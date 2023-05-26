/**
 * [전문위원회] 안건현황 팝업 스크립트
 * - 작성일: 2022-02-08
 * 
 * - 다른 스크립트 변수 사용
 * 1. [common.js] comn
 * 2. [uploadForm.js] fileArr
 */
	
/********** 안건 상세 팝업 Function **********/
var AgendaViewPopup = function(){
	var vp = {};
	
	var $popup = null;
	var popupUrl = '';
	
	var agendaCode = '';
	
	vp.close = function(){
		comn.popupClose();
	};
	
	vp.open = function(agdCode){
		if(!agdCode){
			console.log("잘못된 접근입니다.");
			return;
		}
		agendaCode = agdCode;
		popupUrl = '/expert/popup/agenda/detail.do?agdCode='+agendaCode;
		comn.popupOpen(popupUrl, createEvent);
	};
	
	var createEvent = function(popupElement){
		$popup = popupElement;
		
		
		
		
		/** 닫기 버튼 클릭 이벤트 */
		$popup.find("div.layer_popup_btn a.btn_close").off().on("click",function(){
			vp.close();
		});
		// Event 생성
	};
	
	return vp;
}();

/********** 검토 결과 확정 Function **********/
var AgendaComPopup = function(){
	var vp = {};
	
	var $popup = null;
	var popupUrl = '';
	
	var agendaCode = '';
	
	vp.close = function(){
		comn.popupClose();
	};
	
	vp.open = function(agdCode){
		if(!agdCode){
			console.log("잘못된 접근입니다.");
			return;
		}
		agendaCode = agdCode;
		popupUrl = '/expert/popup/agenda/completed.do?agdCode='+agendaCode;
		comn.popupOpen(popupUrl, createEvent);
	};
	
	var createEvent = function(popupElement){
		$popup = popupElement;
		
		var $standate = $('#standate');
	
		$standate.datepicker({
			language: 'en',
			autoClose: true,
			position : 'left top',
			todayButton: true,
			clearButton: true,
			todayButton: new Date(),
		});
		
		// 검토 결과 선택 
		$popup.find(".AgdSummeryList .AgdSummeryItem").off().on("click",function(){
			var Type = $(this).parent().parent().find(".TypeCode").val();
			var Idx = $(this).index();
			if(!$(this).hasClass("on")){
				$(this).parent().find("li").removeClass("on");
				$(this).addClass("on");
				if(Type=="01"){
					if(Idx=="00"||Idx=="02"){
						$popup.find(".ComAgdSend .TechAreaSelBox").css("display","block");
					}else{
						$popup.find(".ComAgdSend .TechAreaSelBox").css("display","none");
					}
				}else{
					if(Idx=="00"||Idx=="02"||Idx=="03"){
						$popup.find(".ComAgdSend .TechAreaSelBox").css("display","block");
					}else{
						$popup.find(".ComAgdSend .TechAreaSelBox").css("display","none");
					}
				}
			}
		});
		
		/** 검토 결과 확정 버튼  */
		$popup.find("div.layer_popup_btn a.btn_agdcomplited").off().on("click",function(){
			var agdCode = $(this).data("agd-code");
			var chkExit = confirm('해당 안건의 검토 결과를 최종 확정하시겠습니까? ');
			if(chkExit){
				//해당 안건  상태  IC > CS로 변경 후 리스트 새로고침
				$.ajax({
						anyne:true,
						type:'POST',
						data: JSON.stringify({
							agdCode: agdCode,
							agdStatus: "CS"
						}),
			        	url: "/expert/proc/agenda/complete.do",
						dataType: "json",
						contentType: 'application/json;charset=UTF-8',
						success : function(data) {
							console.log(data);
							alert("검토 결과가 최종 확정 되었습니다.");	
							location.href = "/expert/agendaList.do";
						},
						error: function(e) {
							alert("ERROR ");
						}
					});
			}
		});
		
		
		/** 닫기 버튼 클릭 이벤트 */
		$popup.find("div.layer_popup_btn a.btn_close").off().on("click",function(){
			vp.close();
		});
		// Event 생성
	};
	
	return vp;
}();

