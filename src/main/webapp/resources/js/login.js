/**
 * [전문위원회] 로그인 화면 스크립트
 * - 작성일: 2022-01-11
 * 
 */
var secondstotal = 180;
var isAuthSuccess = false;
$(document).ready(function(){   
 	var authpopup = null;
// 로그인 버튼 클릭 
	$("#cpnId").keypress(function(e){
		if (e.key === "Enter") {
			goLogin();
		}
	});
	$("#cpnPassword").keypress(function(e){
		if (e.key === "Enter") {
			goLogin();
		}
	});
	
	$("#phoneNum").change(function(){
		alert("asddd");
		var phoneNum = $("#phoneNum").val();
		$("#JoinPhone1").val(phoneNum);
	});
	
	
	$(".loginbox .login_normal").click(function() {
		goLogin();
	});
	
	var goLogin = function() {
		if($("#cpnId").val()==""){
			$("#fail_message").html("아이디를 입력해주세요.");
			$("#fail_message").css("display","block");
			$("#cpnId").focus();
		}else if($("#cpnPassword").val()==""){
			$("#fail_message").html("비밀번호를 입력해주세요.");
			$("#fail_message").css("display","block");
			$("#cpnPassword").focus();
		}else{
			var userid = $("#cpnId").val();
			var userpw = $("#cpnPassword").val();
			// AJAX DB 조회  DB: kaits_nct / Table : company_member
			// ID 컬럼 CPN_ID / PW 컬럼 CPN_PASSWORD 
			// 비밀번호 암호화 방식 이전과 동일
			// CPN_STAT : Y면 관리자 승인된 계정 / N이면 관리자 승인전 계정
			$.ajax({
				type : "POST", 
				url : "/member/proc/login", 
			 	data : {"userid": userid, "userpw": userpw}, 
			 	dataType : "json",
//				contentType: "application/json; charset:UTF-8",
			 	success : function(data) { 
					// data 정보
					// resultCode: S(성공), F(실패)
					// resultData: 유저정보
					// resultOtpSend: OTP 인증요청 정보
					console.log(data);
					switch(data.resultCode){
						case "SL":
							location.href = "/dash.do";
							break;
						case "S":
							if (data.resultStat == "300") {
								//invitationWritePopup.open();
								//location.href = "/dash" + data.resultStat + ".do";
								//alert("국가핵심기술 종합관리시스템의 사용 권한이 중지 되었습니다.\n관리자에게 문의해주세요.");
								location.href = "/member/meminfo.do?infoCode="+data.resultStat;
								return;
							}else if (data.resultStat == "400") {
								location.href = "/member/meminfo.do?infoCode="+data.resultStat;
								return;
							}else {
								// 아이디 / 비번이 유효 한경유 OTP 발송 컨트롤러 AJAX로 호출후 OTP인증번호 입력 화면으로 전환 
								// $("#fail_message").css("display","none");
								$("#fail_message").css("display","none");
								$(".otp_message").css("display","block");
								
								SetTimer = setInterval("StartTimer()", 1000); 
	
								$("p.opt_message strong").text(data.resultData.admMobile1+"-****-"+data.resultData.admMobile3);
								$(".loginbox .login").css("display","none");
								$(".loginbox .otp").css("display","block");
								break;
							}
						case "F":
					 		$("#fail_message").html("아이디 혹은 비밀번호가 잘못되었습니다.");
					 		$("#fail_message").css("display","block");
							break;
					}
				},
			 	error : function() { 
			 		alert("통신장애"); 
			 	} 
			});
		}
	}
	//OTP 재발급 버튼
	$("#otpSendBtn").click(function() {
//		alert("OTP연동 개발 중입니다. 입력하신 아이디와 비밀번호로 로그인 됩니다.");
		// 실제 로그인 처리 
		var OtpTimeStat = $("#OtpTimeStat").val();
		if(OtpTimeStat="ing"){
			var chkExit = confirm('인증번호를 다시 받으시겠습니까?');
			if(chkExit){
				$.ajax({
					type : "POST", 
					url : "/member/proc/otp/send", 
				 	data : {}, 
				 	dataType : "json", 
		//			contentType: "application/json; charset:UTF-8",
				 	success : function(data) { 
						// data 정보
						// resultCode: S(성공), F(실패)
						// resultData: null
						switch(data.resultCode){
							case "S":
								// OTP 인증번호 발송 완료 
								// $("#fail_message").css("display","none");
								$("#fail_message").html("OTP 인증번호가 재발송 되었습니다.");
								$("#fail_message").css("display","block");
								
								clearInterval(SetTimer);
								$("#OtpTimeStat").val("stop");
								SetTimer = setInterval("StartTimer()", 1000); 
								break;
							case "F":
						 		$("#fail_message").html("OTP 인증번호 재발송 실패.");
						 		$("#fail_message").css("display","block");
								break;
						}
					},
				 	error : function() { 
				 		alert("통신장애"); 
				 	} 
				});
			}
		}
	});
	//OTP 확인 버튼
	$(".loginbox .otp_normal").click(function() {
		// 입력값 검증
		var otpNumber = $("#otp").val();
		var OtpTimeStat = $("#OtpTimeStat").val();
		if (otpNumber == null || otpNumber == ""){
			$("#fail_message").html("OTP 인증번호를 입력해주세요.");
			$("#fail_message").css("display","block");
			return;
		}else if(OtpTimeStat == "stop") {
			$("#fail_message").html("인증시간이 만료 되었습니다. 다시 인증해주세요.");
			$("#fail_message").css("display","block");
			return;
		}
		// OTP 인증
		$.ajax({
			type : "POST", 
			url : "/member/proc/otp/check", 
		 	data : {otpNumber: otpNumber}, 
		 	dataType : "json",
//			contentType: "application/json; charset:UTF-8",
		 	success : function(data) { 
				// data 정보
				// resultCode: S(성공), F(실패)
				// resultMessage: 인증 결과에 따른 메시지
				switch(data.resultCode){
					case "S":
						// OTP 인증 성공 
						location.href = "/dash.do";
						break;
					case "F":
						// OTP 인증 실패
				 		$("#fail_message").html(data.resultMessage);
				 		$("#fail_message").css("display","block");
						break;
				}
			},
		 	error : function() { 
		 		alert("통신장애"); 
		 	} 
		});
	
	});
	
	// // 약관 동의 처리 ChkOn 
	$(".AgreeChk .AgreeChkBtn").click(function() {
		if($(this).parent().hasClass("ChkOn")){
			$(this).parent().removeClass("ChkOn");
			$(this).parent().find(".JoinAgree").val("N");
		}else{
			$(this).parent().addClass("ChkOn");
			$(this).parent().find(".JoinAgree").val("Y");
		}
	});
	
	// 약관 동의 버튼
	$(".Joinbox .CallNiceBtn").click(function() {
		
		var agree1 = $("#JoinAgree01").val();
		var agree2 = $("#JoinAgree02").val();

		if(agree1=="N"){
			alert("국가핵심기술 종합관리시스템 이용약관에 동의해주세요.");
			return;
		}else if(agree2=="N"){
			alert("개인정보 수집 및 이용에 동의해주세요.");
			return;
		}else{
			auth_type = 'M'
			$.ajax({
				type : "POST", 
				url : "/nice/api/token.do", 
			 	data : {"authType": auth_type, "businessno": ""}, 
			 	dataType : "json",
			 	success : function(data) {
			 		console.log(data);
					var form = $("#niceApiform");
					$("#token_version_id").val(data.resultData.tokenVersionId);
					$("#enc_data").val(data.resultData.encData);
					$("#integrity_value").val(data.resultData.integrityValue);
					
					form.submit();
				},
			 	error : function(e) { 
			 		console.log(e); 
			 	} 
			});
//			alert("임시 실명인증이 완료 되었습니다.");
//			// 실명 인증 호출 후 성공시 이동  
//			location.href = "/member/joinform.do";
		}
	});
	
	//모듈 테스트
	$("#localnice").click(function() {
		var rscMemPhone = '01028040565';
		var resultDi = 'MC0GCCqGSIb3DQIJAyEAnSH4l9CHMTfoDULqVuN06rLTyQ/Du560tzw/lfeX7uw=';
		var resultName = '김연식';
		$(this).css("display","none");
		NiceSuccess(rscMemPhone, resultDi, resultName);
	});
	
	
	$("#niceApiform").submit(function() {
		authpopup = window.open('about:blank', 'formpopup', 'width=400,height=400,resizeable,scrollbars');
		this.target = 'formpopup';
	});
	
	// 소속 선택
	$(".JoinCompany .JoinCompanyItem").click(function() {
		
		if(!$(this).parent().hasClass("ChkOn")){
			$(this).parent().parent().find("li").removeClass("ChkOn");
			$(this).parent().addClass("ChkOn");
			var idx = $(this).parent().index();
			if(idx=="0"){
				$(this).parent().parent().parent().find("#JoinCompany").val("AMG01");
			}else if(idx=="1"){
				$(this).parent().parent().parent().find("#JoinCompany").val("AMG02");
			}else{	
				$(this).parent().parent().parent().find("#JoinCompany").val("AMG03");
			}
		}
	});
	
	// 휴대폰 입력
	$("#JoinPhone1").keyup(function(event){
		var phone = $(this).val();
		$(this).val(phone.replace(/[^0-9]/gi,''));
	});
	
	$("#JoinId").off().on("keypress", function(event){
		$("#checkId").val("F");
	})
	
	// 아이디 중복 체크
	$(".Joinbox .IdChk").click(function() {
		var JoinId = $("#JoinId").val();
		//ajax
		//alert("사용가능한 아이디 입니다.");
		//alert("이미 사용중인 아이디 입니다.");
		$.ajax({
			anyne:true,
			type:'POST',
			data: JSON.stringify({
				admId: JoinId,
			}),
        	url: "/member/proc/adm/checkid.do",
			dataType: "json",
			contentType: 'application/json;charset=UTF-8',
			success : function(data) {
				alert(data.resultData);
				$("#checkId").val(data.resultCode);

			},
			error: function(e) {
				alert("ERROR ");
			}
		});
		
	});
	
	// 비밀번호 찾기 > 본인인증 버튼 클릭 이벤트 
	$(".membershipBox .CallNicePBtn").click(function(event){
		
		var cpnId = $("#cpnId").val();
		var checkId = $("#checkId").val();
		var cpnPassword = $("#cpnPassword").val();
		var cpnPasswordC = $("#cpnPasswordC").val();
		var cpnPNm = $("#cpnPNm").val();
		var cpnPDept = $("#cpnPDept").val();
		var cpnPPosition = $("#cpnPPosition").val();
		var cpnPEmail = $("#cpnPEmail").val();
		auth_type = 'M'
		$.ajax({
			type : "POST", 
			url : "/nice/api/token.do", 
		 	data : {"authType": auth_type, "businessno": ""}, 
		 	dataType : "json",
		 	success : function(data) {
				var form = $("#niceApiform");
				$("#token_version_id").val(data.resultData.tokenVersionId);
				$("#enc_data").val(data.resultData.encData);
				$("#integrity_value").val(data.resultData.integrityValue);
				form.submit(); // 토큰을 받았으니 모듈 팝업 호출
			},
		 	error : function(e) { 
		 		console.log(e); 
		 	} 
		});
	});
	
	
	// 회원 가입 버튼 클릭  
	$(".Joinbox .JoinMemBtn").click(function() {
		var JoinId = $("#JoinId").val();
		var JoinPassword = $("#JoinPassword").val();
		var JoinPasswordC = $("#JoinPasswordC").val();
		var JoinName = $("#JoinName").val();
		var JoinComName = $("#JoinComName").val();
		var JoinDepart = $("#JoinDepart").val();
		var JoinPosition = $("#JoinPositio").val();
		var JoinPhone1 = $("#JoinPhone1").val();
		var JoinEmail = $("#JoinEmail").val();
		var JoinCompany = $("#JoinCompany").val();
		
		if(JoinId==""){
			alert("아이디를 입력해주세요.");
			return;
		}else if($("#checkId").val() === "F") {
			alert("아이디 중복검사 후 진행해주세요.");
			return;
		}else if(JoinPassword==""){
			alert("비밀번호를 입력해주세요.");
			return;
		}else if(JoinPasswordC==""){
			alert("비밀번호 확인을 입력해주세요.");
			return;
		}else if(JoinPassword != JoinPasswordC){
			alert("비밀번호가 비밀번호 확인과 다릅니다.");
			return;
		}else if(JoinName==""){
			alert("이름을 입력해주세요.");
			return;
		}else if(JoinComName==""){
			alert("소속을 입력해주세요.");
			return;
		}else if(JoinDepart==""){
			alert("부서를 입력해주세요.");
			return;
		}else if(JoinPosition==""){
			alert("직책을 입력해주세요.");
			return;
		}else if(JoinPhone1==""){
			alert("휴대폰 번호를  입력해주세요.");
			return;
		}else if(JoinEmail==""){
			alert("이메일을 입력해주세요.");
			return;
		}else{
			//회원 정보 DB 저장 
			var phone1 = JoinPhone1.substr(0,3); 
			var phone2 = JoinPhone1.substr(3,4);
			var phone3 = JoinPhone1.substr(7,4);
			var memDi = $("#memDi").val();
			var joinMode = $("#joinMode").val();
			console.log(joinMode);
			if(joinMode=="InviJoin"){
				var admInviYn = $("#admInviYn").val();
				var admInviKey = $("#admInviKey").val();
				var admSamu = $("#admInviSamu").val();
				var admProYn = $("#admInviProYn").val();
				var admSaveYn = $("#admInviSaveYn").val();
				var admSubYn = $("#admInviSubYn").val();
			}else{
				var admInviYn = "N";
				var admInviKey = "";
				var admSamu = "N";
				var admProYn = "N";
				var admSaveYn = "N";
				var admSubYn = "N";
			}
			$.ajax({
				anyne:true,
				type:'POST',
				data: JSON.stringify({
					admId: JoinId,
					admGroup: JoinCompany,
					admName: JoinName,
					admPassword: JoinPassword,
					admCom: JoinComName,
					admDept: JoinDepart,
					admPositon: JoinPosition,
					admMobile1: phone1,
					admMobile2: phone2,
					admMobile3: phone3,
					admEmail: JoinEmail,
					admInviYn: admInviYn,
					admInviKey: admInviKey,
					admSamu: admSamu,
					admProYn: admProYn,
					admSaveYn: admSaveYn,
					admSubYn: admSubYn,
					admDnValue: memDi,
					admInviYn: admInviYn,
					admInviKey: admInviKey,
					admStat: '400',
				}),
	        	url: "/member/proc/adm/save.do",
				dataType: "json",
				contentType: 'application/json;charset=UTF-8',
				success : function(data) {
					console.log(phone1+"-"+phone2+"-"+phone3);
					var returnMsg = "회원가입이 완료 되었습니다.";
					var rscMemEmail = JoinEmail;
					var rscMemName = JoinName;
					var emailSendNote1 = JoinId;
					var emailSendNote2 = JoinComName;
					var admDept = JoinDepart;
					var admPositon = JoinPosition;
					var emailSend3 = admDept+"/"+admPositon;
					var emailSendNote3 = emailSend3;
					var emailSendNote4 = "";
					var emailSendNote5 = "";
					
					var HisSenderName = "국가핵심기술 종합관리시스템";
					var HisSubject = "국가핵심기술 종합관리시스템 회원가입 완료 안내";
					var HisBody = "";
					var HisTemp = "14";
					var HisSender = "국가핵심기술 종합관리시스템";
					var HisUserName = "UserName유저네임";
					
					sendEmailjoin(rscMemEmail, rscMemName, HisSenderName, HisSubject, HisBody, HisTemp, HisSender, HisUserName, emailSendNote1, emailSendNote2, emailSendNote3, emailSendNote4, emailSendNote5, returnMsg);
					
					
					//location.href = "/member/joininfo.do";
				},
				error: function(e) {
					alert("회원가입에 실패하였습니다. 잠시 후 다시 시도해주세요.");
				}
			});
			//console.log(phone1+"-"+phone2+"-"+phone3);
		}
	});
});
function SetTimer() {
	var min = '3';
	var seconds = '00';
	$(".OtpTimecntdown .TMin").html(min);
	$(".OtpTimecntdown .TSeconds").html(seconds);
    StartTimer();
    
    
}

