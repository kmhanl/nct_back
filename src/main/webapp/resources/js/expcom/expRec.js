/** [전문위원회] > 위원회 현황 리스트 **/
var recMetaData = {}; // 메타 데이터
var recTechList = []; // 기술 분야 및 명칭 리스트
var recCountryList = []; // 수출 대상국 리스트 
var recImMetaData = {}; //검색 등록 임시데이터 
var uploadfiles = []; // 전체 업로드 파일
var uploadfilesIm = [];
//var uploadfilesIm = []; //업로드 파일 타입 정보
$(document).ready(function(){  
	// 공통 인풋 숫자만 입력 
	var RegNotNum = /[^0-9]/g;
 	// ** 보유기술 입력 > 특허 등록 건수 숫자만 입력 가능 **/
 	$(document).on('keyup', '.nct_bro_item .no_only', function() {
 		this.value = this.value.replace(RegNotNum, '');
	});
	// 전문위원회 > 접수현황 > 신규 접수 등록  > 대상기업 설정여부 설정 add_copy
	$(".nct_body .section_utile_box a.com_type_item").on("click",function(){
		if(!$(this).parent().hasClass("chkOn")){
			var ctype = $(this).data("ctype");
			if(ctype=="C101"){
				var comInchk = $("#comInchk").val();
				if(comInchk != "Y"){
					//컨펌 알럿 	
				}
			}else if(ctype=="C102"){
			
			}else{
			
			}
			$(this).parent().parent().find("li").removeClass("chkOn");
			$(this).parent().addClass("chkOn");
			var comMode = $(this).data("cmode");
			$("#leftBlock").removeClass("mode_s");
			$("#leftBlock").removeClass("mode_n");
			$("#leftBlock").removeClass("mode_d");
			$("#leftBlock").addClass(comMode);
			$("#comType").val(ctype);
		}
	});
	
	// 전문위원회 > 접수현황 > 신규 접수 등록  > 대상 기업 검색 자동 완성
	$(".nct_body .company_search_box #schCompay").on("keyup", function(){
		var schKetword = $(this).val();
		var $box = $(".nct_body .company_search_box .search_hidden_wrap");
		if (schKetword.length == 0) {
			$box.removeClass("no_result");
			$box.removeClass("add_result");
			$box.addClass("no_sch");
		}else{
			$box.removeClass("no_sch");
			$.ajax({
	            type: "post",
	        	url: "/exp/proc/findCom.do",
			 	data : {"cpnNm": schKetword}, 
			 	dataType : "json",
			 	success : function(data) { 
					var liHtml = "";
					if(data.resultCode=="S"){
						if (data.resultList.length == 0) {
							$box.addClass("no_result");
							$box.removeClass("add_result");
						}else{
							$("#schResultList").empty();
							$box.removeClass("no_result");
							$box.addClass("add_result");
							for (var ent of data.resultList) {
								liHtml += "<li><a href='javascript:void(0);' class='company_preview_item' data-com-id='"+ent.cpnId+"'>";
								liHtml += "<p class='company'>"+ent.cpnNm+" ["+ent.cpnSNo+"] 대표:"+ent.cpnCeo+"</p>";
								liHtml += "<p class='company_pm'>담당자: "+ent.cpnPNm+" "+ent.cpnPDept+" "+ent.cpnPPosition+"</p>";
								liHtml += "<p class='company_book'>"+ent.cpnPPhone1+"-"+ent.cpnPPhone2+"-"+ent.cpnPPhone3+" | "+ent.cpnPMobile1+"-"+ent.cpnPMobile2+"-"+ent.cpnPMobile3+" | "+ent.cpnPEmail+"</p>";
								liHtml += "</a></li>";
							}
							$("#schResultList").html(liHtml);
						}
					}
				}
			});
		}
	});
	
	// 전문위원회 > 접수현황 > 신규 접수 등록  > 대상 기업 검색 결과 선택 
	$(document).on("click", ".company_search_box a.company_preview_item", function () {
		var comCode = $(this).data("com-id");
		$(".nct_body .company_search_box .company_search_inner").removeClass("keyup");
		$.ajax({
	        type: "post",
	    	url: "/exp/proc/findCom.do",
		 	data : {"comCode": comCode}, 
		 	dataType : "json",
		 	success : function(data) { 
				var liHtml = "";
				if(data.resultCode=="S"){
					var ren = data.resultList;
					recImMetaData = ren;
					$("#comInchk").val("Y");
					$("#schSelected .com_nm").html(ren.cpnNm);
					$("#schSelected .com_info").html("<span class='sub_label'>대표명 : </span>"+ren.cpnCeo+" <span class='sub_label'>사업자등록번호 : </span>"+ren.cpnSNo+" ");
					$("#schSelected .com_b_add").html("("+ren.cpnBZip+") "+ren.cpnBAdd1+" "+ren.cpnBAdd2+" ");
					$("#schSelected .com_b_phone").html("<span class='sub_label'>전화번호 : </span>"+ren.cpnBPhone1+"-"+ren.cpnBPhone2+"-"+ren.cpnBPhone3+" ");
					$("#schSelected .com_s_add").html("("+ren.cpnSZip+") "+ren.cpnSAdd1+" "+ren.cpnSAdd2+" ");
					$("#schSelected .com_s_phone").html("<span class='sub_label'>전화번호 : </span>"+ren.cpnSPhone1+"-"+ren.cpnSPhone2+"-"+ren.cpnSPhone3+" ");
					$("#schSelected .com_pm").html(ren.cpnPNm+" <span class='sub_label'>"+ren.cpnPDept+" "+ren.cpnPPosition+"</span>");
					$("#schSelected .compm_phone").html("<span class='sub_label'>연락처 : </span>"+ren.cpnPPhone1+"-"+ren.cpnPPhone2+"-"+ren.cpnPPhone3+ "<span class='sub_label'> | </span> "+ren.cpnPMobile1+"-"+ren.cpnPMobile2+"-"+ren.cpnPMobile3+ "<span class='sub_label'> | </span> "+ren.cpnPEmail+" ");
					$("#schSelectInfo").addClass("sch_elected");
					$("#schSelected").removeClass("sch_elected");
					$(".nct_body .company_search_box #schCompay").val("");
					$(".search_hidden_wrap").removeClass("add_result");
					$(".search_hidden_wrap").addClass("no_sch");
					$("#schResultList").empty();
				}
			}
		});
	});
	
	// 전문위원회 > 접수현황 > 신규 접수 등록  > 대상 기업 검색 포커스 인
	$(".nct_body .company_search_box #schCompay").on("focus", function(){
		$(this).parent().addClass("keyup");
	});
	$(document).on('mouseup',function(e){
		//$(".Schbox").removeClass("keyup");
	});
	// 전문위원회 > 접수현황 > 신규 접수 등록  > 대상 기업 검색 포커스 아웃
	$(".nct_body .company_search_box #schCompay").on("blur", function(){
		var schKetword = $(this).val();
		if (schKetword.length == 0) {
			if(!$(".search_hidden_wrap").hasClass("no_sch")){
				$(this).parent().removeClass("keyup");
			}
		}
	});
	
	// 전문위원회 > 접수현황 > 신규 접수 등록  > 본사 주소와 동일 처리 
	$(".nct_body a.add_copy").on("click",function(){
		if($(this).hasClass("tap_on")){
			$("#newComSaPost").val(""); 
			$("#newComSaAdd1").val(""); 
			$("#newComSaAdd2").val("");
			$("#newSaPhone1").val(""); 
			$("#newSaPhone2").val(""); 
			$("#newSaPhone3").val("");
			$(this).removeClass("tap_on"); 	
		}else{
			var newComBoPost = $("#newComBoPost").val(); 
			var newComBoAdd1 = $("#newComBoAdd1").val(); 
			var newComBoAdd2 = $("#newComBoAdd2").val();
			var newBoPhone1 = $("#newBoPhone1").val(); 
			var newBoPhone2 = $("#newBoPhone2").val(); 
			var newBoPhone3 = $("#newBoPhone3").val(); 
			$("#newComSaPost").val(newComBoPost); 
			$("#newComSaAdd1").val(newComBoAdd1); 
			$("#newComSaAdd2").val(newComBoAdd2);
			$("#newSaPhone1").val(newBoPhone1); 
			$("#newSaPhone2").val(newBoPhone2); 
			$("#newSaPhone3").val(newBoPhone3);
			$(this).addClass("tap_on");
		}
	});
	
	// 전문위원회 > 접수현황 > 신규 접수 등록  > 접수 분야 선택  처리 
	$(".nct_body .rec_type_sel_box a.meta_type_item").on("click",function(){
		var metaType = $(this).data("mtype");
		$("#metaType").val(metaType);
		goMetaFormSet(metaType);
		$(".nct_body .rec_type_sel_box").css("display","none");
	});
	
	// 전문위원회 > 접수현황 > 신규 접수 등록  > 기술 분야 및 명칭 등록  팝업 호출
	$(".nct_body .add_meta_tech").on("click",function(){
		techAddPopup.open();
	});
	
	// 전문위원회 > 접수현황 > 신규 접수 등록  > 기술 분야 및 명칭 삭제 
	$(".nct_body ul.meta_tech_list a.meta_tech_del ").on("click",function(){
		var idx = $(this).parent().parent().index();
		recAlertPopup.open('codeRecW021','closeAlert','goMetaTechDel','dual', idx);
	});
	
	// 전문위원회 > 접수현황 > 신규 접수 등록  > 기술 분야 및 명칭 순서 위로 
	$(".nct_body ul.meta_tech_list a.meta_tech_up ").on("click",function(){
		var metaTechCnt = $("#metaTechCnt").val();
		var idx = $(this).parent().parent().index();
		if(idx=="0"){
			recAlertPopup.open('codeRecW022','','closeAlert','one', '');
		}else{
			var $moveTech = $(this).parent().parent();
			$moveTech.prev().before($moveTech);
			setMetaTechNo()
		}
	});

	// 전문위원회 > 접수현황 > 신규 접수 등록  > 기술 분야 및 명칭 순서 아래로 
	$(".nct_body ul.meta_tech_list a.meta_tech_down").on("click",function(){
		var metaTechCnt = $("#metaTechCnt").val();
		var idx = $(this).parent().parent().index();
		++idx;
		if(idx==metaTechCnt){
			recAlertPopup.open('codeRecW023','','closeAlert','one', '');
		}else{
			var $moveTech = $(this).parent().parent();
			$moveTech.next().after($moveTech);
			setMetaTechNo()
		}
	});
	
	// 전문위원회 > 접수현황 > 신규 접수 등록  > 신고 사유 법률 선택 처리 
	$(".nct_body .meta_reason a.reasonflag").on("click",function(){
		if($(this).hasClass("tap_on")){
			$(this).removeClass("tap_on");
		}else{
			$(this).addClass("tap_on");
		}
	});
	
	// 전문위원회 > 접수현황 > 신규 접수 등록  > 수출 사유 선택
	$(".nct_body .reason_type_list a.reason_type_item").on("click",function(){
		if(!$(this).parent().hasClass("chkOn")){
			var reasonType = $(this).data("exrtype");
			$("#exReasonType").val(reasonType);
			$(this).parent().parent().find("li").removeClass("chkOn");
			$(this).parent().addClass("chkOn");
		}
	});

	// 전문위원회 > 접수현황 > 신규 접수 등록  > 수출 예정일 달력 세팅
	var $exDatePick = $('#exDatePick');
	$exDatePick.datepicker({
        language: 'en',
        autoClose: true,
    })
    
    // 전문위원회 > 접수현황 > 신규 접수 등록  > 대상국가  등록 팝업 호출
	$(".nct_body .add_ex_coutury").on("click",function(){
		ctyAddPopup.open();
	});
    
    // 전문위원회 > 접수현황 > 신규 접수 등록  > 대상국가 삭제 
	$(".nct_body ul.meta_cty_list a.meta_cty_del ").on("click",function(){
		var idx = $(this).parent().parent().index();
		recAlertPopup.open('codeRecW024','closeAlert','goMetaCtyDel','dual', idx);
	});
	
	// 전문위원회 > 접수현황 > 신규 접수 등록  > 대상국가  순서 위로 
	$(".nct_body ul.meta_cty_list a.meta_cty_up ").on("click",function(){
		var metaCtyCnt = $("#metaCtyCnt").val();
		var idx = $(this).parent().parent().index();
		if(idx=="0"){
			recAlertPopup.open('codeRecW025','','closeAlert','one', '');
		}else{
			var $moveCty = $(this).parent().parent();
			$moveCty.prev().before($moveCty);
			setMetaCtyNo()
		}
	});
	
	// 전문위원회 > 접수현황 > 신규 접수 등록  > 대상국가 순서 아래로 
	$(".nct_body ul.meta_cty_list a.meta_cty_down").on("click",function(){
		var metaCtyCnt = $("#metaCtyCnt").val();
		var idx = $(this).parent().parent().index();
		++idx;
		if(idx==metaCtyCnt){
			recAlertPopup.open('codeRecW026','','closeAlert','one', '');
		}else{
			var $moveCty = $(this).parent().parent();
			$moveCty.next().after($moveCty);
			setMetaCtyNo()
		}
	});
	
	// 전문위원회 > 접수현황 > 접수 신청서 상세  > 소관과 의견 첨부 권한 설정
	$(".nct_body .browser_block .nct_tech_list_box a.nct_tech_item").on("click",function(){
		if($(this).parent().hasClass("compe_on")){
			$(this).parent().removeClass("compe_on");
		}else{
			$(this).parent().addClass("compe_on");
		}
	});
	
	
});
/***************************************************/
/********** 기술 분야 및 명칭 추가 Layer Popup 생성    **********/
/***************************************************/
var techAddPopup = function(){
	var wp = {};
	
	var $popup = null;
	var popupUrl = '/expcom/popup/techAddPopup.do';
	
	wp.open = function(){
		comn.popupOpen(popupUrl, createEvent);
	};
	
	/** 검토요청 팝업 종료 */
	wp.close = function(){
		comn.popupClose();
	};
	
	/** 검토요청 팝업 시작 */
	var createEvent = function (popupElement){
		// 팝업 Element 저장
		$popup = popupElement;
		
		/** 기술 분야 선택  */
		$popup.find('div.rec_tech_add_popup a.nct_tech_item').off().on('click',function(){
			if(!$(this).hasClass("compe_on")){
				$(this).parent().parent().find("li").removeClass("compe_on");
				$(this).parent().addClass("compe_on");
				var type_code = $(this).parent().data("tid");
				$.ajax({
		            type: "post",
		        	url: "/exp/proc/findTechArea.do",
				 	data : {"techId": type_code}, 
				 	dataType : "json",
				 	success : function(data) { 
						// data 정보
						// resultCode: S(성공), F(실패)
						switch(data.resultCode){
							case "S":
								console.log(data.resultList);
								//wp.setTechItem(target, data.resultList);
								break;
							case "F":
				 				alert("Failed"); 
								break;
						}
					},
		            error : function(){
		                alert("failed! ")
		            }
				});
			}
		});
		
		/** 팝업 - 닫기 버튼 클릭 이벤트 */
		$popup.find('div.layer_popup_btn a.btn_next').off().on('click',function(){
			wp.close();
		});
		
	};
	return wp;
}();
/***************************************************/
/********** 수출 대상국 Layer Popup 생성                   **********/
/***************************************************/
var ctyAddPopup = function(){
	var wp = {};
	
	var $popup = null;
	var popupUrl = '/expcom/popup/ctyAddPopup.do';
	
	wp.open = function(){
		comn.popupOpen(popupUrl, createEvent);
	};
	
	/** 검토요청 팝업 종료 */
	wp.close = function(){
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
	};
	return wp;
}();
// 테스트
function otpUserSend(){
	var userId = "test01";
	var userName = "김연식";
	var email = "";
	var mobile = "01028040565";
	var comCode = "test";
	$.ajax({
        type: "post",
    	url: "/member/proc/otpUserSend.do",
	 	data : {"comCode": comCode}, 
	 	dataType : "json",
	 	success : function(data) { 
			console.log(data)
		}
	});
}

