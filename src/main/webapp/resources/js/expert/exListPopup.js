/** [전문위원회] > 위원회 현황 리스트 > 팝업 **/

/***************************************************/
/*********** [CE] 개최 예정 > 전문위 취소  ************/
/***************************************************/
var cancelExPopup = function(){
	var wp = {};
	
	var $popup = null;
	var popupUrl = "/ex/popup/cancelEx.do";
	
	/** 팝업 종료 */
	wp.close = function(){
		comn.popupClose();
	};
	
	/** 화면에서 시작하는 경우 */
	wp.open = function(committeeIdx, deleteType){
		console.log(committeeIdx+":"+ deleteType);
		popupUrl = '/ex/popup/cancelEx.do?committeeIdx='+committeeIdx+'&deleteType='+deleteType;
		comn.popupOpen(popupUrl, createEvent);
	};
	
	/** 팝업 기능 생성 */
	var createEvent = function(popupElement){
		$popup = popupElement;
		
		/** Alert 닫기 버튼 클릭 이벤트 */
		$popup.find("div.layer_alert_tit a.layer_closer").off().on("click",function(){
			wp.close();
		});
		$popup.find("div.layer_alert_btn a.alertClose").off().on("click",function(){
			wp.close();
		});
	};
	return wp;
}();

/***************************************************/
/*********** [CE] 개최 예정 > 전문위 개최 [CI]  ************/
/***************************************************/
var openExPopup = function(){
	var wp = {};
	
	var $popup = null;
	var popupUrl = "/ex/popup/openEx.do";
	
	/** 팝업 종료 */
	wp.close = function(){
		comn.popupClose();
	};
	
	/** 화면에서 시작하는 경우 */
	wp.open = function(committeeIdx, deleteType){
		console.log(committeeIdx+":"+ deleteType);
		popupUrl = '/ex/popup/openEx.do?committeeIdx='+committeeIdx;
		comn.popupOpen(popupUrl, createEvent);
	};
	
	/** 팝업 기능 생성 */
	var createEvent = function(popupElement){
		$popup = popupElement;
		
		/** Alert 닫기 버튼 클릭 이벤트 */
		$popup.find("div.layer_alert_tit a.layer_closer").off().on("click",function(){
			wp.close();
		});
		$popup.find("div.layer_alert_btn a.alertClose").off().on("click",function(){
			wp.close();
		});
	};
	return wp;
}();

/***************************************************/
/*********** [CI] 전문위 진행중 > 개최 회수      ************/
/***************************************************/
var backExPopup = function(){
	var wp = {};
	
	var $popup = null;
	var popupUrl = "/ex/popup/backEx.do";
	
	/** 팝업 종료 */
	wp.close = function(){
		comn.popupClose();
	};
	
	/** 화면에서 시작하는 경우 */
	wp.open = function(committeeIdx){
		console.log(committeeIdx);
		popupUrl = '/ex/popup/backEx.do?committeeIdx='+committeeIdx;
		comn.popupOpen(popupUrl, createEvent);
	};
	
	/** 팝업 기능 생성 */
	var createEvent = function(popupElement){
		$popup = popupElement;
		
		/** Alert 닫기 버튼 클릭 이벤트 */
		$popup.find("div.layer_alert_tit a.layer_closer").off().on("click",function(){
			wp.close();
		});
		$popup.find("div.layer_alert_btn a.alertClose").off().on("click",function(){
			wp.close();
		});
	};
	return wp;
}();

/***************************************************/
/*********** [CI] 전문위 진행중 > 종료      ************/
/***************************************************/
var endExPopup = function(){
	var wp = {};
	
	var $popup = null;
	var popupUrl = "/ex/popup/endEx.do";
	
	/** 팝업 종료 */
	wp.close = function(){
		comn.popupClose();
	};
	
	/** 화면에서 시작하는 경우 */
	wp.open = function(committeeIdx){
		console.log(committeeIdx);
		popupUrl = '/ex/popup/endEx.do?committeeIdx='+committeeIdx;
		comn.popupOpen(popupUrl, createEvent);
	};
	
	/** 팝업 기능 생성 */
	var createEvent = function(popupElement){
		$popup = popupElement;
		
		/** Alert 닫기 버튼 클릭 이벤트 */
		$popup.find("div.layer_alert_tit a.layer_closer").off().on("click",function(){
			wp.close();
		});
		$popup.find("div.layer_alert_btn a.alertClose").off().on("click",function(){
			wp.close();
		});
	};
	return wp;
}();

/***************************************************/
/*********** [CC] 전문위 종료 (결과도출중) > 종료 회수      ************/
/***************************************************/
var endbackExPopup = function(){
	var wp = {};
	
	var $popup = null;
	var popupUrl = "/ex/popup/endbackEx.do";
	
	/** 팝업 종료 */
	wp.close = function(){
		comn.popupClose();
	};
	
	/** 화면에서 시작하는 경우 */
	wp.open = function(committeeIdx){
		console.log(committeeIdx);
		popupUrl = '/ex/popup/endbackEx.do?committeeIdx='+committeeIdx;
		comn.popupOpen(popupUrl, createEvent);
	};
	
	/** 팝업 기능 생성 */
	var createEvent = function(popupElement){
		$popup = popupElement;
		
		/** Alert 닫기 버튼 클릭 이벤트 */
		$popup.find("div.layer_alert_tit a.layer_closer").off().on("click",function(){
			wp.close();
		});
		$popup.find("div.layer_alert_btn a.alertClose").off().on("click",function(){
			wp.close();
		});
	};
	return wp;
}();

