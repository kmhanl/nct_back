/** [전문위원회] > 위원회 현황 리스트 **/
var expMeta = {};
var expAgds = [];
var expMems = [];

$(document).ready(function(){  
	$(document).on('mouseup',function(e){
		$(".AutoH01").css("display","none");
	});
	var $DateNom01 = $('#DateNom01'),
		$DateNom02 = $('#DateNom02'),
		$DateNom03 = $('#DateNom03'),
		$str_date = $('#str_date');
		$end_date = $('#end_date');
		
	$DateNom01.datepicker({
		language: 'en',
		autoClose: true,
		position : 'right center',
		todayButton: true,
		clearButton: true,
		todayButton: new Date(),
		minDate: new Date(),
		
	})
	$DateNom02.datepicker({
		language: 'en',
		autoClose: true,
		position : 'right center',
		todayButton: true,
		clearButton: true,
		todayButton: new Date(),
		minDate: new Date(),
	})
	$DateNom03.datepicker({
		language: 'en',
		autoClose: true,
		position : 'right bottom',
		todayButton: true,
		clearButton: true,
		todayButton: new Date(),
		minDate: new Date(),
	})
	$str_date.datepicker({
		language: 'en',
		autoClose: true,
		position : 'right center',
		todayButton: true,
		clearButton: true,
		todayButton: new Date(),
		minDate: new Date(),
		onSelect: function (fd, date) {
			$end_date.data('datepicker')
			.update('minDate', date)
		}
	})
	$end_date.datepicker({
		language: 'en',
		autoClose: true,
		position : 'right center',
		todayButton: true,
		clearButton: true,
		todayButton: new Date(),
		onSelect: function (fd, date) {
			$str_date.data('datepicker')
			.update('maxDate', date)
		}
	})
		
	/** 위원회 구성 > 위원회 설정  > 기술 분야 선택 */
	$(document).on("click",".nct_tech_list .nct_tech_item",function(event){
		var setupTech = $(this).parent().data("tid");
		var setupTechNm = $(this).text();
		$("#expTechCode").val(setupTech);
		$("#expSetup").removeClass("tech_setup_ok");
		
		$(".section_utile_box .expTechNm").text(setupTechNm);
		
	});	
	
	/** 위원회 구성 > 위원회 설정  > 대면 / 설정 서면 */
	$(".nct_body .expcom_type_list a.expcom_type_item").on("click",function(){
		if(!$(this).parent().hasClass("chkOn")){
			var expType = $(this).data("exptype");
			$("#expComType").val(expType);
			$(this).parent().parent().find("li").removeClass("chkOn");
			$(this).parent().addClass("chkOn");
			if(expType=="EXPM"){
				$(".exp_setup_wrap").removeClass("in_writing");
				$(".exp_setup_wrap").addClass("in_meeting");
				$(".exp_com_type_tit").text("참석여부 조사기간");
			}else{
				$(".exp_setup_wrap").removeClass("in_meeting");	
				$(".exp_setup_wrap").addClass("in_writing");
				$(".exp_com_type_tit").text("자료 열람 기간");
			}
		}
	});
	
	/** 위원회 구성 > 위원회 설정  > 시간 인풋 포커스 */
	$(document).on("click",".DateForm .DateH",function(event){
		$(".AutoH01").css("display","none");
		$(this).parent().find(".HourPick").css("display","block");
	});
	
	/** 위원회 구성 > 위원회 설정  > 시간 레이어 선택*/
	$(document).on("click",".HourPick .HourPickItem",function(event){
		var selhour = $(this).data("selhour");
		$(this).parent().parent().parent().parent().find(".DateH").text(selhour);
		$(this).parent().parent().parent().parent().find(".DateHD").val(selhour);
		$(this).parent().parent().parent().css("display","none");
	});
	
	/** 위원회 구성 > 위원회 설정  > 분 인풋 포커스 */
	$(document).on("click",".DateForm .DateM",function(event){
		$(".AutoH01").css("display","none");
		$(this).parent().find(".MinPick").css("display","block");
	});		
	
	/** 위원회 구성 > 위원회 설정  > 분 레이어 선택*/
	$(document).on("click",".MinPick .MinPickItem",function(event){
		var selmin = $(this).data("selmin");
		$(this).parent().parent().parent().parent().find(".DateM").text(selmin);
		$(this).parent().parent().parent().parent().find(".DateMD").val(selmin);
		$(this).parent().parent().parent().css("display","none");
	});
	
	/** 위원회 구성 > 안건 설정 > 안건별 권한 리스트 토글 */
	$(document).on("click",".agd_auth_cnt_box .agd_auth_status",function(event){
		
		if($(this).parent().hasClass("auth_open")){
			$(this).parent().removeClass("auth_open");
			$(this).parent().addClass("auth_closed");
		}else{
			$(this).parent().removeClass("auth_closed");
			$(this).parent().addClass("auth_open");
		}
		var lil = $("ul.com_agd_add_list .add_agd").length;
		var opl = $("ul.com_agd_add_list .auth_open").length;
		var cll = $("ul.com_agd_add_list .auth_closed").length;
		if(lil==opl){
			$(".section_utile_box .agd_add_list_type .all").addClass("chkOn");
		}else{
			$(".section_utile_box .agd_add_list_type .all").removeClass("chkOn");	
		}
		if(lil==cll){
			$(".section_utile_box .agd_add_list_type .one").addClass("chkOn");
		}else{
			$(".section_utile_box .agd_add_list_type .one").removeClass("chkOn");	
		}
		
	});
	
	/** 위원회 구성 > 안건 설정 > 안건별 권한 리스트 전체 토글 */
	$(document).on("click",".agd_add_list_type .list_type_item",function(event){
		if(!$(this).hasClass("chkOn")){
			$(this).parent().parent().find(".list_type_item").removeClass("chkOn");
			$(this).addClass("chkOn");
			var idx = $(this).parent().index();
			if(idx=="0"){
				$(".add_agd_box").find(".agd_auth_cnt_box").removeClass("auth_closed");
				$(".add_agd_box").find(".agd_auth_cnt_box").addClass("auth_open");
			}else{
				$(".add_agd_box").find(".agd_auth_cnt_box").removeClass("auth_open");
				$(".add_agd_box").find(".agd_auth_cnt_box").addClass("auth_closed");
			}
		}
	});
	
	/** 위원회 구성 > 안건 설정 > 안건별 권한 리스트 > 검토 권한  토글 */
	$(document).on("click",".agd_auth_cnt_list .adm_auth_button",function(event){
		//console.log("검토권한  토글");
		if($(this).parent().hasClass("authOn")){
			$(this).parent().removeClass("authOn");
			$(this).html("<span></span>검토 권한 Off");
			
		}else{
			$(this).parent().addClass("authOn");
			$(this).html("<span></span>검토 권한 On");
		}
		goExpAgdAuthSet('set01');
	});
	
	/** 위원회 구성 > 안건 설정 > 안건별 권한 리스트 > 참고의견, 검토의견 토글 */
	$(document).on("click",".agd_auth_sub .agd_auth_sitem",function(event){
		//console.log("검토/참고의견 토글");
		if($(this).parent().parent().parent().parent().hasClass("authOn")){
			if(!$(this).parent().hasClass("authSubChk")){
				$(this).parent().parent().find("li").removeClass("authSubChk");
				$(this).parent().addClass("authSubChk");
			}
		}
		goExpAgdAuthSet('set02');
	});
	
	/** 위원회 구성 > 구성원 설정 > 구성원 삭제 */
	$(document).on("click",".com_agd_mem_list .add_mem_del",function(event){
		var idx = $(this).parent().parent().index();
		expAlertPopup.open('codeExp001','closeAlert','goExpMemDel','dual', idx);
		
	});
	
	/** 위원회 구성 > 안건 설정 > 안건 삭제 */
	$(document).on("click",".com_agd_add_list .add_agd_del",function(event){
		var idx = $(this).parent().parent().index();
		expAlertPopup.open('codeExp002','closeAlert','goExpAgdDel','dual', idx);
	});
	
	// 위원회 구성 > 안건 설정 > 안건 순서 위로 
	$(document).on("click",".nct_body ul.com_agd_add_list a.add_agd_up",function(event){
		var expAgdCnt = $("#expAgdCnt").val();
		var idx = $(this).parent().parent().index();
		if(idx=="0"){
			expAlertPopup.open('codeExp003','','closeAlert','one', '');
		}else{
			var $moveAgd = $(this).parent().parent();
			$moveAgd.prev().before($moveAgd);
			setExpAgdNo()
		}
		
		
	});
	// 위원회 구성 > 안건 설정 > 안건 순서 아래로 
	$(document).on("click",".nct_body ul.com_agd_add_list a.add_agd_down",function(event){
		var expAgdCnt = $("#expAgdCnt").val();
		var idx = $(this).parent().parent().index();
		++idx;
		if(idx==expAgdCnt){
			expAlertPopup.open('codeExp004','','closeAlert','one', '');
		}else{
			var $moveAgd = $(this).parent().parent();
			$moveAgd.next().after($moveAgd);
			setExpAgdNo()
		}
	});
	
});