// 전문위원회 > 접수현황 > 신규 접수 등록  > 접수분야 변경 안내 처리
function goRecComReset(){
	$("#comType").val("");
	$(".nct_body .com_type_sel_box").css("display","flex");
	$("#Dimmed_Layer_Warpper").css("display","none");
	$("#Dimmed_Layer_Warpper").empty();
}

// 전문위원회 > 접수현황 > 신규 접수 등록  > 접수 분야 변경 처리 
function goRecFormReset(){
	$("#metaType").val("");
	//$("#metaForm").find(".meta_tech_list").empty();
	$("#metaForm").find(".base_input").val("");
	$("#metaForm").find(".textareaf").val("");
	recMetaData = {};
	recTechList = [];
	recCountryList = [];
	recPrint = [];
	recOfficial = [];
	nctBefore = [];
	nctAfter = [];
	goMetaFormSet();
	$(".nct_body .rec_type_sel_box").css("display","flex");
	$("#metaFormTitle").text("");
	$("#Dimmed_Layer_Warpper").css("display","none");
	$("#Dimmed_Layer_Warpper").empty();
}

// 전문위원회 > 접수현황 > 신규 접수 등록  > 접수분야 변경 안내 처리
function goMetaFormSet(formMode){
	if(!formMode){
		$("#metaForm").removeClass("parT0");
		$("#metaForm").removeClass("parT1");
		$("#metaForm").removeClass("parT2");
		$("#metaForm").removeClass("parT3");
		$("#metaForm").removeClass("parT4");
		$("#metaForm").removeClass("chi01");
		$("#metaForm").removeClass("chi02");
		$("#metaForm").removeClass("chi03");
	}else{
		var formPalent = formMode.substring(0,2);
		var formChild = formMode.substring(2,4);
		$("#metaForm").addClass("par"+formPalent);
		$("#metaForm").addClass("chi"+formChild);
	}
	switch(formMode){
	case "T101":
		$("#metaFormTitle").text("국가핵심기술 여부 판정");
		break;
	case "T201":
		$("#metaFormTitle").text("국가핵심기술 수출신고");
		break;
	case "T202":
		$("#metaFormTitle").text("국가핵심기술 수출승인");
		break;
	case "T203":
		$("#metaFormTitle").text("국가핵심기술 사전검토");
		break;
	case "T301":
		$("#metaFormTitle").text("국가핵심기술 해외인수·합병 신고");
		break;
	case "T302":
		$("#metaFormTitle").text("국가핵심기술 해외인수·합병 승인");
		break;
	case "T303":
		$("#metaFormTitle").text("국가핵심기술 해외인수·합병 사전검토");
		break;
	case "T401":
		$("#metaFormTitle").text("국가핵심기술 지정");
		break;
	case "T402":
		$("#metaFormTitle").text("국가핵심기술 변경");
		break;
	case "T403":
		$("#metaFormTitle").text("국가핵심기술 해제");
		break;
	case "T001":
		$("#metaFormTitle").text("기타 안건");
		break;
	}
	
}

