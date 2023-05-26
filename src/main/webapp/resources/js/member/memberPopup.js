/**
 * [업무포털 회원관리] 업무포털 회원관리 팝업  화면 스크립트
 * - 작성일: 2022-02-08
 * 
 * - 다른 스크립트 변수 사용
 * 1. [common.js] comn
 */
	
/** ********** 초대 메일 발송  팝업 Function *********** */
var invitationWritePopup = function(){
	var wp = {};
	
	var $popup = null;
	var popupUrl = "/member/invitationWrite.do";
	
	/** 팝업 종료 */
	wp.close = function(){
		comn.popupClose();
	};
	
	/** 화면에서 시작하는 경우 */
	wp.open = function(){
		comn.popupOpen(popupUrl, createEvent);
	};
	
	
	/** 팝업 기능 생성 */
	var createEvent = function(popupElement){
		$popup = popupElement;
		
		
		/** 소속 선택  */
		$popup.find(".InviConpany .InviCompanyItem").off().on("click",function(){
			var idx = $(this).parent().index();
			
			if(!$(this).parent().hasClass("ChkOn")){
				$(this).parent().parent().find("li").removeClass("ChkOn");
				$(this).parent().addClass("ChkOn");
				if(idx=="0"){
					$(this).parent().parent().parent().find("#InviCompany").val("AMG04");
					$(this).parent().parent().parent().find("#InviComDWrap").css("display","block");
					$(this).parent().parent().parent().find("#InviComYear").css("display","none");
				}else if(idx=="1"){
					$(this).parent().parent().parent().find("#InviCompany").val("AMG05");
					$(this).parent().parent().parent().find("#InviComDWrap").css("display","none");
					$(this).parent().parent().parent().find("#InviComYear").css("display","flex");
				}else if(idx=="2"){
					$(this).parent().parent().parent().find("#InviCompany").val("AMG06");
					$(this).parent().parent().parent().find("#InviComDWrap").css("display","none");
					$(this).parent().parent().parent().find("#InviComYear").css("display","none");
				}else if(idx=="3"){
					$(this).parent().parent().parent().find("#InviCompany").val("AMG03");
					$(this).parent().parent().parent().find("#InviComDWrap").css("display","none");
					$(this).parent().parent().parent().find("#InviComYear").css("display","none");
				}else if(idx=="4"){
					$(this).parent().parent().parent().find("#InviCompany").val("AMG02");
					$(this).parent().parent().parent().find("#InviComDWrap").css("display","none");
					$(this).parent().parent().parent().find("#InviComYear").css("display","none");
				}else{
					$(this).parent().parent().parent().find("#InviCompany").val("AMG01");
					$(this).parent().parent().parent().find("#InviComDWrap").css("display","none");
					$(this).parent().parent().parent().find("#InviComYear").css("display","none");
				}
			}
			
		});
		
		/** 간사 사무관 선택  */
		$popup.find(".InviComDWrap .InviComDItem").off().on("click",function(){
			var idx = $(this).parent().index();
			
			if(!$(this).parent().hasClass("ChkOn")){
				$(this).parent().parent().find("li").removeClass("ChkOn");
				$(this).parent().addClass("ChkOn");
				if(idx=="0"){
					$(this).parent().parent().parent().find("#InviComD").val("Y");
					
				}else if(idx=="1"){
					$(this).parent().parent().parent().find("#InviComD").val("N");
					
				}
			}
			
		});
		
		/** 위원회  선택  */
		$popup.find(".InviCommit .InviCommitItem").off().on("click",function(){
			
			if(!$(this).parent().hasClass("ChkOn")){
				$(this).parent().addClass("ChkOn");
			}else{
				$(this).parent().removeClass("ChkOn");
			}
			
		});
		
		/** 기술 분야  선택  */
		$popup.find(".InviTech .InviTechItem").off().on("click",function(){
			
			if(!$(this).parent().hasClass("ChkOn")){
				$(this).parent().addClass("ChkOn");
			}else{
				$(this).parent().removeClass("ChkOn");
			}
			
		});
		
		/** 닫기 버튼 클릭 이벤트 */
		$popup.find("div.layer_popup_btn a.btn_close").off().on("click",function(){
			wp.close();
		});
		
		/** 저장 버튼 클릭 이벤트 */
		$popup.find("div.layer_popup_btn a.btn_invisace").off().on("click",function(){
			var inviCompany = $("#InviCompany").val();
			var inviSamu = $("#InviComD").val();
			var inviComYear = $("#InviComYearDate").val();
			var inviComIdx = $("#InviComIdx").val();
			var inviProYn = "N";
			var inviSaveYn = "N";
			var inviSubYn = "N";
			var techList = [];
			var inviName = $("#InviName").val();
			var inviMobile = $("#InviPhone").val();
			var inviEmail = $("#InviEmail").val();
			
			// 위원회 권한
			$popup.find("ul.InviCommitList li").each(function(idx, li) {
				if($(li).hasClass("ChkOn")) {
					switch ($(li).find("a.InviCommitItem").data("com-item")) {
						case "PRO":
							inviProYn = "Y";
							break;
						case "SAVE":
							inviSaveYn = "Y";
							break;
						case "SUB":
							inviSubYn = "Y";
							break;
					}
				}
			});
			
			// 기술분야 권한
			$popup.find("ul.InviTechList li").each(function(idx, li){
				if($(li).hasClass("ChkOn")) {
					techList.push({admId: null, techId: $(li).find("a.InviTechItem").data("techId")});
				}
			});
			if(inviCompany!="AMG04"){
				inviSamu = 'N';
			}
			var phone1 = inviMobile.substr(0,3); 
			var phone2 = inviMobile.substr(3,4);
			var phone3 = inviMobile.substr(7,4);
			var miInfo = {
				admInviGroup: inviCompany,
				admInviName: inviName,
				admInviMobile1: phone1,
				admInviMobile2: phone2,
				admInviMobile3: phone3,
				admInviEmail: inviEmail,
				admInviCarYear: inviComYear,
				admInviCarNum: inviComIdx,
				admInviSamu: inviSamu,
				admInviProYn: inviProYn,
				admInviSaveYn: inviSaveYn,
				admInviSubYn: inviSubYn
			};
			
			var	emailHisSenderName = "국가핵심기술 종합관리시스템";
			var emailHisSubject = "국가핵심기술 종합관리시스템 회원가입 "; // 이메일 제목
			
			$.ajax({
				anyne:true,
				type:'POST',
				data: JSON.stringify({
					memberInvitationInfo: miInfo,
					techList: techList,
					emailHisSenderName : emailHisSenderName,
					emailHisSubject : emailHisSubject
				}),
	        	url: "/member/proc/invite/save.do",
				dataType: "json",
				contentType: 'application/json;charset=UTF-8',
			 	success : function(data) { 
			 		console.log(data);
					switch(data.resultCode){
						case "S":
							//alert("신규 회원 초대가 완료되었습니다."+data.resultSeq);
							//location.href = "/member/invitationList";
							var returnMsg = "신규 회원 초대가 완료되었습니다.";
							var rscMemEmail = inviEmail;
							var rscMemName = inviName;
							var emailSendNote1 = data.resultSeq;
							var emailSendNote2 = "";
							var emailSendNote3 = "";
							var emailSendNote4 = "";
							var emailSendNote5 = "";
							
							var HisSenderName = "국가핵심기술 종합관리시스템";
							var HisSubject = "국가핵심기술 종합관리시스템 회원가입 요청";
							var HisBody = "";
							var HisTemp = "8";
							var HisSender = "국가핵심기술 종합관리시스템";
							var HisUserName = "UserName유저네임";
							sendEmail(rscMemEmail, rscMemName, HisSenderName, HisSubject, HisBody, HisTemp, HisSender, HisUserName, emailSendNote1, emailSendNote2, emailSendNote3, emailSendNote4, emailSendNote5, returnMsg);
							
							break;
						case "F":
							//alert("신규 회원 초대가 실패하였습니다.");
							break;
					}
				},
			 	error : function() { 
			 		alert("통신장애"); 
			 	} 
			});
		});
		
		
	}
    return wp;
}();