function StartTimer() {
	var OtpTimeStat = $("#OtpTimeStat").val();
	if(OtpTimeStat=="stop"){
		secondstotal = 180;
		$("#OtpTimeStat").val("ing");
	}
	
	var min = parseInt((secondstotal)/60);
    var seconds = secondstotal%60;
	min = min < 10 ? "0" + min : min;
    seconds = seconds < 10 ? "0" + seconds : seconds;
	console.log(secondstotal);
	$(".OtpTimecntdown .TMin").html(min);
	$(".OtpTimecntdown .TSeconds").html(seconds);
	if(--secondstotal < 0){
		secondstotal = 0;
		$("#fail_message").html("인증시간이 만료 되었습니다. 인증번호를 다시 받아주세요.");
		$("#fail_message").css("display","block");
		$("#OtpTimeStat").val("stop");
		clearInterval(SetTimer);
	}
}
//휴대폰 인증 완료 
function NiceSuccess(rscMemPhone, resultDi, resultName) {
	var niceMode = $("#niceMode").val();
	
	if(niceMode=="Join"){
		$(".JoinWrap #memDi").val(resultDi);
		$(".JoinWrap #phoneNum").val(rscMemPhone);
		$(".JoinWrap #JoinName").val(resultName);
		$(".JoinWrap #JoinPhone1").val(rscMemPhone);
		$(".JoinWrap .joinStep01").css("display","none");
		$(".JoinWrap .joinStep02").css("display","block");
	}else if(niceMode=="Find"){
		$(".membershipBox #memDi").val(resultDi);
		$(".membershipBox #phoneNum").val(rscMemPhone);
		$(".membershipBox .firstInfo").css("display","none");
		$(".membershipBox .lastInfo").css("display","block");
		$(".membershipBox .CallNicePBtn").css("display","none");
		$(".membershipBox .SavePwassBtn").css("display","block");
		$(".membershipBox .lastform").css("display","block");
	}else{
		alert("법인 공동인증서 인증이 완료 되었습니다.");
		return;
	}
	
	
}