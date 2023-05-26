/**
 * [전문위원회] 접수현황 화면 스크립트
 * - 작성일: 2022-01-11
 * 
 * - 다른 스크립트 사용
 * 1. [receiptPopup.js] ReceiptViewPopup, ReceiptWritePopup
 */
$(document).ready(function(){
	var rcptStatus = $("#rcptStatus").val(); // 상단 탭 별 분류
	var rcptStatusURLParam = $("#rcptStatus").val(); // URL Param rcptStatus
	var pageRows = 10; // 한 페이지에 조회할 데이터 수
	
	// 최초 진입 시 URL에 rcptStatus 값을 잘 못 입력하였을 경우
	// null, RC, RA, RJ, AC 인 경우에는 각 탭 클릭된 형태로 조회
	// 이 외의 임의의 값을 입력하였을 경우 Alert 메시지 호출 후 전체로 새로 조회
	if (rcptStatusURLParam && rcptStatusURLParam != "null" &&
		rcptStatusURLParam != "AP" && rcptStatusURLParam != "RC" && rcptStatusURLParam != "RA" && rcptStatusURLParam != "RJ" && rcptStatusURLParam != "AC") {
		alert("잘못된 접근입니다. 페이지를 다시 로드합니다.");
		location.href = "/expert/receiptList.do";
		return;
	}
	
	// ** 상단 탭 클릭 이벤트 **
	$("ul.tap_list li").on("click",function(){
		var $parent = $("ul.tap_list");
		$parent.find("li").removeClass("on");
		$(this).addClass("on");
		if($(this).data("status") != "ALL"){
			rcptStatus = $(this).data("status");
		} else {
			rcptStatus = null;
		}
		getReceiptList(1, pageRows);
	});
	
	// ** 페이징 버튼 클릭 이벤트 **
	$("ul.pagination li").on("click",function(){
		var $parent = $("ul.pagination");
		var pageNo = $(this).text();
		// 페이지 넘버 클릭 시 
		if ($(this).hasClass("item")){
			getReceiptList(pageNo, pageRows);
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
				getReceiptList(--pageNo, pageRows);
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
			getReceiptList(++pageNo, pageRows);
		}
	});
	
	// ** 신규접수등록 버튼 클릭 이벤트 **
	$("div.BodyTopUtile  a.tap_btn").on("click",function(){
		ReceiptWritePopup.open();
		
		
	});
	
	// ** 접수내역 상세 보기 (기술명칭) 클릭 이벤트 **
	$(".receipt_ist_t01 .card_tit").on("click",function(){
		var rcptIdx = $(this).data("rcpt-idx");
		var agdtype = $(this).data("agd-type"); 
		console.log(agdtype);
		ReceiptViewPopup.open(rcptIdx,agdtype);
	});
	
	// 접수현황 페이지 조회
	function getReceiptList(pageNo, pageRows) {
		var href = "/expert/receiptList.do?pageNo="+pageNo+"&pageRows="+pageRows;
		if (rcptStatus != "" && rcptStatus != null) {
			href += "&rcptStatus="+rcptStatus;
		}
		location.href = href;
	}
});