/** ********** 초대 메일 발송  팝업 Function *********** */
var HoldTechInvitationWritePopup = function(){
	var wp = {};
	
	var $popup = null;
	var popupUrl = "/holdtech/invitationWrite.do";
	
	/** 팝업 종료 */
	wp.close = function(){
		comn.popupClose();
	};
	
	/** 화면에서 시작하는 경우 */
	wp.open = function(){
		comn.popupOpen(popupUrl, createEvent);
	};
	
	
	/** 팝업 기능 생성 */
	var createEvent = function(popupElement){
		$popup = popupElement;
		
		
		
		/** 닫기 버튼 클릭 이벤트 */
		$popup.find("div.layer_popup_btn a.btn_close").off().on("click",function(){
			wp.close();
		});
		
		/** 저장 버튼 클릭 이벤트 */
		$popup.find("div.layer_popup_btn a.btn_invisace").off().on("click",function(){
			var inviCompany = "";
			var inviSamu =  "";
			var inviComYear =  "";
			var inviComIdx =  "";
			var inviProYn = "N";
			var inviSaveYn = "N";
			var inviSubYn = "N";
			var techList = [];
			var inviName = $("#InviName").val();
			var inviMobile = $("#InviPhone").val();
			var inviEmail = $("#InviEmail").val();
			
			// 위원회 권한
			$popup.find("ul.InviCommitList li").each(function(idx, li) {
				if($(li).hasClass("ChkOn")) {
					switch ($(li).find("a.InviCommitItem").data("com-item")) {
						case "PRO":
							inviProYn = "Y";
							break;
						case "SAVE":
							inviSaveYn = "Y";
							break;
						case "SUB":
							inviSubYn = "Y";
							break;
					}
				}
			});
			
			// 기술분야 권한
			$popup.find("ul.InviTechList li").each(function(idx, li){
				if($(li).hasClass("ChkOn")) {
					techList.push({admId: null, techId: $(li).find("a.InviTechItem").data("techId")});
				}
			});
			if(inviCompany!="AMG04"){
				inviSamu = 'N';
			}
			var phone1 = inviMobile.substr(0,3); 
			var phone2 = inviMobile.substr(3,4);
			var phone3 = inviMobile.substr(7,4);
			var miInfo = {
				admInviGroup: inviCompany,
				admInviName: inviName,
				admInviMobile1: phone1,
				admInviMobile2: phone2,
				admInviMobile3: phone3,
				admInviEmail: inviEmail,
				admInviCarYear: inviComYear,
				admInviCarNum: inviComIdx,
				admInviSamu: inviSamu,
				admInviProYn: inviProYn,
				admInviSaveYn: inviSaveYn,
				admInviSubYn: inviSubYn
			};
			
			var	emailHisSenderName = "국가핵심기술 종합관리시스템";
			var emailHisSubject = "국가핵심기술 종합관리시스템 회원가입 "; // 이메일 제목
			
			$.ajax({
				anyne:true,
				type:'POST',
				data: JSON.stringify({
					memberInvitationInfo: miInfo,
					techList: techList,
					emailHisSenderName : emailHisSenderName,
					emailHisSubject : emailHisSubject
				}),
	        	url: "/holdtech/inviteSave.do",
				dataType: "json",
				contentType: 'application/json;charset=UTF-8',
			 	success : function(data) { 
			 		console.log(data);
					switch(data.resultCode){
						case "S":
							//alert("신규 회원 초대가 완료되었습니다."+data.resultSeq);
							//location.href = "/member/invitationList";
							var returnMsg = "신규 회원 초대가 완료되었습니다.";
							var rscMemEmail = inviEmail;
							var rscMemName = inviName;
							var emailSendNote1 = data.resultSeq;
							var emailSendNote2 = "";
							var emailSendNote3 = "";
							var emailSendNote4 = "";
							var emailSendNote5 = "";
							
							var HisSenderName = "국가핵심기술 종합관리시스템";
							var HisSubject = "국가핵심기술 종합관리시스템 회원가입 요청";
							var HisBody = "";
							var HisTemp = "11";
							var HisSender = "국가핵심기술 종합관리시스템";
							var HisUserName = "UserName유저네임";
							sendEmail(rscMemEmail, rscMemName, HisSenderName, HisSubject, HisBody, HisTemp, HisSender, HisUserName, emailSendNote1, emailSendNote2, emailSendNote3, emailSendNote4, emailSendNote5, returnMsg);
							
							break;
						case "F":
							//alert("신규 회원 초대가 실패하였습니다.");
							break;
					}
				},
			 	error : function() { 
			 		alert("통신장애"); 
			 	} 
			});
		});
		
		
	}
    return wp;
}();