// 기술 분야 및 명칭 순서 삭제 처리
function goMetaTechDel(idx){
	$(".nct_body ul.meta_tech_list li:eq("+idx+")").remove();
	var metaTechCnt = $("#metaTechCnt").val();
	metaTechCnt--;
	if(metaTechCnt=="0"){
		$(".meta_tech_box").removeClass("add_tech_result");
	}
	$("#metaTechCnt").val(metaTechCnt);
	$("#Dimmed_Layer_Warpper").css("display","none");
	$("#Dimmed_Layer_Warpper").empty();
	setMetaTechNo();
}

// 수출 대상국 삭제 처리
function goMetaCtyDel(idx){
	$(".nct_body ul.meta_cty_list li:eq("+idx+")").remove();
	var metaCtyCnt = $("#metaCtyCnt").val();
	metaCtyCnt--;
	if(metaCtyCnt=="0"){
		$(".ex_coutury").removeClass("add_meta_cty");
	}
	$("#metaCtyCnt").val(metaCtyCnt);
	$("#Dimmed_Layer_Warpper").css("display","none");
	$("#Dimmed_Layer_Warpper").empty();
	setMetaCtyNo();
}

// 기술 분야 및 명칭 순서 리넘버링
function setMetaTechNo(){
	var idx = $(".nct_body ul.meta_tech_list li").length;
	for(i=0;i<idx;i++){
		$(".nct_body ul.meta_tech_list li:eq("+i+")").find(".meta_tech_no").text(i+1);
	}
}
// 수출 대상국 리넘버링
function setMetaCtyNo(){
	var idx = $(".nct_body ul.meta_cty_list li").length;
	for(i=0;i<idx;i++){
		$(".nct_body ul.meta_cty_list li:eq("+i+")").find(".meta_cty_no").text(i+1);
	}
}

// 전문위원회 > 접수현황 > 신규 접수 등록  > 접수분야 변경 안내
function recFormReset(){
	recAlertPopup.open('codeRecW001','closeAlert','goRecFormReset','dual', '');
}

