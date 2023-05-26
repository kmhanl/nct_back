
$(document).ready(function(){
	var pageRows = 10; // 한 페이지에 조회할 데이터 수
	
	//** 엑셀 다운로드 버튼 excelbtn**
	$("div.BodyTopUtile   a.excelbtn").on("click",function(){
		var efilename = $(this).data("efilename");
		var sheetname = $(this).data("sheetname");
		downloadExcel(efilename, sheetname);
	});
	
	// ** 담당자 변경  **
	$("div.conInfoBtn  a.ModiMem").on("click",function(){
		var memCode = $(this).data("memcode");
		console.log(memCode);
		ModiMem.open(memCode);
	});
	
	/** 매일 재발송 */
	$("div.conInfoBtn  a.SendMail").off().on("click",function(){
		var rscMemCompany = $("#rscMemCompany").val();
		var rscMemName = $("#rscMemName").val();	    
		var rscMemEmail = $("#rscMemEmail").val();	       	
       	var rscInviKey = $("#rscInviKey").val();
		
		emailList = [];
		//emailList.emailHisEmail = rscMemEmail;
		//emailList.emailHisCom = rscMemCompany;
		//emailList.emailHisName = rscMemName;
		//emailList.emailInviKey = rscInviKey;
		
		
		
		emailList.push({
			emailHisEmail: rscMemEmail,
			emailHisCom: rscMemCompany,
			emailHisName: rscMemName,
			emailInviKey: rscInviKey,
		});
		console.log(emailList);
		$.ajax({
			type : "POST", 
			url : "/rsc/proc/send/email.do", 
			data: JSON.stringify({
				emailInfo: {
					emailHisSenderName: "국가핵심기술 보호 실태조사",
					emailHisSubject: "(산보협) 국가핵심기술 보유기관 실태조사 협조 요청의 건", // 이메일 제목
					emailHisBody: "", // 이메일 내용
				},
				emailList: emailList
			}),
			dataType: "json",
			contentType: 'application/json;charset=UTF-8',
		 	success : function(data) { 
		 		alert("대상기업 초대 메일이 발송 되었습니다.");
			 	location.reload();
		 		//alert(data.resultData[0].status);
		 		//console.log(data);
				// data 정보
				// resultCode: S(성공), F(실패)
				//switch(data.resultCode){
				//	case "S":
				//		console.log(data);
				//		break;
				//	case "F":
				//		alert("[" + data.resultData.status + "] " + data.resultData.message);
				//		break;
				//}
			},
		 	error : function() { 
		 		console.log("통신장애"); 
		 	} 
		});
	
	});
	/** 메일 예약 발송 */
	$(".BodyTopUtile .SendMail").off().on("click",function(){
		emailList = []
		$(".tarketList01 li").each(function(idx,tech){
			emailList.push({
    			emailHisEmail: $(this).find(".memEmail").text(),
    			emailHisCom: $(this).find(".comName").text(),
    			emailHisName: $(this).find(".memName").text(),
    			emailInviKey: $(this).data("invikey"),
    		});
		});
		console.log(emailList);
		$.ajax({
			type : "POST", 
			url : "/expert/proc/send/email.do", 
			data: JSON.stringify({
				emailInfo: {
					emailHisSenderName: "국가핵심기술 보호 실태조사",
					emailHisSubject: "(산보협) 국가핵심기술 보유기관 실태조사 협조 요청의 건", // 이메일 제목
					emailHisBody: "", // 이메일 내용
				},
				emailList: emailList
			}),
			dataType: "json",
			contentType: 'application/json;charset=UTF-8',
		 	success : function(data) { 
		 		console.log(data);
				// data 정보
				// resultCode: S(성공), F(실패)
				//switch(data.resultCode){
				//	case "S":
				//		console.log(data);
				//		break;
				//	case "F":
				//		alert("[" + data.resultData.status + "] " + data.resultData.message);
				//		break;
				//}
			},
		 	error : function() { 
		 		console.log("통신장애"); 
		 	} 
		});
	});
	
	
	/** 고유키 생성 */
	$(".BodyTopUtile .addkey").off().on("click",function(){
		
		var comlength = $(".tarketList01 li").length;
		var comidx = 0;
		makekey(comlength, comidx);		
	});
	
	/** 고유키 저장 */
	$(".BodyTopUtile .savekey").off().on("click",function(){
		var Extra = {};
		var comlength = $(".tarketList01 li").length;
		var comidx = 0;
		
		Extra.intoRscMemList = [];
		var memIdx = 0;
		var rscMemCodeA = "RSC-2022-0000-";
		var rscMemCode = "";
		var rscCode = "RSC-2022-0000"; 
		for(i=1;i<=comlength;i++){
			if(i<10){
				rscMemCode = rscMemCodeA+"00"+i;
			}else if(i<100){
				rscMemCode = rscMemCodeA+"0"+i;
			}else{
				rscMemCode = rscMemCodeA+i;
			}
			Extra.intoRscMemList.push({
				qusIdx: i,
				rscMemCode: rscMemCode,
				rscCode: rscCode,
				rscInviKey: $(".tarketList01 li:eq("+memIdx+")").find(".inviKey").text(),
				
				rscMemCompany:$(".tarketList01 li:eq("+memIdx+")").find(".comName").text(),
				rscMemComCode: $(".tarketList01 li:eq("+memIdx+")").find(".conNum").text(),
				rscMemName: $(".tarketList01 li:eq("+memIdx+")").find(".memName").text(),
				rscMemEmail: $(".tarketList01 li:eq("+memIdx+")").find(".memEmail").text(),
			});
			memIdx++;
			
		}
		
		console.log(Extra.intoRscMemList);
		$.ajax({
			type : "POST", 
			url : "/research/proc/intoMember.do", 
		 	data: JSON.stringify({
		 		intoRscMemList: Extra.intoRscMemList,
		 	}), 
		 	dataType : "json",
		 	contentType: 'application/json;charset=UTF-8',
		 	success : function(data) { 
		 		if(data.resultCode=="S"){
					//ChkStaters();
				}
			},
		 	error : function() { 
		 		alert("임시저장 처리중 오류가 발생하였습니다. 잠시후 다시 시도해주세요."); 
		 	} 
		});	
			
	});
});
function makekey(comlength, comidx) {
	
	var regiNum = $(".tarketList01 li:eq("+comidx+")").find(".conNum").text();
	var memEmail = $(".tarketList01 li:eq("+comidx+")").find(".memEmail").text();
	
	
	var regiNum1 = regiNum.substr(0,3)
	var regiNum2 = regiNum.substr(4,2)
	var regiNum3 = regiNum.substr(7,5);
	
	var regiNum0 = regiNum1+regiNum2+regiNum3;
	var rscMakekey = regiNum+memEmail;
	
	$.ajax({
		type : "POST", 
		url : "/research/proc/rscMakeKey.do", 
	 	data : {
	 		rscMakekey: rscMakekey,
	 	}, 
	 	dataType : "json",
	 	success : function(data) { 
	 		console.log(data);
	 		if(data.resultCode=="S"){
	 			$(".tarketList01 li:eq("+comidx+")").find(".inviKey").text(data.makekey);
	 		}
	 		++comidx;
	 		$(".tarketList01 li:eq("+comidx+")").find(".card_num").text(comidx);
	 		
	 		if(comidx<comlength){
	 			makekey(comlength, comidx);		
	 		}
		},
	 	error : function() { 
	 		alert("입력 현황 업데이트중 오류가 발생하였습니다. 잠시후 다시 시도해주세요."); 
	 	} 
	});
}


