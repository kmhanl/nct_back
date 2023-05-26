/** [전문위원회] > 파일 업로드 공통 스크립트  **/
var multifiles = []; // 멀티 파일 공통
var recPrint = []; // 접수 현황 > 신규 접수 등록 > 접수 신청서 첨부 파일
var recOfficial = []; // 접수 현황 > 신규 접수 등록 > 공문 파일
var nctBefore = []; // 접수 현황 > 국가 핵심 기술 설명자료 파일
var nctAfter = []; // 접수 현황 > 변경 국가 핵심 기술 설명자료 파일

$(document).ready(function(){    
	//싱글 파일 파일 선택 처리 
	$(".singleUpload").change(function(e){	
		var $fileApp = $(this).parent().parent();
		var fileCode = $(this).data("fcode");
		
		$(e.target.files).each(function(index, fielData){
			if(fielData.size <= 0){
				alert(fielData.name + " : 파일 크기가 0 보다 커야 합니다.");
				return;
			}else{
				switch(fileCode){
				case "FC001": // 접수 현황 > 신규 접수 등록 > 접수 신청서 첨부 파일
					recPrint.push(fielData);
					break;
				case "FC002": // 접수 현황 > 신규 접수 등록 > 공문 파일
					recOfficial.push(fielData);
					break;
				case "FC003": // 접수 현황 > 국가 핵심 기술 설명자료 파일
					nctBefore.push(fielData);
					break;
				case "FC004":  // 접수 현황 > 변경 국가 핵심 기술 설명자료 파일
					nctAfter.push(fielData);
					break;
				}
				$fileApp.find(".file_name").val(fielData.name);
			}
		});
	});
});
// GNB 로그인 정보 클릭 
function ucardinfo(){
	$("#LoginCard").toggle();
}
// 공통 멀티 파일 > 파일 첨부  
function addmultiFile() {
	var input =$('input[name=tmp]');
	var input = $('<input />', { type: 'file', name: 'tmp',  multiple: true });
	input.click();
	var mfileLength = $("#addmultiFileCtn").val();
	$(input).change(function(e) {
		var files = [];
		$(e.target.files).each(function(index, filed){
			if(filed.size <= 0){
				alert(filed.name + " : 파일 크기가 0 보다 커야 합니다.");
				return;
			}else{
				multifiles.push(filed);
			}
		});
		//console.log(multifiles.length);
		makeAddFileList();
	})
}

// 공통 멀티 첨부 파일 개별 삭제
function delAddFile(idx) {
	var mfileLength = $("#addmultiFileCtn").val();
	$(".nct_multy_file_list li:eq("+idx+")").remove();
	multifiles.splice(idx, 1);
	makeAddFileList();
}
// 공통 멀티 첨부 파일 전체 삭제
function delAllFile() {
	
	$(".nct_multy_file_list").empty();
	$('.nct_multy_file_wrap').removeClass("addFile");
	multifiles = [];
	console.log(multifiles);
}
// 공통 멀티 첨부 파일  순서 위로 
function upAddFile(idx){
	if(idx=="0"){
		alert("첫 번째 첨부 파일입니다.");
	}else{
		var $moveFile = $(".nct_multy_file_list li:eq("+idx+")");
		$moveFile.prev().before($moveFile);
		setMultiList();	
	}
}
// 공통 멀티 첨부 파일  순서 아래로 
function downAddFile(idx){
	var length = $(".nct_multy_file_list li").length;
	length--;
	if(idx==length){
		alert("마지막 번째 첨부 파일입니다.");
	}else{
		var $moveFile = $(".nct_multy_file_list li:eq("+idx+")");
		$moveFile.next().after($moveFile);
		setMultiList();	
	}
}

// 공통 멀티 첨부 파일  순서 변경에 따른 화면 출력 
function setMultiList(){
	var immultifiles = [];
	$(".nct_multy_file_list li").each(function(index, liItem){
		immultifiles.push(multifiles[$(liItem).data("multiidx")]);
	});
	multifiles = immultifiles;
	makeAddFileList();
}
// 공통 멀티 첨부 파일 화면 출력
function makeAddFileList(){
	var addNo = 1;
	var mfileIdx = 0;
	$(".nct_multy_file_list").empty();
	multifiles.forEach(function(file){
		var lidata = "";
		lidata += "<li data-multiidx='"+mfileIdx+"'>";
		lidata += "	<div class='add_file_item'>";
		lidata += "		<div class='add_file_no'>"+addNo+"</div>";
		lidata += "		<p class='file_name' style='flex:1;'>"+file.name+"</p>";
		lidata += "		<p class='file_size'>"+file.size+" Byte</p>";
		lidata += "		<div class='add_file_btn'>";
		lidata += "			<a href='javascript:upAddFile("+mfileIdx+");' class='add_sort_up'></a>";
		lidata += "			<a href='javascript:delAddFile("+mfileIdx+");' class='add_file_del'></a>";
		lidata += "			<a href='javascript:downAddFile("+mfileIdx+");' class='add_sort_down'></a>	";
		lidata += "		</div>";
		lidata += "	</div>";
		lidata += "</li>";
		$('.nct_multy_file_list').append(lidata);
		addNo++;
		mfileIdx++;
	});
	var length = multifiles.length;
	if(length == 0){
		$('.nct_multy_file_wrap').removeClass("addFile");
	}else{
		$('.nct_multy_file_wrap').addClass("addFile");
	}
	//console.log(multifiles); 
}

// 
function test(){
	
}