/** ********** 접수내역 상세 팝업 Function *********** */
var MemberViewPopup = function(){
	var wp = {};
	
	var $popup = null;
	var popupUrl = "/member/memberview.do";
	
	wp.admId = null;
	
	/** 팝업 종료 */
	wp.close = function(){
		comn.popupClose();
	};
	
	/** 화면에서 시작하는 경우 */
	wp.open = function(admId, mode, invichk, admstat){
		wp.admId = admId;
		wp.mode = mode;
		wp.admInviKey = invichk;
		wp.admstat = admstat;
		comn.popupOpen(popupUrl+"?admId="+wp.admId+"&mode="+wp.mode+"&admInviKey="+wp.admInviKey+"&admstat="+wp.admstat, createEvent);
	};
	
	
	/** 팝업 기능 생성 */
	var createEvent = function(popupElement){
		$popup = popupElement;
		
		/** 소속 선택  */
		$popup.find(".InviConpany .InviCompanyItem").off().on("click",function(){
			var gididx = $(this).data("admgid");
			
			if(!$(this).parent().hasClass("ChkOn")){
				$(this).parent().parent().parent().find("li").removeClass("ChkOn");
				$(this).parent().addClass("ChkOn");
				$(this).parent().parent().parent().find("#InviCompany").val(gididx);
			}
			
		});
		
		/** 간사 사무관 선택  */
		$popup.find(".InviComDWrap .InviComDItem").off().on("click",function(){
			var idx = $(this).parent().index();
			
			if(!$(this).parent().hasClass("ChkOn")){
				$(this).parent().parent().find("li").removeClass("ChkOn");
				$(this).parent().addClass("ChkOn");
				if(idx=="0"){
					$(this).parent().parent().parent().find("#InviComD").val("Y");
					
				}else if(idx=="1"){
					$(this).parent().parent().parent().find("#InviComD").val("N");
					
				}
			}
			
		});
		
		/** 위원회  선택  */
		$popup.find(".InviCommit .InviCommitItem").off().on("click",function(){
			
			if(!$(this).parent().hasClass("ChkOn")){
				$(this).parent().addClass("ChkOn");
			}else{
				$(this).parent().removeClass("ChkOn");
			}
			
		});
		
		/** 기술 분야  선택  */
		$popup.find(".InviTech .InviTechItem").off().on("click",function(){
			
			if(!$(this).parent().hasClass("ChkOn")){
				$(this).parent().addClass("ChkOn");
			}else{
				$(this).parent().removeClass("ChkOn");
			}
			
		});
		
		/** 닫기 버튼 클릭 이벤트 */
		$popup.find("div.layer_popup_btn a.btn_close").off().on("click",function(){
			wp.close();
		});
		
		/** 저장 버튼 클릭 이벤트 */
		$popup.find("div.layer_popup_btn a.btn_memsetup").off().on("click",function(){
			var admInfo = {
				admId:      wp.admId,
				admProYn:   "N",
				admSaveYn:  "N",
				admSubYn:   "N",
			};
			var InviCompany = $("#InviCompany").val();
			var admStat = $("#admStat").val();
			if(InviCompany==""){
				alert("소속 권한을 설정해주세요.");
				return;
			}
			admInfo.admGroup = InviCompany;
			var techList  = [];
			// 위원회 권한 체크
			var job = $popup.find("ul.InviCommitList .ChkOn").length;
			if(job=="0"){
				alert("하나 이상의 위원회 권한을 설정해주세요.");
				return;
			}else{
				if($popup.find("ul.InviCommitList li:eq(0)").hasClass("ChkOn")){
					admInfo.admProYn = "Y";
				}else{
					admInfo.admProYn = "N";
				}
				if($popup.find("ul.InviCommitList li:eq(1)").hasClass("ChkOn")){
					admInfo.admSaveYn = "Y";
				}else{
					admInfo.admSaveYn = "N";
				}
				if($popup.find("ul.InviCommitList li:eq(2)").hasClass("ChkOn")){
					admInfo.admSubYn = "Y";
				}else{
					admInfo.admSubYn = "N";
				}
			}
			
			
			var jobtech = $popup.find(".InviTech .ChkOn").length;
			if(jobtech=="0"){
				alert("하나 이상의 기술분야 권한을 설정해주세요.");
				return;
			}
			
			// 기술분야 권한
			$popup.find("ul.InviTechList li").each(function(idx, li){
				if($(li).hasClass("ChkOn")) {
					techList.push({admId: wp.admId, techId: $(li).find("a.InviTechItem").data("tech-id")});
				}
			});
			
			console.log(admInfo);
			console.log(techList);

			$.ajax({
				anyne:true,
				type:'POST',
				data: JSON.stringify({
					admInfo: admInfo,
					techList: techList
				}),
	        	url: "/member/proc/admin/apply.do",
				dataType: "json",
				contentType: 'application/json;charset=UTF-8',
			 	success : function(data) { 
			 		console.log(data);
					// data 정보
					// resultCode: S(성공), F(실패)
					// resultData: 유저정보
					// resultOtpSend: OTP 인증요청 정보
					if(data.resultCode=="S"){
						if(admStat=="400"){
							
							var returnMsg = "권한 사용 승인이 완료되었습니다.";
							var rscMemEmail = $("#inviEmail").val();
							var rscMemName = $("#inviName").val();
							var emailSendNote1 = $("#admId").val();
							var emailSendNote2 = $("#admCom").val();
							var admDept = $("#admDept").val();
							var admPositon = $("#admPositon").val();
							var emailSend3 = admDept+"/"+admPositon;
							var emailSendNote3 = emailSend3;
							var emailSendNote4 = "";
							var emailSendNote5 = "";
							
							var HisSenderName = "국가핵심기술 종합관리시스템";
							var HisSubject = "국가핵심기술 종합관리시스템 회원가입 승인 안내";
							var HisBody = "";
							
							if(InviCompany=="AMG01"){
								var HisTemp = "20";
							}else if(InviCompany=="AMG02"){
								var HisTemp = "23";
							}else if(InviCompany=="AMG03"){
								var HisTemp = "26";
							}else if(InviCompany=="AMG04"){
								var HisTemp = "29";
							}else{
								var HisTemp = "32";
							}
							var HisTemp = "17";
							var HisSender = "국가핵심기술 종합관리시스템";
							var HisUserName = "UserName유저네임";
							sendEmail(rscMemEmail, rscMemName, HisSenderName, HisSubject, HisBody, HisTemp, HisSender, HisUserName, emailSendNote1, emailSendNote2, emailSendNote3, emailSendNote4, emailSendNote5, returnMsg);
							console.log(HisTemp);
						}else{
							alert("회원의 권한 설정이 완료되었습니다.");
							location.reload();
						}
						// 공통 17 / 기술 안보 20 / 보호협회 23 / 기밀센터 26 / 소관과 29 / 전문위원,기술간사 32
						//location.reload();
					}
				},
			 	error : function() { 
			 		alert("통신장애"); 
			 	} 
			});
		});
	}
    return wp;
}();

