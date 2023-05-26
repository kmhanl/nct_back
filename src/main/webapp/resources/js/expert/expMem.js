/** [전문위원회] > 위원회 현황 리스트 **/

$(document).ready(function(){    
	
});



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