// 전문위원회 > 위원회 구성 > 기술 분야 변경 처리 안내
function expFormReset(){
	expAlertPopup.open('codeExp006','closeAlert','goExpFormReset','dual', '');
}

// 전문위원회 > 위원회 구성 > 기술 분야 변경 처리 
function goExpFormReset(){
	
	// 기술 분야 삭제
	$("#expTechCode").val("");
	$("#expSetup").addClass("tech_setup_ok");
	$(".section_utile_box .expTechNm").text("");
	$("#newExpAllNo").val("");
	$("#newExpSecNo").val("");
	$("#expcom_type_list li").removeClass("chkOn");
	$(".exp_setup_wrap").removeClass("in_writing");
	$(".exp_setup_wrap").removeClass("in_meeting");
				
	// 안건 삭제
	$(".nct_body ul.com_agd_add_list").empty();
	$("#expComAgd").removeClass("add_agd_result");
	setExpAgdNo();
	
	//구성원 삭제 
	$(".nct_body ul.com_agd_mem_list").empty();
	$("#ExpComMember").removeClass("add_mem_result");
	setExpMemNo();
		
	$("#Dimmed_Layer_Warpper").css("display","none");
	$("#Dimmed_Layer_Warpper").empty();
}

//안건 추가 팝업 호출
function loadExpAgdPopup(){
	var expTechId = $("#expTechCode").val();
	expAgdPopup.open(expTechId);
}
/***************************************************/
/*********** 안건 추가 팝업 호출 ************/
/***************************************************/
var expAgdPopup = function(){
	var wp = {};
	
	var $popup = null;
	var popupUrl = "/expcom/popup/expAgdPopup.do";
	
	/** 팝업 종료 */
	wp.close = function(){
		comn.popupClose();
	};
	
	/** 화면에서 시작하는 경우 */
	wp.open = function(expTechId){
		popupUrl = '/expcom/popup/expAgdPopup.do?expTechId='+expTechId;
		comn.popupOpen(popupUrl, createEvent);
	};
	
	/** 팝업 기능 생성 */
	var createEvent = function(popupElement){
		$popup = popupElement;
		
		//현재 등록된 안건 체크 
		$("ul.com_agd_add_list > li").each(function(idx,agd) {
			$popup.find(".popup_agd_list .Agd"+$(agd).data("agd-code")).addClass("disable");	
		});
		
		//안건 선택 이벤트  
		$popup.find("ul.popup_agd_list li").off().on("click",function(){
			if(!$(this).hasClass("disable")){
				if($(this).hasClass("addOnChk")){
					$(this).removeClass("addOnChk");
				}else{
					$(this).addClass("addOnChk");
				}
			}
		});
		
		/** 닫기 버튼 클릭 이벤트 */
		$popup.find("div.layer_popup_btn a.btn_close").off().on("click",function(){
			wp.close();
		});
	};
	return wp;
}();
// 선택 안건 추가 처리  
function addExpAgdList(){
	var expAgdCnt = $("#expAgdCnt").val();
	var addMemCtn = $("#addMemCtn").val();
	var addLength = $(".popup_agd_list .addOnChk").length;
	if(addLength=="0"){
		alert("한 건이상의 안건을 선택 해주세요.");
		//recAlertPopup.open('codeRdy002','','closeAlert','one', '');
		return;
	} 
	if(expAgdCnt=="0"){
		var addIdx = 1; 
		$("#expComAgd").addClass("add_agd_result");
		$("#expAgdCnt").val(addLength);
	}else{
		var addIdx = Number(expAgdCnt) + 1;
		expAgdCnt = Number(expAgdCnt) + Number(addLength);
		$("#expAgdCnt").val(expAgdCnt);
	}
	$(".popup_agd_list .addOnChk").each(function(idx,addAgd) {
		var addAgdHtml = "";
		addAgdHtml += "<li class='add_agd' data-agd-code='"+$(addAgd).data("agd-code")+"'><div class='agd_num'>"+addIdx+"</div>";
		addAgdHtml += "<div class='agd_body'>";
		addAgdHtml += "<p class='agd_agd_top'>"+$(addAgd).find(".agd_agd_top").html()+"</p>";
		addAgdHtml += "<p class='agd_agd_tit'>"+$(addAgd).find(".agd_agd_tit").html()+"</p>";
		addAgdHtml += "<p class='agd_agd_sub_info'>"+$(addAgd).find(".agd_agd_sub_info").html()+"</p>";
		if(addMemCtn=="0"){
			addAgdHtml += "<div class='agd_auth_box'>";
		}else{
			addAgdHtml += "<div class='agd_auth_box add_auth_mem'>";
		}
		addAgdHtml += "<div class='agd_auth_cnt_box auth_open'>";
		addAgdHtml += "<a href='#none' class='agd_auth_status'>";
		addAgdHtml += "<p class='auth_status auth_all'><span class='cnt_tit'>검토 권한</span><span class='cnt '>"+addMemCtn+"/"+addMemCtn+"</span></p>";
		addAgdHtml += "<p class='auth_status auth_opi'><span class='cnt_tit'>검토 의견</span><span class='cnt '>"+addMemCtn+"/"+addMemCtn+"</span></p>";
		addAgdHtml += "<p class='auth_status auth_exm'><span class='cnt_tit'>참고 의견</span><span class='cnt '>0/"+addMemCtn+"</span></p>";
		addAgdHtml += "</a>";
		addAgdHtml += "<div class='agd_auth_cnt_no'><p>위원회에 포함될 구성원을 등록 해주세요.</p></div>";
		addAgdHtml += "<ul class='agd_auth_cnt_list'>";
		if(!addMemCtn=="0"){
			$(".com_agd_mem_list .add_mem ").each(function(idx, onMem) {
				addAgdHtml += "<li class='authOn "+$(onMem).data("memadm-amg")+"' data-admid='"+$(onMem).data("memadmid")+"' data-adm-amg='"+$(onMem).data("memadm-amg")+"'>";
				addAgdHtml += "<a href='javascript:void(0);' class='adm_auth_button'><span></span>검토 권한 On</a>";
				addAgdHtml += "<div class='adm_auth_row'>";
				addAgdHtml += "<p class='add_auth_no'>"+$(onMem).find(".mem_num").text()+"</p>"; 
				addAgdHtml += "<p class='add_auth_adm "+$(onMem).data("memadm-amg")+"'>"+$(onMem).find(".agd_mem_adm").text()+"</p>";
				addAgdHtml += "<p class='add_auth_name'>"+$(onMem).find(".agd_add_name").html()+"</p>";
				addAgdHtml += "<ul class='agd_auth_sub'>";
				addAgdHtml += "<li class='authSubChk'><a href='javascript:void(0);' class='agd_auth_sitem'>검토의견</a></li>";
				addAgdHtml += "<li><a href='javascript:void(0);' class='agd_auth_sitem'>참고의견</a></li>";
				addAgdHtml += "</ul>";
				addAgdHtml += "</div>";
				addAgdHtml += "</li>";
			});
		}
		addAgdHtml += "</ul></div></div>";
		addAgdHtml +="</div>";
		addAgdHtml +="<div class='add_agd_btn'><a href='#none' class='add_agd_up'></a><a href='#none' class='add_agd_del'></a><a href='#none' class='add_agd_down'></a></div>";
		addAgdHtml +="</li>";	
		$("ul.com_agd_add_list").append(addAgdHtml);	
		addIdx++;
	});
	setExpAgdNo();
	$("#Dimmed_Layer_Warpper").css("display","none");
	$("#Dimmed_Layer_Warpper").empty();
}

