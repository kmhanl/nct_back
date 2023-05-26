/**
 * [전문위원회] 접수현황 화면 스크립트
 * - 작성일: 2022-01-11
 * 
 * - 다른 스크립트 사용
 * 1. [datepickPopup.js] AgendaModify, DateModify, MemberModify
 */
$(document).ready(function(){
	var url = "/expert/datepickList.do";
	
	// ** 안건 수정 버튼 클릭 이벤트 **
	$("div.BodyList  a.agdmodify").on("click",function(){
		var exIdx = $(this).data("ex-idx");
		var extechId = $(this).data("ex-tech");
		
		AgendaModify.open(exIdx,extechId);
	});
	
	// ** 위원 구성  수정 버튼 클릭 이벤트 **
	$("div.BodyList  a.memmodify").on("click",function(){
		var exIdx = $(this).data("ex-idx");
		var techId = $(this).data("ex-tech-id");
		MemberModify.open(exIdx, techId, 'Y', url);
	});
	
	// ** 개최예정일  버튼 클릭 이벤트 **
	$("div.BodyList  a.datemodify").on("click",function(){
		var exIdx = $(this).data("ex-idx");
		DateModify.open(exIdx, 'Y', url);
	});
	
	// ** 참석일 선택  버튼 클릭 이벤트 **
	$("div.BodyList  a.datestat1").on("click",function(){
		var exIdx = $(this).data("ex-idx");
		DateStat01.open(exIdx);
	});
	// ** 참석일 선택  버튼 클릭 이벤트 **
	$(".DatePickSetBtn").on("click",function(){
		var exIdx = $(this).data("exidx");
		DateStat01.open(exIdx);
	});
	
	// ** 참석일 현황  버튼 클릭 이벤트 **
	//$("div.BodyList  a.datestat2").on("click",function(){
	//	var exIdx = $(this).data("ex-idx");
	//	DateStat02.open(exIdx);
	//});
	
	// ** 개최일 확정  버튼 클릭 이벤트 **
	$("div.BodyList  a.datestat3").on("click",function(){
		var exIdx = $(this).data("ex-idx");
		DateStat03.open(exIdx);
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
	$("div.BodyList  .CommitTit").on("click",function(){
		var exIdx = $(this).data("ex-idx");
		var href = "/expert/committeeView.do";
		location.href = href + "?committeeIdx="+ exIdx;
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
	
	$("ul.CommitListD a.excommodify").off().on("click",function(){
		CommitteeWritePopup.open($(this).data("user-group"), $(this).data("user-tech"));
		
	})
	// 위원회현황 페이지 조회
	function getCommitteeList(pageNo, pageRows) {
		var href = "/expert/committeeList.do?pageNo="+pageNo+"&pageRows="+pageRows;
		location.href = href;
	}
	
});