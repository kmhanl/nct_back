/** 공통 프로퍼티 */
var comn = function(){
	var that = {};
	
	var popupId = 'Dimmed_Layer_Warpper';
	var $popup = null;
	
	that.setPopup = function(){
		$popup = $("#"+popupId);
	}
	
	that.popupClose = function(){
		$popup.css("display","none");
		$popup.empty();
	};
	
	/** 팝업 생성
	 * @param url 팝업 생성 URL
	 * @param callBack 팝업 생성 후 Callback Function
	 */
	that.popupOpen = function(url, callBack){
		$.ajax({
			url: url,
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success:function(result) {
				if (!result) {
					console.log("팝업 데이터가 없습니다.");
					return;
				}
				var resultHtml = result;
				// Dimmed_Layer_Warpper 가 화면상에 존재하는 경우 지우기
				if (result.indexOf(popupId) >= 0) {
					resultHtml = result.substring(result.indexOf(">")+1, result.lastIndexOf("</"));
				}
				$popup.css("display","");
				$popup.empty();
				$popup.append(resultHtml);
				
				/** 팝업 - X 버튼 (공통) 클릭 이벤트 */
				$popup.find('div.layer_popup_tit a.layer_closer').off().on('click',function(){
					that.popupClose();
				});
				
				// callback Function 이 존재하면 호출한다.
				if (callBack != null && callBack != undefined && typeof callBack == 'function'){
					callBack($popup);
				}
			}, error:function(e){
				console.log(e);
			}
		});
	};
	
	return that;
}();

