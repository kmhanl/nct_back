/**
 * [전문위원회] 접수현황 화면 스크립트
 * - 작성일: 2022-01-11
 * 
 * - 다른 스크립트 사용
 * 1. [datepickPopup.js] AgendaModify, DateModify, MemberModify
 */
$(document).ready(function(){    
	var committeeStatus = $("#committeeStatus").val(); // 상단 탭 별 분류
	var committeeStatusURLParam = $("#committeeStatus").val(); // URL Param rcptStatus
	var pageRows = 10; // 한 페이지에 조회할 데이터 수
	var url = "/expert/committeeList.do";
	// ** 안건 수정 버튼 클릭 이벤트 **
	$("div.BodyList  a.agdmodify").on("click",function(){
		var exIdx = $(this).data("ex-idx");
		AgendaModify.open(exIdx, 'N', url);
	});
	
	// ** 위원 구성  수정 버튼 클릭 이벤트 **
	$("div.BodyList  a.memmodify").on("click",function(){
		var exIdx = $(this).data("ex-idx");
		var techId = $(this).data("ex-tech-id");
		MemberModify.open(exIdx, techId, 'N', url);
	});
	
	// ** 개최예정일  버튼 클릭 이벤트 **
	$("div.BodyList  a.datemodify").on("click",function(){
		var exIdx = $(this).data("ex-idx");
		DateModify.open(exIdx, 'N', url);
	});
	
	// ** 참석일 현황  버튼 클릭 이벤트 **
	$("div.BodyList  a.datestat1").on("click",function(){
		var exIdx = $(this).data("ex-idx");
		DateStat01.open();
	});
	
	// ** SMS발송  버튼 클릭 이벤트 **
	$("div.BodyList  a.sendsms").on("click",function(){
		var exIdx = $(this).data("ex-idx");
		SendSms.open(exIdx);
	});
	
	// ** 이메일발송  버튼 클릭 이벤트 **
	$("div.BodyList  a.sendemail").on("click",function(){
		var exIdx = $(this).data("ex-idx");
		SendEmail.open(exIdx);
	});
	
	// 
	
	// ** 개최일 선택 상세 보기 (기술명칭) 클릭 이벤트 **
	//$("div.BodyList  .CommitTit").on("click",function(){
	//	var exIdx = $(this).data("ex-idx");
	//	var href = "/expert/committeeWrite.do";
	//	location.href = href;
	//});
	
	
	
	// ** 상단 탭 클릭 이벤트 **
	$("ul.tap_list li").on("click",function(){
		var $parent = $("ul.tap_list");
		$parent.find("li").removeClass("on");
		$(this).addClass("on");
		if($(this).data("status") != "ALL"){
			committeeStatus = $(this).data("status");
		} else {
			committeeStatus = null;
		}
		getCommitteeList(1, pageRows);
	});
	
	// ** 페이징 버튼 클릭 이벤트 **
	$("ul.pagination li").on("click",function(){
		var $parent = $("ul.pagination");
		var pageNo = $(this).text();
		// 페이지 넘버 클릭 시 
		if ($(this).hasClass("item")){
			getCommitteeList(pageNo, pageRows);
		}
		// 이전 버튼 클릭 시
		if ($(this).hasClass("prev")){
			var isPrev = false;
			$($parent.find("li.item")).each(function(idx, li){
				if ($(li).hasClass("current")) {
					pageNo = $(li).text();
					if (pageNo <= 1) {
						return;
					}
					isPrev = true;
				}
			});
			if (isPrev) {
				getCommitteeList(--pageNo, pageRows);
			}
		}
		// 다음 버튼 클릭 시
		if ($(this).hasClass("next")){
			var maxPage = 0;
			$($parent.find("li.item")).each(function(idx, li){
				maxPage = $(li).text();
				if ($(li).hasClass("current")) {
					pageNo = $(li).text();
				}
			});
			if (pageNo >= maxPage) {
				return;
			}
			getCommitteeList(++pageNo, pageRows);
		}
	});
	
	
	$(".goopinion").off().on("click",function() {
		var exIdx = $(this).data("ex-idx");
		var href = "/expert/committeepWrite.do";
		location.href = href + "?committeeIdx="+ exIdx;
	});
	
	$(".sendagd").off().on("click",function() {
		var exIdx = $(this).data("ex-idx");
		var href = "/expert/sendcommittee.do";
		location.href = href + "?committeeIdx="+ exIdx;
	});
	
	$(".cancleCom").off().on("click",function() {
		var exIdx = $(this).data("ex-idx");
		if (confirm("해당 위원회를 개최 취소 하시겠습니까? (취소 후에는 개최예정으로 변경됩니다.)")) {
			$.ajax({
				anyne:true,
				type:'POST',
				data: JSON.stringify({
					committeeIdx: exIdx,
				}),
				url: "/expert/proc/commit/info/cancel.do",
				dataType: "json",
				contentType: 'application/json;charset=UTF-8',
				success : function(data) {
					alert("전문위원회가 취소되었습니다.");
					location.href="/expert/committeeList.do";
				},
				error: function(e) {
					alert("ERROR ");
				}
			});
		}
	});
	
	// 전문위원회 개회
	$(".open-committee").off().on("click",function(){
		var exIdx = $(this).data("ex-idx");
		if(confirm("해당 전문위를 개회하시겠습니까?")) {
			$.ajax({
				anyne:true,
				type:'POST',
				data: JSON.stringify({
					committeeIdx: exIdx,
				}),
				url: "/expert/proc/commit/info/start.do",
				dataType: "json",
				contentType: 'application/json;charset=UTF-8',
				success : function(data) {
					alert("전문위원회가 개회되었습니다.");
					location.href="/expert/committeeList.do";
				},
				error: function(e) {
					alert("ERROR ");
				}
			});
		}
	});
	
	// 전문위원회 종료
	$(".close-committee").off().on("click",function(){
		var exIdx = $(this).data("ex-idx");
		if(confirm("해당 전문위를 종료하시겠습니까?")) {
			$.ajax({
				anyne:true,
				type:'POST',
				data: JSON.stringify({
					committeeIdx: exIdx,
				}),
				url: "/expert/proc/commit/info/stop.do",
				dataType: "json",
				contentType: 'application/json;charset=UTF-8',
				success : function(data) {
					alert("전문위원회가 종료되었습니다.");
					location.href="/expert/committeeList.do";
				},
				error: function(e) {
					alert("ERROR ");
				}
			});
		}
	});
	
	// 위원회현황 페이지 조회
	function getCommitteeList(pageNo, pageRows) {
		var href = "/expert/committeeList.do?pageNo="+pageNo+"&pageRows="+pageRows;
		if (committeeStatus != "" && committeeStatus != null) {
			href += "&committeeStatus="+committeeStatus;
		}
		location.href = href;
	}
});