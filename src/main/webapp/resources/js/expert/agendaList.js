/**
 * [전문위원회] 안건현황 화면 스크립트
 * - 작성일: 2022-01-18
 * 
 * - 다른 스크립트 사용
 * 1. [receiptPopup.js] ReceiptViewPopup
 * 1. [agendaPopup.js] AgendaWritePopup, AgendaViewPopup
 */
$(document).ready(function(){    
	var agdStatus = $('#agdStatus').val(); // 상단 탭 별 분류
	var agdStatusURLParam = $('#agdStatus').val(); // URL Param rcptStatus
	var pageRows = 10; // 한 페이지에 조회할 데이터 수
	
	// 최초 진입 시 URL에 rcptStatus 값을 잘 못 입력하였을 경우
	// ** 상태 별 agdStatus **
	// * 전체:		null
	// * 접수완료:		RC
	// * 검토요청완료: 	AS
	// * 개최예정:		SE
	// * 결과입력중:	ID
	// * 결과입력완료: 	IC
	// * 검토결과확정: 	EC
	// * 재검토:		??(임시: 05)
	// 이 외의 임의의 값을 입력하였을 경우 Alert 메시지 호출 후 전체로 새로 조회
	if (agdStatusURLParam && agdStatusURLParam != 'null' &&
		agdStatusURLParam != 'RC' &&
		agdStatusURLParam != 'AS' &&
		agdStatusURLParam != 'CE' &&
		agdStatusURLParam != 'CI' &&
		agdStatusURLParam != 'CC' &&
		agdStatusURLParam != 'SE' &&
		agdStatusURLParam != 'IC' &&
		agdStatusURLParam != 'CS' &&
		agdStatusURLParam != '05'
		) {
		alert('잘못된 접근입니다. 페이지를 다시 로드합니다.');
		location.href = '/expert/agendaList.do';
		return;
	}
	
	/** 상단 탭 클릭 이벤트 */
	$('ul.tap_list li').on('click',function(){
		var $parent = $('ul.tap_list');
		$parent.find('li').removeClass('on');
		$(this).addClass('on');
		if($(this).data('status') != null){
			agdStatus = $(this).data('status');
		} else {
			agdStatus = "";
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
	
	/** 검토요청 체크 박스 클릭 */
	$('.receipt_ist_t01 .AgendaSendChk').on('click',function(){
		if($(this).hasClass("ChkOn")){
			$(this).removeClass("ChkOn");
			$(this).parent().find('input:checkbox[name="agdCheck"]').attr("checked", false);
		}else{
			$(this).addClass("ChkOn");
			$(this).parent().find('input:checkbox[name="agdCheck"]').attr("checked", true);
		}
	});
	
	/** 검토요청 버튼 클릭 이벤트 */
	$('div.BodyTopUtile a.tap_btn').on('click',function(){
		// 접수완료 체크 확인
		var isCheck = false;
		var rcpts = [];
		($('input[type=checkbox][name=agdCheck]')).each(function(idx,item){
			if($(item).is(':checked')){
				isCheck = true;
				rcpts.push($(item).val());
			}
		});
		if(!isCheck){
			alert('선택된 접수완료 데이터가 없습니다.');
			return;
		}
		
		AgendaWritePopup.open(rcpts);
	});
	
	// ** 안건현황 상세 보기 (기술명칭) 클릭 이벤트 **
	$(".receipt_ist_t01 .card_tit").on("click",function(){
		var agdCode = $(this).data("agd-code");
		var agdtype = $(this).data("agd-type");
		if(!agdCode){
			// 접수완료건은 접수상세 팝업 호출
			ReceiptViewPopup.open($(this).data("rcpt-code"),$(this).data("agd-type"));
			return;
		}
		
		// 안건상세 팝업 호출
		AgendaViewPopup.open(agdCode);
	});
	
	// ** 검토 요청 회수 버튼 **
	$(".receipt_ist_t01 .card_modi_btn .ReturnAgd").on("click",function(){
		var chkExit = confirm('선택한 안건을 회수 하시겠습니까?');
		if(chkExit){
			var agdCode = $(this).data("agd-code");
			// 검토 요청 회수 처리 
			$.ajax({
					anyne:true,
					type:'POST',
					data: JSON.stringify({
						agdCode: agdCode
					}),
		        	url: "/expert/proc/agenda/delete.do",
					dataType: "json",
					contentType: 'application/json;charset=UTF-8',
					success : function(data) {
						console.log(data);
						alert("소관과이관완료 내역이 회수되었습니다.");	
						location.href = "/expert/agendaList.do";
					},
					error: function(e) {
						alert("ERROR ");
					}
				});
		}
	});
	
	// ** 검토 결과 확정 버튼 **
	$(".receipt_ist_t01 .card_modi_btn .CompliteAgd").on("click",function(){
		var agdCode = $(this).data("agd-code");
		var agdTy = $(this).data("agd-ty");
		//AgendaComPopup.open(agdCode);
		AgendaComPopup02.open(agdCode);
	});
	
	// ** 검토 결과 통보 버튼 **
	$(".receipt_ist_t01 .card_modi_btn .AgdSendCom").on("click",function(){
		var chkExit = confirm('선택한 안건의 검토 결과를 기업에 통보하시겠습니까? ');
		if(chkExit){
			// 검토결과 통보 처리
		}
	});
	
	/** 안건현황 페이지 조회 */
	function getAgendaList(pageNo, pageRows) {
		console.log(agdStatus);
		var href = '/expert/agendaList.do?pageNo='+pageNo+'&pageRows='+pageRows;
		if (agdStatus != '' && agdStatus != null) {
			href += '&agdStatus='+agdStatus;
		}
		location.href = href;
	}
});