/***************************************************/
/*********** [IC] 검토 완료(기술안보과이관 완료) > 이관 회수      ************/
/***************************************************/
var returnExPopup = function(){
	var wp = {};
	
	var $popup = null;
	var popupUrl = "/ex/popup/returnEx.do";
	
	/** 팝업 종료 */
	wp.close = function(){
		comn.popupClose();
	};
	
	/** 화면에서 시작하는 경우 */
	wp.open = function(committeeIdx){
		console.log(committeeIdx);
		popupUrl = '/ex/popup/returnEx.do?committeeIdx='+committeeIdx;
		comn.popupOpen(popupUrl, createEvent);
	};
	
	/** 팝업 기능 생성 */
	var createEvent = function(popupElement){
		$popup = popupElement;
		
		/** Alert 닫기 버튼 클릭 이벤트 */
		$popup.find("div.layer_alert_tit a.layer_closer").off().on("click",function(){
			wp.close();
		});
		$popup.find("div.layer_alert_btn a.alertClose").off().on("click",function(){
			wp.close();
		});
	};
	return wp;
}();
/************ 비밀유지의무 동의서 - 자료 열람 ()************/
var SecretViewAgreePopup = function(){
	var wp = {};
	
	var $popup = null;
	var popupUrl = "/expert/popup/agree/secretAgreeViewPopup.do";
	
	/** 팝업 종료 */
	wp.close = function(){
		comn.popupClose();
	};
	
	/** 화면에서 시작하는 경우 */
	wp.open = function(exIdx){
		popupUrl = '/expert/popup/agree/secretAgreeViewPopup.do?committeeIdx='+exIdx;
		comn.popupOpen(popupUrl, createEvent);
	};
	
	
	/** 팝업 기능 생성 */
	var createEvent = function(popupElement){
		$popup = popupElement;
		var sig = $('#sig').signature({ 
	    	change: function(event, ui) { 
	        	$popup.find("#SignatureYN").val("Y"); 
	    	}
	    });
	    
	    $('#sig').signature({background: '#f3f8fe'});
	    $popup.find("#SignatureYN").val("N");
		/**  서명 지우기 버튼 클릭 **/ 
		$('#clear').click(function() {
			sig.signature('clear');
			$popup.find("#SignatureYN").val("N");
		});
		
		/** 비밀 유지 약관 동의 체크 **/
		$popup.find("div.AgreeChkBox a.AgreeChkBtn").off().on("click",function(){
			if($(this).hasClass("AgreeOn")){
				$(this).removeClass("AgreeOn");
				$(this).parent().find("#AgreeOnYN").val("N");
			}else{
				$(this).addClass("AgreeOn");
				$(this).parent().find("#AgreeOnYN").val("Y");
			}
		});
		
		/** 동의 및 확인 */
		$popup.find("div.layer_popup_btn a.btn_AgreeCommite").off().on("click",function(){
			var AgreeOnYN = $("#AgreeOnYN").val();
			var SignatureYN = $popup.find("#SignatureYN").val();
			if(AgreeOnYN=="N"){
				alert("약관에 동의해주세요.");
				return;
			}else if(SignatureYN=="N"){
				alert("서명을 작성해주세요.");
				return;
			}else{
				var admId = $(this).data("admid");
				var exIdx = $(this).data("exidx");
				var committeeSignViewYn = "Y";
				var signature = sig.signature('toSVG');
				//alert("/"+admId+"/"+exIdx);
				$.ajax({
					anyne:true,
					type:'POST',
					data: JSON.stringify({
						committeeIdx          : exIdx
						,committeeSignViewYn : committeeSignViewYn
						,committeeSignView    : signature     
						}),
						
		        	url: "/expert/proc/commit/opinion/agreeViewSave.do",
					dataType: "json",
					contentType: 'application/json;charset=UTF-8',
					success : function(data) {
						alert("자료 열람 비밀유지동의 서명이 완료 되었습니다.");
						wp.close();
						//location.reload();
					},
					error: function(e) {
						alert("ERROR ");
					}
				});
			}
		});
	};
	return wp;
}();

/************ 비밀유지의무 동의서 - 의견 작성 ()************/
var SecretWriteAgreePopup = function(){
	var wp = {};
	
	var $popup = null;
	var popupUrl = "/expert/popup/agree/secretAgreeWritePopup.do";
	
	/** 팝업 종료 */
	wp.close = function(){
		comn.popupClose();
	};
	
	/** 화면에서 시작하는 경우 */
	wp.open = function(exIdx){
		popupUrl = '/expert/popup/agree/secretAgreeWritePopup.do?committeeIdx='+exIdx;
		comn.popupOpen(popupUrl, createEvent);
	};
	
	
	/** 팝업 기능 생성 */
	var createEvent = function(popupElement){
		$popup = popupElement;
		var sig = $('#sig').signature({ 
	    	change: function(event, ui) { 
	        	$popup.find("#SignatureYN").val("Y"); 
	    	}
	    });
	    
	    $('#sig').signature({background: '#f3f8fe'});
	    $popup.find("#SignatureYN").val("N");
		/**  서명 지우기 버튼 클릭 **/ 
		$('#clear').click(function() {
			sig.signature('clear');
			$popup.find("#SignatureYN").val("N");
		});
		
		/** 비밀 유지 약관 동의 체크 **/
		$popup.find("div.AgreeChkBox a.AgreeChkBtn").off().on("click",function(){
			if($(this).hasClass("AgreeOn")){
				$(this).removeClass("AgreeOn");
				$(this).parent().find("#AgreeOnYN").val("N");
			}else{
				$(this).addClass("AgreeOn");
				$(this).parent().find("#AgreeOnYN").val("Y");
			}
		});
		
		/** 동의 및 확인 */
		$popup.find("div.layer_popup_btn a.btn_AgreeCommite").off().on("click",function(){
			var AgreeOnYN = $("#AgreeOnYN").val();
			var SignatureYN = $popup.find("#SignatureYN").val();
			if(AgreeOnYN=="N"){
				alert("약관에 동의해주세요.");
				return;
			}else if(SignatureYN=="N"){
				alert("서명을 작성해주세요.");
				return;
			}else{
				var admId = $(this).data("admid");
				var exIdx = $(this).data("exidx");
				var committeeSignWriteYn = "Y";
				var signature = sig.signature('toSVG');
				//alert("/"+admId+"/"+exIdx);
				$.ajax({
					anyne:true,
					type:'POST',
					data: JSON.stringify({
						committeeIdx          : exIdx     
						,committeeSignWriteYn : committeeSignWriteYn
						,committeeSignWrite    : signature     
						}),
						
		        	url: "/expert/proc/commit/opinion/agreeViewSave.do",
					dataType: "json",
					contentType: 'application/json;charset=UTF-8',
					success : function(data) {
						alert("전문위원회 참석 비밀유지동의 서명이 완료 되었습니다.");
						wp.close();
						//location.reload();
					},
					error: function(e) {
						alert("ERROR ");
					}
				});
			}
		});
	};
	return wp;
}();