//구성원 추가 팝업 호출 
function loadExpMemPopup(){
	var expTechId = $("#expTechCode").val();
	expMemPopup.open(expTechId);
}
/***************************************************/
/*********** 구성원 추가 팝업 호출 ************/
/***************************************************/
var expMemPopup = function(){
	var wp = {};
	
	var $popup = null;
	var popupUrl = "/expcom/popup/expMemPopup.do";
	
	/** 팝업 종료 */
	wp.close = function(){
		comn.popupClose();
	};
	
	/** 화면에서 시작하는 경우 */
	wp.open = function(expTechId){
		popupUrl = '/expcom/popup/expMemPopup.do?expTechId='+expTechId;
		comn.popupOpen(popupUrl, createEvent);
	};
	
	/** 팝업 기능 생성 */
	var createEvent = function(popupElement){
		$popup = popupElement;
		
		//현재 등록된 구성원 체크 
		$("ul.com_agd_mem_list li.add_mem").each(function(idx,mem) {
			$popup.find(".popup_mem_list .Adm"+$(mem).data("memadmid")).addClass("disable");	
		});
		
		//구성원 탭 선택 이벤트  
		$popup.find(".popup_utile_box ul.com_mem_tap_list a.mem_tap_item").off().on("click",function(){
			if(!$(this).hasClass("chkOn")){
				var tapAmg = $(this).data("amg-code");
				$(this).parent().parent().find(".mem_tap_item").removeClass("chkOn");
				$(this).addClass("chkOn");
				$(".popup_mem_box .nct_bro_item").removeClass("show03");
				$(".popup_mem_box .nct_bro_item").removeClass("show04");
				$(".popup_mem_box .nct_bro_item").removeClass("show05");
				$(".popup_mem_box .nct_bro_item").removeClass("show06");
				$(".popup_mem_box .nct_bro_item").addClass(tapAmg);
			}
		});
		
		//구성원 선택 이벤트  
		$popup.find("ul.popup_mem_list li").off().on("click",function(){
			if(!$(this).hasClass("disable")){
				if($(this).hasClass("addOnChk")){
					$(this).removeClass("addOnChk");
				}else{
					$(this).addClass("addOnChk");
				}
			}
		});
		
		/** 닫기 버튼 클릭 이벤트 */
		$popup.find("div.layer_popup_btn a.btn_close").off().on("click",function(){
			wp.close();
		});
	};
	return wp;
}();
// 선택 구성원 추가 처리  
function addExpMemList(){
	var expAgdCnt = $("#expAgdCnt").val();
	var addMemCtn = $("#addMemCtn").val();
	
	var selLength = $(".popup_mem_box .popup_mem_list .addOnChk").length;
	if(selLength=="0"){
		alert("한 명이상의 구성원을 선택 해주세요.");
		return;
	} 
	var mode = "after";
	$(".popup_mem_box .popup_mem_list .addOnChk").each(function(idx,addMem) {
		var addamg03Length = $(".section_utile_box .com_mem_tap_list .adm03_cnt").text();
		var addamg04Length = $(".section_utile_box .com_mem_tap_list .adm04_cnt").text();
		var addamg05Length = $(".section_utile_box .com_mem_tap_list .adm05_cnt").text();
		var addamg06Length = $(".section_utile_box .com_mem_tap_list .adm06_cnt").text();
		
		var addMemHtml = "";
		var addMemAuthHtml = "";
		addMemHtml +="<li class='selected add_mem "+$(addMem).data("memadm-amg")+"' data-memadmid='"+$(addMem).data("memadmid")+"' data-memadm-amg='"+$(addMem).data("memadm-amg")+"'>";
		addMemHtml +="<div class='mem_num'></div>"
		addMemHtml +="<div class='mem_body type01'>";
		addMemHtml += $(addMem).find(".mem_body").html();
		addMemHtml +="</div>";
		addMemHtml +="<div class='add_mem_btn'><a href='#none' class='add_mem_del'></a></div></li>";
		addMemAuthHtml +="<li class='authOn' data-admid='"+$(addMem).data("memadmid")+"' data-adm-amg='"+$(addMem).data("memadm-amg")+"'>";
		addMemAuthHtml +="<a href='javascript:void(0);' class='adm_auth_button'><span></span>검토 권한 On</a>";
		addMemAuthHtml +="<div class='adm_auth_row'>";
		addMemAuthHtml +="<p class='add_auth_no'></p>";
		addMemAuthHtml +="<p class='add_auth_adm'>"+$(addMem).find(".agd_mem_adm").text()+"</p>";
		addMemAuthHtml +="<p class='add_auth_name'>"+$(addMem).find(".agd_add_name").text()+"</p>";
		addMemAuthHtml +="<ul class='agd_auth_sub'>";
		addMemAuthHtml +="<li class='authSubChk'><a href='javascript:void(0);' class='agd_auth_sitem'>검토의견</a></li>";
		addMemAuthHtml +="<li><a href='javascript:void(0);' class='agd_auth_sitem'>참고의견</a></li></ul></div></li>";
		if(addMemCtn=="0"){
			$("#ExpComMember").addClass("add_mem_result");
			$("ul.com_agd_mem_list").append(addMemHtml);
			$(".com_agd_add_list .add_agd").each(function(idx,addMemAuth) {
				$(addMemAuth).find(".agd_auth_box ").addClass("add_auth_mem");
				$(addMemAuth).find(".agd_auth_cnt_list").append(addMemAuthHtml);
			});
		}else{
			switch($(addMem).data("memadm-amg")){
			case "Amg03":
				var inidx = Number(addamg04Length) + Number(addamg03Length) -1;
				if(inidx<0){
					inidx = 0;
					mode = "before";
				}
				break;
			case "Amg04":
				var inidx = Number(addamg04Length) -1;
				if(inidx<0){
					inidx = 0;
					mode = "before";
				}
				break;
			case "Amg05":
				var inidx = Number(addamg03Length) + Number(addamg04Length) + Number(addamg05Length) -1;
				if(inidx<0){
					inidx = 0;
					mode = "before";
				}
				break;
			case "Amg06":
				var inidx = Number(addamg03Length) + Number(addamg04Length) + Number(addamg05Length) + Number(addamg06Length) -1;
				break;
			}
			if(mode=="before"){
				$("ul.com_agd_mem_list li:eq("+inidx+")").before(addMemHtml);
			}else{
				$("ul.com_agd_mem_list li:eq("+inidx+")").after(addMemHtml);
			}
			$(".com_agd_add_list .add_agd").each(function(idx,addMemAuth) {
				if(mode=="before"){
					$(addMemAuth).find(".agd_auth_cnt_list > li:eq("+inidx+")").before(addMemAuthHtml);
				}else{
					$(addMemAuth).find(".agd_auth_cnt_list > li:eq("+inidx+")").after(addMemAuthHtml);
				}
			});
			mode = "after";
		}
		setExpMemNo();
	});
	
	$("#Dimmed_Layer_Warpper").css("display","none");
	$("#Dimmed_Layer_Warpper").empty();
}

