/** [전문위원회] > 위원회 현황 리스트 **/

$(document).ready(function(){    
	
});

//전문위원회 리스트 > 소관과 > 전문위 취소 Alert 호출 이벤트
function cancelEx(committeeIdx, deleteType){
	cancelExPopup.open(committeeIdx, deleteType);
}

//전문위원회 리스트 > 소관과 > 전문위 취소 Alert > 위원회 취소 이벤트
function cancelAlertEx(committeeIdx, Type){
	var prourl ='';
	if(Type=="A"){
		prourl ="/ex/proc/cancelEx.do";
	}else{
		prourl ="/ex/proc/deleteEx.do";
	}
	$.ajax({
		anyne:true,
		type:'POST',
		data: JSON.stringify({
			committeeIdx: committeeIdx
		}),
    	url: prourl,
		dataType: "json",
		contentType: 'application/json;charset=UTF-8',
		success : function(data) {
			if(data.resultCode=="S"){
				location.reload();
			}	
		},
		error: function(e) {
			alert("ERROR ");
		}
	});
}

//전문위원회 리스트 > 소관과 > 전문위 개최 Alert 호출 이벤트
function openEx(committeeIdx){
	openExPopup.open(committeeIdx);
}

//전문위원회 리스트 > 소관과 > 전문위 개최 Alert > 위원회 개최 이벤트
function openAlertEx(committeeIdx, Type){
	var prourl ='';
	prourl ="/ex/proc/openEx.do";
	$.ajax({
		anyne:true,
		type:'POST',
		data: JSON.stringify({
			committeeIdx: committeeIdx
		}),
    	url: prourl,
		dataType: "json",
		contentType: 'application/json;charset=UTF-8',
		success : function(data) {
			if(data.resultCode=="S"){
				location.reload();
			}	
		},
		error: function(e) {
			alert("ERROR ");
		}
	});
}

//전문위원회 리스트 > 소관과 > 전문위 개최 회수 Alert 호출 이벤트
function backEx(committeeIdx){
	backExPopup.open(committeeIdx);
}

//전문위원회 리스트 > 소관과 > 위원회 진행중 > 개최 회수 이벤트
function backAlertEx(committeeIdx, Type){
	var prourl ='';
	prourl ="/ex/proc/backEx.do";
	$.ajax({
		anyne:true,
		type:'POST',
		data: JSON.stringify({
			committeeIdx: committeeIdx
		}),
    	url: prourl,
		dataType: "json",
		contentType: 'application/json;charset=UTF-8',
		success : function(data) {
			if(data.resultCode=="S"){
				location.reload();
			}	
		},
		error: function(e) {
			alert("ERROR ");
		}
	});
}

//전문위원회 리스트 > 소관과 > 전문위 종료 회수 Alert 호출 이벤트
function endEx(committeeIdx){
	endExPopup.open(committeeIdx);
}

//전문위원회 리스트 > 소관과 > 위원회 진행중 > 위원회 종료  이벤트
function endAlertEx(committeeIdx){
	var prourl ='';
	prourl ="/ex/proc/endEx.do";
	$.ajax({
		anyne:true,
		type:'POST',
		data: JSON.stringify({
			committeeIdx: committeeIdx
		}),
    	url: prourl,
		dataType: "json",
		contentType: 'application/json;charset=UTF-8',
		success : function(data) {
			if(data.resultCode=="S"){
				location.reload();
			}	
		},
		error: function(e) {
			alert("ERROR ");
		}
	});
}

//전문위원회 리스트 > 소관과 > 전문위 종료 회수 Alert 호출 이벤트
function endbackEx(committeeIdx){
	endbackExPopup.open(committeeIdx);
}


//전문위원회 리스트 > 소관과 > 위원회 진행중 > 위원회 종료  이벤트
function endBackAlertEx(committeeIdx){
	var prourl ='';
	prourl ="/ex/proc/endBackEx.do";
	$.ajax({
		anyne:true,
		type:'POST',
		data: JSON.stringify({
			committeeIdx: committeeIdx
		}),
    	url: prourl,
		dataType: "json",
		contentType: 'application/json;charset=UTF-8',
		success : function(data) {
			if(data.resultCode=="S"){
				location.reload();
			}	
		},
		error: function(e) {
			alert("ERROR ");
		}
	});
}

//전문위원회 리스트 > 소관과 > 위원회 종료 > 기술안보과 이관  이벤트
function sendProcEx(committeeIdx,admId){
	// 기술안보과 이관 전 체크 사항 정리 
	
	
	prourl ="/ex/proc/sendProcExdo.do";
	$.ajax({
		anyne:true,
		type:'POST',
		data: JSON.stringify({
			committeeIdx: committeeIdx
			,admId: admId
		}),
    	url: prourl,
		dataType: "json",
		contentType: 'application/json;charset=UTF-8',
		success : function(data) {
			if(data.resultCode=="S"){
				//location.reload();
				alert("기술안보과로 이관이 완료 되었습니다.");	
				location.href = "/expert/committeepList.do";
			}	
		},
		error: function(e) {
			alert("ERROR ");
		}
	});
}


//전문위원회 리스트 > 소관과 > 전문위 이관 회수 Alert 호출 이벤트
function returnEx(committeeIdx){
	returnExPopup.open(committeeIdx);
}

//전문위원회 리스트 > 소관과 >기술안보과 이관 완료 > 이관 회수  이벤트
function returnAlertEx(committeeIdx){
	var prourl ='';
	alert('asdddd');
	prourl ="/ex/proc/returnEx.do";
	$.ajax({
		anyne:true,
		type:'POST',
		data: JSON.stringify({
			committeeIdx: committeeIdx
		}),
    	url: prourl,
		dataType: "json",
		contentType: 'application/json;charset=UTF-8',
		success : function(data) {
			if(data.resultCode=="S"){
				location.reload();
			}	
		},
		error: function(e) {
			alert("ERROR ");
		}
	});
}