/************ 비밀유지의무 동의서 - 최종의견 제출 ()************/
var SecretSaveAgreePopup = function(){
	var wp = {};
	
	var $popup = null;
	var popupUrl = "/expert/popup/agree/secretAgreeSavePopup.do";
	
	/** 팝업 종료 */
	wp.close = function(){
		comn.popupClose();
	};
	
	/** 화면에서 시작하는 경우 */
	wp.open = function(exIdx){
		popupUrl = '/expert/popup/agree/secretAgreeSavePopup.do?committeeIdx='+exIdx;
		comn.popupOpen(popupUrl, createEvent);
	};
	
	
	/** 팝업 기능 생성 */
	var createEvent = function(popupElement){
		$popup = popupElement;
		var sig = $('#sig').signature({ 
	    	change: function(event, ui) { 
	        	$popup.find("#SignatureYN").val("Y"); 
	    	}
	    });
	    
	    $('#sig').signature({background: '#f3f8fe'});
	    $popup.find("#SignatureYN").val("N");
		/**  서명 지우기 버튼 클릭 **/ 
		$('#clear').click(function() {
			sig.signature('clear');
			$popup.find("#SignatureYN").val("N");
		});
		
		/** 비밀 유지 약관 동의 체크 **/
		$popup.find("div.AgreeChkBox a.AgreeChkBtn").off().on("click",function(){
			if($(this).hasClass("AgreeOn")){
				$(this).removeClass("AgreeOn");
				$(this).parent().find("#AgreeOnYN").val("N");
			}else{
				$(this).addClass("AgreeOn");
				$(this).parent().find("#AgreeOnYN").val("Y");
			}
		});
		
		/** 동의 및 확인 */
		$popup.find("div.layer_popup_btn a.btn_AgreeCommite").off().on("click",function(){
			var AgreeOnYN = $("#AgreeOnYN").val();
			var SignatureYN = $popup.find("#SignatureYN").val();
			if(AgreeOnYN=="N"){
				alert("약관에 동의해주세요.");
				return;
			}else if(SignatureYN=="N"){
				alert("서명을 작성해주세요.");
				return;
			}else{
				var admId = $(this).data("admid");
				var exIdx = $(this).data("exidx");
				var committeeSignSaveYn = "Y";
				var signature = sig.signature('toSVG');
				//alert("/"+admId+"/"+exIdx);
				$.ajax({
					anyne:true,
					type:'POST',
					data: JSON.stringify({
						committeeIdx          : exIdx
						,committeeSignSaveYn : committeeSignSaveYn
						,committeeSignSave    : signature     
						}),
						
		        	url: "/expert/proc/commit/opinion/agreeViewSave.do",
					dataType: "json",
					contentType: 'application/json;charset=UTF-8',
					success : function(data) {
						//alert("최종 검토 의견 제출 비밀유지동의 서명이 완료 되었습니다.");
						//wp.close();
						//location.reload();
						$.ajax({
							anyne:true,
							type:'POST',
							data: JSON.stringify({
								committeeIdx: exIdx
							}),
				        	url: "/expert/proc/commit/opinion/finish.do",
							dataType: "json",
							contentType: 'application/json;charset=UTF-8',
							success : function(data) {
								//console.log(data);
								alert("수고하셨습니다. \n비밀유지동의 및  최종의견 제출이 완료 되었습니다.");	
								location.href = "/expert/committeepList.do";
							},
							error: function(e) {
								alert("ERROR ");
							}
						});
					},
					error: function(e) {
						alert("ERROR ");
					}
				});
			}
		});
	};
	return wp;
}();