// 전문위원회 > 접수현황 > 신규 접수 등록  > 저장 버튼 클릭 > 데이터 체크 
function recSaveChk(){
	var comType = $("#comType").val();
	var metaType = $("#metaType").val();
	var recComDataChk = false;
	var recDataChk = true;
	switch(comType){
	case "C101":
		recComDataChk = setComT01(comType);
		break;
	case "C102":
		recComDataChk = setComT02(comType);
		break;
	case "C103":
		recComDataChk = setComT03(comType);
		break;
	}
	if(metaType==""){
		recAlertPopup.open('codeRecV019','','closeAlert','one');
		recDataChk = false; 
		return; 
	}
	var metaTechCnt = $("#metaTechCnt").val();
	if(metaTechCnt=="0"){
		recAlertPopup.open('codeRecV020','','closeAlert','one');
		recDataChk = false; 
		return; 
	}
	switch(metaType.substring(0,2)){
	case "T0":
		recDataChk = setRecT0(metaType);
		break;
	case "T1":
		recDataChk = setRecT1(metaType);
		break;
	case "T2":
		recDataChk = setRecT2(metaType);
		break;
	case "T3":
		recDataChk = setRecT3(metaType);
		break;
	case "T4":
		recDataChk = setRecT4(metaType);
		break;
	}
	if(metaType.substring(0,2)=="T2"||metaType.substring(0,2)=="T3"){
		var metaCtyCnt = $("#metaCtyCnt").val();
		if(metaCtyCnt=="0"){
			recAlertPopup.open('codeRecV036','','closeAlert','one');
			recDataChk = false; 
			return; 
		}
	}
	
	if(recComDataChk==true&&recDataChk==true){
		setTeckItem();
		if(metaType.substring(0,2)=="T2"||metaType.substring(0,2)=="T3"){
			setCtyItem();
		}
		//console.log("신청 접수 분야 : "+metaType);
		//console.log("기술분야");
		//console.debug(recTechList);
		//console.log("대상국 ");
		//console.debug(recCountryList);
		//console.log("메타정보");
		//console.debug(recMetaData);
		
		//console.log("파일 체크");
		var comCode = "loadNewCode";
		var recFileChk = setFileData();
		var strFile = 0;
		$.ajax({
	        type: "post",
	    	url: "/exp/proc/makeKey.do",
		 	data : {"comCode": comCode}, 
		 	dataType : "json",
		 	success : function(data) {
		 		// MetaCode 생성 후 첨부 파일이 있으면 파일 업로드 후 데이터 저장
		 		if(recFileChk!="0"){
		 			//console.log("파일 저장 후 데이터 저장");
		 			uploadFiles(data.metaCode, recFileChk, strFile);
		 		}else{
		 			//console.log("파일 저장 없음 데이터 저장");
		 			saveRecData(data.metaCode);
		 		} 
			}
		});
	}
}
// 개별 파일 업로드 및 프로그래스 적용 Roof
function uploadFiles(metaCode, recFileChk ,strFile){
	console.log(strFile);
	var formData = new FormData();
	formData.append("metaCode", metaCode);
	formData.append(`fileList[0].file`, uploadfiles[strFile]);
	formData.append(`fileList[0].type`, uploadfilesIm[strFile].type);
	formData.append(`fileList[0].sort`, uploadfilesIm[strFile].sort);
	formData.append(`fileList[0].id`, strFile + 1);
	console.log(uploadfiles[strFile]);
	$.ajax({
    	url: '/exp/proc/saveFileData.do',
    	data : formData,
    	type : 'post',
    	contentType : false,
    	processData: false,
    	xhr: function() {
	      	var xhr = $.ajaxSettings.xhr();
      		xhr.upload.onprogress = function(e) {
        	var percent = e.loaded  * 100 / e.total;
        	console.log("퍼센트:"+percent);
        	$(".upload_list li:eq("+strFile+")").find(".progress_data .percent").text(percent.toFixed());
        	$(".upload_list li:eq("+strFile+")").find(".progress_box .progress_bar").css("width",percent.toFixed()+"%");
        };
      	return xhr;
    	},
    	success : function(ret) {
      		strFile++;
      		if(strFile!=recFileChk){
      			//추가 업로 파일일 있는 경우 추가 업로드 실행 
      			uploadFiles(metaCode, recFileChk ,strFile);
      		}else{
      			$(".upload_layer_wrap").css("display","none");
      			//파일 전체 업로드 완료 > 데이터 저장
      			saveRecData(metaCode);
      		}	
      	}
  	});
}
// 파일 유무 체크 및 업로드 프로그레스 세팅
function setFileData(){
	var uploadIdx = 0;
	if(recPrint.length !=0){
		$(recPrint).each(function(idx, file){
			uploadfiles.push(file);
			uploadfilesIm.push({
				type: "FC001",
				sort: idx
			});
			
			uploadItem = "";
			uploadItem += "<li><div class='upload_item'>";
			uploadItem += "		<p class='item_name'>"+file.name+"</p>";
			uploadItem += "		<p class='item_size'>"+file.size+" Byte</p>";
			uploadItem += "		<div class='progress_box'><div class='progress_bar' style=''></div></div>";
			uploadItem += "		<div class='progress_data'><p class='percent'>00</p>%</div>";
			uploadItem += "</div></li>";
			$(".upload_box_wrap ul.upload_list").append(uploadItem);		
			uploadIdx++;	
		});
	}
	if(recOfficial.length !=0){
		$(recOfficial).each(function(idx, file){
			uploadfiles.push(file);
			uploadfilesIm.push({
				type: "FC002",
				sort: idx
			});
			uploadItem = "";
			uploadItem += "<li><div class='upload_item'>";
			uploadItem += "		<p class='item_name'>"+file.name+"</p>";
			uploadItem += "		<p class='item_size'>"+file.size+" Byte</p>";
			uploadItem += "		<div class='progress_box'><div class='progress_bar' style=''></div></div>";
			uploadItem += "		<div class='progress_data'><p class='percent'>00</p>%</div>";
			uploadItem += "</div></li>";
			$(".upload_box_wrap ul.upload_list").append(uploadItem);		
			uploadIdx++;	
		});
	}
	if(nctBefore.length !=0){
		$(nctBefore).each(function(idx, file){
			uploadfiles.push(file);
			uploadfilesIm.push({
				type: "FC003",
				sort: idx
			});
			uploadItem = "";
			uploadItem += "<li><div class='upload_item'>";
			uploadItem += "		<p class='item_name'>"+file.name+"</p>";
			uploadItem += "		<p class='item_size'>"+file.size+" Byte</p>";
			uploadItem += "		<div class='progress_box'><div class='progress_bar' style=''></div></div>";
			uploadItem += "		<div class='progress_data'><p class='percent'>00</p>%</div>";
			uploadItem += "</div></li>";
			$(".upload_box_wrap ul.upload_list").append(uploadItem);	
			uploadIdx++;	
		});
	}
	if(nctAfter.length !=0){
		$(nctAfter).each(function(idx, file){
			uploadfiles.push(file);
			uploadfilesIm.push({
				type: "FC004",
				sort: idx
			});
			uploadItem = "";
			uploadItem += "<li><div class='upload_item'>";
			uploadItem += "		<p class='item_name'>"+file.name+"</p>";
			uploadItem += "		<p class='item_size'>"+file.size+" Byte</p>";
			uploadItem += "		<div class='progress_box'><div class='progress_bar' style=''></div></div>";
			uploadItem += "		<div class='progress_data'><p class='percent'>00</p>%</div>";
			uploadItem += "</div></li>";
			$(".upload_box_wrap ul.upload_list").append(uploadItem);		
			uploadIdx++;	
		});
	}
	if(multifiles.length !=0){
		$(multifiles).each(function(idx, file){
			uploadfiles.push(file);
			uploadfilesIm.push({
				type: "FC005",
				sort: idx + 1
			});
			uploadItem = "";
			uploadItem += "<li><div class='upload_item'>";
			uploadItem += "		<p class='item_name'>"+file.name+"</p>";
			uploadItem += "		<p class='item_size'>"+file.size+" Byte</p>";
			uploadItem += "		<div class='progress_box'><div class='progress_bar' style=''></div></div>";
			uploadItem += "		<div class='progress_data'><p class='percent'>00</p>%</div>";
			uploadItem += "</div></li>";
			$(".upload_box_wrap ul.upload_list").append(uploadItem);
			uploadIdx++;	
		});
	}
	if(uploadIdx!=0){
		$(".upload_layer_wrap").css("display","flex");
	}
	console.log(uploadfiles);
	return uploadIdx;
	//uploadFiles();
}
// 전문위원회 > 접수현황 > 신규 접수 등록  > 데이터 저장 처리 
function saveRecData(metaCode){
	$.ajax({
		anyne:true,
		type:'POST',
		data: JSON.stringify({
			metaCode: metaCode
			,recMetaData: recMetaData
			,recTechList: recTechList
			,recCountryList: recCountryList
			//receiptLinkAgdList: wp.receiptLinkAgdList
		}),
    	url: "/exp/proc/saveMetaData.do",
		dataType: "json",
		contentType: 'application/json;charset=UTF-8',
		success : function(data) {
			var returnUrl = '/expcom/expRecList.do';
			recAlertPopup.open('codeRecV037','','pageLocation','one', returnUrl);
		},
		error: function(e) {
			alert("ERROR ");
		}
	});
}

