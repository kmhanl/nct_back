/**
 * [전문위원회] 접수현황 화면 스크립트
 * - 작성일: 2022-01-11
 * 
 * - 다른 스크립트 사용
 * 1. [datepickPopup.js] AgendaModify, DateModify, MemberModify
 */
$(document).ready(function(){    
	var opnExIdx = "";
	
	var committeeIdx = $("#committeeIdx").val();
	var committeeStatus = $("#committeeStatus").val();
	var committeeSignViewYn = $("#committeeSignViewYn").val();
	var committeeSignWriteYn = $("#committeeSignWriteYn").val();
	
	if(committeeStatus=="RD"){
		if(committeeSignViewYn=="N"){
			SecretViewAgreePopup.open(committeeIdx);
		}
	}else if(committeeStatus=="IN"){
		if(committeeSignWriteYn=="N"){
			SecretWriteAgreePopup.open(committeeIdx);
		}
	}
	
	// ** 기술안보과 이관 버튼 - 소관과**
	$("div.TodoListBox  a.SendSaveAdmin").on("click",function(){
		var exIdx = $(this).data("ex-idx");
		sendCommitteeAdminPopup.open(exIdx);
	});
		
	// ** 비밀유지의무 동의서 팝업**
	$("div.TodoListBox  a.BtnSEdit").on("click",function(){
		//var exIdx = $(this).data("ex-idx");
		SecretAgree.open();
	});
	
	// ** 회의록 동의서 팝업**
	$("div.TodoListBox  a.BtnSEdit02").on("click",function(){
		alert("준비중입니다.");
	});
	
	// ** 예금계좌이체 승낙서 팝업 **
	$("div.TodoListBox  a.BtnBEdit").on("click",function(){
		//var exIdx = $(this).data("ex-idx");
		BankAgree.open();
	});
	
	// ** 의견 작성 왼쪽 안건 리스트 포커스 **
	function ExAgendaListfocus(){
		var scrollTop = $(".ExAgendaBox").scrollTop();
		var BoxH = $(".ExAgendaBox").outerHeight();
		var ExAgendaH = $(".ExAgendaBox .TapOn").outerHeight();
		var UlBoxH = $(".ExAgendaBox .ExAgendaList").outerHeight();
		
		var ExAgendaList = $(".ExAgendaBox .TapOn").position();
		var AgdH = ExAgendaH + ExAgendaList.top;
		var Scroll = scrollTop + ExAgendaList.top - 10;
		if(AgdH<=ExAgendaH){
			$('.ExAgendaBox').animate({scrollTop: Scroll},500);
		}
		var listtopC = $(".ExAgendaBox .TapOn").index();
		var listtopH = 0;
		for(i=0;i<listtopC;i++){
			listtopH = listtopH + $(".ExAgendaBox .ExAgendaList li:eq("+i+")").outerHeight() + 10;
		}
		var chkTopLi = BoxH + scrollTop - ExAgendaH - 20;
		if(chkTopLi <= listtopH){
			var Scroll3 =  (listtopH + ExAgendaH + 20) - BoxH;
			$('.ExAgendaBox').animate({scrollTop: Scroll3},500);
		}
	};
    
    // ** 상단 탭 리스트 포커스 **
	function ExTapListfocus(){
		var scrolLeft = $(".BrowserTapBox .BrowserTapList").position();
		var TapBox = $(".BrowserTapBox").outerWidth();
		var listtopC = $(".BrowserTapList .TapOn").index();
		var listtopW = 0
		if(listtopC!=0){
			var LeftW = ((180 * listtopC) + 181);
		}else{
			var LeftW = 0;
		}
		var tapbox2 = TapBox - scrolLeft.left;
		if(tapbox2 <= LeftW){
			var scrolW =  (180 * listtopC) + 181 - TapBox; 
			$(".BrowserTapBox .BrowserTapList").animate({left: "-"+scrolW+"px"},500);
		}
		
		var Limit = 180 * Number(listtopC) + scrolLeft.left;
    	if(Limit<0){
    		var MarginL = listtopC * 180;
    		$('.BrowserTapList').animate({ left : "-"+MarginL+"px" },500);
    	}
		
	};
    
	// ** 편집장 변경 혹은 추가 **
	var Exchange;
	function PageExchange(type,agdIdx){
		//alert(type+":"+agdIdx);
		if(type=="change"){
			// 상단 탭 활성화
			$(".BrowserUtil .BrowserTapList li").removeClass("TapOn");
			$(".BrowserUtil .BrowserTapList").find(".Tap"+agdIdx).addClass("TapOn");
			// 왼쪽 안건 리스트 활성화 
			$(".ExAgendaBox .ExAgendaList li").removeClass("TapOn");
			$(".ExAgendaBox .ExAgendaList .Agd"+agdIdx).addClass("TapOn");
			ExAgendaListfocus();
			ExTapListfocus();
			// 편집창  활성화
			$("#ComBrowserBoard .ComBrowserPage").css("display","none");
			$("#ComBrowserBoard #Page"+agdIdx).css("display","block");
			var EditPage = $(".BrowserTapList .TapOn").index();
			$("#EditPage").val(EditPage);
		}else{
			// 상단 탭 활성화
			$(".BrowserUtil .BrowserTapList li").removeClass("TapOn");
			$(".BrowserUtil .BrowserTapList").find(".Tap"+agdIdx).addClass("TapOn");
			// 왼쪽 안건 리스트 활성화 
			$(".ExAgendaBox .ExAgendaList li").removeClass("TapOn");
			$(".ExAgendaBox .ExAgendaList .Agd"+agdIdx).addClass("TapOn");
			ExAgendaListfocus();
			ExTapListfocus();
			// 편집창  활성화
			$("#ComBrowserBoard .ComBrowserPage").css("display","none");
			$("#ComBrowserBoard #Page"+agdIdx).css("display","block");
			
			var EditPage = $(".BrowserTapList .TapOn").index();
			$("#EditPage").val(EditPage);
		}
    };
    
	// ** 전문위원회 안건 목록 안건 선택 **
	$("div.ExAgendaBox  .ExAgendaList li").on("click",function(){
		if($(this).hasClass("ComsendAgd")){
			var sendagdtype = "test01";
		}else{
			var sendagdtype = "test02";
		}
		var techId = $("#committeeTechId").val();
		var exStat = $("#committeeStatus").val();
		var exIdx = $(this).data("ex-idx"); // 위원 IDX  
		var agdIdx = $(this).data("agd-idx"); // 안건 IDX  
		var agdViewCode = $(this).data("agd-view-code"); // 안건 IDX  
		var rcptIdx = $(this).data("rcpt-code"); // 접수 IDX  
		var	listIdx = $(this).index();  // 안건 순서
		listIdx++;
		var agdType = $(this).data("agd-type"); // 안건 타입
		var pageOpen = $("#Page"+agdIdx).find("#PageOpen").val(); //오픈여부 확인
		var PageCnt = $("#PageCnt").val(); //열린 안건수  확인 
		var techType = $("#techType").val(); //위원회 분야  확인 
		
		if(pageOpen=="Y"){
			//이미 열려 있는 안건 인 경우 열려있는 창 활성화
			clearTimeout(Exchange);
        	Exchange = setTimeout(PageExchange('change',agdIdx), 100);
	    }else{
	    	//안건 편집창 호출 후 화면 추가 
			$(".TodoListBox .ExPageLoding").css("display","flex");
			$(".ComBrowserBoard .PageLoding").css("display","flex");
			//페이지 로드 후 활성화
			
			if(sendagdtype=="test01"){
				PageUrl = "/expert/opinion/opinionEnd.do?committeeIdx="+exIdx+"&agdIdx="+agdIdx+"&exStat="+exStat+"&listIdx="+listIdx+"&rcptIdx="+rcptIdx+"&techId="+techId;
				if(agdType=="01"){
					var TapName = "여부판정";
				}else if(agdType=="02"){
					var TapName = "사전검토";
				}else if(agdType=="03"){
					var TapName = "수출신고";
				}else if(agdType=="04"){
					var TapName = "수출승인";
				}else if(agdType=="05"){
					var TapName = "해외인수·합병 사전검토";
				}else if(agdType=="06"){
					var TapName = "해외인수·합병 신고";
				}else if(agdType=="07"){
					var TapName = "해외인수·합병 승인";
				}else if(agdType=="08"){
					var TapName = "국가핵심기술 지정";
				}else if(agdType=="09"){
					var TapName = "국가핵심기술 변경";
				}else if(agdType=="10"){
					var TapName = "국가핵심기술 해제";
				}else if(agdType=="11"){
					var TapName = "기타";
				}
			}else{
				PageUrl = "/expert/opinion/opinionView.do?committeeIdx="+exIdx+"&agdIdx="+agdIdx+"&exStat="+exStat+"&listIdx="+listIdx+"&rcptIdx="+rcptIdx+"&techId="+techId;
				if(agdType=="01"){
					var TapName = "여부판정";
				}else if(agdType=="02"){
					var TapName = "사전검토";
				}else if(agdType=="03"){
					var TapName = "수출신고";
				}else if(agdType=="04"){
					var TapName = "수출승인";
				}else if(agdType=="05"){
					var TapName = "해외인수·합병 사전검토";
				}else if(agdType=="06"){
					var TapName = "해외인수·합병 신고";
				}else if(agdType=="07"){
					var TapName = "해외인수·합병 승인";
				}else if(agdType=="08"){
					var TapName = "국가핵심기술 지정";
				}else if(agdType=="09"){
					var TapName = "국가핵심기술 변경";
				}else if(agdType=="10"){
					var TapName = "국가핵심기술 해제";
				}else if(agdType=="11"){
					var TapName = "기타";
				}
			}
			
			
			// 편집창 데이터 로드
			$.ajax({
				url: PageUrl,
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				success:function(result) {
					if (!result) {
						console.log("팝업 데이터가 없습니다.");
						return;
					}
					var resultHtml = result;
					$(".ComBrowserBoard").append(resultHtml);
					// 상단 탭 생성
					var TapHtml = "<li class='TapOn Tap"+agdIdx+"' data-Btap-idx='"+agdIdx+"'><a href='#none' class='BrowserTapItem'><p>안건"+(listIdx)+". <span>"+agdViewCode+"</span></p>"+TapName+"</a><a href='#none' class='TapClose'><p class='Cicon'></p></a></li>";
					$(".BrowserUtil .BrowserTapList").append(TapHtml);
					// 열린 편집창 수 업데이트
					PageCnt = Number(PageCnt) + 1; 
					$("#PageCnt").val(PageCnt);
					//편집 안건 활성화 처리
					clearTimeout(Exchange);
		        	Exchange = setTimeout(PageExchange('NewPage',agdIdx), 100);
				},
				complete:function(){
					$(".TodoListBox .ExPageLoding").css("display","none");
					$(".ComBrowserBoard .PageLoding").css("display","none");
				},
				error:function(e){
					console.log(e);
				}
			});
		}
	});
	
	// ** 작성가이드 버튼 **
	$("div.BrowserUtil  a.TapGuide").on("click",function(){
		$(".ComBrowserBoard .ComBrowserPage").css("display","none");
		$(".ExAgendaBox .ExAgendaList li").removeClass("TapOn");
		$(".BrowserUtil .BrowserTapList li").removeClass("TapOn");
		$(".ComBrowserBoard .ComBrowserGuide").css("display","flex");
	});
	
	// ** 전문위원회 브라우저 탭 이전 선택 **
	$("div.BrowserTool  a.TapPre").on("click",function(){
		var TapIdx = $(".BrowserTapList .TapOn").index();
    	if(TapIdx!=0){
    		var agdIdx = $(".BrowserUtil .BrowserTapList li:eq("+(TapIdx-1)+")").data("btap-idx");
    		clearTimeout(Exchange);
    		Exchange = setTimeout(PageExchange('change',agdIdx), 100);
    	}else{
    		alert("첫번째 검토 의견서 입니다. ");
    	}
    });
    
    // ** 전문위원회 브라우저 탭 다음 선택 **
	$("div.BrowserTool  a.TapNext").on("click",function(){
		var TapIdx = $(".BrowserTapList .TapOn").index();
		var TapCut = $(".BrowserTapList li").length;
		if(TapIdx <TapCut-1){
			var agdIdx = $(".BrowserUtil .BrowserTapList li:eq("+(TapIdx+1)+")").data("btap-idx");
    		clearTimeout(Exchange);
    		Exchange = setTimeout(PageExchange('change',agdIdx), 100);
    	}else{
    		alert("마지막 검토 의견서 입니다. ");
    	}
    });
	
	
	// ** 전문위원회 브라우저 탭 선택 ** 
	$(document).on("click","div.BrowserUtil  .BrowserTapItem",function(event){
		var agdIdx = $(this).parent().data("btap-idx");
		if(!$(this).parent().hasClass("TapOn")){
			//이미 열려 있는 안건 인 경우 열려있는 창 활성화
			clearTimeout(Exchange);
    		Exchange = setTimeout(PageExchange('change',agdIdx), 100);
		}
	});
	
	// ** 검토의견 작성 종합 의견 선택 **
	// 01 여부판정 - 해당 / 미해당 / 재검토 / 기타 : 미해당인 경우 기술범위 선택 없음
	// 02 사전검토 - 기술범위 선택 없음
	// 03 수출신고 - 수리 / 불수리 / 조건부 수리 / 재검토 / 기타 : 불수리인 경우 기술범위 선택 없음
	// 04 수출승인 - 승인 / 불승인 / 조건부 승인 / 재검토 / 기타 : 불승인인 경우 기술범위 선택 없음
	// 05 해외인수·합병 사전 검토 - 기술범위 선택 없음
	// 06 해외인수·합병 신고 - 수리 / 불수리 / 조건부 수리 / 재검토 / 기타 : 불수리인 경우 기술범위 선택 없음
	// 07 해외인수·합병 승인 - 승인 / 불승인 / 조건부 승인 / 재검토 / 기타 : 불승인인 경우 기술범위 선택 없음
	// 08 국가핵심기술 지정 - 필요 / 불필요 / 재검토 / 기타 : 불필요인 경우 기술범위 선택 없음
	// 09 국가핵심기술 변경 - 필요 / 불필요 / 재검토 / 기타 : 불필요인 경우 기술범위 선택 없음
	// 10 국가핵심기술 해제 - 필요 / 불필요 / 재검토 / 기타 : 불필요인 경우 기술범위 선택 없음
	// 11 기타 - 기술범위 선택 없음
	$(document).on("click", "div.ComBoradFrom  .TechAreaTypeItem",function(event){
		var agdIdx = $(this).parent().parent().data("pageidx");
		var itemIdx = $(this).parent().index();
		var opinionType =  $(this).data("type");
		
		if(!$(this).parent().hasClass("SelOn")){
			$(this).parent().parent().find("li").removeClass("SelOn");
			$(this).parent().addClass("SelOn");
			if(!hasTech(opinionType)){
				$(this).parent().parent().parent().find(".TechAreaSelBox").css("display","none");
			}else{
				// 기술 범위 선택인 경우 .TechAreaSelBox > TechAreaSelList > li 요소에 해당 분야의 기술 범위 출력 후 TechAreaSelBox display:block 처리
				// 이부분에서 ajax로 해당 기술 범위 추가 처리 
				
				$(this).parent().parent().parent().find(".TechAreaSelBox").css("display","block");
			}
		} else {
			if(hasTech(opinionType)){
				$(this).parent().parent().parent().find(".TechAreaSelBox").css("display","block");
			}
		}
	});
	
	// ** 검토의견 작성 종합 의견 > 기술분야 > 범위  선택 ** 
	$(document).on("click", "div.TechAreaSelBox  .TechAreaSelListItem",function(event){
		var itemIdx = $(this).parent().index();
		
		if(!$(this).parent().hasClass("SelOn")){
			$(this).parent().addClass("SelOn");
			console.log($(this).parent().parent().parent().parent().find(".TechAreaSelBox"));
			//$(this).parent().parent().parent().parent().find(".TechAreaSelBox").css("display","none");
		}else{
			$(this).parent().removeClass("SelOn");
		}
	});
	
	// ** 검토의견 작성 종합 의견 > 기술분야 > 범위  리스트 닫기 버튼  ** 
	$(document).on("click", "div.TechAreaSelBox  .TechSelListClosedBtn",function(event){
		var TechListTem = $(this).parent().parent().find(".TechAreaSelList li");
		var itemlength = $(this).parent().parent().find("li").length;
		var itemSellength = $(this).parent().parent().find(".SelOn").length;
		if(itemSellength=="0"){
			alert("1개 이상의 기술 분야를 선택 해주세요.");
			return;
		}else{
			for(i=0;i<itemlength;i++){
				if(!TechListTem.eq(i).hasClass("SelOn")){
					TechListTem.eq(i).css("display","none");		
				}
			}
			$(this).css("display","none");
			$(this).parent().find(".TechSelListOpenBtn").css("display","inline-block");
		}
	});
	
	// ** 검토의견 작성 종합 의견 > 기술분야 > 범위  리스트 더보기 버튼  ** 
	$(document).on("click", "div.TechAreaSelBox  .TechSelListOpenBtn",function(event){
		$(this).parent().parent().find(".TechAreaSelList li").css("display","block");
		$(this).css("display","none");
		$(this).parent().find(".TechSelListClosedBtn").css("display","inline-block");
	});
	
	
	/** 파일 뷰어 */
	$(document).on("click",".ItemRctpFileList .FileItem",function(event){
		var filePath = $(this).data("file-path")
		if (filePath === "LOCAL") {
			alert("서버에서 등록된 파일만 조회할 수 있습니다.");
			return;
		}
		filePath += $(this).data("file-name");
		var viewerPath = $(this).data("viewer-path");
		var fid = $(this).data("file-key");
		// HTML로 변환
		var convertType = "html";
		// URL로 문서 다운로드 후 변환
		var fileType = "Local";
		var watermarkText = $(this).data("user-com") + " \n"
								+ $(this).data("user-dept") + " " + $(this).data("user-name") + " " + $(this).data("user-position") + " \n"
								+ $(this).data("user-phone1") + "-" + $(this).data("user-phone2") + "-" + $(this).data("user-phone3") + " \n"
								+ $(this).data("user-email");
		
		var encodedUrl = encodeURIComponent(filePath);
		var requestUrl = viewerPath + "/SynapDocViewServer/job?fid=" + fid // Server
																			// Address
																			// Setting
							+ "&filePath=" + encodedUrl + "&convertType=" + convertType
							+ "&fileType=" + fileType + "&watermarkText="+ watermarkText;
		
		window.open(requestUrl, "preview");
	});
	
	
	// ** 전문위원회 브라우저 탭 닫기 엑스 버튼 선택 ** 
	$(document).on("click","div.BrowserUtil  .TapClose",function(event){
		var agdIdx = $(this).parent().data("btap-idx");
		var PageCnt = $("#PageCnt").val();
		
		if($(this).parent().hasClass("TapOn")){
			$(this).parent().remove();
			var TapCut = $(".BrowserTapList li").length;
			$(".BrowserTapList li:eq("+(TapCut-1)+")").addClass("TapOn");
			
			$("#ComBrowserBoard #Page"+agdIdx).remove();
		}else{
			$(this).parent().remove();
			$("#ComBrowserBoard #Page"+agdIdx).remove();
		}
		var Tapindex = $(".BrowserTapList .TapOn").index();
		var Tapidx = $(".BrowserTapList .TapOn").data("btap-idx");
		$(".ExAgendaBox .ExAgendaList li").removeClass("TapOn");
		$(".ExAgendaBox .ExAgendaList .Agd"+Tapidx).addClass("TapOn");
		$("#ComBrowserBoard #Page"+Tapidx).css("display","block");
		$("#PageCnt").val(PageCnt-1);
		$("#EditPage").val(Tapindex);
		
		ExAgendaListfocus();
		ExTapListfocus();
	});
	
	
	
	// ** 최종의견 제출 버튼 **
	$("div.TodoListBox  a.Save").on("click",function(){
		var idx00 = $(".AgendaTapList li:eq(0) .AgendaTapItem .Num").text();
		var idx03 = $(".AgendaTapList li:eq(3) .AgendaTapItem .Num").text();
		
		if(idx00 != idx03){
			var sum = Number(idx00) - Number(idx03);
			alert("작성완료 되지 않은 안건 "+sum+"건 남아 있습니다. 작성후 최종 의견을 제출해주세요");	
		}else{
			SecretSaveAgreePopup.open(committeeIdx);
		}
		
	});
	
	// ** 기술 안보과 이관 위원회 목록 버튼  **
	$("div.TodoListBox  a.SendExit").on("click",function(){
		
		// 미저장된 검토 의견 체크 
		var chkExit = confirm('기술안보과 이관을 종료하시겠습니까?');
		if(chkExit){
			var href = "/expert/committeepList.do";
			location.href = href;
		}
	});
	
	// ** 기술안보과 이관 > 기술안보과 이관 버튼 **
	$("div.TodoListBox  a.SendSave").on("click",function(){
		var exIdx = $(this).data("ex-idx");
		var chkExit = confirm('전문위원회 결과를 기술안보과로 이관 하시겠습니까?');
		if(chkExit){
			
			// 위원회 상태 CS, 포함된 안건 상태 안건 상태 IC로 변경 후 리스트로 이동 
			$.ajax({
					anyne:true,
					type:'POST',
					data: JSON.stringify({
						committeeIdx: exIdx,
						committeeStatus: "CS"
					}),
		        	url: "/expert/proc/commit/status/change.do",
					dataType: "json",
					contentType: 'application/json;charset=UTF-8',
					success : function(data) {
						console.log(data);
						alert("기술안보과로 이관이 완료 되었습니다.");	
						location.href = "/expert/committeepList.do";
					},
					error: function(e) {
						alert("ERROR ");
					}
				});
		}
		
	});
	
	// **임시 저장 버튼 버튼 선택 ** 
	$(document).on("click","div.ComBoradBtn  .ImSave",function(event){
		var agdCode = $(this).data("pageidxs");
		var agdtype = $(this).data("agdtype");
		var exIdx = $("#committeeIdx").val();
		
		var opinionText = {
			text01 : null,
			text02 : null,
			text03 : null,
			text04 : null,
			text05 : null,
			text06 : null,
			text07 : null,
			text08 : null,
			textGeneral : null
		};
		
		if(agdtype=="01"){
			opinionText.textGeneral = $("#Page"+agdCode+" .ComBoradFrom .GeneralOpinionText ").val();
			opinionText.text01 = $("#Page"+agdCode+" .ComBoradFrom .OpinionText01").val();
			opinionText.text02 = $("#Page"+agdCode+" .ComBoradFrom .OpinionText02").val();
			opinionText.text03 = '';
			opinionText.text04 = '';
			opinionText.text05 = '';
			opinionText.text06 = ''; 
			opinionText.text07 = '';
			opinionText.text08 = '';
		}else if(agdtype=="04"){
			opinionText.textGeneral = $("#Page"+agdCode+" .ComBoradFrom .GeneralOpinionText ").val();
			opinionText.text01 = $("#Page"+agdCode+" .ComBoradFrom .OpinionText01").val();
			opinionText.text02 = $("#Page"+agdCode+" .ComBoradFrom .OpinionText02").val();
			opinionText.text03 = $("#Page"+agdCode+" .ComBoradFrom .OpinionText03").val();
			opinionText.text04 = $("#Page"+agdCode+" .ComBoradFrom .OpinionText04").val();
			opinionText.text05 = $("#Page"+agdCode+" .ComBoradFrom .OpinionText05").val();
			opinionText.text06 = $("#Page"+agdCode+" .ComBoradFrom .OpinionText06").val();
			opinionText.text07 = $("#Page"+agdCode+" .ComBoradFrom .OpinionText07").val();
			opinionText.text08 = '';
		}else if(agdtype=="02"||agdtype=="03"||agdtype=="05"||agdtype=="06"||agdtype=="07"){
			opinionText.textGeneral = $("#Page"+agdCode+" .ComBoradFrom .GeneralOpinionText ").val();
			opinionText.text01 = $("#Page"+agdCode+" .ComBoradFrom .OpinionText01").val();
			opinionText.text02 = $("#Page"+agdCode+" .ComBoradFrom .OpinionText02").val();
			opinionText.text03 = $("#Page"+agdCode+" .ComBoradFrom .OpinionText03").val();
			opinionText.text04 = $("#Page"+agdCode+" .ComBoradFrom .OpinionText04").val();
			opinionText.text05 = $("#Page"+agdCode+" .ComBoradFrom .OpinionText05").val();
			opinionText.text06 = ''; 
			opinionText.text07 = '';
			opinionText.text08 = '';
		}
		
		
		
		if(agdtype!="02"||agdtype!="05"){
		// 결과 타입 저장
			var opinionType = null;
			$("ul.TechAreaType li").each(function(idx, tech){
				if ($(tech).hasClass("SelOn")) {
					opinionType = $(tech).find("a.TechAreaTypeItem").data("type");
				}
			});
			var opinionTechItemId = null;
			if (hasTech(opinionType)){
				$(".TechAreaSelListItem").each(function(idx, item){
					if($(this).parent().hasClass("SelOn")){
						opinionTechItemId = $(item).data("tech-item-id");
					}
				});
			}
		}
		$.ajax({
			anyne:true,
			type:'POST',
			data: JSON.stringify({
				committeeIdx          : exIdx     
				, agdCode             : agdCode
				, committeeAdmId      : null
				, committeeOptType    : 'N'     
				, committeeOpt01      : opinionText.text01
				, committeeOpt02      : opinionText.text02
				, committeeOpt03      : opinionText.text03
				, committeeOpt04      : opinionText.text04
				, committeeOpt05      : opinionText.text05
				, committeeOpt06      : opinionText.text06
				, committeeOpt07      : opinionText.text07
				, committeeOpt08      : opinionText.text08
				, committeeOptGeneral : opinionText.textGeneral
				, committeeOptFlag    : opinionType
				, techItemId          : opinionTechItemId
				, committeeOptStatus  : 'TS'
			}),
        	url: "/expert/proc/commit/opinion/save.do",
			dataType: "json",
			contentType: 'application/json;charset=UTF-8',
			success : function(data) {
				alert("작성중인 검토 의견을 임시 저장 하였습니다.");
				//location.reload();
				$(".ExAgendaList .Agd"+agdCode).find(".ExagendaFlag").removeClass("Flag_01");
				$(".ExAgendaList .Agd"+agdCode).find(".ExagendaFlag").addClass("Flag_02");
				$(".ExAgendaList .Agd"+agdCode).find(".ExagendaFlag").text("임시저장");
				
				var idx00 = $(".AgendaTapList li:eq(0) .AgendaTapItem .Num").text();
				var idx01 = $(".AgendaTapList li:eq(1) .AgendaTapItem .Num").text();
				var idx02 = $(".AgendaTapList li:eq(2) .AgendaTapItem .Num").text();
				var idx03 = $(".AgendaTapList li:eq(3) .AgendaTapItem .Num").text();
				
				idx02++;
				idx001 = Number(idx00) - Number(idx02) - Number(idx03);
				$(".AgendaTapList li:eq(1) .AgendaTapItem .Num").text(idx001);
				$(".AgendaTapList li:eq(2) .AgendaTapItem .Num").text(idx02);
			},
			error: function(e) {
				alert("ERROR ");
			}
		});
	});
	
	// **임시 저장 버튼 버튼 선택 ** 
	$(document).on("click","div.ComBoradBtn  .OpSave",function(event){
		var agdCode = $(this).data("pageidxs");
		var agdtype = $(this).data("agdtype");
		var exIdx = $("#committeeIdx").val();
		
		var opinionText = {
			text01 : null,
			text02 : null,
			text03 : null,
			text04 : null,
			text05 : null,
			text06 : null,
			text07 : null,
			text08 : null,
			textGeneral : null
		};
		
		if(agdtype=="01"){
			
			opinionText.text01 = $("#Page"+agdCode+" .ComBoradFrom .OpinionText01").val();
			opinionText.text02 = $("#Page"+agdCode+" .ComBoradFrom .OpinionText02").val();
			opinionText.text03 = '';
			opinionText.text04 = '';
			opinionText.text05 = '';
			opinionText.text06 = ''; 
			opinionText.text07 = '';
			opinionText.text08 = '';
		}else if(agdtype=="04"){
			opinionText.text01 = $("#Page"+agdCode+" .ComBoradFrom .OpinionText01").val();
			opinionText.text02 = $("#Page"+agdCode+" .ComBoradFrom .OpinionText02").val();
			opinionText.text03 = $("#Page"+agdCode+" .ComBoradFrom .OpinionText03").val();
			opinionText.text04 = $("#Page"+agdCode+" .ComBoradFrom .OpinionText04").val();
			opinionText.text05 = $("#Page"+agdCode+" .ComBoradFrom .OpinionText05").val();
			opinionText.text06 = $("#Page"+agdCode+" .ComBoradFrom .OpinionText06").val();
			opinionText.text07 = $("#Page"+agdCode+" .ComBoradFrom .OpinionText07").val();
			opinionText.text08 = '';
		}else if(agdtype=="02"||agdtype=="03"||agdtype=="05"||agdtype=="06"||agdtype=="07"){
			opinionText.text01 = $("#Page"+agdCode+" .ComBoradFrom .OpinionText01").val();
			opinionText.text02 = $("#Page"+agdCode+" .ComBoradFrom .OpinionText02").val();
			opinionText.text03 = $("#Page"+agdCode+" .ComBoradFrom .OpinionText03").val();
			opinionText.text04 = $("#Page"+agdCode+" .ComBoradFrom .OpinionText04").val();
			opinionText.text05 = $("#Page"+agdCode+" .ComBoradFrom .OpinionText05").val();
			opinionText.text06 = ''; 
			opinionText.text07 = '';
			opinionText.text08 = '';
		}
		else if(agdtype=="11"){
			opinionText.text01 = $("#Page"+agdCode+" .ComBoradFrom .OpinionText01").val();
			opinionText.text02 = '';
			opinionText.text03 = '';
			opinionText.text04 = '';
			opinionText.text05 = '';
			opinionText.text06 = ''; 
			opinionText.text07 = '';
			opinionText.text08 = '';
		}
		opinionText.textGeneral = $("#Page"+agdCode+" .ComBoradFrom .GeneralOpinionText ").val();
		
		
		
		if(agdtype!="02"||agdtype!="05"){
		// 결과 타입 저장
			var opinionType = null;
			$("ul.TechAreaType li").each(function(idx, tech){
				if ($(tech).hasClass("SelOn")) {
					opinionType = $(tech).find("a.TechAreaTypeItem").data("type");
				}
			});
			var opinionTechItemId = null;
			if (hasTech(opinionType)){
				$(".TechAreaSelListItem").each(function(idx, item){
					if($(this).parent().hasClass("SelOn")){
						opinionTechItemId = $(item).data("tech-item-id");
					}
				});
			}
		}
		$.ajax({
			anyne:true,
			type:'POST',
			data: JSON.stringify({
				committeeIdx          : exIdx     
				, agdCode             : agdCode
				, committeeAdmId      : null
				, committeeOptType    : 'N'     
				, committeeOpt01      : opinionText.text01
				, committeeOpt02      : opinionText.text02
				, committeeOpt03      : opinionText.text03
				, committeeOpt04      : opinionText.text04
				, committeeOpt05      : opinionText.text05
				, committeeOpt06      : opinionText.text06
				, committeeOpt07      : opinionText.text07
				, committeeOpt08      : opinionText.text08
				, committeeOptGeneral : opinionText.textGeneral
				, committeeOptFlag    : opinionType
				, techItemId          : opinionTechItemId
				, committeeOptStatus  : 'SA'
			}),
        	url: "/expert/proc/commit/opinion/save.do",
			dataType: "json",
			contentType: 'application/json;charset=UTF-8',
			success : function(data) {
				alert("작성중인 검토 의견을 저장 하였습니다.");
				
				var idx00 = $(".AgendaTapList li:eq(0) .AgendaTapItem .Num").text();
				var idx01 = $(".AgendaTapList li:eq(1) .AgendaTapItem .Num").text();
				var idx02 = $(".AgendaTapList li:eq(2) .AgendaTapItem .Num").text();
				var idx03 = $(".AgendaTapList li:eq(3) .AgendaTapItem .Num").text();
				//console.log (idx00+"/"+idx01+"/"+idx02+"/"+idx03+"/agd"+agdCode);
		//		alert("작성중인 검토 의견을 저장 하였습니다.");
				//$(".ExAgendaList .Agd"+agdCode).find(".ExagendaFlag").text("작성완료");
				if($(".ExAgendaList .Agd"+agdCode).find(".ExagendaFlag").hasClass("Flag_02")){
					$(".ExAgendaList .Agd"+agdCode).find(".ExagendaFlag").removeClass("Flag_03");
					$(".ExAgendaList .Agd"+agdCode).find(".ExagendaFlag").addClass("Flag_03");
					$(".ExAgendaList .Agd"+agdCode).find(".ExagendaFlag").text("작성완료");
					idx02--;
					$(".AgendaTapList li:eq(2) .AgendaTapItem .Num").text(idx02);
					idx03++;
					$(".AgendaTapList li:eq(3) .AgendaTapItem .Num").text(idx03);
					idx001 = Number(idx00) - Number(idx02) - Number(idx03);
					$(".AgendaTapList li:eq(1) .AgendaTapItem .Num").text(idx001);
				}else{
					$(".ExAgendaList .Agd"+agdCode).find(".ExagendaFlag").removeClass("Flag_01");
					$(".ExAgendaList .Agd"+agdCode).find(".ExagendaFlag").addClass("Flag_03");
					$(".ExAgendaList .Agd"+agdCode).find(".ExagendaFlag").text("작성완료");
					idx01--;
					$(".AgendaTapList li:eq(1) .AgendaTapItem .Num").text(idx01);
					idx03++;
					$(".AgendaTapList li:eq(3) .AgendaTapItem .Num").text(idx03);
					idx002 = Number(idx00) - Number(idx01) - Number(idx03);
					$(".AgendaTapList li:eq(2) .AgendaTapItem .Num").text(idx002);
				}
				 $("#Page"+agdCode+" .ComBoradFrom .ImSave").css("display","none");
				//location.reload();
			},
			error: function(e) {
				alert("ERROR ");
			}
		});
	});
	
	
	$(document).on("click","div.ComBoradBtn  .OpSave02",function(event){
		var agdIdx = $(this).data("pageidxs");
		var agdType = $(this).data("agdtype");
		var idx00 = $(".AgendaTapList li:eq(0) .AgendaTapItem .Num").text();
		var idx01 = $(".AgendaTapList li:eq(1) .AgendaTapItem .Num").text();
		var idx02 = $(".AgendaTapList li:eq(2) .AgendaTapItem .Num").text();
		var idx03 = $(".AgendaTapList li:eq(3) .AgendaTapItem .Num").text();
		alert("작성중인 이관 의견을 저장 하였습니다.");
		if($(".ExAgendaList .Agd"+agdIdx).find(".ExagendaFlag").hasClass("Flag_02")){
			$(".ExAgendaList .Agd"+agdIdx).find(".ExagendaFlag").removeClass("Flag_03");
			$(".ExAgendaList .Agd"+agdIdx).find(".ExagendaFlag").addClass("Flag_03");
			$(".ExAgendaList .Agd"+agdIdx).find(".ExagendaFlag").text("작성완료");
			idx02--;
			$(".AgendaTapList li:eq(2) .AgendaTapItem .Num").text(idx02);
			idx03++;
			$(".AgendaTapList li:eq(3) .AgendaTapItem .Num").text(idx03);
			idx001 = Number(idx00) - Number(idx02) - Number(idx03);
			$(".AgendaTapList li:eq(1) .AgendaTapItem .Num").text(idx001);
			
		}else{
			$(".ExAgendaList .Agd"+agdIdx).find(".ExagendaFlag").removeClass("Flag_01");
			$(".ExAgendaList .Agd"+agdIdx).find(".ExagendaFlag").addClass("Flag_03");
			$(".ExAgendaList .Agd"+agdIdx).find(".ExagendaFlag").text("작성완료");
			idx01--;
			$(".AgendaTapList li:eq(1) .AgendaTapItem .Num").text(idx01);
			idx03++;
			$(".AgendaTapList li:eq(3) .AgendaTapItem .Num").text(idx03);
			idx002 = Number(idx00) - Number(idx01) - Number(idx03);
			$(".AgendaTapList li:eq(2) .AgendaTapItem .Num").text(idx002);
		}
	});
	var hasTech = function(type) {
		if (type == null) return false;
		switch (type) {
			case "F001":
			case "F003":
			case "F005":
			case "F007":
			case "F008":
			case "F010":
			case "F011":
				return true;
			case "F002":
			case "F004":
			case "F006":
			case "F009":
			case "F012":
				return false;
			default:
				return false;
		}
	}
	
	
	// ** 개최일 선택 상세 보기 (기술명칭) 클릭 이벤트 **
	$("div.BodyList  .CommitTit").on("click",function(){
		var exIdx = $(this).data("ex-idx");
		var href = "/expert/committeeWrite.do";
		location.href = href;
	});
	
	// ** 의견 작성 버튼 클릭 이벤트 **
	$("div.BodyListP  .CommodiBtn").on("click",function(){
		var exIdx = $(this).data("ex-idx");
		var href = "/expert/committeepWrite.do";
		location.href = href;
	});
	
});