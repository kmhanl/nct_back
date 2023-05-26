/** [전문위원회] > 안건 현황  리스트 **/
var recCode = [];
var metaCode = [];
var checkMetaCode = []; // 체크된 접수번호 리스트(String[])
var checkRecCode = []; // 체크된 접수번호 리스트(String[])
var makeAgdCode = []; // AgdCode 생성
var checkTechs = []; // 선택된 분야 리스트(String[])

$(document).ready(function(){  
	// 전문위원회 > 안건 현황 > 안건 리스트 > No 선택 체크박스
	$(".nct_body .nct_content_list_01 a.AgendaSendChk").on("click",function(){
		if($(this).hasClass("ChkOn")){
			$(this).removeClass("ChkOn");
			$(this).parent().find('input:checkbox[name="agdCheck"]').attr("checked", false);
		}else{
			$(this).addClass("ChkOn");
			$(this).parent().find('input:checkbox[name="agdCheck"]').attr("checked", true);
		}
		metaCode = [];
		recCode = [];
		var agdSelCnt = 0;
		$(".nct_body .nct_content_list_01 a.ChkOn").each(function(idx, chkRec) {
			recCode.push($(chkRec).data("reccode"));
			metaCode.push($(chkRec).data("mecode"));
			agdSelCnt++;
		});
		if(agdSelCnt!=0){
			$("#sendAgdbtn").find(".agdSelCnt").text(agdSelCnt);
			$("#sendAgd").text(agdSelCnt);
			$("#sendAgdbtn").removeClass("disabledBtn");
		}else{
			$("#sendAgdbtn").find(".agdSelCnt").text(agdSelCnt);
			$("#sendAgd").text(agdSelCnt);
			if($("#sendAgdLayer").hasClass("sendlayerOpen")){
				$("#sendAgdLayer").removeClass("sendlayerOpen")
			}
			$("#sendAgdbtn").addClass("disabledBtn");
		}
	});
	
	/** 검토 요청 레이어 > 기술 분야 선택  */
	$('.nct_body div.send_Agd_layer_content a.nct_tech_item').on('click',function(){
		if($(this).parent().hasClass("compe_on")){
			$(this).parent().removeClass("compe_on");
		}else{
			$(this).parent().addClass("compe_on");
		}
		checkMetaCode = [];
		checkRecCode = [];
		checkTechs = [];
		checkMetaCode = metaCode;
		checkRecCode = recCode;
		$('.nct_body div.send_Agd_layer_content ul.nct_tech_list li').each(function(idx, item){
			if($(item).hasClass('compe_on')) {
				checkTechs.push($(item).data('tid'));
			}
		});
	});
});
// 전문위원회 > 안건 현황 > 안건 리스트 > 검토 요청 버튼 클릭 > 팝업 호출 
function sendRec(){
	var chkList = $('.nct_body .nct_content_list_01 a.ChkOn').length;
	var sendCallRec = $("#sendCallRec").val();
	if(chkList!=0){
		if(!$("#sendAgdLayer").hasClass("sendlayerOpen")){
			$("#sendAgdLayer").addClass("sendlayerOpen");
		}else{
			$("#sendAgdLayer").removeClass("sendlayerOpen");
		}
	}else{
		if(sendCallRec!=0){
			agdAlertPopup.open('codeAgd001','','closeAlert','one', '');
			return;
		}else{
			agdAlertPopup.open('codeAgd002','','closeAlert','one', '');
			return;
		}
	}
}
// 전문위원회 > 안건 현황 > 안건 리스트 > 검토 요청 팝업 > 저장 버튼 클릭  
function saveSendRec(){
	var chkListCnt = $('.nct_body .nct_tech_list .compe_on').length;
	if(chkListCnt==0){
		agdAlertPopup.open('codeAgd003','','closeAlert','one', '');
		return;
	}
	
	var formData = new FormData();
	var uploadIdx =0;
	if(multifiles.length !=0){
		$(multifiles).each(function(idx, file){
			uploadfiles.push(file);
			uploadItem = "";
			uploadItem += "<li><div class='upload_item'>";
			uploadItem += "		<p class='item_name'>"+file.name+"</p>";
			uploadItem += "		<p class='item_size'>"+file.size+" Byte</p>";
			uploadItem += "		<div class='progress_box'><div class='progress_bar' style=''></div></div>";
			uploadItem += "		<div class='progress_data'><p class='percent'>00</p>%</div>";
			uploadItem += "</div></li>";
			$(".upload_box_wrap ul.upload_list").append(uploadItem);
			uploadIdx++;	
		});
		console.log(uploadfiles);
		$(".upload_layer_wrap").css("display","flex");
	}else{
		agdAlertPopup.open('codeAgd004','','closeAlert','one', '');
		return;
	}
	var strFile = 0;
	var recFileChk = multifiles.length;
	//saveSendRecData();
	uploadSendFiles(strFile, recFileChk);
}
// 개별 파일 업로드 및 프로그래스 적용 Roof
function uploadSendFiles(strFile, recFileChk){
	var formData = new FormData();
	var AgdCode = '';
	var TNo = 1;
	var agdNo = 0;
	
	console.log(metaCode);
	console.log(recCode);
	console.log(checkTechs);
	$(checkMetaCode).each(function(idx, metaCode){
		formData.append("metaList["+idx+"]",metaCode);
	});
	
	$(checkTechs).each(function(idx, techCode){
		formData.append("techList["+idx+"]",techCode);
	});
	makeAgdCode = [];
	$(checkRecCode).each(function(idx, recCode){
		var TNo = 1;
		$(checkTechs).each(function(index, tech){
			if(TNo<10){
				AgdCode = recCode+"-0"+TNo;
			}else{
				AgdCode = recCode+"-"+TNo;
			}
			console.log(AgdCode);
			makeAgdCode.push(AgdCode);
			formData.append("agdCodeList["+agdNo+"]",AgdCode);
			agdNo++;
			TNo++;
		});
		
	});
	
	formData.append(`fileList[0].file`, uploadfiles[strFile]);
	formData.append(`fileList[0].type`, 'FC006');
	formData.append(`fileList[0].sort`, '0');
	formData.append(`fileList[0].id`, strFile + 1);
	$.ajax({
    	url: '/exp/proc/saveSendFileData.do',
    	data : formData,
    	type : 'post',
    	contentType : false,
    	processData: false,
    	xhr: function() {
	      	var xhr = $.ajaxSettings.xhr();
      		xhr.upload.onprogress = function(e) {
        	var percent = e.loaded  * 100 / e.total;
        	console.log("퍼센트:"+percent);
        	$(".upload_list li:eq("+strFile+")").find(".progress_data .percent").text(percent.toFixed());
        	$(".upload_list li:eq("+strFile+")").find(".progress_box .progress_bar").css("width",percent.toFixed()+"%");
        };
      	return xhr;
    	},
    	success : function(ret) {
      		strFile++;
      		if(strFile!=recFileChk){
      			//추가  업로 파일일 있는 경우 추가 업로드 실행 
      			uploadSendFiles(strFile, recFileChk);
      		}else{
      			$(".upload_layer_wrap").css("display","none");
      			//파일 전체 업로드 완료 > 데이터 저장
      			saveSendRecData();
      		}	
      	}
  	});
}
// 검토 요청 데이터 저장
function saveSendRecData(){
	console.log("데이터 저장");
	var AgdCode = '';
	var TNo = 1;
	var agdNo = 0;
	sendAgdList = [];
	sendMetaList = [];
	$(checkMetaCode).each(function(idx, metaCode){
		sendMetaList.push({ 
			nctIdx: 'temp',
			nctMetaCode: metaCode,
			nctRecCode: checkRecCode[idx],
			nctRecExCnt: checkTechs.length,
		});
	});
	$(checkRecCode).each(function(idx, recCode){
		var TNo = 1;
		$(checkTechs).each(function(index, tech){
			if(TNo<10){
				AgdCode = recCode+"-0"+TNo;
			}else{
				AgdCode = recCode+"-"+TNo;
			}
			sendAgdList.push({ 
				nctIdx: 'temp',
				nctAgdCode: AgdCode,
				nctMetaCode: checkMetaCode[idx],
				nctAgdTech: tech,
			});
			agdNo++;
			TNo++;
		});
		
	});
	
	$.ajax({
		anyne:true,
		type:'POST',
		data: JSON.stringify({
			sendMetaList: sendMetaList
			,sendagdList: sendAgdList
		}),
    	url: "/exp/proc/saveSendData.do",
		dataType: "json",
		contentType: 'application/json;charset=UTF-8',
		success : function(data) {
			agdAlertPopup.open('codeAgd005','','pageReload','one');
		},
		error: function(e) {
			alert("ERROR ");
		}
	});
}