// 전문위원회 > 접수현황 > 신규 접수 등록  > 대상 기업 설정 > 검색 등록  > 데이터 체크 
function setComT01(comType){
	var comInchk = $("#comInchk").val();
	if(comInchk=="N"){
		recAlertPopup.open('codeRecW003','','closeFocus','one', 'schCompay');
		return false;
	}else{
		recMetaData = {};
		recMetaData.nctMetaRecYn = "N";
		recMetaData.nctMetaAdmYn = "Y";
		recMetaData.nctMetaRecCode = "";
		recMetaData.nctMetaComType = comType;
		recMetaData.nctMetaComCode = recImMetaData.cpnId;
		recMetaData.nctMetaComNo = recImMetaData.cpnSNo;
		recMetaData.nctMetaComNm = recImMetaData.cpnNm;
		recMetaData.nctMetaCeo = recImMetaData.cpnCeo;
		recMetaData.nctMetaBoZip = recImMetaData.cpnBZip;
		recMetaData.nctMetaBoAdd1 = recImMetaData.cpnBAdd1;
		recMetaData.nctMetaBoAdd2 = recImMetaData.cpnBAdd2;
		recMetaData.nctMetaBoPhone1 = recImMetaData.cpnBPhone1;
		recMetaData.nctMetaBoPhone2 = recImMetaData.cpnBPhone2;
		recMetaData.nctMetaBoPhone3 = recImMetaData.cpnBPhone3;
		recMetaData.nctMetaSaZip = recImMetaData.cpnSZip;
		recMetaData.nctMetaSaAdd1 = recImMetaData.cpnSAdd1;
		recMetaData.nctMetaSaAdd2 = recImMetaData.cpnSAdd2;
		recMetaData.nctMetaSaPhone1 = recImMetaData.cpnSPhone1;
		recMetaData.nctMetaSaPhone2 = recImMetaData.cpnSPhone2;
		recMetaData.nctMetaSaPhone3 = recImMetaData.cpnSPhone3;
		recMetaData.nctMetaPmNm = recImMetaData.cpnPNm;
		recMetaData.nctMetaPmDept = recImMetaData.cpnPDept;
		recMetaData.nctMetaPmPosition = recImMetaData.cpnPPosition;
		recMetaData.nctMetaPmPhone1 = recImMetaData.cpnPPhone1;
		recMetaData.nctMetaPmPhone2 = recImMetaData.cpnPPhone2;
		recMetaData.nctMetaPmPhone3 = recImMetaData.cpnPPhone3;
		recMetaData.nctMetaPmMobile1 = recImMetaData.cpnPMobile1;
		recMetaData.nctMetaPmMobile2 = recImMetaData.cpnPMobile2;
		recMetaData.nctMetaPmMobile3 = recImMetaData.cpnPMobile3;
		recMetaData.nctMetaPmEmail = recImMetaData.cpnPEmail;
		return true;
	}
}
// 전문위원회 > 접수현황 > 신규 접수 등록   > 대상 기업 설정 > 신규 등록 데이터 체크 
function setComT02(comType){
	var chhOn =  true;
	recMetaData = {};
	recMetaData.nctMetaRecYn = "N";
	recMetaData.nctMetaAdmYn = "Y";
	recMetaData.nctMetaRecCode = "";
	recMetaData.nctMetaComType = comType;
	recMetaData.nctMetaComCode = "";
	
	var $newCompayNm = $("#newCompayNm"); 
	if($newCompayNm.val()==""){
		recAlertPopup.open('codeRecW004','','closeFocus','one', 'newCompayNm');
		chhOn = false;
		return;
	}else{
		recMetaData.nctMetaComNm = $newCompayNm.val();
	}
	
	var $newCompayCeo = $("#newCompayCeo"); 
	if($newCompayCeo.val()==""){
		recAlertPopup.open('codeRecW005','','closeFocus','one', 'newCompayCeo');
		chhOn = false;
		return;
	}else{
		recMetaData.nctMetaCeo = $newCompayCeo.val();
	}
	
	var $newCompayNo1 = $("#newCompayNo1");
	var $newCompayNo2 = $("#newCompayNo2");
	var $newCompayNo3 = $("#newCompayNo3"); 
	
	if($newCompayNo1.val()==""){
		recAlertPopup.open('codeRecW006','','closeFocus','one', 'newCompayNo1');
		chhOn = false;
		return;
	}else if($newCompayNo2.val()==""){
		recAlertPopup.open('codeRecW006','','closeFocus','one', 'newCompayNo2');
		chhOn = false;
		return;
	}else if($newCompayNo3.val()==""){
		recAlertPopup.open('codeRecW006','','closeFocus','one', 'newCompayNo3');
		chhOn = false;
		return;
	}else{
		recMetaData.nctMetaComNo = $newCompayNo1.val()+"-"+$newCompayNo2.val()+"-"+$newCompayNo3.val();
	}
	
	var $newComBoPost = $("#newComBoPost"); 
	var $newComBoAdd1 = $("#newComBoAdd1"); 
	var $newComBoAdd2 = $("#newComBoAdd2"); 
	if($newComBoPost.val()==""){
		recAlertPopup.open('codeRecW007','','closeFocus','one', 'newComBoPost');
		chhOn = false;
		return;
	}else if($newComBoAdd1.val()==""){
		recAlertPopup.open('codeRecW008','','closeFocus','one', 'newComBoAdd1');
		chhOn = false;
		return;
	}else if($newComBoAdd2.val()==""){
		recAlertPopup.open('codeRecW009','','closeFocus','one', 'newComBoAdd2');
		chhOn = false;
		return;
	}else{
		recMetaData.nctMetaBoZip = $newComBoPost.val();
		recMetaData.nctMetaBoAdd1 = $newComBoAdd1.val();
		recMetaData.nctMetaBoAdd2 = $newComBoAdd2.val();
	}
	
	var $newBoPhone1 = $("#newBoPhone1"); 
	var $newBoPhone2 = $("#newBoPhone2"); 
	var $newBoPhone3 = $("#newBoPhone3"); 
	if($newBoPhone1.val()==""){
		recAlertPopup.open('codeRecW007','','closeFocus','one', 'newBoPhone1');
		chhOn = false;
		return;
	}else if($newBoPhone2.val()==""){
		recAlertPopup.open('codeRecW008','','closeFocus','one', 'newBoPhone2');
		chhOn = false;
		return;
	}else if($newBoPhone3.val()==""){
		recAlertPopup.open('codeRecW009','','closeFocus','one', 'newBoPhone3');
		chhOn = false;
		return;
	}else{
		recMetaData.nctMetaBoPhone1 = $newBoPhone1.val();
		recMetaData.nctMetaBoPhone2 = $newBoPhone2.val();
		recMetaData.nctMetaBoPhone3 = $newBoPhone3.val();
	}
	
	var $newComSaPost = $("#newComSaPost"); 
	var $newComSaAdd1 = $("#newComSaAdd1"); 
	var $newComSaAdd2 = $("#newComSaAdd2"); 
	if($newComSaPost.val()==""){
		recAlertPopup.open('codeRecW010','','closeFocus','one', 'newComSaPost');
		chhOn = false;
		return;
	}else if($newComSaAdd1.val()==""){
		recAlertPopup.open('codeRecW011','','closeFocus','one', 'newComSaAdd1');
		chhOn = false;
		return;
	}else if($newComSaAdd2.val()==""){
		recAlertPopup.open('codeRecW012','','closeFocus','one', 'newComSaAdd2');
		chhOn = false;
		return;
	}else{
		recMetaData.nctMetaSaZip = $newComSaPost.val();
		recMetaData.nctMetaSaAdd1 = $newComSaAdd1.val();
		recMetaData.nctMetaSaAdd2 = $newComSaAdd2.val();
	}
	
	var $newSaPhone1 = $("#newSaPhone1"); 
	var $newSaPhone2 = $("#newSaPhone2"); 
	var $newSaPhone3 = $("#newSaPhone3"); 
	if($newSaPhone1.val()==""){
		recAlertPopup.open('codeRecW007','','closeFocus','one', 'newSaPhone1');
		chhOn = false;
		return;
	}else if($newSaPhone2.val()==""){
		recAlertPopup.open('codeRecW008','','closeFocus','one', 'newSaPhone2');
		chhOn = false;
		return;
	}else if($newSaPhone3.val()==""){
		recAlertPopup.open('codeRecW009','','closeFocus','one', 'newSaPhone3');
		chhOn = false;
		return;
	}else{
		recMetaData.nctMetaSaPhone1 = $newSaPhone1.val();
		recMetaData.nctMetaSaPhone2 = $newSaPhone2.val();
		recMetaData.nctMetaSaPhone3 = $newSaPhone3.val();
	}
	
	var $newPmName = $("#newPmName"); 
	if($newPmName.val()==""){
		recAlertPopup.open('codeRecW013','','closeFocus','one', 'newPmName');
		chhOn = false;
		return;
	}else{
		recMetaData.nctMetaPmNm = $newPmName.val();
	}
	
	var $newPmEmail = $("#newPmEmail"); 
	if($newPmEmail.val()==""){
		recAlertPopup.open('codeRecW014','','closeFocus','one', 'newPmEmail');
		chhOn = false;
		return;
	}else{
		recMetaData.nctMetaPmEmail = $newPmEmail.val();
	}
	
	var $newPmDepth = $("#newPmDepth"); 
	if($newPmDepth.val()==""){
		recAlertPopup.open('codeRecW015','','closeFocus','one', 'newPmDepth');
		chhOn = false;
		return;
	}else{
		recMetaData.nctMetaPmDept = $newPmDepth.val();
	}
	
	var $newPmPosi = $("#newPmPosi"); 
	if($newPmPosi.val()==""){
		recAlertPopup.open('codeRecW016','','closeFocus','one', 'newPmPosi');
		chhOn = false;
		return;
	}else{
		recMetaData.nctMetaPmPosition = $newPmPosi.val();
	}
	
	var $newPmPhone1 = $("#newPmPhone1"); 
	var $newPmPhone2 = $("#newPmPhone2"); 
	var $newPmPhone3 = $("#newPmPhone3"); 
	if($newPmPhone1.val()==""){
		recAlertPopup.open('codeRecW017','','closeFocus','one', 'newPmPhone1');
		chhOn = false;
		return;
	}else if($newPmPhone2.val()==""){
		recAlertPopup.open('codeRecW017','','closeFocus','one', 'newPmPhone2');
		chhOn = false;
		return;
	}else if($newPmPhone3.val()==""){
		recAlertPopup.open('codeRecW017','','closeFocus','one', 'newPmPhone3');
		chhOn = false;
		return;
	}else{
		recMetaData.nctMetaPmPhone1 = $newPmPhone1.val();
		recMetaData.nctMetaPmPhone2 = $newPmPhone2.val();
		recMetaData.nctMetaPmPhone3 = $newPmPhone3.val();
	}
	
	var $newPmMobile1 = $("#newPmMobile1"); 
	var $newPmMobile2 = $("#newPmMobile2"); 
	var $newPmMobile3 = $("#newPmMobile3"); 
	if($newPmMobile1.val()==""){
		recAlertPopup.open('codeRecW018','','closeFocus','one', 'newPmMobile1');
		chhOn = false;
		return;
	}else if($newPmMobile2.val()==""){
		recAlertPopup.open('codeRecW018','','closeFocus','one', 'newPmMobile2');
		chhOn = false;
		return;
	}else if($newPmMobile3.val()==""){
		recAlertPopup.open('codeRecW018','','closeFocus','one', 'newPmMobile3');
		chhOn = false;
		return;
	}else{
		recMetaData.nctMetaPmMobile1 = $newPmMobile1.val();
		recMetaData.nctMetaPmMobile2 = $newPmMobile2.val();
		recMetaData.nctMetaPmMobile3 = $newPmMobile3.val();
	}
	
	if(chhOn == false){
		return false;
	}else{
		return true;
	}
}
// 전문위원회 > 접수현황 > 신규 접수 등록   > 대상 기업 설정 > 미지정 입력 체크
function setComT03(comType){
	recMetaData = {};
	recMetaData.nctMetaRecYn = "N";
	recMetaData.nctMetaAdmYn = "Y";
	recMetaData.nctMetaRecCode = "";
	recMetaData.nctMetaComType = comType;
	return true;
}