/** ********** 권한 수정 *********** */
var MemberEditPopup = function(){
	var wp = {};
	
	var $popup = null;
	var popupUrl = "/member/memberEdit.do";
	
	wp.admId = null;
	
	/** 팝업 종료 */
	wp.close = function(){
		comn.popupClose();
	};
	
	/** 화면에서 시작하는 경우 */
	wp.open = function(admId){
		wp.admId = admId
		comn.popupOpen(popupUrl+"?admId="+wp.admId, createEvent);
	};
	
	
	/** 팝업 기능 생성 */
	var createEvent = function(popupElement){
		$popup = popupElement;
		
		/** 소속 선택  */
		$popup.find(".InviConpany .InviCompanyItem").off().on("click",function(){
			var idx = $(this).parent().index();
			
			if(!$(this).parent().hasClass("ChkOn")){
				$(this).parent().parent().find("li").removeClass("ChkOn");
				$(this).parent().addClass("ChkOn");
				if(idx=="0"){
					$(this).parent().parent().parent().find("#InviCompany").val("AMG04");
					$(this).parent().parent().parent().find("#InviComDWrap").css("display","block");
					$(this).parent().parent().parent().find("#InviComYear").css("display","none");
				}else if(idx=="1"){
					$(this).parent().parent().parent().find("#InviCompany").val("AMG05");
					$(this).parent().parent().parent().find("#InviComDWrap").css("display","none");
					$(this).parent().parent().parent().find("#InviComYear").css("display","flex");
				}else{
					$(this).parent().parent().parent().find("#InviCompany").val("AMG06");
					$(this).parent().parent().parent().find("#InviComDWrap").css("display","none");
					$(this).parent().parent().parent().find("#InviComYear").css("display","none");
				}
			}
			
		});
		
		/** 간사 사무관 선택  */
		$popup.find(".InviComDWrap .InviComDItem").off().on("click",function(){
			var idx = $(this).parent().index();
			
			if(!$(this).parent().hasClass("ChkOn")){
				$(this).parent().parent().find("li").removeClass("ChkOn");
				$(this).parent().addClass("ChkOn");
				if(idx=="0"){
					$(this).parent().parent().parent().find("#InviComD").val("Y");
					
				}else if(idx=="1"){
					$(this).parent().parent().parent().find("#InviComD").val("N");
					
				}
			}
			
		});
		
		/** 위원회  선택  */
		$popup.find(".InviCommit .InviCommitItem").off().on("click",function(){
			
			if(!$(this).parent().hasClass("ChkOn")){
				$(this).parent().addClass("ChkOn");
			}else{
				$(this).parent().removeClass("ChkOn");
			}
			
		});
		
		/** 기술 분야  선택  */
		$popup.find(".InviTech .InviTechItem").off().on("click",function(){
			
			if(!$(this).parent().hasClass("ChkOn")){
				$(this).parent().addClass("ChkOn");
			}else{
				$(this).parent().removeClass("ChkOn");
			}
			
		});
		
		/** 닫기 버튼 클릭 이벤트 */
		$popup.find("div.layer_popup_btn a.btn_close").off().on("click",function(){
			wp.close();
		});
		
		/** 저장 버튼 클릭 이벤트 */
		$popup.find("div.layer_popup_btn a.btn_invisace").off().on("click",function(){
			var admInfo = {
				admId:      wp.admId,
				admName:    "",
				admMobile1: "",
				admMobile2: "",
				admMobile3: "",
				admEmail:   "",
				admProYn:   "N",
				admSaveYn:  "N",
				admSubYn:   "N",
			};
			var techList  = [];
			// 위원회 권한 체크
			$popup.find("ul.InviCommitList li").each(function(idx, li){
				if($(li).hasClass("ChkOn")) {
					switch($(li).find("a.InviCommitItem").data("commit-auth")) {
					case "PRO":
						admInfo.admProYn = "Y";
						break;
					case "SAVE":
						admInfo.admSaveYn = "Y";
						break;
					case "SUB":
						admInfo.admSubYn = "Y";
						break;
					}
				}
			});
			
			// 기술분야 권한
			$popup.find("ul.InviTechList li").each(function(idx, li){
				if($(li).hasClass("ChkOn")) {
					techList.push({admId: wp.admId, techId: $(li).find("a.InviTechItem").data("tech-id")});
				}
			});
			
			// 이름, 휴대폰번호, 이메일
			admInfo.admName   = $("#InviName").val();
			var admMobile = $("#InviPhone").val();
			if (admMobile.length < 10) {
				alert("휴대폰 번호가 올바르지 않습니다.");
				return;
			} else if (admMobile.length === 10) {
				admInfo.admMobile1 = admMobile.substring(0,3);
				admInfo.admMobile2 = admMobile.substring(3,6);
				admInfo.admMobile3 = admMobile.substring(6,10);
			} else if (admMobile.length === 11) {
				admInfo.admMobile1 = admMobile.substring(0,3);
				admInfo.admMobile2 = admMobile.substring(3,7);
				admInfo.admMobile3 = admMobile.substring(7,11);
			}
			admInfo.admEmail  = $("#InviEmail").val();

			console.log(admInfo);
			console.log(techList);

			$.ajax({
				anyne:true,
				type:'POST',
				data: JSON.stringify({
					admInfo: admInfo,
					techList: techList
				}),
	        	url: "/member/proc/admin/apply.do",
				dataType: "json",
				contentType: 'application/json;charset=UTF-8',
			 	success : function(data) { 
			 		console.log(data);
					// data 정보
					// resultCode: S(성공), F(실패)
					// resultData: 유저정보
					// resultOtpSend: OTP 인증요청 정보
					switch(data.resultCode){
						case "S":
							alert("회원 사용 승인이 완료되었습니다.");
							location.href = "/member/memberList";
							break;
						case "F":
							alert("회원 사용 승인이 실패하였습니다.");
							break;
					}
				},
			 	error : function() { 
			 		alert("통신장애"); 
			 	} 
			});
		});
	}
    return wp;
}();