// 구성원 삭제 처리 
function goExpMemDel(idx){
	//console.log("구성원 삭제");
	$(".nct_body ul.com_agd_mem_list li:eq("+idx+")").remove();
	
	var addMemCtn = $("#addMemCtn").val();
	addMemCtn--;
	var expAgdCnt = $("#expAgdCnt").val();
	if(addMemCtn=="0"){
		$("#ExpComMember").removeClass("add_mem_result");
		for(a=0;a<expAgdCnt;a++){
			//console.log(expAgdCnt+":"+a+":"+idx);	
			//$(".nct_body ul.com_agd_add_list > li:eq("+a+")").css("background","#ff0000");
			$(".nct_body ul.com_agd_add_list > li:eq("+a+")").find(".agd_auth_box").removeClass("add_auth_mem");
		}
	}
	$("#addMemCtn").val(addMemCtn);
	$("#Dimmed_Layer_Warpper").css("display","none");
	$("#Dimmed_Layer_Warpper").empty();
	
	for(a=0;a<expAgdCnt;a++){
		//console.log(expAgdCnt+":"+a+":"+idx);	
		//$(".nct_body ul.com_agd_add_list > li:eq("+a+")").css("background","#ff0000");
		$(".nct_body ul.com_agd_add_list > li:eq("+a+")").find("ul.agd_auth_cnt_list > li:eq("+idx+")").remove();
	}
	setExpMemNo();
}