// 전문위원회 > 접수현황 > 신청서 설정 > 기술 분야 데이터 체크 
function setTeckItem(){
	recTechList = [];
	$("ul.meta_tech_list li").each(function(idx, tech){
		recTechList.push({ 
			nctIdx: 'temp',
			nctMetaTechSort: idx+1,
			techNtcGid: $(tech).data("tech-gid"),
			techNctCode: $(tech).data("tech-code"),
			techUniqId: $(tech).data("tech-uniqid"),
			nctMetaTechNm: $(tech).find(".meta_tech_name").text()
		});
	});
	return true;
}
// 전문위원회 > 접수현황 > 신청서 설정 > 수출 대상국 데이터 체크
function setCtyItem(){
	recCountryList = [];
	$(".ex_coutury ul.meta_cty_list li").each(function(idx, tech){
		recCountryList.push({ 
			nctIdx: 'temp',
			nctCtySort: idx+1,
			nctCtyCode: $(tech).data("cty-code"),
			nctCtyBuyer: $(tech).find(".meta_cty_buyer_nm").text()
		});
	});
	return true;
	
}
// 전문위원회 > 접수현황 > 신청서 설정 > 접수분야 > 기타 분야 데이터 체크 
function setRecT0(metaType){
	var setRecT0Chk = true;
	var $agdTitle = $("#agdTitle"); 
	if($agdTitle.val()==""){
		recAlertPopup.open('codeRecW027','','closeFocus','one', 'agdTitle');
		setRecT0Chk = false;
		return;
	}else{
		recMetaData.nctMetaTitle = $agdTitle.val();
	}
	var $newMetaReason = $("#newMetaReason");
	if($newMetaReason.val()==""){
		recAlertPopup.open('codeRecW028','','closeFocus','one', 'newMetaReason');
		setRecT0Chk = false;
		return;
	}else{
		recMetaData.nctMetaReason = $newMetaReason.val();
	}
	recMetaData.nctMetaType = metaType;
	if(setRecT0Chk == false){
		return false;
	}else{
		return true;
	}
}
// 전문위원회 > 접수현황 > 신청서 설정 > 접수분야 > 여부 판정 분야 데이터 체크
function setRecT1(metaType){
	var setRecT1Chk = true;
	
	var $newMetaForm = $("#newMetaForm");
	if($newMetaForm.val()==""){
		recAlertPopup.open('codeRecW029','','closeFocus','one', 'newMetaForm');
		setRecT1Chk = false;
		return;
	}else{
		recMetaData.nctMetaTechForm = $newMetaForm.val();
	}
	
	var $newMetaQua = $("#newMetaQua");
	if($newMetaQua.val()==""){
		recAlertPopup.open('codeRecW030','','closeFocus','one', 'newMetaQua');
		setRecT1Chk = false;
		return;
	}else{
		recMetaData.nctMetaTechQua = $newMetaQua.val();
	}
	
	var $newMetaReason = $("#newMetaReason");
	if($newMetaReason.val()==""){
		recAlertPopup.open('codeRecW028','','closeFocus','one', 'newMetaReason');
		setRecT1Chk = false;
		return;
	}else{
		recMetaData.nctMetaReason = $newMetaReason.val();
	}
	console.log(metaType);
	recMetaData.nctMetaType = metaType;
	if(setRecT1Chk == false){
		return false;
	}else{
		return true;
	}
}
// 전문위원회 > 접수현황 > 신청서 설정 > 수출 신고/수출승인/수출 사전검토 분야  데이터 체크
function setRecT2(metaType){
	var setRecT2Chk = true;
	
	var $newMetaForm = $("#newMetaForm");
	if($newMetaForm.val()==""){
		recAlertPopup.open('codeRecW029','','closeFocus','one', 'newMetaForm');
		setRecT2Chk = false;
		return;
	}else{
		recMetaData.nctMetaTechForm = $newMetaForm.val();
	}
	
	var exReasonType = $("#exReasonType").val();
	if(exReasonType==""){
		recAlertPopup.open('codeRecW033','','closeFocus','one', 'reason_type_list');
		setRecT2Chk = false;
		return;
	}else if(exReasonType=="ER01"){
		recMetaData.nctMetaExSale = exReasonType;
	}
	
	var $newExReason = $("#newExReason");
	if($newExReason.val()==""){
		recAlertPopup.open('codeRecW034','','closeFocus','one', 'newExReason');
		setRecT2Chk = false;
		return;
	}else{
		recMetaData.nctMetaExSCom = $newExReason.val();
	}
	var $exDatePick = $("#exDatePick");
	if($exDatePick.val()==""){
		recAlertPopup.open('codeRecW035','','closeFocus','one', 'exDatePick');
		setRecT2Chk = false;
		return;
	}else{
		recMetaData.nctMetaExDate = $exDatePick.val();
		recMetaData.nctMetaExDCom = $("#exDateEtc").val();
	}
	recMetaData.nctMetaType = metaType;
	if(setRecT2Chk == false){
		return false;
	}else{
		return true;
	}
}
// 전문위원회 > 접수현황 > 신청서 설정 > 해외인수합병 신고/해외인수합병 승인/해외인수합병  사전검토 분야  데이터 체크
function setRecT3(metaType){
	var setRecT3Chk = true;
	
	var $newMetaForm = $("#newMetaForm");
	if($newMetaForm.val()==""){
		recAlertPopup.open('codeRecW029','','closeFocus','one', 'newMetaForm');
		setRecT3Chk = false;
		return;
	}else{
		recMetaData.nctMetaTechForm = $newMetaForm.val();
	}
	
	var $newMetaQua = $("#newMetaQua");
	if($newMetaQua.val()==""){
		recAlertPopup.open('codeRecW030','','closeFocus','one', 'newMetaQua');
		setRecT3Chk = false;
		return;
	}else{
		recMetaData.nctMetaTechQua = $newMetaQua.val();
	}
	
	var $newMetaReason = $("#newMetaReason");
	if($newMetaReason.val()==""){
		switch(metaType.substring(2,4)){
			case "01":
				recAlertPopup.open('codeRecW031','','closeFocus','one', 'newMetaReason');
				break;
			case "02":
				recAlertPopup.open('codeRecW032','','closeFocus','one', 'newMetaReason');
				break;
			case "03":
				recAlertPopup.open('codeRecW028','','closeFocus','one', 'newMetaReason');
				break;
		}
		setRecT3Chk = false;
		return;	
	}else{
		recMetaData.nctMetaReason = $newMetaReason.val();
		if(metaType.substring(2,4)=="01"){
			var $newMetaLaw01 = $("#newMetaLaw01");
			var $newMetaLaw02 = $("#newMetaLaw02");
			var $newMetaLaw03 = $("#newMetaLaw03");
			if($newMetaLaw01.hasClass("tap_on")){
				recMetaData.nctMetaLaw01 = "Y";
			}else{
				recMetaData.nctMetaLaw01 = "N";
			}
			if($newMetaLaw02.hasClass("tap_on")){
				recMetaData.nctMetaLaw02 = "Y";
			}else{
				recMetaData.nctMetaLaw02 = "N";
			}
			if($newMetaLaw03.hasClass("tap_on")){
				recMetaData.nctMetaLaw03 = "Y";
			}else{
				recMetaData.nctMetaLaw03 = "N";
			}
		}
	}
	recMetaData.nctMetaType = metaType;
	if(setRecT3Chk == false){
		return false;
	}else{
		return true;
	}
}
// 전문위원회 > 접수현황 > 신청서 설정 > 국가핵심기술 지정/국가핵심기술 변경/국가핵심기술 해제 분야  데이터 체크
function setRecT4(metaType){
	var setRecT4Chk = true;
	
	var $newMetaReason = $("#newMetaReason");
	if($newMetaReason.val()==""){
		recAlertPopup.open('codeRecW028','','closeFocus','one', 'newMetaReason');
		setRecT0Chk = false;
		return;
	}else{
		recMetaData.nctMetaReason = $newMetaReason.val();
	}
	recMetaData.nctMetaType = metaType;
	if(setRecT4Chk == false){
		return false;
	}else{
		return true;
	}
}

