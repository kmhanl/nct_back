/**
 * [전문위원회] 개최일 확정 리스트 팝업
 * - 작성일: 2022-02-08
 * 
 * - 다른 스크립트 변수 사용
 * 1. [common.js] comn
 */

/************ 참석일 선택 > 안건 수정  팝업 Function ************/
var AgendaModify = function(){
	var wp = {};
	
	var $popup = null;
	var popupUrl = "/expert/popup/agenda/modify.do";
	
	wp.committeeIdx = null;
	wp.committeeTechId = null;
	
	/** 팝업 종료 */
	wp.close = function(){
		comn.popupClose();
	};
	
	/** 화면에서 시작하는 경우 */
	wp.open = function(exIdx, extechId){
		wp.committeeIdx = exIdx;
		wp.committeeTechId = extechId;
		comn.popupOpen(popupUrl+"?committeeIdx="+wp.committeeIdx+"&committeeTechId="+wp.committeeTechId);
	};
	
	/** 팝업 기능 생성 */
	var createEvent = function(popupElement){
		$popup = popupElement;
		
		/** 닫기 버튼 클릭 이벤트 */
		$popup.find("div.layer_popup_btn a.btn_close").off().on("click",function(){
			wp.close();
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
        
        /** 위원회 구성 > 안건 구성 > 안건 선택 */
        $(document).on("click",".AgendaModiForm .agenda_list_item",function(event){
		    var target = $(this);
			if(target.hasClass("agenda_on")){
		        target.removeClass("agenda_on");
		    }else{
		        target.addClass("agenda_on");
		    }
		});
		
		
		/** 위원회 구성 > 안건 구성 > 안건 자동 정렬 */
        function listSort(dataNm){
	    	$("#sortable1").html(
		        $("#sortable1 li").sort(function(a, b){
		            return $(a).data(dataNm) - $(b).data(dataNm);
		        })
		    );
        }
        
		$popup.find(".btn_save_4001").on("click",function(e){
			var exList = [];
			var noExList = [];
			$popup.find("ul.agenda_list").each(function(idx, ul) {
				$(ul).find("li.agenda_list_item").each(function(liIdx, li){
					switch($(ul).data("list-name")) {
					case "results_agenda":
						// 선택되지 않은 안건
						noExList.push($(li).data("agd-code"));
						break;
					case "send_agenda":
						// 선택된 안건
						exList.push($(li).data("agd-code"));
						break;
					}
				})
			});
			
			// 위원회 안건 구성 저장
			$.ajax({
				anyne:true,
				type:'POST',
				data: JSON.stringify({committeeIdx: wp.committeeIdx, exList: exList, noExList: noExList}),
	        	url: "/expert/proc/agenda/modify",
				dataType: "json",
				contentType: 'application/json;charset=UTF-8',
				success : function(data) {
					alert("전문위원회 안건 구성이 완료되었습니다.");
					console.log(wp.returnUrl);
					location.href=wp.returnUrl;
				},
				error: function(e) {
					alert("ERROR ");
				}
			});
			
//			$popup.find(".agenda_ex_list").each(function(idx, exItem) {
//				console.log("ex agenda " + $(exItem).data("agd-code"));
//			});
		});
		
//		$popup.find(".btn_clase_4001").on("click",function(e){
//			console.log("close");
//		});
	};
	
	return wp;
}();

/************ 참석일 선택 > 위원 수정  팝업 Function ************/
var MemberModify = function(){
	var wp = {};
	
	var $popup = null;
	var popupUrl = "/expert/popup/member/modify.do";
	
	wp.committeeIdx = null;
	wp.committeeTechId = null;
	wp.isDatePick = null;
	wp.returnUrl = null;
	
	/** 팝업 종료 */
	wp.close = function(){
		comn.popupClose();
	};
	
	/** 화면에서 시작하는 경우 */
	wp.open = function(exIdx, techId, isDatePick, returnUrl){
		wp.committeeIdx = exIdx;
		wp.committeeTechId = techId;
		wp.isDatePick = isDatePick;
		wp.returnUrl = returnUrl;
		comn.popupOpen(popupUrl+"?committeeIdx="+wp.committeeIdx+"&techId="+wp.committeeTechId, createEvent);
	};
	
	
	/** 팝업 기능 생성 */
	var createEvent = function(popupElement){
		$popup = popupElement;
		
		/** 닫기 버튼 클릭 이벤트 */
		$popup.find("div.layer_popup_btn a.btn_close").off().on("click",function(){
			wp.close();
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
		
		/** 위원회 구성 > 위원 구성 > 위원 선택 */
        $(document).on("click",".MemberListBox .ComMemItem",function(event){
		    
			if($(this).hasClass("MemOn")){
				$(this).removeClass("MemOn");
				$(this).find(".MemChk").text("미요청");
		    }else{
		    	$(this).addClass("MemOn");
		    	$(this).find(".MemChk").text("참석요청");
		    }
		});

		/** 저장 버튼 클릭 이벤트 */
        $popup.find("a.btn_save_4002").off().on("click",function(e){
			var checkList = [];
			var noCheckList = [];
        	$popup.find("div.MemberListBox ul.ComMemList").each(function(idx, ul) {
        		$(ul).find("li.ComMemItem").each(function(lIdx, li){
        			if ($(li).hasClass("MemOn")) {
        				checkList.push($(li).data("id"));
        			} else {
        				noCheckList.push($(li).data("id"));
        			}
        		});
        	});
            
			// 위원회 위원 구성 저장
			$.ajax({
				anyne:true,
				type:'POST',
				data: JSON.stringify({committeeIdx: wp.committeeIdx, committeeTechId: wp.committeeTechId, checkList: checkList, noCheckList: noCheckList}),
	        	url: "/expert/proc/member/modify",
				dataType: "json",
				contentType: 'application/json;charset=UTF-8',
				success : function(data) {
					alert("전문위원회 위원 구성이 완료되었습니다.");
					location.href=wp.returnUrl;
				},
				error: function(e) {
					alert("ERROR ");
				}
			});
        });
        
	};
	
	return wp;
}();

/************ 참석일 선택 > 개최예정일 수정 팝업 Function ************/
var DateModify = function(){
	var wp = {};
	
	var $popup = null;
	var popupUrl = "/expert/popup/date/modify.do";
	
	wp.committeeIdx = null;
	wp.isDatePick = null;
	wp.returnUrl = null;
	
	wp.committeeInfo = {};
	
	/** 팝업 종료 */
	wp.close = function(){
		comn.popupClose();
	};
	
	/** 화면에서 시작하는 경우 */
	wp.open = function(exIdx, isDatePick, returnUrl){
		wp.committeeIdx = exIdx;
		wp.isDatePick = isDatePick;
		wp.returnUrl = returnUrl
		comn.popupOpen(popupUrl+"?committeeIdx="+wp.committeeIdx+"&datepick="+wp.isDatePick, createEvent);
	};
	
	wp.initCommitteeInfo = function() {
		wp.committeeInfo = {
			committeeIdx: null,
			committeeType: null,
			committeeDatePickS: null,
			committeeDatePickE: null,
			committeeDatePick1: null,
			committeeDateAdd1: null,
			committeeDatePick2: null,
			committeeDateAdd2: null,
			committeeDatePick3: null,
			committeeDateAdd3: null,
			committeeModiS: null,
			committeeModiE: null
		};
	}
	
	
	/** 팝업 기능 생성 */
	var createEvent = function(popupElement){
		wp.initCommitteeInfo();
		$popup = popupElement;

     	if(wp.isDatePick=="Y"){
     		$popup.find(".DatePickBox #PickCom").text("참석여부 조사기간");
     		$popup.find(".ComSetupBox .DatePickBox1").css("display","block");
     	}else{
     		$popup.find(".DatePickBox #PickCom").text("자료 열람 기간");
     		$popup.find(".ComSetupBox .DatePickBox1").css("display","none");
     	}
		
		/** 닫기 버튼 클릭 이벤트 */
		$popup.find("div.layer_popup_btn a.btn_close").off().on("click",function(){
			wp.close();
		});
		
		
		$(document).on('mouseup',function(e){
		   	//var LayerCNT = $popup.find("#LayerCNT").val();
		    //if(LayerCNT=="1"){
		    	$popup.find(".AutoH01").css("display","none");
		    //}
		});
		
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
        
		/** 저장 버튼 클릭 이벤트 */
		$popup.find("div.layer_popup_btn a.btn_save_4002").off().on("click",function(){
			wp.initCommitteeInfo();
			wp.committeeInfo.committeeIdx = wp.committeeIdx;
			$popup.find("ul.ComTypeList li").each(function(idx, li){
				if ($(li).hasClass("TypeOn")) {
					wp.committeeInfo.committeeType = $(li).find("a.ComTypeItem").data("type-code");
				}
			});
			switch (wp.committeeInfo.committeeType) {
			case "A":
				// 대면
				wp.committeeInfo.committeeDatePickS = $popup.find("#str_date").val().replace(/-/gi, "") + $popup.find("#str_dateH").val().replace(/-/gi, "") + $popup.find("#str_dateM").val().replace(/-/gi, "") + "00";
				wp.committeeInfo.committeeDatePickE = $popup.find("#end_date").val().replace(/-/gi, "") + $popup.find("#end_dateH").val().replace(/-/gi, "") + $popup.find("#end_dateM").val().replace(/-/gi, "") + "00";
				wp.committeeInfo.committeeDatePick1 = $popup.find("#DateNom01").val().replace(/-/gi, "") + $popup.find("#nome_date1H").val().replace(/-/gi, "") + $popup.find("#nome_date1M").val().replace(/-/gi, "") + "00";
				wp.committeeInfo.committeeDateAdd1 =  $popup.find("#nomeDate1Add").val();
				wp.committeeInfo.committeeDatePick2 = $popup.find("#DateNom02").val().replace(/-/gi, "") + $popup.find("#nome_date2H").val().replace(/-/gi, "") + $popup.find("#nome_date2M").val().replace(/-/gi, "") + "00";
				wp.committeeInfo.committeeDateAdd2 =  $popup.find("#nomeDate2Add").val();
				wp.committeeInfo.committeeDatePick3 = $popup.find("#DateNom03").val().replace(/-/gi, "") + $popup.find("#nome_date3H").val().replace(/-/gi, "") + $popup.find("#nome_date3M").val().replace(/-/gi, "") + "00";
				wp.committeeInfo.committeeDateAdd3 =  $popup.find("#nomeDate3Add").val();
				break;
			case "B":
				// 서면
				wp.committeeInfo.committeeModiS = $popup.find("#str_date").val().replace(/-/gi, "") + $popup.find("#str_dateH").val().replace(/-/gi, "") + $popup.find("#str_dateM").val().replace(/-/gi, "") + "00";
				wp.committeeInfo.committeeModiE = $popup.find("#end_date").val().replace(/-/gi, "") + $popup.find("#end_dateH").val().replace(/-/gi, "") + $popup.find("#end_dateM").val().replace(/-/gi, "") + "00";
				break;
			}
            
			// 위원회 개최일 설정 저장
			$.ajax({
				anyne:true,
				type:'POST',
				data: JSON.stringify({committeeData: wp.committeeInfo}),
	        	url: "/expert/proc/commitdate/modify",
				dataType: "json",
				contentType: 'application/json;charset=UTF-8',
				success : function(data) {
					alert("전문위원회 개최 후보일 설정이 완료되었습니다.");
					location.href=wp.returnUrl;
				},
				error: function(e) {
					alert("ERROR ");
				}
			});
		});
	};
	
	return wp;
}();
/************ 참석일 선택 > 참석일 선택 팝업 Function ************/
var DateStat01 = function(){
	var wp = {};
	
	var $popup = null;
	var popupUrl = "/expert/popup/datepick01.do";
	
	wp.committeeIdx = null;
	
	/** 팝업 종료 */
	wp.close = function(){
		comn.popupClose();
	};
	
	/** 화면에서 시작하는 경우 */
	wp.open = function(exIdx){
		wp.committeeIdx = exIdx;
		comn.popupOpen(popupUrl+"?committeeIdx="+wp.committeeIdx, createEvent);
	};
	
	/** 팝업 재 호출 */
	wp.refresh = function(){
		comn.popupOpen(popupUrl+"?committeeIdx="+wp.committeeIdx, createEvent);
	};
	
	/** 팝업 기능 생성 */
	var createEvent = function(popupElement){
		$popup = popupElement;
		
		/** 닫기 버튼 클릭 이벤트 */
		$popup.find("div.layer_popup_btn a.btn_close").off().on("click",function(){
			wp.close();
		});
		
		/** 달력 생성 **/
		var $EtcDate = $('#EtcDate');
		$EtcDate.datepicker({
			language: 'en',
			autoClose: true,
			position : 'left bottom',
			todayButton: true,
			clearButton: true,
			todayButton: new Date(),
			minDate: new Date(),
			
		})
		
		/** 후보일 선택 */
		$popup.find(".DatePickSelList .DataPicjChk").off().on("click",function(){
			if($(this).parent().hasClass("ChkOn")){
				$(this).parent().removeClass("ChkOn");
				$(this).parent().find(".DatePicker").val("N");
			}else{
				$(this).parent().addClass("ChkOn");
				$(this).parent().find(".DatePicker").val("Y");
			}
		});
		
		
		/** 참석일 저장 */
		$popup.find("div.layer_popup_btn a.datepicksave1").off().on("click",function(){
			var admId = $("#admId").val();
			var DatePick01 = $("#DatePicker1").val();
			var DatePick02 = $("#DatePicker2").val();
			var DatePick03 = $("#DatePicker3").val();
			var DatePick04 = $("#DatePicker4").val();
			var EtcDate = $("#EtcDate").val();
			
			if(DatePick04=="Y"){
				if(EtcDate==""){
					alert("그외 참석 가능일을 선택해주세요.");
					return;
				}
			}
			// ajax DB 저장후 페이지 /expert/datepickList.do 리로드 
			$.ajax({
				anyne:true,
				type:'POST',
				data: JSON.stringify({
					admId: admId,
					committeeIdx: wp.committeeIdx,
					committeeDatePick1: DatePick01,
					committeeDatePick2: DatePick02,
					committeeDatePick3: DatePick03,
					committeeDatePick4: DatePick04,
					committeeDatePickEtc: EtcDate
				}),
	        	url: "/expert/proc/commit/member/save.do",
				dataType: "json",
				contentType: 'application/json;charset=UTF-8',
				success : function(data) {
					alert("저장되었습니다.");
					wp.refresh();
				},
				error: function(e) {
					alert("ERROR ");
				}
			});
		});
		
	}
    return wp;
}();

/************ 참석일 선택 > 참석일 현황 팝업 Function ************/
var DateStat02 = function(){
	var wp = {};
	
	var $popup = null;
	var popupUrl = "/expert/popup/datepick02.do";
	
	wp.committeeIdx = null;
	/** 팝업 종료 */
	wp.close = function(){
		comn.popupClose();
	};
	
	/** 화면에서 시작하는 경우 */
	wp.open = function(exIdx){
		wp.committeeIdx = exIdx
		comn.popupOpen(popupUrl+"?committeeIdx="+wp.committeeIdx, createEvent);
	};
	
	/** 팝업 새로고침 */
	wp.refresh = function(){
		comn.popupOpen(popupUrl+"?committeeIdx="+wp.committeeIdx, createEvent);
	};
	
	
	/** 팝업 기능 생성 */
	var createEvent = function(popupElement){
		$popup = popupElement;
		
		/** 닫기 버튼 클릭 이벤트 */
		$popup.find("div.layer_popup_btn a.btn_close").off().on("click",function(){
			wp.close();
		});
		
		/** 후보일 선택 */
		$popup.find(".DatePickMemList .DateRowChk").off().on("click",function(){
			if($(this).parent().hasClass("ChkOn")){
				$(this).parent().removeClass("ChkOn");
				$(this).parent().find(".DataPick00").val("N");
			}else{
				$(this).parent().addClass("ChkOn");
				$(this).parent().find(".DataPick00").val("Y");
			}
		});
		
		/** 후보일 선택 */
		$popup.find(".DatePickMemList .MemPickSave").off().on("click",function(){
			var DataPick01 = $(this).parent().parent().find(".DataPick01").val();
			var DataPick02 = $(this).parent().parent().find(".DataPick02").val();
			var DataPick03 = $(this).parent().parent().find(".DataPick03").val();
			var DataPick04 = $(this).parent().parent().find(".DataPick04").val();
			var DataPickMem = $(this).parent().parent().find(".DataPickMem").val();
			
			
			// ajax DB 저장후 페이지 /expert/datepickList.do 리로드 
			$.ajax({
				anyne:true,
				type:'POST',
				data: JSON.stringify({
					admId: DataPickMem,
					committeeIdx: wp.committeeIdx,
					committeeDatePick1: DataPick01,
					committeeDatePick2: DataPick02,
					committeeDatePick3: DataPick03,
					committeeDatePick4: DataPick04
				}),
	        	url: "/expert/proc/commit/member/save.do",
				dataType: "json",
				contentType: 'application/json;charset=UTF-8',
				success : function(data) {
					alert("저장되었습니다.");
					wp.refresh();
				},
				error: function(e) {
					alert("ERROR ");
				}
			});
		});
		
		
	}
    return wp;
}();

/************ 참석일 선택 > 개최일 화정 팝업 Function ************/
var DateStat03 = function(){
	var wp = {};
	
	var $popup = null;
	var popupUrl = "/expert/popup/datepick03.do";
	
	/** 팝업 종료 */
	wp.close = function(){
		comn.popupClose();
	};
	
	/** 화면에서 시작하는 경우 */
	wp.open = function(exIdx){
		wp.committeeIdx = exIdx;
		comn.popupOpen(popupUrl+"?committeeIdx="+wp.committeeIdx, createEvent);
	};
	
	/** 팝업 새로고침 */
	wp.refresh = function(){
		comn.popupOpen(popupUrl+"?committeeIdx="+wp.committeeIdx, createEvent);
	};
	
	
	/** 팝업 기능 생성 */
	var createEvent = function(popupElement){
		$popup = popupElement;
		
		/** 닫기 버튼 클릭 이벤트 */
		$popup.find("div.layer_popup_btn a.btn_close").off().on("click",function(){
			wp.close();
		});
		
		/**달력 생성 **/
		var $DataComStr = $('#DataComStr');
		$DataComEnd = $('#DataComEnd');
		
		$DataComStr.datepicker({
			language: 'en',
			autoClose: true,
			position : 'left bottom',
			todayButton: true,
			clearButton: true,
			todayButton: new Date(),
			minDate: new Date(),
			onSelect: function (fd, date) {
				$DataComEnd.data('datepicker')
				.update('minDate', date)
			}
		})
		$DataComEnd.datepicker({
			language: 'en',
			autoClose: true,
			position : 'left bottom',
			todayButton: true,
			clearButton: true,
			todayButton: new Date(),
			onSelect: function (fd, date) {
				$DataComStr.data('datepicker')
				.update('maxDate', date)
			}
		})
		
		
		/** 개최일 선택 */
		$popup.find(".DateEndList .DateEndItem").off().on("click",function(){
			var idx = $(this).parent().index() + 1;
			
			if(!$(this).parent().hasClass("ChkOn")){
				$(this).parent().parent().find("li").removeClass("ChkOn");
				$(this).parent().addClass("ChkOn");
			}
			$(this).parent().parent().parent().find(".DataComPick").val(idx);
		});
		
		/** 후보일 선택 */
		$popup.find(".DatePickMemList .DateRowChk").off().on("click",function(){
			if($(this).parent().hasClass("ChkOn")){
				$(this).parent().removeClass("ChkOn");
				$(this).parent().find(".DataPick00").val("N");
			}else{
				$(this).parent().addClass("ChkOn");
				$(this).parent().find(".DataPick00").val("Y");
			}
		});
		
		/** 후보일 선택 */
		$popup.find(".DatePickMemList .MemPickSave").off().on("click",function(){
			var DataPick01 = $(this).parent().parent().find(".DataPick01").val();
			var DataPick02 = $(this).parent().parent().find(".DataPick02").val();
			var DataPick03 = $(this).parent().parent().find(".DataPick03").val();
			var DataPick04 = $(this).parent().parent().find(".DataPick04").val();
			var DataPickMem = $(this).parent().parent().find(".DataPickMem").val();
			
						
			// ajax DB 저장후 페이지 /expert/datepickList.do 리로드 
			$.ajax({
				anyne:true,
				type:'POST',
				data: JSON.stringify({
					admId: DataPickMem,
					committeeIdx: wp.committeeIdx,
					committeeDatePick1: DataPick01,
					committeeDatePick2: DataPick02,
					committeeDatePick3: DataPick03,
					committeeDatePick4: DataPick04
				}),
	        	url: "/expert/proc/commit/member/save.do",
				dataType: "json",
				contentType: 'application/json;charset=UTF-8',
				success : function(data) {
					alert("저장되었습니다.");
					wp.refresh();
				},
				error: function(e) {
					alert("ERROR ");
				}
			});

			
		});
		
		/** 개최일 확정 버튼 클릭 이벤트 */
		$popup.find("div.layer_popup_btn a.datepicksave2").off().on("click",function(){
			var DataComPick = $("#DataComPick").val();
			var DataComStr = $("#DataComStr").val();
			var DataComEnd = $("#DataComEnd").val();
			
			if(DataComPick==""){
				alert("개최확정일을 후보중 선택해주세요.");
				return;
			}else if(DataComStr==""){
				alert("열람 가능 시작일을 선택해주세요.");
				return;
			}else if(DataComEnd==""){
				alert("열람 가능 종료일을 선택해주세요.");
				return;
			}
			var DateComStr14 = DataComStr.replace(/-/gi, "")+"000000";
			var DataComEnd14 = DataComEnd.replace(/-/gi, "")+"235959";
			// ajax DB 저장후 페이지 /expert/datepickList.do 리로드 
			$.ajax({
				anyne:true,
				type:'POST',
				data: JSON.stringify({
					committeeIdx: wp.committeeIdx,
					committeeDatePick: DataComPick,
					committeeModiS: DateComStr14,
					committeeModiE: DataComEnd14
				}),
	        	url: "/expert/proc/commit/info/confirm.do",
				dataType: "json",
				contentType: 'application/json;charset=UTF-8',
				success : function(data) {
					alert("개최일이 확정되었습니다.");
					location.href="/expert/datepickList.do";
				},
				error: function(e) {
					alert("ERROR ");
				}
			});
		});
		
		
	}
    return wp;
}();
/************ 참석일 선택 > SMS 발송  팝업 Function ************/
var SendSms = function(){
	var wp = {};
	
	var $popup = null;
	var popupUrl = "/expert/popup/sms/send.do";
	
	wp.committeeIdx = null;
	
	/** 팝업 종료 */
	wp.close = function(){
		comn.popupClose();
	};
	
	/** 화면에서 시작하는 경우 */
	wp.open = function(exIdx){
		wp.committeeIdx = exIdx;
		comn.popupOpen(popupUrl + "?committeeIdx="+exIdx, createEvent);
	};
	
	
	/** 팝업 기능 생성 */
	var createEvent = function(popupElement){
		$popup = popupElement;
		
		/** 닫기 버튼 클릭 이벤트 */
		$popup.find("div.layer_popup_btn a.btn_next").off().on("click",function(){
			wp.close();
		});
		
		$(document).on('mouseup',function(e){
			//var LayerCNT = $popup.find("#LayerCNT").val();
			//if(LayerCNT=="1"){
			$popup.find(".AutoH01").css("display","none");
			//}
		});
		
		/** 메세지 입력 바이트 체크 */ 
		$popup.find("#SmsText").off().on("keyup", function(){
			console.log("입력");
			var str = $(this).val();	
			var byteNum = 0;
			for(var i = 0; i < str.length; i++) {
				byteNum += (str.charCodeAt(i) > 127) ? 2 : 1;
			}
			if(byteNum<90){
				$(this).parent().find(".insert_length").text(byteNum);
				$(this).parent().find(".limit_length").text("90");
				$(this).parent().find(".SmsTitle").val("");
				$(this).parent().find(".SmsTitle").attr("disabled",true);
				$popup.find(".Messege_box #send_mode").val("S");
			}else if(byteNum >= 2000){
				alert("문자는 최대 2000Byte 가지 작성 가능 합니다.");
				$(this).parent().find(".insert_length").text(byteNum);
				return;
				
			}else{
				$(this).parent().find(".insert_length").text(byteNum);
				$(this).parent().find(".limit_length").text("2000");
				$(this).parent().find(".SmsTitle").attr("disabled",false);
				$popup.find(".Messege_box #send_mode").val("L");
			}
		});
		
		/** 받는 사람 체크 박스 전체 선택  **/
		$popup.find(".to_list_box .to_chk_all").click(function() {
			if($(this).hasClass("chk_all_on")){
				$popup.find(".to_list_box .to_chk_all").removeClass("chk_all_on");
				$popup.find(".to_list_box .to_list li").removeClass("chk_on");
			}else{
				
				$popup.find(".to_list_box .to_chk_all").addClass("chk_all_on");
				$popup.find(".to_list_box .to_list li").addClass("chk_on");
			}	
	    });
	    
	    /** 받는 사람 체크 박스 선택  **/
	    $(document).on("click",".to_list_box .to_chk",function(event){
            console.log("체크");
			if($(this).parent().hasClass("chk_on")){
				$(this).parent().removeClass("chk_on");
			}else{
				$(this).parent().addClass("chk_on");
			}
			var to_list_length = $(this).parent().parent().find(".to_item").length;
			var to_chk_length = $(this).parent().parent().find(".chk_on").length;
			console.log(to_chk_length+"/"+to_list_length);
			if(to_chk_length==to_list_length){
				$popup.find(".to_list_box .to_chk_all").addClass("chk_all_on");
			}else{
				$popup.find(".to_list_box .to_chk_all").removeClass("chk_all_on");
			}	
        });
	    
		
	    
	    /** 받는사람 선택 삭제 **/
		$popup.find(".to_list_wrap_info .to_del_btn").click(function() {
			$popup.find(".to_list_box .to_chk_all").removeClass("chk_all_on");
			$popup.find(".to_list_box .chk_on").remove();
			var to_list_length = $popup.find(".to_scroll .to_item").length;
			$popup.find(".to_list_wrap_info .count").text(to_list_length);
			$popup.find(".send_mem_warp").css("display","none");
			$popup.find(".commit_meem_list .mem_list li").removeClass("chk_on");
			$popup.find(".commit_meem_list .mem_list li").removeClass("hid_on");
			
	    });
	    
	    /** 주소록 열기 **/
		$popup.find(".to_list_wrap_info .open_mem_warp").click(function() {
			var to_m_idx = $popup.find(".to_scroll .to_item ").length;
			for(i=0;i<to_m_idx;i++){
				var chk_num = $popup.find(".to_scroll .to_list li:eq("+i+")").data("phone");
				var chk_phone = "P"+chk_num;
				console.log(chk_phone);
				$popup.find(".commit_meem_list .mem_list ."+chk_phone).addClass("hid_on");
			}
			$popup.find(".send_mem_warp").css("display","block"); 
	    });
	    
	     /** 주소록 리스트 선택 클릭  **/
		$popup.find(".commit_meem_list .mem_list li").click(function() {
			
			if($(this).hasClass("hid_on")){
				alert("이미 받는 사람에 추가된 휴대폰 번호 입니다");
			}else if(!$(this).hasClass("chk_on")){
				$(this).addClass("chk_on");
			}else{
				$(this).removeClass("chk_on");
			}
		});
	    
	    
	    /** 주소록 추가 **/
	    $popup.find(".send_mem_warp .add_mem").click(function() {
			var to_m_idx = $popup.find(".commit_meem_list .chk_on").length;
			
			if(to_m_idx=="0"){
				alert("추가할 구성원을 선택해주세요.");
			}else{
				for(i=0;i<to_m_idx;i++){
					var name = $popup.find(".commit_meem_list .mem_list .chk_on:eq("+i+")").find(".name").text();
					var phone = $popup.find(".commit_meem_list .mem_list .chk_on:eq("+i+")").data("phone");
					var com = $popup.find(".commit_meem_list .mem_list .chk_on:eq("+i+")").find(".com").text();
					var view_phone = phone.substr(0, 3)+"-"+phone.substr(3, 4)+"-"+phone.substr(7, 4);
					var chk_phone = "P"+phone;
					
					var to_item ="";
					to_item += "<li class='to_item "+chk_phone+"' data-phone='"+phone+"'>";
					to_item += "	<a href='#none' class='to_chk'></a>";
					to_item += "	<p class='name'>"+name+"</p>";
					to_item += "	<p class='phone'>"+view_phone+"</p>";
					to_item += "	<p class='com'>"+com+"</p>";
					to_item += "</li>";
					$popup.find(".to_list_box .to_list").append(to_item);
					
					console.log(name+"/"+phone+"/"+com);
					
				}
			}
			$popup.find(".send_mem_warp").css("display","none");
			$popup.find(".commit_meem_list .mem_list li").removeClass("chk_on");
			$popup.find(".commit_meem_list .mem_list li").removeClass("hid_on");
			var to_list_length = $popup.find(".to_scroll .to_item").length;
			$popup.find(".to_list_wrap_info .count").text(to_list_length);
		});
		
		
	    /** 주소록 닫기 **/
	    $popup.find(".send_mem_warp .clase_mem").click(function() {
	    	
			$popup.find(".send_mem_warp").css("display","none");
			$popup.find(".commit_meem_list .mem_list li").removeClass("hid_on");
			$popup.find(".commit_meem_list .mem_list li").removeClass("chk_on");
		});
	    
	    
	    
	    /** 받는사람 추가 **/
		$popup.find(".to_list_wrap_btn .to_insert_btn").click(function() {
			var name = $popup.find(".to_insert_box .name").val();
			var phone = $popup.find(".to_insert_box .phone").val();
			var com = $popup.find(".to_insert_box .com").val();
			
			let regExp_tel = /^01\d-?\d{3,4}-?\d{4}$/;
			   
		    if(phone==""){
				alert("휴대폰 번호는 필수 입력 입니다.");
				return;
			}else if(!regExp_tel.test(phone)){
				alert('잘못된 형식의 휴대전화번호입니다.');
	            $popup.find(".to_insert_box .phone").val("");
	            return;
			}else{
				var chk_phone = "P"+phone;
				//console.log(chk_phone);
				var view_phone = phone.substr(0, 3)+"-"+phone.substr(3, 4)+"-"+phone.substr(7, 4);
				var mem_length = $popup.find(".to_list_box .to_list ."+chk_phone).length;
				console.log(mem_length);
				if(mem_length!="0"){
					alert("이미 등록된 휴대폰 번호 입니다.");
					//$popup.find(".to_insert_box .phone").val("");
				}else{
					if(name == ""){
						name = "-";
					}
					if(com == ""){
						com = "-";
					}
					var to_item ="";
					to_item += "<li class='to_item "+chk_phone+"' data-phone='"+phone+"'>";
					to_item += "	<a href='#none' class='to_chk'></a>";
					to_item += "	<p class='name'>"+name+"</p>";
					to_item += "	<p class='phone'>"+view_phone+"</p>";
					to_item += "	<p class='com'>"+com+"</p>";
					to_item += "</li>";
					$popup.find(".to_list_box .to_list").append(to_item);
					$popup.find(".to_insert_box .name").val("");
					$popup.find(".to_insert_box .phone").val("");
					$popup.find(".to_insert_box .com").val("");
					var to_list_length = $popup.find(".to_scroll .to_item").length;
					$popup.find(".to_list_wrap_info .count").text(to_list_length);
				}
				
			}
	    });
	    
	    /** 발송 타입 설정 **/
		$popup.find(".send_type .send_type_item").click(function() {
			if(!$(this).parent().hasClass("on")){
				var type = $(this).parent().index();
				console.log(type);
				if(type=="0"){
					$(this).parent().parent().find("li").removeClass("on");
					$(this).parent().addClass("on");
					$(this).parent().parent().parent().find(".send_reserve_box").css("display","none");
					$(this).parent().parent().parent().find("#send_flag").val("N");
				}else{
					$(this).parent().parent().parent().find(".send_reserve_box").css("display","inline-block");
					$(this).parent().parent().find("li").removeClass("on");
					$(this).parent().addClass("on");
					$(this).parent().parent().parent().find("#send_flag").val("R");
				}
			}
		});
		var $DateNom01 = $('#DateNom01');
		$DateNom01.datepicker({
			language: 'en',
			autoClose: true,
			position : 'left bottom',
			todayButton: true,
			clearButton: true,
			todayButton: new Date(),
			minDate: new Date(),
			
		})
		
		/** 발송예약 > 시간 인풋 포커스 */
		$(document).on("click",".DateForm .DateH",function(event){
			$popup.find(".AutoH01").css("display","none");
			$(this).parent().find(".HourPick").css("display","block");
		});
		
		/**  발송예약 > > 시간 레이어 선택*/
		$(document).on("click",".HourPick .HourPickItem",function(event){
			var selhour = $(this).data("selhour");
			$(this).parent().parent().parent().parent().find(".DateH").text(selhour);
			$(this).parent().parent().parent().parent().find(".DateHD").val(selhour);
			$(this).parent().parent().parent().css("display","none");
		});
		
		/**  발송예약 > 분 인풋 포커스 */
		$(document).on("click",".DateForm .DateM",function(event){
			$popup.find(".AutoH01").css("display","none");
			$(this).parent().find(".MinPick").css("display","block");
		});		
		
		/**  발송예약 >  분 레이어 선택*/
		$(document).on("click",".MinPick .MinPickItem",function(event){
			var selmin = $(this).data("selmin");
			$(this).parent().parent().parent().parent().find(".DateM").text(selmin);
			$(this).parent().parent().parent().parent().find(".DateMD").val(selmin);
			$(this).parent().parent().parent().css("display","none");
		});
	    
	    
	     /** 팝업 닫기 */
		$popup.find("div.layer_popup_btn a.btn_send_0001").off().on("click",function(){
			var send_length = $popup.find(".to_list_wrap_info .count").text(); // 받는 사람 수 
			var send_flag = $popup.find(".send_type #send_flag").val(); // 발송 설정  / N : 즉시 발송 , R:예약 발송
			var send_mode = $popup.find(".Messege_box #send_mode").val(); // 발송 타입  / S : SMS , L: LMS
			var seed_mes = $popup.find(".Messege_box #SmsText").val(); // 발송 메세지
			
			var smsList = [];
			if(send_length=="0"){
				alert("받는 사람을 설정해주세요.");
				return;
			}
			if(seed_mes==""){
				alert("발송 메세지를 입력해주세요.");
				return;
			}
			
//			console.log(send_length+"/"+send_flag+"/"+send_mode);
//			console.log(seed_mes);
			var lms_tit = null;
			if(send_mode=="L"){
				lms_tit = $popup.find(".Messege_box #SmsTitle").val(); // LMS 제목
//				console.log(lms_tit);
				var amass = "LMS";
			}else{
				var amass = "SMS";
			}
			var sendDate = null;
			if(send_flag=="R"){
				var send_date = $popup.find(".send_reserve_box #DateNom01").val();
				var send_hour = $popup.find(".send_reserve_box #nome_date1H").val();
				var send_min = $popup.find(".send_reserve_box #nome_date1M").val();
//				console.log(send_date+"//"+send_hour+"//"+send_min);
				sendDate = send_date.replace(/-/gi, "") + send_hour + send_min + "00";
			}
			var smsInfo = {
					'committeeIdx' : wp.committeeIdx,	
					'smsHisMode' : send_mode,
					'smsHisType' : send_flag,
					'smsHisTit' : lms_tit,
					'smsHisMsg' : seed_mes,
					'smsHisRdate' : sendDate
			};
			for(i=0;i<send_length;i++){
				var name = $popup.find(".to_scroll .to_list li:eq("+i+")").find(".name").text();
				var phone = $popup.find(".to_scroll .to_list li:eq("+i+")").data("phone"); 
				var com = $popup.find(".to_scroll .to_list li:eq("+i+")").find(".com").text();
//				console.log(name+"//"+phone+"//"+com);
				smsList.push({
					'smsHisName' : name,
					'smsHisCom' : com,
					'smsHisPhone' : phone
				});
			}
			
			// 발송처리 후 팝업 닫기 실행
			// if(send_flag=="R"){
			//		alert(amass+"발송예약이 완료 되있습니다.");
			//      팝업닫기
			// }else{
			//		alert(amass+"발송이 완료 되었습닏다.");
			//      팝업닫기
			// }
		
			// /receipt/save 참조
			$.ajax({
				type : "POST", 
				url : "/expert/proc/send/sms.do", 
				data: JSON.stringify({
					smsInfo: smsInfo,
					smsList: smsList
				}),
				dataType: "json",
				contentType: 'application/json;charset=UTF-8',
			 	success : function(data) { 
					// data 정보
					// resultCode: S(성공), F(실패)
					switch(data.resultCode){
						case "S":
							// 팝업 재 호출
							switch (smsInfo.smsHisType) {
							case "R":
								// 예약 발송일 경우
								alert("예약 발송이 완료되었습니다.");
								wp.close();
								break;
							case "N":
								// 즉시 발송일 경우
								alert("발송이 완료되었습니다.");
								wp.close();
								break;
							}
							break;
						case "F":
							alert("[" + data.resultData.status + "] " + data.resultData.message);
							break;
					}
				},
			 	error : function() { 
			 		console.log("통신장애"); 
			 	} 
			});
		});
		
	    
		 /** 팝업 닫기 */
		$popup.find("div.layer_popup_btn a.btn_close").off().on("click",function(){
			wp.close();
		});
		
//		$.ajax({
//			type : "POST", 
//			url : "/expert/proc/send/sms.do", 
//		 	data : {"metaCode": null}, 
//		 	dataType : "json",
//		 	success : function(data) { 
//				// data 정보
//				// resultCode: S(성공), F(실패)
//				switch(data.resultCode){
//					case "S":
//						// 팝업 재 호출
////						console.log("[성공] 파일 첨부 실패로 인한 메타 데이터 삭제");
//						console.log(data.resultData);
//						$popup.find(".content_01").text("발송 결과: " + data.resultData);
//						break;
//					case "F":
//						console.log(data.resultData);
//						break;
//				}
//			},
//		 	error : function() { 
//		 		console.log("통신장애"); 
//		 	} 
//		});
	}
    return wp;
}();
/************ 참석일 선택 > 이메일 발송  팝업 Function ************/
var SendEmail = function(){
	var wp = {};
	
	var $popup = null;
	var popupUrl = "/expert/popup/email/send.do";
	
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
			wp.close();
		});
		
		/** 테스트 이메일 발송 */
		$popup.find(".btn.send_test_email").off().on("click",function(){
			var senderName = "국가핵심기술 종합관리시스템TB"; // 이메일 발신자 이름
			var emailList = []; // 이메일 수신자 리스트
			
			var emailSubject = $("#email-subject").val();
			var emailBody = $("#email-body").val();
			$popup.find("input[name=email-receiver]").each(function(idx, receiver){
				console.log($(receiver).val());
				if ($(receiver).val() == "" || $(receiver).val() == null) {
					return;
				}
				emailList.push({
					emailHisEmail: $(receiver).val()
				});
			});
			
			if (emailList.length === 0) {
				alert("이메일 수신자를 입력하세요.");
				return;
			}
			
			if (emailSubject == null || emailSubject == "") {
				alert("이메일 제목을 입력하세요.");
				return;
			}
			
			if (emailBody == null || emailBody == "") {
				alert("이메일 내용을 입력하세요.");
				return;
			}
			
			$.ajax({
				type : "POST", 
				url : "/expert/proc/send/email.do", 
				data: JSON.stringify({
					emailInfo: {
						emailHisSenderName: senderName,
						emailHisSubject: emailSubject, // 이메일 제목
						emailHisBody: emailBody, // 이메일 내용
					},
					emailList: emailList
				}),
				dataType: "json",
				contentType: 'application/json;charset=UTF-8',
			 	success : function(data) { 
					// data 정보
					// resultCode: S(성공), F(실패)
					switch(data.resultCode){
						case "S":
							alert("테스트 Email 발송 결과 : "+data.resultData.message
									+ "\n제목: "+emailSubject
									+ "\n내용: "+emailBody
									+ "\n수신이메일: "+emailList.length+"건"
									);
							wp.close();
							break;
						case "F":
							alert("[" + data.resultData.status + "] " + data.resultData.message);
							break;
					}
				},
			 	error : function() { 
			 		console.log("통신장애"); 
			 	} 
			});
		});
		
		 
	}
    return wp;
}();