/** ********** 권한 수정 *********** */
var CompanyViewPopup = function(){
	var wp = {};
	
	//alert("22222")
	var $popup = null;
	var popupUrl = "/member/comMemberInfo.do";
	
	wp.admId = null;
	
	/** 팝업 종료 */
	wp.close = function(){
		comn.popupClose();
	};
	
	/** 화면에서 시작하는 경우 */
	wp.open = function(admId){
		wp.admId = admId
		comn.popupOpen(popupUrl+"?cpnId="+wp.admId, createEvent);
	};
	
	
	/** 팝업 기능 생성 */
	var createEvent = function(popupElement){
		$popup = popupElement;
		
		
		/** 닫기 버튼 클릭 이벤트 */
		$popup.find("div.layer_popup_btn a.btn_close").off().on("click",function(){
			wp.close();
		});
		
		/** 저장 버튼 클릭 이벤트 */
		$popup.find("div.layer_popup_btn a.btn_shipSave").off().on("click",function(){
			 var result = confirm('승인 하시겠습니까?');
			 var cpnId = wp.admId;
			 if(result){
				$.ajax({
				type : "POST", 
				data : {"cpnId": cpnId, "cpnStat" : '200'}, 
			 	dataType : "json",
	        	url: "/member/proc/comapply.do",
			 	success : function(data) { 
			 		console.log(data);
					switch(data.resultCode){
						case "S":
							alert("사용 승인이 완료되었습니다.");
						    location.reload();
							break;
						case "F":
							alert("사용 승인이 실패하였습니다.");
							location.reload();
							break;
					}
				},
			 	error : function() { 
			 		alert("통신장애"); 
			 	} 
			});	
			}
		});
		
		/** 저장 버튼 클릭 이벤트 */
		$popup.find("div.layer_popup_btn a.btn_shipStop").off().on("click",function(){
			 var result = confirm('사용 중지 하시겠습니까?');
			 var cpnId = wp.admId;
			 if(result){
				$.ajax({
				type : "POST", 
				data : {"cpnId": cpnId, "cpnStat" : '500'}, 
			 	dataType : "json",
	        	url: "/member/proc/comapply.do",
			 	success : function(data) { 
			 		console.log(data);
					switch(data.resultCode){
						case "S":
							alert("사용 중지 되었습니다.");
						    location.reload();
							break;
						case "F":
							location.reload();
							break;
					}
				},
			 	error : function() { 
			 		alert("통신장애"); 
			 	} 
			});	
			}
		});
			
	}
    return wp;
}();