// 전문위원회 > 접수현황 > 신청서 상세  > 의견 작성 저장 클릭 이벤트
function recSaveComent(){
	var recComent = $(".nct_body .rec_coment_box #coment").val();
	if(recComent==""){
		recAlertPopup.open('codeRecV005','','closeAlert','one');
	}else{
		goSaveComent();
	}
}


// 전문위원회 > 접수현황 > 신청서 상세  > 검토 의견 첨부 소관과 권한 설정 클릭 이벤트
function recSaveCompe(){
	var authOriCnt = $(".nct_body .nct_tech_list_box").find("ul.nct_tech_list .compe_ori").length;
	var authCnt = $(".nct_body .nct_tech_list_box").find("ul.nct_tech_list .compe_on").length;
	if(authOriCnt>0&&authCnt=="0"){
		recAlertPopup.open('codeRecV001','rollBackAuth','goSaveAuth','dual');
	}else if(authOriCnt == authCnt){
		if(authCnt == "0"){
			recAlertPopup.open('codeRecV002','','closeAlert','one');
		}else{
			recAlertPopup.open('codeRecV004','','closeAlert','one');
		}
	}else if(authCnt=="0"){
		recAlertPopup.open('codeRecV003','','closeAlert','one');
	}else{
		goSaveAuth();
	}
}

