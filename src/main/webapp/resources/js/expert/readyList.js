/**
 * [전문위원회] 검토준비중 화면 스크립트
 * - 작성일: 2022-01-19
 * 
 * - 다른 스크립트 사용
 * 1. [agendaPopup.js] AgendaViewPopup
 * 2. [committeePopup.js] CommitteeWritePopup
 */
$(document).ready(function(){
	var pageRows = 10; // 한 페이지에 조회할 데이터 수
	
	/** 페이징 버튼 클릭 이벤트 */
	$('ul.pagination li').off().on('click',function(){
		var $parent = $('ul.pagination');
		var pageNo = $(this).text();
		// 페이지 넘버 클릭 시 
		if ($(this).hasClass('item')){
			getReadyList(pageNo, pageRows);
		}
		// 이전 버튼 클릭 시
		if ($(this).hasClass('prev')){
			var isPrev = false;
			$($parent.find('li.item')).each(function(idx, li){
				if ($(li).hasClass('current')) {
					pageNo = $(li).text();
					if (pageNo <= 1) {
						return;
					}
					isPrev = true;
				}
			});
			if (isPrev) {
				getReadyList(--pageNo, pageRows);
			}
		}
		// 다음 버튼 클릭 시
		if ($(this).hasClass('next')){
			var maxPage = 0;
			$($parent.find('li.item')).each(function(idx, li){
				maxPage = $(li).text();
				if ($(li).hasClass('current')) {
					pageNo = $(li).text();
				}
			});
			if (pageNo >= maxPage) {
				return;
			}
			getReadyList(++pageNo, pageRows);
		}
	});
	
	$("div.BodyTopUtile a.commake01").off().on("click",function(){
		CommitteeWritePopup.open($(this).data("user-group"), $(this).data("user-tech"));
		
	})
	
	/** 안건현황 상세 보기 (기술명칭) 클릭 이벤트 */
	$(".receipt_ist_t01 .card_tit").off().on("click",function(){
		var agdCode = $(this).data("agd-code");
		if(!agdCode){
			return;
		}
		
		AgendaViewPopup.open(agdCode);
	});
	
	/** 검토준비중 현황 페이지 조회 */
	function getReadyList(pageNo, pageRows) {
		location.href = '/expert/readyList.do?pageNo='+pageNo+'&pageRows='+pageRows;
	}
});