/************ 비밀유지의무 동의서 ************/
var SecretAgree = function(){
	var wp = {};
	
	var $popup = null;
	var popupUrl = "/expert/popup/agree/SecretAgree.do";
	
	/** 팝업 종료 */
	wp.close = function(){
		comn.popupClose();
	};
	
	/** 화면에서 시작하는 경우 */
	wp.open = function(){
		comn.popupOpen(popupUrl, createEvent);
	};
	
	
	/** 팝업 기능 생성 */
	var createEvent = function(popupElement){
		$popup = popupElement;
		
		/** 닫기 버튼 클릭 이벤트 */
		$popup.find("div.layer_popup_btn a.btn_close").off().on("click",function(){
			vp.close();
		});
		
		/** 위원회 구성 > 안건 구성 > 안건 자동 정렬 */
        function listSort(dataNm){
	    	$("#sortable1").html(
	        $("#sortable1 li").sort(function(a, b){
	            return $(a).data(dataNm) - $(b).data(dataNm);
	        })
	    );
	}
        
		
	};
	
	return wp;
}();
/************ 예금계좌이체 승낙서 팝업 ************/
var BankAgree = function(){
	var wp = {};
	
	var $popup = null;
	var popupUrl = "/expert/popup/agree/BankAgree.do";
	
	/** 팝업 종료 */
	wp.close = function(){
		comn.popupClose();
	};
	
	/** 화면에서 시작하는 경우 */
	wp.open = function(){
		comn.popupOpen(popupUrl, createEvent);
	};
	
	
	/** 팝업 기능 생성 */
	var createEvent = function(popupElement){
		$popup = popupElement;
		
		/** 닫기 버튼 클릭 이벤트 */
		$popup.find("div.layer_popup_btn a.btn_close").off().on("click",function(){
			vp.close();
		});
		
		/** 위원회 구성 > 안건 구성 > 안건 자동 정렬 */
        function listSort(dataNm){
	    	$("#sortable1").html(
	        $("#sortable1 li").sort(function(a, b){
	            return $(a).data(dataNm) - $(b).data(dataNm);
	        })
	    );
	}
        
		
	};
	
	return wp;
}();
var CommitteeWritePopup = function(){
	var wp = {};
	
	var $popup = null;
	var popupUrl = "/expert/popup/committee/write.do";
	
	/** 팝업 종료 */
	wp.close = function(){
		comn.popupClose();
	};
	
	wp.userGroup = "";
	wp.usertech = "";
	
	/** 화면에서 시작하는 경우 */
	wp.open = function(userGroup, userTech){
		wp.userGroup = userGroup;
		wp.userTech = userTech
		console.log(wp.userTech);
		comn.popupOpen(popupUrl, createEvent);
	};
	
	wp.commitInfo = {};
	wp.commitAgendas = [];
	wp.commitMembers = [];
	wp.commitOpinions = [];
	
	wp.initCommitData = function() {
		wp.commitInfo = {
				committeeIdx: null,
				committeeTechId: null,
				committeeYear: null,
				committeeNum: null,
				committeeTechNum: null,
				committeeAgdCnt: 0,
				committeeAmg03Cnt: 0,
				committeeAmg04Cnt: 0,
				committeeAmg05Cnt: 0,
				committeeAmg06Cnt: 0,
				committeeType: null,
				committeeDatePickS: null,
				committeeDatePickE: null,
				committeeDatePick1: null,
				committeeDateAdd1: null,
				committeeDatePick2: null,
				committeeDateAdd2: null,
				committeeDatePick3: null,
				committeeDateAdd3: null,
				committeeDatePick: null,
				committeeModiS: null,
				committeeModiE: null,
				committeeStatus: "CE",
				lastUpdt: null,
				lastUpdusrId: null
		};
		
		wp.commitAgendas = [];
		wp.commitMembers = [];
		wp.commitOpinions = [];
	};
	wp.getAgendaList = function(techId) {
		$.ajax({
			type: "GET",
			url: "/expert/proc/agenda/list.do",
			data : {"techId": techId}, 
			dataType : "json",
			success : function(data) { 
				// data 정보
				// resultCode: S(성공), F(실패)
				switch(data.resultCode){
				case "S":
					if (data.resultList.length == 0) {
						alert("해당 분야에 대한 안건이 존재하지 않습니다.");
						return;
					}
					// 데이터 추가
					wp.setAgendaList(data.resultList);
					
					// 위원회 구성원 조회
					wp.getMemberList(techId);
					
					// 퍼블리싱
					$popup.find(".layer_popup_body #stap_idx").val("2");
					$popup.find(".layer_popup_body .AgendaModi00").css("display","none");
					$popup.find(".layer_popup_body .AgendaModi01").css("display","block");
					$popup.find(".layer_popup_body .AgendaModi02").css("display","none");
					$popup.find(".layer_popup_body .AgendaModi03").css("display","none");
					if (wp.userGroup === "AMG04") {
						$popup.find(".layer_popup_btn .btn_pre_3003").css("display","none");
					} else {
						$popup.find(".layer_popup_btn .btn_pre_3003").css("display","inline-block");
					}
					$popup.find(".layer_popup_body .TitleTapList li").removeClass("TapOn");
					$popup.find(".layer_popup_body .TitleTapList li:eq(1)").addClass("TapOn");
					$('#Layer_Content_Warpper').animate({ width : '1200px'},500);
					break;
				case "F":
					alert("Failed"); 
					break;
				}
			},
			error : function(){
				alert("failed! ")
			},
		});
	};
	
	wp.setAgendaList = function(list) {
		var $agendaUl = $("#sortable1");
		var $agendaSelectedUl = $("#sortable2");
		$agendaUl.empty();
		$agendaSelectedUl.empty();
		var liHtml = "";
		$(list).each(function(idx,agenda){
			liHtml += "<li class='agenda_list_item ui-sortable-handle' data-index='"+idx+"' data-agd-code='"+agenda.agdCode+"' data-rcptseq='"+"0"+"' style='position: relative; opacity: 1; left: 0px; top: 0px;'>";
			liHtml += "<div class='agenda_sub_item_01'>"
				liHtml += "    <p class='agenda_no'>"+(list.length - idx)+"</p>"
				liHtml += "</div>"
					liHtml += "<div class='agenda_sub_item_02'>"
						liHtml += "    <p class='type_flag'>"+agenda.rcptTypeCodeName+"</p>"
						liHtml += "    <span class='agenda_date'>안건번호 : "+agenda.agdViewCode+"</span>"
						liHtml += "    <p class='agenda_tit'>"+agenda.techRcptTechNm+"</p>"
						liHtml += "    <p class='agenda_company'>신청기관 : "+(agenda.cpnNm == null ? "대상기업없음" : agenda.cpnNm)+"</p>"
						liHtml += "</div>"
		});
		$agendaUl.append(liHtml);
		
		/** 위원회 구성 > 안건 구성 > 안건 드래그 */
		$( "#sortable1").sortable({
			connectWith: "ul#sortable2",
			selectedClass: "agenda_on",
			opacity: 0.5,
			placeholder: "ui-state-highlight",
			stop: function(e, ui) {
				var list_name = ui.item.parent().data("list-name");
				if(list_name=="results_agenda"){
					$(this).sortable("cancel");
				}
			}
		}).disableSelection();
		
		$( "#sortable2").sortable({
			connectWith: "ul#sortable1",
			selectedClass: "agenda_on",
			opacity: 0.5,
			placeholder: "ui-state-highlight",
			stop: function(e, ui) {
				var list_name = ui.item.parent().data("list-name");
				if(list_name=="results_agenda"){
					listSort("index");
				}
			}
		}).disableSelection();
	};
	
	wp.getMemberList = function(techId) {
		$.ajax({
			type: "GET",
			url: "/member/proc/adm/list.do",
			data : {"techId": techId}, 
			dataType : "json",
			success : function(data) { 
				// data 정보
				// resultCode: S(성공), F(실패)
				switch(data.resultCode){
				case "S":
					wp.setMemberList(data.resultList);
					break;
				case "F":
					alert("Failed"); 
					break;
				}
			},
			error : function(){
				alert("failed! ")
			},
		});
	};
	
	//$popup.find("#sortable2 li.agenda_list_item").each(function(idx,agd) {
		//wp.commitAgendas.push($(agd).data("agd-code"));
		//wp.commitInfo.committeeAgdCnt++;
	//});
	
	wp.setMemberList = function(list){
		$popup.find("ul.ComMemList").each(function(){
			$(this).empty();
		});
		$(list).each(function(idx,mbr){
			var liHtml = "";
			
			switch(mbr.admGroup){
			case "AMG05":
				// 전문위원
				liHtml += "<li class='ComMemItem MemOn' data-adm-group='"+mbr.admGroup+"' data-id='"+mbr.admId+"'>";
    			liHtml += "	<input type='hidden' class='AgdYn' value='Y'>";
    			liHtml += "	<div class='ComMemItem_top'>";
    			liHtml += "		<div class='ComMemCard'>";
        		liHtml += "			<p>";
            	liHtml += "				<span class='ComMemName'>"+mbr.admName+"</span>";
            	liHtml += "				<span>"+mbr.admDept+" / "+mbr.admPositon+"</span>";
            	liHtml += "				<span>"+mbr.admCom+"</span>";
        		liHtml += "			</p>";
        		liHtml += "			<p>";
        		liHtml += "				<span class='ComMemInfo'>"+mbr.admMobile1+"-"+mbr.admMobile2+"-"+mbr.admMobile3+" | "+mbr.admEmail+"</span>";
        		liHtml += "			</p>";
        		liHtml += "		</div>";
    			liHtml += "		<a href='#none' class='MemAgdYN MemAgdYNOn'>검토권한</a>";
    			liHtml += "		<a href='#none' class='MemAgdChk'>상세설정</a>";
    			liHtml += "	</div>";
    			liHtml += "	<div class='MemAgendaCHListbox'>";
    			liHtml += "		<ul class='MemAgendaCHList'>";
    			liHtml += "		</ul>";
    			liHtml += "	</div>";
    			liHtml += "</li>";
				$popup.find("div.MemberListBox0 ul.ComMemList").append(liHtml);
				break;
			case "AMG06":
				// 기술위원
				liHtml += "<li class='ComMemItem MemOn' data-adm-group='"+mbr.admGroup+"' data-id='"+mbr.admId+"'>";
    			liHtml += "	<input type='hidden' class='AgdYn' value='Y'>";
    			liHtml += "	<div class='ComMemItem_top'>";
    			liHtml += "		<div class='ComMemCard'>";
        		liHtml += "			<p>";
            	liHtml += "				<span class='ComMemName'>"+mbr.admName+"</span>";
            	liHtml += "				<span>"+mbr.admDept+" / "+mbr.admPositon+"</span>";
            	liHtml += "				<span>"+mbr.admCom+"</span>";
        		liHtml += "			</p>";
        		liHtml += "			<p>";
        		liHtml += "				<span class='ComMemInfo'>"+mbr.admMobile1+"-"+mbr.admMobile2+"-"+mbr.admMobile3+" | "+mbr.admEmail+"</span>";
        		liHtml += "			</p>";
        		liHtml += "		</div>";
    			liHtml += "		<a href='#none' class='MemAgdYN'>검토권한</a>";
    			liHtml += "		<a href='#none' class='MemAgdChk'>상세설정</a>";
    			liHtml += "	</div>";
    			liHtml += "	<div class='MemAgendaCHListbox'>";
    			liHtml += "		<ul class='MemAgendaCHList'>";
    			liHtml += "		</ul>";
    			liHtml += "	</div>";
    			liHtml += "</li>";
				$popup.find("div.MemberListBox1 ul.ComMemList").append(liHtml);
				break;
			case "AMG03":
				// 보호센터
				liHtml += "<li class='ComMemItem MemOn' data-adm-group='"+mbr.admGroup+"' data-id='"+mbr.admId+"'>";
    			liHtml += "	<input type='hidden' class='AgdYn' value='Y'>";
    			liHtml += "	<div class='ComMemItem_top'>";
    			liHtml += "		<div class='ComMemCard'>";
        		liHtml += "			<p>";
            	liHtml += "				<span class='ComMemName'>"+mbr.admName+"</span>";
            	liHtml += "				<span>"+mbr.admDept+" / "+mbr.admPositon+"</span>";
            	liHtml += "				<span>"+mbr.admCom+"</span>";
        		liHtml += "			</p>";
        		liHtml += "			<p>";
        		liHtml += "				<span class='ComMemInfo'>"+mbr.admMobile1+"-"+mbr.admMobile2+"-"+mbr.admMobile3+" | "+mbr.admEmail+"</span>";
        		liHtml += "			</p>";
        		liHtml += "		</div>";
    			liHtml += "		<a href='#none' class='MemAgdYN MemAgdYNOn'>검토권한</a>";
    			liHtml += "		<a href='#none' class='MemAgdChk'>상세설정</a>";
    			liHtml += "	</div>";
    			liHtml += "	<div class='MemAgendaCHListbox'>";
    			liHtml += "		<ul class='MemAgendaCHList'>";
    			liHtml += "		</ul>";
    			liHtml += "	</div>";
    			liHtml += "</li>";
				$popup.find("div.MemberListBox2 ul.ComMemList").append(liHtml);
				break;
			case "AMG04":
				// 소관과
				liHtml += "<li class='ComMemItem MemOn' data-adm-group='"+mbr.admGroup+"' data-id='"+mbr.admId+"'>";
    			liHtml += "	<input type='hidden' class='AgdYn' value='Y'>";
    			liHtml += "	<div class='ComMemItem_top'>";
    			liHtml += "		<div class='ComMemCard'>";
        		liHtml += "			<p>";
            	liHtml += "				<span class='ComMemName'>"+mbr.admName+"</span>";
            	liHtml += "				<span>"+mbr.admDept+" / "+mbr.admPositon+"</span>";
            	liHtml += "				<span>"+mbr.admCom+"</span>";
        		liHtml += "			</p>";
        		liHtml += "			<p>";
        		liHtml += "				<span class='ComMemInfo'>"+mbr.admMobile1+"-"+mbr.admMobile2+"-"+mbr.admMobile3+" | "+mbr.admEmail+"</span>";
        		liHtml += "			</p>";
        		liHtml += "		</div>";
    			liHtml += "		<a href='#none' class='MemAgdYN MemAgdYNOn'>검토권한</a>";
    			liHtml += "		<a href='#none' class='MemAgdChk'>안건권한</a>";
    			liHtml += "	</div>";
    			liHtml += "	<div class='MemAgendaCHListbox'>";
    			liHtml += "		<ul class='MemAgendaCHList'>";
    			liHtml += "		</ul>";
    			liHtml += "	</div>";
    			liHtml += "</li>";
				$popup.find("div.MemberListBox3 ul.ComMemList").append(liHtml);
				break;
			}
		});
		
		/** 위원회 구성 > 위원 구성 > 위원 선택 */
		$(document).on("click",".MemberListBox .ComMemItem .ComMemCard",function(event){
			
			if($(this).parent().parent().hasClass("MemOn")){
				$(this).parent().parent().removeClass("MemOn");
				$(this).parent().parent().find(".MemAgendaCHListbox").removeClass("MALOn");
				
			}else{
				$(this).parent().parent().addClass("MemOn");
				
			}
		});
		
		
		/** 위원회 구성 > 위원 구성 > 위원 안건 권한 선택  */
		$(document).on("click",".MemberListBox .ComMemItem .MemAgdChk",function(event){
			if($(this).parent().parent().hasClass("MemOn")){
				if($(this).parent().parent().find(".MemAgendaCHListbox").hasClass("MALOn")){
					$(this).parent().parent().find(".MemAgendaCHListbox").removeClass("MALOn");
				}else{
					$(this).parent().parent().parent().find(".MemAgendaCHListbox").removeClass("MALOn");
					$(this).parent().parent().find(".MemAgendaCHListbox").addClass("MALOn");
				}
			}
		});
		
		/** 위원회 구성 > 위원 구성 > 위원 안건 권한 > 안건 선택  */
		$(document).on("click",".MemberListBox .MemAgendaCHList li",function(event){
			if($(this).hasClass("ReadOk")){
				var chkExit = confirm('권한을 해제 하시면 해당 구성원은 해당 안건의 열람 권한이 부여되지 않습니다.');
				if(chkExit){
					$(this).removeClass("ReadOk");	
				}
			}else{
				$(this).addClass("ReadOk");
			}
		});
		
		/** 위원회 구성 > 위원 구성 > 위원 유효의견 선택  */
		$(document).on("click",".MemberListBox .ComMemItem .MemAgdYN",function(event){
			if($(this).parent().parent().hasClass("MemOn")){
				if($(this).hasClass("MemAgdYNOn")){
					var chkExit = confirm('유효의견을 해제하시겠습니까?\n해제 적용 후에도 의견 작성은 가능 합니다.');
					if(chkExit){
						$(this).parent().parent().find(".AgdYn").val("N");	
						$(this).removeClass("MemAgdYNOn");	
					}
				}else{
					$(this).addClass("MemAgdYNOn");
					$(this).parent().parent().find(".AgdYn").val("Y");
				}
				
			}
		});
		
		
	};
	
	wp.saveCommittee = function() {
		$.ajax({
			anyne:true,
			type:'POST',
			data: JSON.stringify({
				committeeData: wp.commitInfo, 
				committeeAgendaList: wp.commitAgendas,
				committeeMemberList: wp.commitMembers,
				committeeOpinionList: wp.commitOpinions,
			}),
			url: "/expert/proc/committee/save",
			dataType: "json",
			contentType: 'application/json;charset=UTF-8',
			success : function(data) {
				alert("전문위원회 구성이 완료되었습니다.");
				location.href="/expert/readyList.do";
			},
			error: function(e) {
				alert("ERROR ");
			}
		});
	};
	
	/** 팝업 기능 생성 */
	var createEvent = function(popupElement) {
		$popup = popupElement;
		
		$(document).on('mouseup',function(e){
			//var LayerCNT = $popup.find("#LayerCNT").val();
			//if(LayerCNT=="1"){
			$popup.find(".AutoH01").css("display","none");
			//}
		});
		
		if (wp.userGroup == "AMG04") {
			$popup.find("li.techSettingTab").css("display","none");
			wp.getAgendaList(wp.userTech);
		}
		
		/** 테스트 */
		var $DateNom01 = $('#DateNom01'),
		$DateNom02 = $('#DateNom02'),
		$DateNom03 = $('#DateNom03'),
		$str_date = $('#str_date');
		$end_date = $('#end_date');
		
		$DateNom01.datepicker({
			language: 'en',
			autoClose: true,
			position : 'left top',
			todayButton: true,
			clearButton: true,
			todayButton: new Date(),
			minDate: new Date(),
			
		})
		$DateNom02.datepicker({
			language: 'en',
			autoClose: true,
			position : 'left center',
			todayButton: true,
			clearButton: true,
			todayButton: new Date(),
			minDate: new Date(),
		})
		$DateNom03.datepicker({
			language: 'en',
			autoClose: true,
			position : 'left bottom',
			todayButton: true,
			clearButton: true,
			todayButton: new Date(),
			minDate: new Date(),
		})
		$str_date.datepicker({
			language: 'en',
			autoClose: true,
			position : 'left top',
			todayButton: true,
			clearButton: true,
			todayButton: new Date(),
			minDate: new Date(),
			onSelect: function (fd, date) {
				$end_date.data('datepicker')
				.update('minDate', date)
			}
		})
		$end_date.datepicker({
			language: 'en',
			autoClose: true,
			position : 'left top',
			todayButton: true,
			clearButton: true,
			todayButton: new Date(),
			onSelect: function (fd, date) {
				$str_date.data('datepicker')
				.update('maxDate', date)
			}
		})
		/** 위원회 구성 > 안건 구성 > 선택 안건 추가 */
		$popup.find(".dept_list_01 li").click(function() {
			var ComTechType = $(this).data("tech-id");
			if(!$(this).hasClass("dept_on")){
				$(this).parent().find("li").removeClass("dept_on");
				$(this).addClass("dept_on");
				$(this).parent().parent().find("#ComTechType").val(ComTechType);
			}
			
//			ComTechType 
			$('#sortable2').append($('#sortable1').children('.agenda_on'));
			$('.agenda_list li').removeClass('agenda_on');
		});
		
		
		
		/** 위원회 구성 > 안건 구성 > 선택 안건 추가 */
		$popup.find(".AgendaModiForm .agendaadd").click(function() {
			$('#sortable2').append($('#sortable1').children('.agenda_on'));
			$('.agenda_list li').removeClass('agenda_on');
		});
		
		/** 위원회 구성 > 안건 구성 > 선택 안건 삭제 */
		$popup.find(".AgendaModiForm .agendadel").click(function() {
			$('#sortable1').append($('#sortable2').children('.agenda_on'));
			listSort("index");
			$('.agenda_list li').removeClass('agenda_on');
		});
		
		/** 위원회 구성 > 안건 구성 > 안건 선택 */
		$(document).on("click",".AgendaModiForm .agenda_list_item",function(event){
			var target = $(this);
			if(target.hasClass("agenda_on")){
				target.removeClass("agenda_on");
			}else{
				target.addClass("agenda_on");
			}
		});
		
		/** 위원회 구성 > 위원 구성 > 탭 선택 */
		$(document).on("click",".ComMemeberBox .MemberTapItem",function(event){
			var idx = $(this).parent().index();
			if(!$(this).parent().hasClass("TapOn")){
				$(this).parent().parent().find("li").removeClass("TapOn");
				$(this).parent().addClass("TapOn");
				$popup.find(".ComMemeberBox .MemberListBox").css("display","none");
				$popup.find(".ComMemeberBox .MemberListBox"+idx).css("display","block");   
			}
		});
		
		/** 위원회 구성 > 위원회 설정  > 대면, 서면 선택 */
		$(document).on("click",".ComTypeBox .ComTypeItem",function(event){
			var idx = $(this).parent().index();
			var typeCode = $(this).data("type-code");
			if(!$(this).parent().hasClass("TypeOn")){
				
				$(this).parent().parent().parent().find("#committee_type").val(typeCode);
				$(this).parent().parent().find("li").removeClass("TypeOn");
				$(this).parent().addClass("TypeOn");
				if(typeCode=="A"){
					$popup.find(".DatePickBox #PickCom").text("참석여부 조사기간");
					$popup.find(".ComSetupBox .DatePickBox1").css("display","block");
				}else{
					$popup.find(".DatePickBox #PickCom").text("자료 열람 기간");
					$popup.find(".ComSetupBox .DatePickBox1").css("display","none");
				}
				
				
			}
		});
		
		/** 위원회 구성 > 위원회 설정  > 시간 인풋 포커스 */
		$(document).on("click",".DateForm .DateH",function(event){
			$popup.find(".AutoH01").css("display","none");
			$(this).parent().find(".HourPick").css("display","block");
		});
		
		/** 위원회 구성 > 위원회 설정  > 시간 레이어 선택*/
		$(document).on("click",".HourPick .HourPickItem",function(event){
			var selhour = $(this).data("selhour");
			$(this).parent().parent().parent().parent().find(".DateH").text(selhour);
			$(this).parent().parent().parent().parent().find(".DateHD").val(selhour);
			$(this).parent().parent().parent().css("display","none");
		});
		
		/** 위원회 구성 > 위원회 설정  > 분 인풋 포커스 */
		$(document).on("click",".DateForm .DateM",function(event){
			$popup.find(".AutoH01").css("display","none");
			$(this).parent().find(".MinPick").css("display","block");
		});		
		
		/** 위원회 구성 > 위원회 설정  > 분 레이어 선택*/
		$(document).on("click",".MinPick .MinPickItem",function(event){
			var selmin = $(this).data("selmin");
			$(this).parent().parent().parent().parent().find(".DateM").text(selmin);
			$(this).parent().parent().parent().parent().find(".DateMD").val(selmin);
			$(this).parent().parent().parent().css("display","none");
		});
		
		
		/** 위원회 구성 > 다음 버튼 */
		$(document).on("click",".layer_popup_btn .btn_next_3003",function(event){
			var idx = $popup.find(".layer_popup_body #stap_idx").val();
			
			if(idx=="1"){
				var techId = $popup.find(".dept_list_01 li.dept_on").data("tech-id");
				if(!techId){
					alert("위원회를 구성할 분야를 선택하세요.");
					return;
				}
				wp.getAgendaList(techId);
			}else if(idx=="2"){
				var $agendaSelectedUl = $("#sortable2");
				wp.selectedAgendas = [];
				$agendaSelectedUl.find("li").each(function(idx,agenda){
					wp.selectedAgendas.push($(agenda).data("agd-code"));
				});
		    	if(wp.selectedAgendas.length == 0){
		    		alert("위원회를 구성할 안건을 선택해주세요.");
		    		return;
		    	}
				var AgdListidx = $popup.find("#sortable2 li").length;
				$popup.find(".MemAgendaCHList").empty();
				var AgdListItem = "";
				for(i=0;i<AgdListidx;i++){
					var AgdListcode = $popup.find("#sortable2 li:eq("+i+")").data("agd-code");
					var AgdListcon = $popup.find("#sortable2 li:eq("+i+") .agenda_sub_item_02").html();
					AgdListItem += "<li class='ReadOk' data-agd-code='"+AgdListcode+"'>";
					AgdListItem += AgdListcon;
					AgdListItem += "</li>";
				}
				$popup.find(".MemAgendaCHList").append(AgdListItem);
				
				$popup.find(".layer_popup_body #stap_idx").val("3");
				$popup.find(".layer_popup_body .AgendaModi00").css("display","none");
				$popup.find(".layer_popup_body .AgendaModi01").css("display","none");
				$popup.find(".layer_popup_body .AgendaModi02").css("display","block");
				$popup.find(".layer_popup_body .AgendaModi03").css("display","none");
				$popup.find(".layer_popup_btn .btn_pre_3003").css("display","inline-block");
				$popup.find(".layer_popup_body .TitleTapList li").removeClass("TapOn");
				$popup.find(".layer_popup_body .TitleTapList li:eq(2)").addClass("TapOn");
				$('#Layer_Content_Warpper').animate({ width : '800px'},500);
			}else if(idx=="3"){
				var isMemberCheck = false;
				$popup.find("li.ComMemItem").each(function(idx,li){
					if ($(li).hasClass("MemOn")){
						isMemberCheck = true;
					}
				});
				if (!isMemberCheck) {
					alert("위원회 구성원을 설정해주세요.");
					return;
				}
				
				$popup.find(".layer_popup_body #stap_idx").val("4");
				$popup.find(".layer_popup_body .AgendaModi00").css("display","none");
				$popup.find(".layer_popup_body .AgendaModi01").css("display","none");
				$popup.find(".layer_popup_body .AgendaModi02").css("display","none");
				$popup.find(".layer_popup_body .AgendaModi03").css("display","block");
				$popup.find(".layer_popup_btn .btn_pre_3003").css("display","inline-block");
				$popup.find(".layer_popup_btn .btn_save_3003").css("display","inline-block");
				$popup.find(".layer_popup_body .TitleTapList li").removeClass("TapOn");
				$popup.find(".layer_popup_body .TitleTapList li:eq(3)").addClass("TapOn");
				$(this).css("display","none");
			}
		});
		
		/** 위원회 구성 > 이전 버튼 */
		$(document).on("click",".layer_popup_btn .btn_pre_3003",function(event){
			var idx = $popup.find(".layer_popup_body #stap_idx").val();
			
			if(idx=="4"){
				$popup.find(".layer_popup_body #stap_idx").val("3");
				$popup.find(".layer_popup_body .AgendaModi00").css("display","none");
				$popup.find(".layer_popup_body .AgendaModi01").css("display","none");
				$popup.find(".layer_popup_body .AgendaModi02").css("display","block");
				$popup.find(".layer_popup_body .AgendaModi03").css("display","none");
				$popup.find(".layer_popup_btn .btn_pre_3003").css("display","inline-block");
				$popup.find(".layer_popup_btn .btn_save_3003").css("display","none");
				$popup.find(".layer_popup_btn .btn_next_3003").css("display","inline-block");
				$popup.find(".layer_popup_body .TitleTapList li").removeClass("TapOn");
				$popup.find(".layer_popup_body .TitleTapList li:eq(2)").addClass("TapOn");
			}else if(idx=="3"){
				$popup.find(".layer_popup_body #stap_idx").val("2");
				$popup.find(".layer_popup_body .AgendaModi00").css("display","none");
				$popup.find(".layer_popup_body .AgendaModi01").css("display","block");
				$popup.find(".layer_popup_body .AgendaModi02").css("display","none");
				$popup.find(".layer_popup_body .AgendaModi03").css("display","none");
				if (wp.userGroup === "AMG04") {
					$popup.find(".layer_popup_btn .btn_pre_3003").css("display","none");
				} else {
					$popup.find(".layer_popup_btn .btn_pre_3003").css("display","inline-block");
				}
				$popup.find(".layer_popup_btn .btn_next_3003").css("display","inline-block");
				$('#Layer_Content_Warpper').animate({ width : '1200px'},500);
				$popup.find(".layer_popup_body .TitleTapList li").removeClass("TapOn");
				$popup.find(".layer_popup_body .TitleTapList li:eq(1)").addClass("TapOn");
			}else if(idx=="2"){
				$popup.find(".layer_popup_body #stap_idx").val("1");
				$popup.find(".layer_popup_body .AgendaModi00").css("display","block");
				$popup.find(".layer_popup_body .AgendaModi01").css("display","none");
				$popup.find(".layer_popup_body .AgendaModi02").css("display","none");
				$popup.find(".layer_popup_body .AgendaModi03").css("display","none");
				$popup.find(".layer_popup_btn .btn_save_3003").css("display","none");
				$popup.find(".layer_popup_btn .btn_next_3003").css("display","inline-block");
				$popup.find(".layer_popup_body .TitleTapList li").removeClass("TapOn");
				$popup.find(".layer_popup_body .TitleTapList li:eq(0)").addClass("TapOn");
				$(this).css("display","none");
				$('#Layer_Content_Warpper').animate({ width : '640px'},500);
			}
		});
		
		/** 위원회 구성 > 위원회 구성 저장 버튼 */
		$popup.find(".layer_popup_btn .btn_save_3003").off().on("click",function(event){
			wp.initCommitData();
			
			// 분야
			if (wp.userGroup == "AMG04") {
				wp.commitInfo.committeeTechId = wp.userTech;
			} else {
				wp.commitInfo.committeeTechId = $popup.find(".dept_list_01 li.dept_on").data("tech-id");
			}
			
			// 연도
			var today = new Date();
			wp.commitInfo.committeeYear = today.getFullYear()+"";
			
			// 타입 체크
			var comType = "";
			$popup.find("ul.ComTypeList li").each(function(idx,li){
				if($(li).hasClass("TypeOn")){
					comType = $(li).find("a.ComTypeItem").data("type-code");
				}
			});
			var startDate = $popup.find("#str_date").val();
			var endDate = $popup.find("#end_date").val();
			switch (comType) {
			case "A":
				// 대면
				// 1. 참석일 선택
				if (startDate == "" || endDate == "") {
					alert("참석여부 조사기간을 입력하세요.");
					return;
				}
				wp.commitInfo.committeeDatePickS = startDate.replace(/-/gi, "")
				+ $popup.find("#str_dateH").val()
				+ $popup.find("#str_dateM").val() + "00";
				wp.commitInfo.committeeDatePickE = endDate.replace(/-/gi, "")
				+ $popup.find("#end_dateH").val()
				+ $popup.find("#end_dateM").val() + "00";
				
				// 2. 개최후보일 / 장소
				var canDate1 = $popup.find("#DateNom01").val();
				var canDate2 = $popup.find("#DateNom02").val();
				var canDate3 = $popup.find("#DateNom03").val();
				
				var canAddr1 = $popup.find("#can_addr1").val();
				var canAddr2 = $popup.find("#can_addr2").val();
				var canAddr3 = $popup.find("#can_addr3").val();
				
				if (canDate1) {
					wp.commitInfo.committeeDatePick1 = canDate1.replace(/-/gi, "")
					+ $popup.find("#can_date1H").val()
					+ $popup.find("#can_date1M").val() + "00";
					if (canAddr1) {
						wp.commitInfo.committeeDateAdd1 = canAddr1;
					}
				}
				if (canDate2) {
					wp.commitInfo.committeeDatePick2 = canDate2.replace(/-/gi, "")
					+ $popup.find("#can_date2H").val()
					+ $popup.find("#can_date2M").val() + "00";
					if (canAddr2) {
						wp.commitInfo.committeeDateAdd2 = canAddr2;
					}
				}
				if (canDate3) {
					wp.commitInfo.committeeDatePick3 = canDate3.replace(/-/gi, "")
					+ $popup.find("#can_date3H").val()
					+ $popup.find("#can_date3M").val() + "00";
					if (canAddr3) {
						wp.commitInfo.committeeDateAdd3 = canAddr3;
					}
				}
				break;
			case "B":
				// 서면
				if (startDate == "" || endDate == "") {
					alert("자료 열람 기간을 입력하세요.");
					return;
				}
				wp.commitInfo.committeeModiS = startDate.replace(/-/gi, "")
				+ $popup.find("#str_dateH").val()
				+ $popup.find("#str_dateM").val() + "00";
				wp.commitInfo.committeeModiE = endDate.replace(/-/gi, "")
				+ $popup.find("#end_dateH").val()
				+ $popup.find("#end_dateM").val() + "00";
				
				// 접수상태 변경 (의견작성중: CI)
				wp.commitInfo.committeeStatus = "CI";
				break;
			}
			// 대면/서면 타입
			wp.commitInfo.committeeType = comType;
			
			// 전문위원회 안건
			$popup.find("#sortable2 li.agenda_list_item").each(function(idx,agd) {
				wp.commitAgendas.push($(agd).data("agd-code"));
				wp.commitInfo.committeeAgdCnt++;
			});
			
			// 전문위원회 구성원
			$popup.find("li.ComMemItem").each(function(idx,mbr){
				if ($(mbr).hasClass("MemOn")){
					wp.commitMembers.push({"admId": $(mbr).data("id"), "committeeOptYn": $(mbr).find(".AgdYn").val()});
					switch($(mbr).data("adm-group")){
					case "AMG05":
						// 전문위원
						wp.commitInfo.committeeAmg05Cnt++;
						break;
					case "AMG06":
						// 기술위원
						wp.commitInfo.committeeAmg06Cnt++;
						break;
					case "AMG03":
						// 보호센터
						wp.commitInfo.committeeAmg03Cnt++;
						break;
					case "AMG04":
						// 소관과
						wp.commitInfo.committeeAmg04Cnt++;
						break;
					}
					$(mbr).find("ul.MemAgendaCHList li").each(function(idx,macl){
						var opinionStatus = "DD";
						if ($(macl).hasClass("ReadOk")) {
							opinionStatus = "PW";
						}
						wp.commitOpinions.push({
							"agdCode":				$(macl).data("agd-code"),
							"committeeAdmId": 		$(mbr).data("id"),
							"committeeOptStatus": 	opinionStatus
						});
					});
					
				}
			});
			console.log(wp.commitMembers);
			console.log(wp.commitOpinions);
			wp.saveCommittee();
		});
		
		/* 
    	function fnSelectExpert(e){
			var target = $(e.currentTarget);
		    if(target.hasClass("mem_on")){
		        target.removeClass("mem_on");
		    }else{
		        target.addClass("mem_on");
		    }
		};
		
		 */
		
		
		/** 위원회 구성 > 안건 구성 > 안건 자동 정렬 */

        function listSort(dataNm){
        	console.log("리스트 순서 재구성 ")
	    	$("#sortable1").html(
		        $("#sortable1 li").sort(function(a, b){
		            return $(a).data(dataNm) - $(b).data(dataNm);
		        })
		    );
        }
        
		
	};
	
	return wp;
}();