//구성원 No 보정
function setExpMemNo(){
	var expAgdCnt = $("#expAgdCnt").val();
	var idx = $(".nct_body ul.com_agd_mem_list li").length;
	var amg03 = $(".nct_body ul.com_agd_mem_list .Amg03").length;
	var amg04 = $(".nct_body ul.com_agd_mem_list .Amg04").length;
	var amg05 = $(".nct_body ul.com_agd_mem_list .Amg05").length;
	var amg06 = $(".nct_body ul.com_agd_mem_list .Amg06").length;
	
	for(i=0;i<idx;i++){
		$(".nct_body ul.com_agd_mem_list li:eq("+i+")").find(".mem_num").text(i+1);
	}
	for(a=0;a<expAgdCnt;a++){
		var authLeng = $(".nct_body ul.com_agd_add_list > li:eq("+a+")").find("ul.agd_auth_cnt_list > li").length;
		for(m=0;m<authLeng;m++){
			$(".nct_body ul.com_agd_add_list > li:eq("+a+")").find("ul.agd_auth_cnt_list > li:eq("+m+")").find(".add_auth_no").text(m+1);
		}
	}
	$(".mem_add_cnt_box .all_cnt").text(idx);
	$("#addMemCtn").val(idx);
	$(".mem_add_cnt_box .adm03_cnt").text(amg03);
	$(".mem_add_cnt_box .adm04_cnt").text(amg04);
	$(".mem_add_cnt_box .adm05_cnt").text(amg05);
	$(".mem_add_cnt_box .adm06_cnt").text(amg06);
	
	// 안건별 검토, 참고 의견 카운트
	goExpAgdAuthSet('set03');
}