/**
* 엑셀 다운로드
* @param fileName 엑셀파일명 (ex. excel.xls)
* @param sheetName 시트명
* @param headers 시트내용(html - table)
*/
function _excelDown(fileName, sheetName, sheetHtml) {
    var html = '';
    html += '<html xmlns:x="urn:schemas-microsoft-com:office:excel">';
    html += '    <head>';
    html += '        <meta http-equiv="content-type" content="application/vnd.ms-excel; charset=UTF-8">';
    html += '        <xml>';
    html += '            <x:ExcelWorkbook>';
    html += '                <x:ExcelWorksheets>';
    html += '                    <x:ExcelWorksheet>'
    html += '                        <x:Name>' + sheetName + '</x:Name>';   // 시트이름
    html += '                        <x:WorksheetOptions><x:Panes></x:Panes></x:WorksheetOptions>';
    html += '                    </x:ExcelWorksheet>';
    html += '                </x:ExcelWorksheets>';
    html += '            </x:ExcelWorkbook>';
    html += '        </xml>';
    html += '    </head>';
    html += '    <body>';
    
    // ----------------- 시트 내용 부분 -----------------
    html += sheetHtml;
    // ----------------- //시트 내용 부분 -----------------
    
    html += '    </body>';
    html += '</html>';
    
    // 데이터 타입
    var data_type = 'data:application/vnd.ms-excel';
    var ua = window.navigator.userAgent;
    var blob = new Blob([html], {type: "application/csv;charset=utf-8;"});
    
    if ((ua.indexOf("MSIE ") > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)) && window.navigator.msSaveBlob) {
        // ie이고 msSaveBlob 기능을 지원하는 경우
        navigator.msSaveBlob(blob, fileName);
    } else {
        // ie가 아닌 경우 (바로 다운이 되지 않기 때문에 클릭 버튼을 만들어 클릭을 임의로 수행하도록 처리)
        var anchor = window.document.createElement('a');
        anchor.href = window.URL.createObjectURL(blob);
        anchor.download = fileName;
        document.body.appendChild(anchor);
        anchor.click();
        
        // 클릭(다운) 후 요소 제거
        document.body.removeChild(anchor);
    }
}
function downloadExcel(efilename, sheetname){
	
    // 대상 테이블을 가져옴
    var table = document.getElementById("DownloadData");
    
    if(table){
        // CASE 대상 테이블이 존재하는 경우
      
        // 엑셀다운 (엑셀파일명, 시트명, 내부데이터HTML)
        _excelDown(efilename, sheetname, table.outerHTML)
    }
}
