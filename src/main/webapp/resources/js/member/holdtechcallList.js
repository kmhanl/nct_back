/**
 * [업무포털 회원관리] 업무포털 회원관리 리스트  화면 스크립트
 * - 작성일: 2022-07-18
 * 
 * - 다른 스크립트 사용
 * 1. memberPopup
 */
$(document).ready(function(){
	
	var admInviStat = ""; // 상단 탭 별 분류
	var admInviStatURLParam = $("#admInviStat").val(); // URL Param rcptStatus
	var pageRows = 10; // 한 페이지에 조회할 데이터 수
	
	// 최초 진입 시 URL에 rcptStatus 값을 잘 못 입력하였을 경우
	// null, RC, RA, RJ, AC 인 경우에는 각 탭 클릭된 형태로 조회
	// 이 외의 임의의 값을 입력하였을 경우 Alert 메시지 호출 후 전체로 새로 조회
	if (admInviStatURLParam && admInviStatURLParam != "null" &&
		admInviStatURLParam != "200" && admInviStatURLParam != "400") {
		alert("잘못된 접근입니다. 페이지를 다시 로드합니다.");
		location.href = "/holdtech/holdtechCallList";
		return;
	}
	
	// ** 상단 탭 클릭 이벤트 **
	$("ul.tap_list li").on("click",function(){
		var $parent = $("ul.tap_list");
		$parent.find("li").removeClass("on");
		$(this).addClass("on");
		if($(this).data("status") != "ALL"){
			admInviStat = $(this).data("status");
		}
		getInvitationList(1, pageRows);
	});
	
	// ** 페이징 버튼 클릭 이벤트 **
	$("ul.pagination li").on("click",function(){
		var $parent = $("ul.pagination");
		var pageNo = $(this).text();
		// 페이지 넘버 클릭 시 
		if ($(this).hasClass("item")){
			getInvitationList(pageNo, pageRows);
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
				getInvitationList(--pageNo, pageRows);
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
			getInvitationList(++pageNo, pageRows);
		}
	});
	
	
	// ** 회원정보 상세 클릭 이벤트 **
	$(".receipt_ist_t01 .card_tit").on("click",function(){
		var rcptIdx = $(this).data("rcpt-idx");
		//alert(1111);
		MemberViewPopup.open(rcptIdx);
	});
	
	// ** 신규 회원 초대**
	$("#comInvite").on("click",function(){
		//nvitationWritePopup.open();
		//alert(2222);
	    HoldTechInvitationWritePopup.open();
	
	});
	
	// ** SMS발송  버튼 클릭 이벤트 **
	$("div.BodyList  a.datemodify").on("click",function(){
		alert("초대를 통해 회원가입인 진행되지 않았습니다");
	});
	
	
	$("div.BodyList  a.datemodifyadd").on("click",function(){
		
		MemberViewPopup.open();
	});
	
	
	
	
	// 접수현황 페이지 조회
	function getInvitationList(pageNo, pageRows) {
		var href = "/holdtech/holdtechCallList?pageNo="+pageNo+"&pageRows="+pageRows;
		if (admInviStat != "") {
			href += "&admInviStat="+admInviStat;
		}
		location.href = href;
	}
	
	
});