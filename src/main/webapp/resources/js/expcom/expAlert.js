/***************************************************/
/*********** 공통 업로드 Progress Popup 생성        ************/
/***************************************************/
var upProgressPopup = function(){
	var wp = {};
	
	var $popup = null;
	var popupUrl = "/exp/alert/uploadAlert.do";
	
	/** 팝업 종료 */
	wp.close = function(){
		comn.popupClose();
	};
	
	/** 화면에서 시작하는 경우 */
	wp.open = function(metaCode, metaType, fileCnt){
		popupUrl = '/exp/alert/uploadAlert.do?metaCode='+metaCode+'&metaType='+metaType+'&fileCnt='+fileCnt;
		comn.popupOpen(popupUrl, createEvent);
	};
	
	/** 팝업 기능 생성 */
	var createEvent = function(popupElement){
		$popup = popupElement;
		
		if(recPrint.length !=0){
			$(recPrint).each(function(idx, file){
				uploadItem = "";
				uploadItem += "<li><div class='upload_item'>";
				uploadItem += "		<p class='item_name'>"+file.name+"</p>";
				uploadItem += "		<p class='item_size'>"+file.size+" Byte</p>";
				uploadItem += "		<div class='progress_box'><div class='progress_bar' style=''></div></div>";
				uploadItem += "		<div class='progress_data'><p class='percent'>00</p>%</div>";
				uploadItem += "</div></li>";
				$(".upload_box_wrap ul.upload_list").append(uploadItem);
			});
			console.log(recPrint);
		}
		if(multifiles.length !=0){
			$(multifiles).each(function(idx, file){
				//var fSize = Number(file.size) / 1000;
				uploadItem = "";
				uploadItem += "<li><div class='upload_item'>";
				uploadItem += "		<p class='item_name'>"+file.name+"</p>";
				uploadItem += "		<p class='item_size'>"+file.size+" Byte</p>";
				uploadItem += "		<div class='progress_box'><div class='progress_bar' style=''></div></div>";
				uploadItem += "		<div class='progress_data'><p class='percent'>00</p>%</div>";
				uploadItem += "</div></li>";
				$(".upload_box_wrap ul.upload_list").append(uploadItem);
			});
			console.log(multifiles);
		}
		
		
	};
	return wp;
}();
/***************************************************/
/*********** 접수 현황 관련 Alert Popup 생성        ************/
/***************************************************/
var recAlertPopup = function(){
	var wp = {};
	
	var $popup = null;
	var popupUrl = "/exp/alert/recAlert.do";
	
	/** 팝업 종료 */
	wp.close = function(){
		comn.popupClose();
	};
	
	/** 화면에서 시작하는 경우 */
	wp.open = function(aComent,reAction, forAction, alType , recCode){
		popupUrl = '/exp/alert/recAlert.do?aComent='+aComent+'&reAction='+reAction+'&forAction='+forAction+'&alType='+alType+'&recCode='+recCode;
		comn.popupOpen(popupUrl, createEvent);
	};
	
	/** 팝업 기능 생성 */
	var createEvent = function(popupElement){
		$popup = popupElement;
	};
	return wp;
}();
/***************************************************/
/*********** 안건 현황 관련 Alert Popup 생성        ************/
/***************************************************/
var agdAlertPopup = function(){
	var wp = {};
	
	var $popup = null;
	var popupUrl = "/exp/alert/agdAlert.do";
	
	/** 팝업 종료 */
	wp.close = function(){
		comn.popupClose();
	};
	
	/** 화면에서 시작하는 경우 */
	wp.open = function(aComent,reAction, forAction, alType , recCode){
		popupUrl = '/exp/alert/agdAlert.do?aComent='+aComent+'&reAction='+reAction+'&forAction='+forAction+'&alType='+alType+'&recCode='+recCode;
		comn.popupOpen(popupUrl, createEvent);
	};
	
	/** 팝업 기능 생성 */
	var createEvent = function(popupElement){
		$popup = popupElement;
	};
	return wp;
}();
/***************************************************************/
/*********** 전문위원회 관련 Alert  Popup 생성                                ************/
/***************************************************************/
var expAlertPopup = function(){
	var wp = {};
	
	var $popup = null;
	var popupUrl = "/exp/alert/expAlert.do";
	
	/** 팝업 종료 */
	wp.close = function(){
		comn.popupClose();
	};
	
	/** 화면에서 시작하는 경우 */
	wp.open = function(aComent,reAction, forAction, alType , recCode){
		popupUrl = '/exp/alert/expAlert.do?aComent='+aComent+'&reAction='+reAction+'&forAction='+forAction+'&alType='+alType+'&recCode='+recCode;
		comn.popupOpen(popupUrl, createEvent);
	};
	
	/** 팝업 기능 생성 */
	var createEvent = function(popupElement){
		$popup = popupElement;
	};
	return wp;
}();

/***************************************************************/
/***********  Alert 팝업 호출                                                             ************/
/***************************************************************/
// 전문위원회 > 접수현황  > 신규 접수 등록 > 취소 안내 Alert 호출
function cancleRec(){
	returnUrl = '/expcom/expRecList.do';
	recAlertPopup.open('codeRecV038','closeAlert','pageLocation','dual', returnUrl);
}

// 전문위원회 > 접수현황 > 신규 접수 등록  > 대상기업 변경 안내
function recComReset(){
	recAlertPopup.open('codeRecW002','closeAlert','goRecComReset','dual', '');
}

// 전문위원회 > 접수현황 > 상세  > 접수 승인 처리 Alert 호출
function recConfirm(recCode){
	recAlertPopup.open('codeRecV007','closeAlert','saveRecConfirm','dual', recCode);
}

// 전문위원회 > 접수현황 > 상세  > 접수 승인 회수 처리   Alert 호출
function recBaCon(recCode){
	recAlertPopup.open('codeRecV011','closeAlert','saveRecBaCon','dual', recCode);
}

// 전문위원회 > 접수현황 > 상세  > 접수반려 처리 Alert 호출
function recReCon(recCode){
	recAlertPopup.open('codeRecV009','closeAlert','saveRecReCon','dual', recCode);
}

// 전문위원회 > 접수현황 > 상세  > 접수반려 회수 처리 Alert 호출
function recBaRe(recCode){
	recAlertPopup.open('codeRecV013','closeAlert','saveRecBaRe','dual', recCode);
}

/***************************************************************/
/*********** Alert Return Function                  ************/
/***************************************************************/
// Alert close
function closeAlert(){
	$("#Dimmed_Layer_Warpper").css("display","none");
	$("#Dimmed_Layer_Warpper").empty();
}
// Alert close + Element Focus 
function closeFocus(item){
	$("#"+item).focus();
	$("#Dimmed_Layer_Warpper").css("display","none");
	$("#Dimmed_Layer_Warpper").empty();
}
// Alert close + rollBack > 접수현황 > 접수현황 상세 > 검토의견 권한 설정 rollBack  
function rollBackAuth(){
	$(".nct_body .nct_tech_list_box").find("ul.nct_tech_list .compe_ori").addClass("compe_on");
	$("#Dimmed_Layer_Warpper").css("display","none");
	$("#Dimmed_Layer_Warpper").empty();
}
// Alert close + Page Reload
function pageReload(){
	location.reload();
}
// Alert close + Page Location Redirect
function pageLocation(returnUrl){
	location.href = returnUrl;
}