$(document).ready(function(){    
	comn.setPopup();
	// GNB 줄임 버튼 
	$("#nav-icon3").click(function() {
        $("#FullGnbBody").css("display","flex");
    });
    
	$("#FullGnbClose").click(function() {
        $("#FullGnbBody").css("display","none");
    });
	
	
	$(".header_wrapper #nav-icon3").click(function() {
        if(!$(".header_wrapper").hasClass("gnb_active")){
			$(this).removeClass("open");
			$(".header_wrapper").addClass("gnb_active");
			$(".header_wrapper").animate({width: "90px"}, 300);
			$(".header_wrapper .gnb").removeClass("slide_on");
			$(".header_wrapper .gnb").addClass("slide_off");
			$(".header_wrapper .gnb_sub").css("display","none");
		}else{
			$(this).addClass("open");
			$(".header_wrapper").animate({width: "300px"},300, function() {
				$(".header_wrapper").removeClass("gnb_active");
				$(".header_wrapper .gnb").removeClass("slide_off");
				$(".header_wrapper .gnb").addClass("slide_on");
				$(".header_wrapper .active .gnb_sub").css("display","block");
			});
			
		}
    });
	//GNB 1Depth 메뉴 클릭
	$(".gnb .gnb_item").click(function() {
        if(!$(".header_wrapper").hasClass("gnb_active")){
			var menu_dep = $(this).data("menu_dep");
			if(menu_dep != "none"){
				$(this).parent().find(".gnb_item").removeClass("active");
				$(this).parent().find(".gnb_sub").css("display","none");
				$(this).find(".gnb_sub").css("display","block");
				$(this).addClass("active");
			}
		}else{
		
		}
	});
	
//	// 로그인 버튼 클릭 
//	$(".loginbox .login_normal").click(function() {
//		
//		if($("#cpnId").val()==""){
//			$("#fail_message").html("아이디를 입력해주세요.");
//			$("#fail_message").css("display","block");
//		}else if($("#cpnPassword").val()==""){
//			$("#fail_message").html("비밀번호를 입력해주세요.");
//			$("#fail_message").css("display","block");
//		}else{
//			var userid = $("#cpnId").val();
//			var userpw = $("#cpnPassword").val();
//			// AJAX DB 조회  DB: kaits_nct / Table : company_member
//			// ID 컬럼 CPN_ID / PW 컬럼 CPN_PASSWORD 
//			// 비밀번호 암호화 방식 이전과 동일
//			// CPN_STAT : Y면 관리자 승인된 계정 / N이면 관리자 승인전 계정
//			$.ajax({
//				type : "POST", 
//				url : "/member/proc/login", 
//			 	data : {"userid": userid, "userpw": userpw}, 
//			 	dataType : "json",
////				contentType: "application/json; charset:UTF-8",
//			 	success : function(data) { 
//					// data 정보
//					// resultCode: S(성공), F(실패)
//					// resultData: 유저정보
//					// resultOtpSend: OTP 인증요청 정보
//					console.log(data);
//					switch(data.resultCode){
//						case "S":
//							// 아이디 / 비번이 유효 한경유 OTP 발송 컨트롤러 AJAX로 호출후 OTP인증번호 입력 화면으로 전환 
//							// $("#fail_message").css("display","none");
//							$("#fail_message").css("display","none");
//							$(".otp_message").css("display","block");
//							$("p.opt_message strong").text(data.resultData.mbtlnum);
//							$(".loginbox .login").css("display","none");
//							$(".loginbox .otp").css("display","block");
//							break;
//						case "F":
//					 		$("#fail_message").html("아이디 혹은 비밀번호가 잘못되었습니다.");
//					 		$("#fail_message").css("display","block");
//							break;
//					}
//				},
//			 	error : function() { 
//			 		alert("통신장애"); 
//			 	} 
//			})
//		}
//	});
//	//OTP 재발급 버튼
//	$("#otpSendBtn").click(function() {
////		alert("OTP연동 개발 중입니다. 입력하신 아이디와 비밀번호로 로그인 됩니다.");
//		// 실제 로그인 처리 
//		$.ajax({
//			type : "POST", 
//			url : "/member/proc/otp/send", 
//		 	data : {}, 
//		 	dataType : "json", 
////			contentType: "application/json; charset:UTF-8",
//		 	success : function(data) { 
//				console.log("OTP 재요청 완료");
//				// data 정보
//				// resultCode: S(성공), F(실패)
//				// resultData: null
//				console.log(data);
//				switch(data.resultCode){
//					case "S":
//						// OTP 인증번호 발송 완료 
//						// $("#fail_message").css("display","none");
//						$("#fail_message").html("OTP 인증번호 재발송 되었습니다.");
//						$("#fail_message").css("display","block");
//						break;
//					case "F":
//				 		$("#fail_message").html("OTP 인증번호 재발송 실패.");
//				 		$("#fail_message").css("display","block");
//						break;
//				}
//			},
//		 	error : function() { 
//		 		alert("통신장애"); 
//		 	} 
//		});
//	});
//	//OTP 확인 버튼
//	$(".loginbox .otp_normal").click(function() {
//		// 입력값 검증
//		var otpNumber = $("#otp").val();
//		if (otpNumber == null || otpNumber == ""){
//			$("#fail_message").html("OTP 인증번호를 입력해주세요.");
//			$("#fail_message").css("display","block");
//			return;
//		}
//		// OTP 인증
//		$.ajax({
//			type : "POST", 
//			url : "/member/proc/otp/check", 
//		 	data : {otpNumber: otpNumber}, 
//		 	dataType : "json",
////			contentType: "application/json; charset:UTF-8",
//		 	success : function(data) { 
//				console.log("OTP 인증 완료");
//				// data 정보
//				// resultCode: S(성공), F(실패)
//				// resultMessage: 인증 결과에 따른 메시지
//				console.log(data);
//				switch(data.resultCode){
//					case "S":
//						// OTP 인증 성공 
//						location.href = "/dash.do";
//						break;
//					case "F":
//						// OTP 인증 실패
//				 		$("#fail_message").html(data.resultMessage);
//				 		$("#fail_message").css("display","block");
//						break;
//				}
//			},
//		 	error : function() { 
//		 		alert("통신장애"); 
//		 	} 
//		});
//	});

	//GNB Close 1Depth 메뉴 Hover
	$(".gnb .gnb_item").hover(function(){
		
		if($(this).parent().hasClass("slide_off")){
			$(this).find(".gnb_sub").css("display","block");
		}
	},
	function(){
		if($(this).parent().hasClass("slide_off")){
			$(this).find(".gnb_sub").css("display","none");
		}
	});
	$(".login_icon").hover(function(){
		//alert("asd");
		$(this).find(".name_card_02").css("display","block");
		// if($(this).parent().hasClass("slide_off")){
			
		// }
	},
	function(){
		$(this).find(".name_card_02").css("display","none");
	});
	//공통 리스트 좌측 검색 버튼
	$(".body_tap_wrapper .sch_btn").click(function() {
    	if(!$(".search_wrapper").hasClass("sch_active")){
			$(".search_wrapper").addClass("sch_active");
			$(".search_wrapper").css("display","block");
		}else{
			$(".search_wrapper").removeClass("sch_active");
			$(".search_wrapper").css("display","none");
		}
	});

	// 접수 관리 > 신규 등록 > 접수 분야 선택 
	$(".receipt_type_select .receipt_type_item").click(function() {
        if(!$(this).parent().hasClass("on")){
			var type_code = $(this).attr("value");
			$(this).parent().parent().parent().find(".receipt_type_val").val(type_code);
			$(this).parent().parent().find("li").removeClass("on");
			$(this).parent().addClass("on");
		}
	});
	

	
	// 안건 현황 > 검토 요청 > 2002 / 검토 요청 팝업 부서 선택
    $('.layer_popup_body').on('click','.dept_list_01 li ',function(){
        if($(this).hasClass("dept_on")){
            $(this).removeClass("dept_on");
        }else{
            $(this).addClass("dept_on");
        }
    });
		
});
function ucardinfo(){
	$("#LoginCard").toggle();
}