/********** 검토 결과 확정 Function **********/
var AgendaComPopup02 = function(){
	var vp = {};
	
	var $popup = null;
	var popupUrl = '';
	
	var agendaCode = '';
	
	vp.close = function(){
		comn.popupClose();
	};
	
	vp.open = function(agdCode){
		if(!agdCode){
			console.log("잘못된 접근입니다.");
			return;
		}
		agendaCode = agdCode;
		popupUrl = '/expert/popup/agenda/completed02.do?agdCode='+agendaCode;
		comn.popupOpen(popupUrl, createEvent);
	};
	
	var createEvent = function(popupElement){
		$popup = popupElement;
		
		var $standate = $('#standate');
	
		$standate.datepicker({
			language: 'en',
			autoClose: true,
			position : 'left top',
			todayButton: true,
			clearButton: true,
			todayButton: new Date(),
		});
		
		// 검토 결과 선택 
		$popup.find(".AgdSummeryList .AgdSummeryItem").off().on("click",function(){
			var Type = $(this).parent().parent().find(".TypeCode").val();
			var Idx = $(this).index();
			if(!$(this).hasClass("on")){
				$(this).parent().find("li").removeClass("on");
				$(this).addClass("on");
				if(Type=="01"){
					if(Idx=="00"||Idx=="02"){
						$popup.find(".ComAgdSend .TechAreaSelBox").css("display","block");
					}else{
						$popup.find(".ComAgdSend .TechAreaSelBox").css("display","none");
					}
				}else{
					if(Idx=="00"||Idx=="02"||Idx=="03"){
						$popup.find(".ComAgdSend .TechAreaSelBox").css("display","block");
					}else{
						$popup.find(".ComAgdSend .TechAreaSelBox").css("display","none");
					}
				}
			}
		});
		
		/** 검토 결과 확정 버튼  */
		$popup.find("div.layer_popup_btn a.btn_agdcomplited").off().on("click",function(){
			var agdCode = $(this).data("agd-code");
			var chkExit = confirm('해당 안건의 검토 결과를 최종 확정하시겠습니까? ');
			if(chkExit){
				//해당 안건  상태  IC > CS로 변경 후 리스트 새로고침
				$.ajax({
						anyne:true,
						type:'POST',
						data: JSON.stringify({
							agdCode: agdCode,
							agdStatus: "CS"
						}),
			        	url: "/expert/proc/agenda/complete.do",
						dataType: "json",
						contentType: 'application/json;charset=UTF-8',
						success : function(data) {
							console.log(data);
							alert("검토 결과가 최종 확정 되었습니다.");	
							location.href = "/expert/agendaList.do";
						},
						error: function(e) {
							alert("ERROR ");
						}
					});
			}
		});
		
		
		/** 닫기 버튼 클릭 이벤트 */
		$popup.find("div.layer_popup_btn a.btn_close").off().on("click",function(){
			vp.close();
		});
		// Event 생성
	};
	
	return vp;
}();

/********** 검토요청 팝업 Function **********/
var AgendaWritePopup = function(){
	var wp = {};
	
	var $popup = null;
	var popupUrl = '/expert/popup/agenda/write.do';
	
	var checkRcpts = []; // 체크된 접수번호 리스트(String[])
	var checkTechs = []; // 선택된 분야 리스트(String[])
	
	wp.open = function(rcpts){
		checkRcpts = rcpts;
		
		comn.popupOpen(popupUrl, createEvent);
	};
	
	/** 검토요청 팝업 종료 */
	wp.close = function(){
		// 종료 시 값 초기화
		checkRcpts = [];
		checkTechs = [];
		
		comn.popupClose();
	};
	
	
	/** 검토요청 팝업 시작 */
	var createEvent = function (popupElement){
		// 팝업 Element 저장
		$popup = popupElement;
		
		/** 팝업 - 닫기 버튼 클릭 이벤트 */
		$popup.find('div.layer_popup_btn a.btn_next').off().on('click',function(){
			wp.close();
		});
		
		/** 팝업 - 검토요청 버튼 클릭 이벤트 */
		$popup.find('div.layer_popup_btn a.btn_save').off().on('click',function(){
			// fileArr: uploadForm.js { fileArr }
			// 데이터 검증
			if(dataVerify()){
				// Formdata 생성
				var formData = new FormData();
				
				// 접수번호 추가
				$(checkRcpts).each(function(idx, rcpt){
					formData.append('receiptIdxList['+idx+']', rcpt);
				});
				
				// 분야 추가
				$(checkTechs).each(function(idx, tech){
					formData.append('techList['+idx+']', tech);
				});
				
				// 파일 추가
				$(fileArr).each(function(idx, file){
		            formData.append(`fileList[${idx}].file`, file);
		            formData.append(`fileList[${idx}].depth`, "E");
		            formData.append(`fileList[${idx}].type`, "2000");
		            formData.append(`fileList[${idx}].id`, idx + 1);
		        });
		        $.ajax({
		            type: "POST",
		        	url: "/expert/proc/agenda/save.do",
		            data: formData,
		            dataType: 'json',
		            processData: false,
		            contentType: false,
				 	success : function(data) { 
						// data 정보
						// resultCode: S(성공), F(실패)
						// resultData: receiptSaveCnt: 접수건수, agendaSaveCnt: 안건건수
						switch (data.resultCode){
							case 'S':
								alert("검토요청이 완료되었습니다.");
								location.href = '/expert/agendaList.do';
								break;
							case 'F':
								alert('검토요청 중 오류 발생');
								break;
						}
					},
		            error : function(){
		                alert("failed! ")
		            }
				});
			}
		});
		
		/** 팝업 - 검토분야 선택 이벤트 */
	    $popup.find('.layer_popup_body').off().on('click','.dept_list_01 li ',function(){
	        if($(this).hasClass('dept_on')){
	            $(this).removeClass('dept_on');
	        }else{
	            $(this).addClass('dept_on');
	        }
			
			setTechs();
	    });
	};
	
	/** 선택분야 저장 */
	var setTechs = function() {
		checkTechs = [];
		$popup.find('.layer_popup_body ul.dept_list_01 li').each(function(idx, item){
			if($(item).hasClass('dept_on')) {
				checkTechs.push($(item).data('tech-id'));
			}
		});
	};

	/** 검토요청 팝업 데이터 검증 */
	var dataVerify = function() {
		// 1. 분야 선택 여부 확인
		if (checkTechs.length == 0) {
			alert('분야를 선택하세요.');
			return false;
		}
		// 1. 첨부파일 유무 확인
		if (fileArr.length == 0) {
			alert('첨부파일을 선택하세요.');
			return false;
		}
		return true;
	};
	
	return wp;
}();