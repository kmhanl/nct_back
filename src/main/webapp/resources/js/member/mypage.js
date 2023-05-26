function userSetupSave(){
	
	var admId = $("#admId").val();
	var OriPw = $("#OriPw").val();
	var Password1 = $("#Password1").val();
	var Password2 = $("#Password2").val();
	
	if(OriPw==""){
		alert("현재 비밀번호를 입력해주세요.");
		return;
	}else if(Password1==""){
		alert("새 비밀번호를 입력해주세요.");
		return;
	}else if(Password2==""){
		alert("새 비밀번호 확인을 입력해주세요.");
		return;
	}
	else if(Password1!=Password2){
		alert("새 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		return;
	}
	
}