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
		//var agdCode = $(this).data("agd-code");
		//if(!agdCode){
		//	return;
		//}
		
		location.href = "/research/researchView.do";
	});
	
	/** 검토준비중 현황 페이지 조회 */
	function getReadyList(pageNo, pageRows) {
		location.href = '/expert/readyList.do?pageNo='+pageNo+'&pageRows='+pageRows;
	}
	
	/** 메일 예약 발송 */
	$(".BodyTopUtile .SendMail").off().on("click",function(){
		emailList = []
		$(".tarketList01 li").each(function(idx,tech){
			emailList.push({
    			emailHisEmail: $(this).find(".memEmail").text(),
    			emailHisCom: $(this).find(".comName").text(),
    			emailHisName: $(this).find(".memName").text(),
    			emailInviKey: $(this).data("invikey"),
    		});
		});
		console.log(emailList);
		$.ajax({
			type : "POST", 
			url : "/expert/proc/send/email.do", 
			data: JSON.stringify({
				emailInfo: {
					emailHisSenderName: "국가핵심기술 보호 실태조사",
					emailHisSubject: "(산보협) 국가핵심기술 보유기관 실태조사 협조 요청의 건", // 이메일 제목
					emailHisBody: "", // 이메일 내용
				},
				emailList: emailList
			}),
			dataType: "json",
			contentType: 'application/json;charset=UTF-8',
		 	success : function(data) { 
		 		console.log(data);
				// data 정보
				// resultCode: S(성공), F(실패)
				//switch(data.resultCode){
				//	case "S":
				//		console.log(data);
				//		break;
				//	case "F":
				//		alert("[" + data.resultData.status + "] " + data.resultData.message);
				//		break;
				//}
			},
		 	error : function() { 
		 		console.log("통신장애"); 
		 	} 
		});
	});
	
	
	/** 고유키 생성 */
	$(".BodyTopUtile .addkey").off().on("click",function(){
		
		var comlength = $(".tarketList01 li").length;
		var comidx = 0;
		makekey(comlength, comidx);		
	});
	
	/** 고유키 저장 */
	$(".BodyTopUtile .savekey").off().on("click",function(){
		var Extra = {};
		var comlength = $(".tarketList01 li").length;
		var comidx = 0;
		
		Extra.intoRscMemList = [];
		var memIdx = 0;
		var rscMemCodeA = "RSC-2022-0000-";
		var rscMemCode = "";
		var rscCode = "RSC-2022-0000"; 
		for(i=1;i<=comlength;i++){
			if(i<10){
				rscMemCode = rscMemCodeA+"00"+i;
			}else if(i<100){
				rscMemCode = rscMemCodeA+"0"+i;
			}else{
				rscMemCode = rscMemCodeA+i;
			}
			Extra.intoRscMemList.push({
				qusIdx: i,
				rscMemCode: rscMemCode,
				rscCode: rscCode,
				rscInviKey: $(".tarketList01 li:eq("+memIdx+")").find(".inviKey").text(),
				
				rscMemCompany:$(".tarketList01 li:eq("+memIdx+")").find(".comName").text(),
				rscMemComCode: $(".tarketList01 li:eq("+memIdx+")").find(".conNum").text(),
				rscMemName: $(".tarketList01 li:eq("+memIdx+")").find(".memName").text(),
				rscMemEmail: $(".tarketList01 li:eq("+memIdx+")").find(".memEmail").text(),
			});
			memIdx++;
			
		}
		
		console.log(Extra.intoRscMemList);
		$.ajax({
			type : "POST", 
			url : "/research/proc/intoMember.do", 
		 	data: JSON.stringify({
		 		intoRscMemList: Extra.intoRscMemList,
		 	}), 
		 	dataType : "json",
		 	contentType: 'application/json;charset=UTF-8',
		 	success : function(data) { 
		 		if(data.resultCode=="S"){
					//ChkStaters();
				}
			},
		 	error : function() { 
		 		alert("임시저장 처리중 오류가 발생하였습니다. 잠시후 다시 시도해주세요."); 
		 	} 
		});	
			
	});
});
function makekey(comlength, comidx) {
	
	var regiNum = $(".tarketList01 li:eq("+comidx+")").find(".conNum").text();
	var memEmail = $(".tarketList01 li:eq("+comidx+")").find(".memEmail").text();
	
	
	var regiNum1 = regiNum.substr(0,3)
	var regiNum2 = regiNum.substr(4,2)
	var regiNum3 = regiNum.substr(7,5);
	
	var regiNum0 = regiNum1+regiNum2+regiNum3;
	var rscMakekey = regiNum+memEmail;
	
	$.ajax({
		type : "POST", 
		url : "/research/proc/rscMakeKey.do", 
	 	data : {
	 		rscMakekey: rscMakekey,
	 	}, 
	 	dataType : "json",
	 	success : function(data) { 
	 		console.log(data);
	 		if(data.resultCode=="S"){
	 			$(".tarketList01 li:eq("+comidx+")").find(".inviKey").text(data.makekey);
	 		}
	 		++comidx;
	 		$(".tarketList01 li:eq("+comidx+")").find(".card_num").text(comidx);
	 		
	 		if(comidx<comlength){
	 			makekey(comlength, comidx);		
	 		}
		},
	 	error : function() { 
	 		alert("입력 현황 업데이트중 오류가 발생하였습니다. 잠시후 다시 시도해주세요."); 
	 	} 
	});
	
	
	
}