//전문위원회 > 접수 현황 > 신청서 상세 > 검토 의견 저장 처리  
function goSaveComent(){
	var recCode = $("#recCode").val();
	var recComent = $(".nct_body .rec_coment_box #coment").val();
	
	$.ajax({
        type: "post",
    	url: "/exp/proc/recComentSave.do",
        data : {"recCode": recCode, "recComent": recComent},
        dataType : "json",
		success : function(data) { 
			switch(data.resultCode){
				case "S":
					recAlertPopup.open('codeRecV006','','pageReload','one');
				case "F":
	 				//alert("Failed"); 
					break;
			}
		},
        error : function(){
            alert("failed! ")
        }
	});
}

//전문위원회 > 접수현황 > 신청서 상세  > 검토 의견 저장 처리  
function goSaveAuth(){
	var formData = new FormData();
	var auths = [];
	var recCode = $("#recCode").val();
	
	formData.append('recCode', recCode);
	var techIdx = "0";
	$(".nct_body .nct_tech_list_box").find("ul.nct_tech_list li").each(function(idx, auth){
		if ($(auth).hasClass("compe_on")){
			auths.push($(auth).data("tid"));
			formData.append('techList['+techIdx+']', $(auth).data("tid"));
			techIdx++;
		}
	});
	$.ajax({
        type: "post",
    	url: "/exp/proc/recCompeSave.do",
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false,
	 	success : function(data) { 
			switch(data.resultCode){
				case "S":
					recAlertPopup.open('codeRecV003','','pageReload','one');
				case "F":
	 				//alert("Failed"); 
					break;
			}
		},
        error : function(){
            alert("failed! ")
        }
	});
}

//전문위원회 > 접수 현황 > 신청서 상세 > 신청서 승인 처리 
function saveRecConfirm(){
	var recCode = $("#recCode").val();
	$.ajax({
        type: "post",
    	url: "/exp/proc/saveRecConfirm.do",
        data : {"recCode": recCode},
        dataType : "json",
		success : function(data) { 
			switch(data.resultCode){
				case "S":
					recAlertPopup.open('codeRecV008','','pageReload','one');
				case "F":
	 				//alert("Failed"); 
					break;
			}
		},
        error : function(){
            alert("failed! ")
        }
	});
}
//전문위원회 > 접수 현황 > 신청서 상세 > 신청서 승인 회수 처리 
function saveRecBaCon(){
	var recCode = $("#recCode").val();
	$.ajax({
        type: "post",
    	url: "/exp/proc/saveRecBaCon.do",
        data : {"recCode": recCode},
        dataType : "json",
		success : function(data) { 
			switch(data.resultCode){
				case "S":
					recAlertPopup.open('codeRecV012','','pageReload','one');
				case "F":
	 				//alert("Failed"); 
					break;
			}
		},
        error : function(){
            alert("failed! ")
        }
	});
}
//전문위원회 > 접수 현황 > 신청서 상세 > 신청서 반려 처리  
function saveRecReCon(){
	var recCode = $("#recCode").val();
	$.ajax({
        type: "post",
    	url: "/exp/proc/saveRecReCon.do",
        data : {"recCode": recCode},
        dataType : "json",
		success : function(data) { 
			switch(data.resultCode){
				case "S":
					recAlertPopup.open('codeRecV010','','pageReload','one');
				case "F":
	 				//alert("Failed"); 
					break;
			}
		},
        error : function(){
            alert("failed! ")
        }
	});
}
//전문위원회 > 접수 현황 > 신청서 상세 > 신청서 반려 회수 처리
function saveRecBaRe(){
	var recCode = $("#recCode").val();
	$.ajax({
        type: "post",
    	url: "/exp/proc/saveRecBaRe.do",
        data : {"recCode": recCode},
        dataType : "json",
		success : function(data) { 
			switch(data.resultCode){
				case "S":
					recAlertPopup.open('codeRecV014','','pageReload','one');
				case "F":
	 				//alert("Failed"); 
					break;
			}
		},
        error : function(){
            alert("failed! ")
        }
	});
}