// 안건 삭제 처리 
function goExpAgdDel(idx){
	//console.log("안건 삭제");
	$(".nct_body ul.com_agd_add_list .add_agd:eq("+idx+")").remove();
	var expAgdCnt = $("#expAgdCnt").val();
	expAgdCnt--;
	if(expAgdCnt=="0"){
		$("#expComAgd").removeClass("add_agd_result");
	}
	$("#expAgdCnt").val(expAgdCnt);
	$("#Dimmed_Layer_Warpper").css("display","none");
	$("#Dimmed_Layer_Warpper").empty();
	setExpAgdNo();
}

// 안건 No 보정
function setExpAgdNo(){
	var idx = $(".nct_body ul.com_agd_add_list .add_agd").length;
	for(i=0;i<idx;i++){
		$(".nct_body ul.com_agd_add_list .add_agd:eq("+i+")").find(".agd_num").text(i+1);
	}
	$(".agd_add_cnt_box .all_cnt").text(idx);
	goExpAgdAuthSet('set04');
}
// 안건 별 검토권한, 검토의견, 참고의견 카운트 및 데이터 셋
function goExpAgdAuthSet(setCode){
	
	var expAgdCnt = $("#expAgdCnt").val();
	var addMemCtn = $("#addMemCtn").val();
	//console.log("안건:"+expAgdCnt+"/멤버:"+addMemCtn+":"+setCode);
	for(z=0;z<expAgdCnt;z++){
		var agdAuthCnt = $(".nct_body ul.agd_auth_cnt_list:eq("+z+")").find(".authOn").length;
		$(".nct_body ul.com_agd_add_list > li:eq("+z+")").find(".agd_auth_status .auth_all .cnt").text(agdAuthCnt+"/"+addMemCtn);
		//console.log(z+"안건검토권한:"+agdAuthCnt+"/"+addMemCtn);
		var auth_opi = agdAuthCnt;
		var auth_exm = 0;
		for(c=0;c<addMemCtn;c++){
			var subAuth = $(".nct_body ul.agd_auth_cnt_list:eq("+z+") > li:eq("+c+")").find(".authSubChk").index();
			//console.log(z+":"+c+":"+subAuth);
			if($(".nct_body ul.agd_auth_cnt_list:eq("+z+") > li:eq("+c+")").hasClass("authOn")){
				if(subAuth!="0"){
					auth_opi--;
					auth_exm++	
				}
			}
		}
		$(".nct_body ul.com_agd_add_list > li:eq("+z+")").find(".agd_auth_status .auth_opi .cnt").text(auth_opi+"/"+agdAuthCnt);
		$(".nct_body ul.com_agd_add_list > li:eq("+z+")").find(".agd_auth_status .auth_exm .cnt").text(auth_exm+"/"+agdAuthCnt);
	}
}
// 위원회 구성 저장
function goSaveExp(){
	var expMeta = {};
	var expAgds = [];
	var expMems = [];
	var expOpis = [];
	expMeta.expAgdCnt = 0;
	expMeta.expAmg03Cnt = 0;
	expMeta.expAmg04Cnt = 0;
	expMeta.expAmg05Cnt = 0;
	expMeta.expAmg06Cnt = 0;
	expMeta.expTechId = $("#expTechCode").val();
	if(expMeta.expTechId==""){
		expAlertPopup.open('codeExp005','','closeAlert','one', '');
		return;
	}
	$("ul.com_agd_add_list li.add_agd").each(function(idx,agd) {
		expAgds.push($(agd).data("agd-code"));
		expMeta.expAgdCnt++;
		var expOpiViewYn = "N";
		var expOpiYn = "N";
		$(agd).find("ul.agd_auth_cnt_list > li").each(function(idx, agdAuth){
			if ($(agdAuth).hasClass("authOn")) {
				expOpiViewYn = "Y";
				var memAuth = $(agdAuth).find(".authSubChk").index();
				if(memAuth=="0"){
					expOpiYn = "Y";
				}else{
					expOpiYn = "N";
				}
			}else{
				expOpiViewYn = "N";
				expOpiYn = "N";
			}
			expOpis.push({
				"agdCode": $(agd).data("agd-code"),
				"expAdmId": $(agdAuth).data("admid"),
				"expOpiViewYn": expOpiViewYn,
				"expOpiYn": 	expOpiYn
			});
		});
	});
	$("ul.com_agd_mem_list li.add_mem ").each(function(idx,mem) {
		expMems.push({"admId": $(mem).data("memadmid")});
		switch($(mem).data("memadm-amg")){
		case "Amg03":
			// 보호센터
			expMeta.expAmg03Cnt++;
			break;
		case "Amg04":
			// 소관과
			expMeta.expAmg04Cnt++;
			break;
		case "Amg05":
			// 전문위원
			expMeta.expAmg05Cnt++;
			break;
		case "Amg06":
			// 기술위원
			expMeta.expAmg06Cnt++;
			break;
		}
	});
	console.log(expMeta);
	console.log(expAgds);
	console.log(expMems);
	console.log(expOpis);
}


