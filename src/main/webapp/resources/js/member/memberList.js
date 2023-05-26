/**
 * [업무포털 회원관리] 업무포털 회원관리 리스트  화면 스크립트
 * - 작성일: 2022-07-18
 * 
 * - 다른 스크립트 사용
 * 1. memberPopup
 */
$(document).ready(function(){
	
	var admStat = ""; // 상단 탭 별 분류
	var admStatURLParam = $("#admStat").val(); // URL Param rcptStatus
	var pageRows = 10; // 한 페이지에 조회할 데이터 수
	var pagePath = "/member/memberList";
	
	// 최초 진입 시 URL에 rcptStatus 값을 잘 못 입력하였을 경우
	// null, RC, RA, RJ, AC 인 경우에는 각 탭 클릭된 형태로 조회
	// 이 외의 임의의 값을 입력하였을 경우 Alert 메시지 호출 후 전체로 새로 조회
	if (admStatURLParam && admStatURLParam != "null" &&
		admStatURLParam != "200" && admStatURLParam != "300" && admStatURLParam != "400") {
		alert("잘못된 접근입니다. 페이지를 다시 로드합니다.");
		location.href = pagePath;
		return;
	}
	
	// ** 상단 탭 클릭 이벤트 **
	$("ul.tap_list li").on("click",function(){
		var $parent = $("ul.tap_list");
		$parent.find("li").removeClass("on");
		$(this).addClass("on");
		if($(this).data("status") != "ALL"){
			admStat = $(this).data("status");
		}
		getAdminMemberList(1, pageRows);
	});
	
	// ** 페이징 버튼 클릭 이벤트 **
	$("ul.pagination li").on("click",function(){
		var $parent = $("ul.pagination");
		var pageNo = $(this).text();
		// 페이지 넘버 클릭 시 
		if ($(this).hasClass("item")){
			getAdminMemberList(pageNo, pageRows);
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
				getAdminMemberList(--pageNo, pageRows);
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
			getAdminMemberList(++pageNo, pageRows);
		}
	});
	
	// ** SMS발송  버튼 클릭 이벤트 **
	$("div.BodyList  a.datemodify").on("click",function(){
		alert("초대를 통해 회원가입인 진행되지 않았습니다");
	});
	
	
	$("div.BodyList  a.datemodifyadd").on("click",function(){
		var admId = $(this).data("adm-id");
		var invichk = $(this).data("invi-key");
		if(invichk==""){
			mode = "N";
		}else{
			mode = "Y";
		}
		MemberViewPopup.open(admId, mode, invichk);
	});
	
	/**  업무 포털 회원 관리 사용 승인 버튼 **/
	$(".AdminMemList li").on("click",function(){
		var admId = $(this).data("adm-id");
		var invichk = $(this).data("invi-key");
		var admstat = $(this).data("admstat");
		
		if(invichk==""){
			mode = "N";
		}else{
			mode = "Y";
		}
		MemberViewPopup.open(admId, mode, invichk, admstat);
	});
	
	
	/**  업무 포털 회원 관리 사용 중지 버튼 **/
	$("div.BodyList  a.memoff").on("click",function(){
		var chkExit = confirm('선택한 업무포털 회원의 사용 권한을 중지 하시겠습니까 ?');
		if(chkExit){
			// 사용 권한 중지 후 리스트 이동 
			
		}
	});
	
	/**  업무 포털 회원 관리 권한 수정 버튼 **/
	$("div.BodyList  a.memedit").on("click",function(){
		var admId = $(this).data("adm-id");
		MemberEditPopup.open(admId);
	});
	
	
	
	
	// 접수현황 페이지 조회
	function getAdminMemberList(pageNo, pageRows) {
		var href = pagePath+"?pageNo="+pageNo+"&pageRows="+pageRows;
		if (admStat != "") {
			href += "&admStat="+admStat;
		}
		location.href = href;
	}
});

