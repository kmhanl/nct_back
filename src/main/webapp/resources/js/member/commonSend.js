/** 공통 프로퍼티 */
function sendEmail(rscMemEmail, rscMemName, HisSenderName, HisSubject, HisBody, HisTemp, HisSender, HisUserName, emailSendNote1, emailSendNote2, emailSendNote3, emailSendNote4, emailSendNote5, returnMsg){ 
	emailList = [];
	emailList.push({
		emailHisEmail: rscMemEmail,
		emailHisName: rscMemName,
		emailSendNote1: emailSendNote1,
		emailSendNote2: emailSendNote2,
		emailSendNote3: emailSendNote3,
		emailSendNote4: emailSendNote4,
		emailSendNote5: emailSendNote5,
	});
	
	$.ajax({
		type : "POST", 
		url : "/member/proc/send/email.do", 
		data: JSON.stringify({
			emailInfo: {
				emailHisSenderName: HisSenderName,
				emailHisSubject: HisSubject, // 이메일 제목
				emailHisBody: HisBody, // 이메일 내용
				emailHisTemp: HisTemp, // 이메일 타입
				emailHisSender: HisSender, // 이메일 타입
				emailHisUserName: HisUserName, // 이메일 타입
			},
			emailList: emailList
		}),
		dataType: "json",
		contentType: 'application/json;charset=UTF-8',
	 	success : function(data) { 
	 		alert(returnMsg);
		 	location.reload();
	 	},
	 	error : function() { 
	 		console.log("회원가입 초대 메일 발송에 문제가 발생하였습니다. 잠시 후 다시 시도 해주세요."); 
	 	} 
	});
}
function sendEmailjoin(rscMemEmail, rscMemName, HisSenderName, HisSubject, HisBody, HisTemp, HisSender, HisUserName, emailSendNote1, emailSendNote2, emailSendNote3, emailSendNote4, emailSendNote5, returnMsg){ 
	emailList = [];
	emailList.push({
		emailHisEmail: rscMemEmail,
		emailHisName: rscMemName,
		emailSendNote1: emailSendNote1,
		emailSendNote2: emailSendNote2,
		emailSendNote3: emailSendNote3,
		emailSendNote4: emailSendNote4,
		emailSendNote5: emailSendNote5,
	});
	
	$.ajax({
		type : "POST", 
		url : "/member/proc/send/email.do", 
		data: JSON.stringify({
			emailInfo: {
				emailHisSenderName: HisSenderName,
				emailHisSubject: HisSubject, // 이메일 제목
				emailHisBody: HisBody, // 이메일 내용
				emailHisTemp: HisTemp, // 이메일 타입
				emailHisSender: HisSender, // 이메일 타입
				emailHisUserName: HisUserName, // 이메일 타입
			},
			emailList: emailList
		}),
		dataType: "json",
		contentType: 'application/json;charset=UTF-8',
	 	success : function(data) { 
	 		alert(returnMsg);
		 	location.href = "/member/joininfo.do";
	 	},
	 	error : function() { 
	 		console.log("회원가입 초대 메일 발송에 문제가 발생하였습니다. 잠시 후 다시 시도 해주세요."); 
	 	} 
	});
}