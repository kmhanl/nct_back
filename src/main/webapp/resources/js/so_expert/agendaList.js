/**
 * [보호위원회] 안건현황 화면 스크립트
 * - 작성일: 2022-02-09
 * 
 * - 다른 스크립트 사용
 * 1. [receiptPopup.js] ReceiptViewPopup
 * 1. [agendaPopup.js] AgendaWritePopup, AgendaViewPopup
 */
$(document).ready(function(){    
	var SO_EXPERT_AGENDA_URL = "/soexpert/agendaList.do";
	var agdStatus = ''; // 상단 탭 별 분류
	var agdStatusURLParam = $('#agdStatus').val(); // URL Param rcptStatus
	var pageRows = 10; // 한 페이지에 조회할 데이터 수
	
	// 최초 진입 시 URL에 rcptStatus 값을 잘 못 입력하였을 경우
	// ** 상태 별 agdStatus **
	// * 전체:		null
	// * 검토예정:		CR
	// * 검토요청완료: 	AS
	// * 개최예정:		SE
	// * 결과입력중:	ID
	// * 결과입력완료: 	IC
	// * 검토결과확정: 	EC
	// * 재검토:		??(임시: 05)
	// 이 외의 임의의 값을 입력하였을 경우 Alert 메시지 호출 후 전체로 새로 조회
	if (agdStatusURLParam && agdStatusURLParam != 'null' &&
		agdStatusURLParam != 'CR' &&
		agdStatusURLParam != 'AS' &&
		agdStatusURLParam != 'SE' &&
		agdStatusURLParam != 'ID' &&
		agdStatusURLParam != 'IC' &&
		agdStatusURLParam != 'EC' &&
		agdStatusURLParam != '05'
		) {
		alert('잘못된 접근입니다. 페이지를 다시 로드합니다.');
		location.href = SO_EXPERT_AGENDA_URL;
		return;
	}
	
	/** 상단 탭 클릭 이벤트 */
	$('ul.tap_list li').on('click',function(){
		var $parent = $('ul.tap_list');
		$parent.find('li').removeClass('on');
		$(this).addClass('on');
		if($(this).data('status') != null){
			agdStatus = $(this).data('status');
		}
		getAgendaList(1, pageRows);
	});
	
	/** 페이징 버튼 클릭 이벤트 */
	$('ul.pagination li').on('click',function(){
		var $parent = $('ul.pagination');
		var pageNo = $(this).text();
		// 페이지 넘버 클릭 시 
		if ($(this).hasClass('item')){
			getAgendaList(pageNo, pageRows);
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
				getAgendaList(--pageNo, pageRows);
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
			getAgendaList(++pageNo, pageRows);
		}
	});
//	
//	/** 검토요청 버튼 클릭 이벤트 */
//	$('div.body_tap_wrapper a.tap_btn').on('click',function(){
//		// 접수완료 체크 확인
//		var isCheck = false;
//		var rcpts = [];
//		($('input[type=checkbox][name=agdCheck]')).each(function(idx,item){
//			if($(item).is(':checked')){
//				isCheck = true;
//				rcpts.push($(item).val());
//			}
//		});
//		if(!isCheck){
//			alert('선택된 접수완료 데이터가 없습니다.');
//			return;
//		}
//		
//		AgendaWritePopup.open(rcpts);
//	});
//	
//	// ** 안건현황 상세 보기 (기술명칭) 클릭 이벤트 **
//	$(".receipt_ist_t01 .card_tit").on("click",function(){
//		var agdIdx = $(this).data("agenda-idx");
//		if(!agdIdx){
//			// 접수완료건은 접수상세 팝업 호출
//			ReceiptViewPopup.open($(this).data("rcpt-idx"));
//			return;
//		}
//		
//		// 안건상세 팝업 호출
//		AgendaViewPopup.open(agdIdx);
//	});
	
	/** 안건현황 페이지 조회 */
	function getAgendaList(pageNo, pageRows) {
		var href = SO_EXPERT_AGENDA_URL+'?pageNo='+pageNo+'&pageRows='+pageRows;
		if (agdStatus != '') {
			href += '&agdStatus='+agdStatus;
		}
		location.href = href;
	}
});