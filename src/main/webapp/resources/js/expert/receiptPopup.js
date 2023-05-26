/**
 * [전문위원회]접수현황 팝업 스크립트
 * - 작성일: 2022-02-08
 * 
 * - 다른 스크립트 변수 사용
 * 1. [common.js] comn
 */
	
/** ********** 접수내역 신규등록 팝업 Function *********** */
var ReceiptWritePopup = function(){
	var wp = {};
	
	var $popup = null;
	var popupUrl = "/expert/popup/receipt/write.do";
	
	/** 사업자 등록번호 하이픈(-) 표시 */
	wp.getSNumber = function(sNo){
		return sNo.substring(0,3)+"-"+sNo.substring(3,5)+"-"+sNo.substring(5,10);
	};
	
	wp.appFileArr = []; // 신청서 파일
	wp.officalNoticeFileArr = []; // 공문 파일
	wp.expFileArr = []; // 공문 파일
	wp.expChangeFileArr = []; // 공문 파일
	wp.companyData = {};
	// 신규 접수 데이터
	wp.receiptData={};
	wp.receiptTechList=[];
	wp.receiptCountryList=[];
	wp.receiptLinkAgdList=[];
	wp.initReceiptData = function() {
		wp.receiptData = {
			rcptIdx: 'temp', // kaits_receipt_stat.RCPT_CODE
			rcptTitle: null,
			rcptRegId: null,
			rcptRegDate: null,
			rcptStatus: 'AP',
			rcptStatusCode: "temp",
			rcptView: 'Y',
			rcptAView: 'Y',
			agdAdmYn: 'N',
			rcptStatusLast: null,
			rcptFixDate: null,
			/* 기업정보 */
			rcptComCode: null,
			rcptComType: 'M',
			rcptCompanyNm: null,
			rcptRegiNum: null,
			rcptCompanyCeo: null,
			rcptCompanyPost: null,
			rcptCompanyAdd: null,
			rcptCompanyAdd2: null,
			rcptCompanyPhone: null,
			rcptCompanyBPost: null,
			rcptCompanyBAdd: null,
			rcptCompanyBAdd2: null,
			rcptCompanyBPhone: null,
			rcptPmName: null,
			rcptPmDept: null,
			rcptPmPosition: null,
			rcptPmPhone1: null,
			rcptPmPhone2: null,
			rcptPmPhone3: null,
			rcptPmMobile1: null,
			rcptPmMobile2: null,
			rcptPmMobile3: null,
			rcptPmEmail: null,
			/* 메타정보 */
			rcptTypeCode: null,
			rcptTechForm: null,
			rcptExReasonSale: null,
			rcptExReasonSCom: null,
			rcptExReasonTrans: null,
			rcptExReasonTCom: null,
			rcptExReasonEtc: null,
			rcptExReasonECom: null,
			rcptExDate: null,
			rcptTechQua: null,
			rcptReason: null,
			rcptLaw01: null,
			rcptLaw02: null,
			rcptLaw03: null
		};
	};
	
	wp.setReceiptDataCompany = function(company){
		if (company == null) {
			company = wp.companyData;
		}
		wp.receiptData.rcptComCode = company.cpnId;
		// 기업
		wp.receiptData.rcptCompanyNm = company.cpnNm;
		wp.receiptData.rcptRegiNum = company.cpnSNo;
		wp.receiptData.rcptCompanyCeo= company.cpnCeo;
		// 본사
		wp.receiptData.rcptCompanyPost = company.cpnBZip;
		wp.receiptData.rcptCompanyAdd = company.cpnBAdd1;
		wp.receiptData.rcptCompanyAdd2 = company.cpnBAdd2;
		wp.receiptData.rcptCompanyPhone = company.cpnBPhone1+""+company.cpnBPhone2+""+company.cpnBPhone3;
		// 사업장
		wp.receiptData.rcptCompanyBPost = company.cpnSZip;
		wp.receiptData.rcptCompanyBAdd = company.cpnSAdd1;
		wp.receiptData.rcptCompanyBAdd2 = company.cpnSAdd2;
		wp.receiptData.rcptCompanyBPhone = company.cpnSPhone1+""+company.cpnSPhone2+""+company.cpnSPhone3;
		// 담당자
		wp.receiptData.rcptPmName = company.cpnPNm;
		wp.receiptData.rcptPmDept = company.cpnPDept;
		wp.receiptData.rcptPmPosition = company.cpnPPosition;
		wp.receiptData.rcptPmPhone1 = company.cpnPPhone1;
		wp.receiptData.rcptPmPhone2 = company.cpnPPhone2;
		wp.receiptData.rcptPmPhone3 = company.cpnPPhone3;
		wp.receiptData.rcptPmMobile1 = company.cpnPMobile1;
		wp.receiptData.rcptPmMobile2 = company.cpnPMobile2;
		wp.receiptData.rcptPmMobile3 = company.cpnPMobile3;
		wp.receiptData.rcptPmEmail = company.cpnPEmail;
	};
	
	/** 팝업 종료 */
	wp.close = function(){
		comn.popupClose();
	};
	/** 화면에서 시작하는 경우 */
	wp.open = function(){
		wp.initReceiptData();
		comn.popupOpen(popupUrl, createEvent);
	};
	
	/** 검색된 기업 정보 표시 */
	wp.setCompany = function(company){
		wp.companyData = company;
		wp.setReceiptDataCompany(company);
		// 선탣한 기업 정보 히든 인풋 적용
		$popup.find("#com_name_s").parent().find("p.section_item").text(company.cpnNm);
		$popup.find("#com_ceo_s").parent().find("p.section_item").text(company.cpnCeo);
		$popup.find("#com_reg_num_s").parent().find("p.section_item").text(wp.getSNumber(company.cpnSNo));
		$popup.find("#com_bon_add_s").parent().find("p.section_item").text(company.cpnBZip + ") "+company.cpnBAdd1+" "+company.cpnBAdd2);
		$popup.find("#com_bon_phone_s").parent().find("p.section_item").text(company.cpnBPhone1+"-"+company.cpnBPhone2+"-"+company.cpnBPhone3);
		$popup.find("#com_sa_add_s").parent().find("p.section_item").text(company.cpnSZip+") "+company.cpnSAdd1+" "+company.cpnSAdd2);
		$popup.find("#com_sa_phone_s").parent().find("p.section_item").text(company.cpnSPhone1+"-"+company.cpnSPhone2+"-"+company.cpnSPhone3);
		$popup.find("#com_pm_name_s").parent().find("p.section_item").text(company.cpnPNm);
		$popup.find("#com_pm_dept_s").parent().find("p.section_item").text(company.cpnPDept);
		$popup.find("#com_pm_position_s").parent().find("p.section_item").text(company.cpnPPosition);
		$popup.find("#com_pm_phone_s").parent().find("p.section_item").text(company.cpnPPhone1+"-"+company.cpnPPhone2+"-"+company.cpnPPhone3);
		$popup.find("#com_pm_mobile_s").parent().find("p.section_item").text(company.cpnPMobile1+"-"+company.cpnPMobile2+"-"+company.cpnPMobile3);
		$popup.find("#com_pm_email_s").parent().find("p.section_item").text(company.cpnPEmail);
	}
	
	/** 팝업 기능 생성 */
	var createEvent = function(popupElement){
		$popup = popupElement;
		// 팝업 진입 시 Step 2 내용 숨기기
		$popup.find("div.layer_popup_body.content_02").css("display","none");
		
		/** 접수 관리 > 신규 등록 > 접수 분야 설정 */
		$popup.find(".receipt_type_select .receipt_type_item").click(function() {
	        if(!$(this).parent().hasClass("on")){
				var type_code = $(this).attr("value");
				wp.receiptData.rcptTypeCode = type_code;
				$(this).parent().parent().parent().find(".receipt_type_val").val(type_code);
				$(this).parent().parent().parent().find("li").removeClass("on");
				$(this).parent().addClass("on");
				
				
				$popup.find(".RctpFormInfo").css("display","none");
				$popup.find(".WriteFormSection").css("display","block");
				$popup.find(".WriteTit .rctp_t").css("display","none");
				$popup.find(".WriteTit .rctp_"+type_code).css("display","block");
				
				$popup.find(".writeform .rctp_t").css("display","none");
				$popup.find(".writeform .rctp_"+type_code).css("display","block");
				
				
				
				if(type_code=="01"){
					$popup.find(".insert_item_00").css("display","none");
					$popup.find(".insert_item_00_01").css("display","block");
					$popup.find(".insert_item_01").css("display","block");
					$popup.find(".insert_item_02").css("display","block");
					$popup.find(".insert_item_03").css("display","none");
					$popup.find(".insert_item_04").css("display","none");
					$popup.find(".insert_item_05").css("display","none");
					$popup.find(".insert_item_06").css("display","none");
					$popup.find(".insert_item_07").css("display","none");
					$popup.find(".insert_item_08").css("display","none");
					$popup.find(".insert_item_sin").css("display","block");
					$popup.find(".insert_item_gong").css("display","block");
					$popup.find(".insert_item_thecinfo").css("display","none");
					$popup.find(".insert_item_thecinfo2").css("display","none");
					$popup.find(".insert_item_multi .section_label").text("첨부 서류");
					$popup.find(".insert_item_multi .file_info").css("display","block");
					$popup.find(".insert_item_multi").css("display","block");
				}else if(type_code=="02"||type_code=="03"||type_code=="04"){
					$popup.find(".insert_item_00").css("display","none");
					$popup.find(".insert_item_00_01").css("display","block");
					$popup.find(".insert_item_01").css("display","none");
					$popup.find(".insert_item_02").css("display","none");
					$popup.find(".insert_item_03").css("display","none");
					$popup.find(".insert_item_04").css("display","none");
					$popup.find(".insert_item_05").css("display","block");
					$popup.find(".insert_item_06").css("display","block");
					$popup.find(".insert_item_07").css("display","block");
					$popup.find(".insert_item_08").css("display","none");
					$popup.find(".insert_item_sin").css("display","block");
					$popup.find(".insert_item_gong").css("display","block");
					$popup.find(".insert_item_thecinfo").css("display","none");
					$popup.find(".insert_item_thecinfo2").css("display","none");
					$popup.find(".insert_item_multi .section_label").text("첨부 서류");
					$popup.find(".insert_item_multi .file_info").css("display","block");
					$popup.find(".insert_item_multi").css("display","block");
				}else if(type_code=="05"){
					$popup.find(".insert_item_00").css("display","none");
					$popup.find(".insert_item_00_01").css("display","block");
					$popup.find(".insert_item_01").css("display","block");
					$popup.find(".insert_item_02").css("display","block");
					$popup.find(".insert_item_03").css("display","none");
					$popup.find(".insert_item_04").css("display","none");
					$popup.find(".insert_item_05").css("display","none");
					$popup.find(".insert_item_06").css("display","none");
					$popup.find(".insert_item_07").css("display","block");
					$popup.find(".insert_item_08").css("display","none");
					$popup.find(".insert_item_sin").css("display","block");
					$popup.find(".insert_item_gong").css("display","block");
					$popup.find(".insert_item_thecinfo").css("display","none");
					$popup.find(".insert_item_thecinfo2").css("display","none");
					$popup.find(".insert_item_multi .section_label").text("첨부 서류");
					$popup.find(".insert_item_multi .file_info").css("display","block");
					$popup.find(".insert_item_multi").css("display","block");
				}else if(type_code=="06"){
					$popup.find(".insert_item_00").css("display","none");
					$popup.find(".insert_item_00_01").css("display","block");
					$popup.find(".insert_item_01").css("display","block");
					$popup.find(".insert_item_02").css("display","none");
					$popup.find(".insert_item_03").css("display","block");
					$popup.find(".insert_item_04").css("display","none");
					$popup.find(".insert_item_05").css("display","none");
					$popup.find(".insert_item_06").css("display","none");
					$popup.find(".insert_item_07").css("display","block");
					$popup.find(".insert_item_08").css("display","none");
					$popup.find(".insert_item_sin").css("display","block");
					$popup.find(".insert_item_gong").css("display","block");
					$popup.find(".insert_item_thecinfo").css("display","none");
					$popup.find(".insert_item_thecinfo2").css("display","none");
					$popup.find(".insert_item_multi .section_label").text("첨부 서류");
					$popup.find(".insert_item_multi .file_info").css("display","block");
					$popup.find(".insert_item_multi").css("display","block");
				}else if(type_code=="07"){
					$popup.find(".insert_item_00").css("display","none");
					$popup.find(".insert_item_00_01").css("display","block");
					$popup.find(".insert_item_01").css("display","none");
					$popup.find(".insert_item_02").css("display","block");
					$popup.find(".insert_item_03").css("display","none");
					$popup.find(".insert_item_04").css("display","block");
					$popup.find(".insert_item_05").css("display","none");
					$popup.find(".insert_item_06").css("display","none");
					$popup.find(".insert_item_07").css("display","block");
					$popup.find(".insert_item_08").css("display","none");
					$popup.find(".insert_item_sin").css("display","block");
					$popup.find(".insert_item_gong").css("display","block");
					$popup.find(".insert_item_thecinfo").css("display","none");
					$popup.find(".insert_item_thecinfo2").css("display","none");
					$popup.find(".insert_item_multi .section_label").text("첨부 서류");
					$popup.find(".insert_item_multi .file_info").css("display","block");
					$popup.find(".insert_item_multi").css("display","block");
					
				}else if(type_code=="08"){
					$popup.find(".insert_item_00").css("display","none");
					$popup.find(".insert_item_00_01").css("display","none");
					$popup.find(".insert_item_01").css("display","none");
					$popup.find(".insert_item_02").css("display","block");
					$popup.find(".insert_item_03").css("display","none");
					$popup.find(".insert_item_04").css("display","none");
					$popup.find(".insert_item_05").css("display","none");
					$popup.find(".insert_item_06").css("display","none");
					$popup.find(".insert_item_07").css("display","none");
					$popup.find(".insert_item_08").css("display","none");
					$popup.find(".insert_item_sin").css("display","none");
					$popup.find(".insert_item_gong").css("display","none");
					$popup.find(".insert_item_thecinfo").css("display","block");
					$popup.find(".insert_item_thecinfo2").css("display","none");
					$popup.find(".insert_item_multi .section_label").text("관련 파일");
					$popup.find(".insert_item_multi .file_info").css("display","none");
					
				}else if(type_code=="09"){
					$popup.find(".insert_item_00").css("display","none");
					$popup.find(".insert_item_00_01").css("display","none");
					$popup.find(".insert_item_01").css("display","none");
					$popup.find(".insert_item_02").css("display","block");
					$popup.find(".insert_item_03").css("display","none");
					$popup.find(".insert_item_04").css("display","none");
					$popup.find(".insert_item_05").css("display","none");
					$popup.find(".insert_item_06").css("display","none");
					$popup.find(".insert_item_07").css("display","none");
					$popup.find(".insert_item_08").css("display","none");
					$popup.find(".insert_item_sin").css("display","none");
					$popup.find(".insert_item_gong").css("display","none");
					$popup.find(".insert_item_thecinfo").css("display","block");
					$popup.find(".insert_item_thecinfo2").css("display","block");
					$popup.find(".insert_item_multi .section_label").text("관련 파일");
					$popup.find(".insert_item_multi .file_info").css("display","none");
					
				}else if(type_code=="10"){
					$popup.find(".insert_item_00").css("display","none");
					$popup.find(".insert_item_00_01").css("display","none");
					$popup.find(".insert_item_01").css("display","none");
					$popup.find(".insert_item_02").css("display","block");
					$popup.find(".insert_item_03").css("display","none");
					$popup.find(".insert_item_04").css("display","none");
					$popup.find(".insert_item_05").css("display","none");
					$popup.find(".insert_item_06").css("display","none");
					$popup.find(".insert_item_07").css("display","none");
					$popup.find(".insert_item_08").css("display","none");
					$popup.find(".insert_item_sin").css("display","none");
					$popup.find(".insert_item_gong").css("display","none");
					$popup.find(".insert_item_thecinfo").css("display","block");
					$popup.find(".insert_item_thecinfo2").css("display","none");
					$popup.find(".insert_item_multi .section_label").text("관련 파일");
					$popup.find(".insert_item_multi .file_info").css("display","none");
					
				}else if(type_code=="11"){
					$popup.find(".insert_item_00").css("display","block");
					$popup.find(".insert_item_00_01").css("display","none");
					$popup.find(".insert_item_01").css("display","none");
					$popup.find(".insert_item_02").css("display","block");
					$popup.find(".insert_item_03").css("display","none");
					$popup.find(".insert_item_04").css("display","none");
					$popup.find(".insert_item_05").css("display","none");
					$popup.find(".insert_item_06").css("display","none");
					$popup.find(".insert_item_07").css("display","none");
					$popup.find(".insert_item_08").css("display","block");
					$popup.find(".insert_item_sin").css("display","none");
					$popup.find(".insert_item_gong").css("display","none");
					$popup.find(".insert_item_thecinfo").css("display","none");
					$popup.find(".insert_item_thecinfo2").css("display","none");
					$popup.find(".insert_item_multi .section_label").text("관련 파일");
					$popup.find(".insert_item_multi .file_info").css("display","none");
					
				}else{
				
				}
				
				
			}
		});
		
		/** 접수관리 > 신규 등록 > 대상 기업 설정 여부 온오프 */
		$popup.find(".sch_chk_box").on("click", function(){
			if($(this).hasClass("active")){
				wp.receiptData.rcptComType = 'F';
				$(this).removeClass("active");
				$("#sch_compay").val("");
				$(this).parent().find(".sch_compay_preview").css("display","none");
				
				$(".not_company_info").css("display","flex");
				$(".sch_company_wrap").css("display","none");
				$(".sch_sel_com").css("display","none");
				$(".receipt_company_new").css("display","none");
				$(".ComIstFrom").css("height","calc(100% - 44px)");
				
				$popup.find("#in_com").val("N");
			}else{
				$(this).addClass("active");
				if($popup.find('li.new_com_on a.new_com_item').hasClass('search_add')){
					wp.receiptData.rcptComType = 'M';
				} else {
					wp.receiptData.rcptComType = 'N';
				}
				
				$(".not_company_info").css("display","none");
				$(".sch_company_wrap").css("display","block");
				
				
				$popup.find("#in_com").val("Y");
				var schtype = $popup.find("#com_new").val();
				
				if(schtype=="S"){
					$(".sch_sel_com").css("display","block");
					$(".ComIstFrom").css("height","calc(100% - 44px)");
				}else{
					$(".receipt_company_new").css("display","block");
					$(".ComIstFrom").css("height","auto");
				}
				
			}
			
		});
		/** 접수관리 > 신규 등록 > 검색등록 / 신규 등록 선택 */
		$popup.find(".new_com_chk .new_com_item").on("click", function(){
			if(!$(this).parent().hasClass("new_com_on")){
				var idx = $(this).parent().index();
				
				if(idx=="0"){
					wp.setReceiptDataCompany();
					wp.receiptData.rcptComType = 'M';
					$(this).parent().parent().find("li:eq(0)").addClass("new_com_on");
					$(this).parent().parent().find("li:eq(1)").removeClass("new_com_on");
					$("#sch_compay").attr("disabled",false);
					$("#sch_compay").attr("placeholder", "사업자등록번호 혹은 기업명을 입력하세요.");
					
					$(".receipt_company_new").css("display","none");
					$(".sch_sel_com").css("display","block");
					$(".ComIstFrom").css("height","calc(100% - 44px)");
					
					
					$popup.find("#com_new").val("S");
				}else{
					wp.receiptData.rcptComType = 'N';
					$("#sch_compay").attr("disabled",true);
					$(this).parent().parent().find("li:eq(0)").removeClass("new_com_on");
					$(this).parent().parent().find("li:eq(1)").addClass("new_com_on");
					$("#sch_compay").attr("placeholder", "");
					
					$(".receipt_company_new").css("display","block");
					$(".sch_sel_com").css("display","none");
					$(".ComIstFrom").css("height","auto");
					
					$(".receipt_company_new").css("display","block");
					$popup.find("#com_new").val("N");
				}
			}
		});
		
		/** 접수관리 > 신규 등록 > 대상 기업 검색 */ 
		$popup.find("#sch_compay").on("keyup", function(){
			var sch_conpany = $(this).val();
			var $ul = $popup.find("ul.compay_preview_list")
			if (sch_conpany.length <= 0) {
				$ul.empty();
				return;
			}
			$(this).parent().find(".sch_compay_preview").css("display","block");
			// Ajax 기업 DB 조회 후 sch_compay_preview li 요소 추가 후 display:block;
			$.ajax({
	            type: "post",
	        	url: "/expert/proc/receipt/company/list.do",
			 	data : {"cpnNm": sch_conpany}, 
			 	dataType : "json",
			 	success : function(data) { 
					// data 정보
					// resultCode: S(성공), F(실패)
					switch(data.resultCode){
						case "S":
							wp.setCompanyList(data.resultList);
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
		});
		
		wp.setCompanyList = function(list) {
			var $ulCompany = $popup.find("ul.compay_preview_list");
			var liHtml = "";
			
			$ulCompany.empty();
			if (list.length === 0) {
				return;
			}
			for (var ent of list) {
				liHtml += "<li class='compay_preview_item' data-com-id='"+ent.cpnId+"'>";
				liHtml += "<span>"+ent.cpnNm+"-["+ent.cpnSNo.substring(0,3)+"-"+ent.cpnSNo.substring(3,5)+"-"+ent.cpnSNo.substring(5,10)+"]-"+ent.cpnId+"</span>";
				liHtml += "<span>"+"대표:"+ent.cpnCeo+"/"+"담당자:"+ent.cpnPNm+"</span>";
				liHtml += "</li>";
			}
			
			$ulCompany.html(liHtml);

			/** 접수관리 > 신규 등록 > 대상 기업 검색 미리보기 기업 선택 */
			$popup.find(".compay_preview_item").off().on("click", function(){
				var comId = $(this).data("com-id");
				$.ajax({
					type: "post",
					url: "/expert/proc/receipt/company.do",
					data : {"cpnId": comId}, 
					dataType : "json",
					success : function(data) { 
						// data 정보
						// resultCode: S(성공), F(실패)
						switch(data.resultCode){
						case "S":
							wp.setCompany(data.resultData);
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
				// Ajax 기업 DB 조회 기업 정보 호출 후 검색 미리보기 닫기
				$(this).parent().parent().parent().find(".sch_compay_preview").css("display","none");
				$(".company_sch_info").css("display","none");
				$(".sch_sel_ative").css("display","block");
				$("#sch_compay").val("");
			});
		};
		
		/** 접수관리 > 신규 등록 > 전화번호 입력 */ 
		$popup.find("#sch_compay").on("keydown", function(){
			
			
		});
		
		/** 접수관리 > 신규 등록 > 다음 버튼 클릭 * */
		$popup.find(".layer_popup_btn .btn_next_1002").on("click", function(){
			var receipt_type = $popup.find("#receipt_type").val();
			var in_com = $popup.find("#in_com").val();
			var com_new = $popup.find("#com_new").val();
			
			// if(receipt_type==""){
			// alert("접수분야를 선택해주세요.");
			// return;
			// }
			
			if(in_com=="Y"){ // 기업정보가 설정인 경우
				if(com_new=="S"){ // 기업정보가 검색인 경우
// var com_name_s = $popup.find("#com_name_s").val();
// var com_ceo_s = $popup.find("#com_ceo_s").val();
// var com_reg_sum_s = $popup.find("#com_reg_sum_s").val();
// var com_bon_add_s = $popup.find("#com_bon_add_s").val();
// var com_bon_phone_s = $popup.find("#com_bon_phone_s").val();
// var com_sa_add_s = $popup.find("#com_sa_add_s").val();
// var com_sa_phone_s = $popup.find("#com_sa_phone_s").val();
// var com_pm_same_s = $popup.find("#com_pm_same_s").val();
// var com_pm_dept_s = $popup.find("#com_pm_dept_s").val();
// var com_pm_position_s = $popup.find("#com_pm_position_s").val();
// var com_pm_phone_s = $popup.find("#com_pm_phone_s").val();
// var com_pm_mobile_s = $popup.find("#com_pm_mobile_s").val();
// var com_pm_email_s = $popup.find("#com_pm_email_s").val();
					if(wp.receiptData.rcptCompanyNm === null){
						alert("기업정보를 검색 후 선택 해주세요.");
						return;
					}
				}else{ // 기업정보가 신규 등록인 경우
					wp.initReceiptData();
					wp.receiptData.rcptComType = 'N';
					wp.receiptData.rcptCompanyNm = $popup.find("#com_name_n").val();
					wp.receiptData.rcptCompanyCeo = $popup.find("#com_ceo_n").val();
					wp.receiptData.rcptRegiNum = $popup.find("#com_reg_num_n").val();
					wp.receiptData.rcptCompanyPost = $popup.find("#com_bon_post_n").val();
					wp.receiptData.rcptCompanyAdd = $popup.find("#com_bon_add_n").val();
					wp.receiptData.rcptCompanyAdd2 = $popup.find("#com_bon_add2_n").val();
					wp.receiptData.rcptCompanyPhone1 = $popup.find("#com_bon_phone_n1").val();
					wp.receiptData.rcptCompanyPhone2 = $popup.find("#com_bon_phone_n2").val();
					wp.receiptData.rcptCompanyPhone3 = $popup.find("#com_bon_phone_n3").val();
					wp.receiptData.rcptCompanyBPost = $popup.find("#com_sa_post_n").val();
					wp.receiptData.rcptCompanyBAdd = $popup.find("#com_sa_add_n").val();
					wp.receiptData.rcptCompanyBAdd2 = $popup.find("#com_sa_add2_n").val();
					wp.receiptData.rcptCompanyBPhone1 = $popup.find("#com_sa_phone_n1").val();
					wp.receiptData.rcptCompanyBPhone2 = $popup.find("#com_sa_phone_n2").val();
					wp.receiptData.rcptCompanyBPhone3 = $popup.find("#com_sa_phone_n3").val();
					wp.receiptData.rcptPmName = $popup.find("#com_pm_name_n").val();
					wp.receiptData.rcptPmDept = $popup.find("#com_pm_dept_n").val();
					wp.receiptData.rcptPmPosition = $popup.find("#com_pm_position_n").val();
					wp.receiptData.rcptPmPhone1 = $popup.find("#com_pm_phone_n1").val();
					wp.receiptData.rcptPmPhone2 = $popup.find("#com_pm_phone_n2").val();
					wp.receiptData.rcptPmPhone3 = $popup.find("#com_pm_phone_n3").val();
					wp.receiptData.rcptPmMobile1 = $popup.find("#com_pm_mobile_n1").val();
					wp.receiptData.rcptPmMobile2 = $popup.find("#com_pm_mobile_n2").val();
					wp.receiptData.rcptPmMobile3 = $popup.find("#com_pm_mobile_n3").val();
					wp.receiptData.rcptPmEmail = $popup.find("#com_pm_email_n").val();
					if(wp.receiptData.rcptCompanyNm==""){
						alert("기업명을 입력해주세요.");
						return;
					}
					if(wp.receiptData.rcptCompanyCeo==""){
						alert("대표자명을 입력해주세요.");
						return;
					}
					if(wp.receiptData.rcptRegiNum==""){
						alert("사업자등록번호를 입력해주세요.");
						return;
					}
					if(wp.receiptData.rcptCompanyPost==""){
						alert("본사 주소를 검색해주세요");
						return;
					}
					if(wp.receiptData.rcptCompanyAdd2==""){
						alert("본사 상세 주소를 입력해주세요.");
						return;
					}
					if(wp.receiptData.rcptCompanyPhone1==""){
						alert("본사 전화번호를 입력해주세요(시작번호)");
						return;
					}
					if(wp.receiptData.rcptCompanyPhone2==""){
						alert("본사 전화번호를 입력해주세요(중간번호)");
						return;
					}
					if(wp.receiptData.rcptCompanyPhone3==""){
						alert("본사 전화번호를 입력해주세요(끝번호)");
						return;
					}
					if(wp.receiptData.rcptCompanyBPost==""){
						alert("사업장 주소를 검색해주세요");
						return;
					}
					if(wp.receiptData.rcptCompanyBAdd2==""){
						alert("사업장 상세주소를 입력해주세요");
						return;
					}
					if(wp.receiptData.rcptCompanyBPhone1==""){
						alert("사업장 전화번호를 입력해주세요(시작번호)");
						return;
					}
					if(wp.receiptData.rcptCompanyBPhone2==""){
						alert("사업장 전화번호를 입력해주세요(중간번호)");
						return;
					}
					if(wp.receiptData.rcptCompanyBPhone3==""){
						alert("사업장 전화번호를 입력해주세요(끝번호)");
						return;
					}
					if(wp.receiptData.rcptPmName==""){
						alert("담당자 이름을 입력해주세요");
						return;
					}
					if(wp.receiptData.rcptPmDept==""){
						alert("담당자 부서를 입력해주세요");
						return;
					}
					if(wp.receiptData.rcptPmPosition==""){
						alert("담당자 직책을 입력해주세요");
						return;
					}
					if(wp.receiptData.rcptPmPhone1==""){
						alert("담당자 전화번호를 입력해주세요(시작번호)");
						return;
					}
					if(wp.receiptData.rcptPmPhone2==""){
						alert("담당자 전화번호를 입력해주세요(중간번호)");
						return;
					}
					if(wp.receiptData.rcptPmPhone3==""){
						alert("담당자 전화번호를 입력해주세요(끝번호)");
						return;
					}
					if(wp.receiptData.rcptPmMobile1==""){
						alert("담당자 휴대폰을 입력해주세요(시작번호)");
						return;
					}
					if(wp.receiptData.rcptPmMobile2==""){
						alert("담당자 휴대폰을 입력해주세요(중간번호)");
						return;
					}
					if(wp.receiptData.rcptPmMobile3==""){
						alert("담당자 휴대폰을 입력해주세요(끝번호)");
						return;
					}
					if(wp.receiptData.rcptPmEmail==""){
						alert("담당자 이메일을 입력해주세요");
						return;
					}
				}
			}
			$popup.find("div.layer_popup_body.content_01").css("display","none");
			$popup.find("div.layer_popup_body.content_02").css("display","");
			$(this).css("display","none");
			$popup.find(".layer_popup_btn .btn_pre_1002").css("display","inline-block");
			$popup.find(".layer_popup_btn .btn_save_1002").css("display","inline-block");
		});
		
		
		/** 접수관리 > 신규 등록 > 기술분야 셀렉트 박스 선택 */
		$popup.find(".TechInSelect .TechType").on("click", function(){
			$(".TechSelectHid").css("display","none");
			wp.onClickTechType(this);
		});
		
		wp.onClickTechType = function(target) {
			var tech_type = $(target).val();
			// alert(tech_type);
			$(target).parent().find('.TechSelectHid').css("display","block");
		};
		
		/** 접수관리 > 신규 등록 > 기술분야 셀렉트 박스 펼침 기술 분야 선택 선택 */
		$popup.find(".TechInSelect .TechItem").on("click", function(d1){
			wp.onClickTechItem(this);
		});
		
		wp.onClickTechItem = function(target){
			var type_code = $(target).attr("value");
			var type_name = $(target).text();
			$(target).parent().parent().parent().parent().find(".tech_type01").val(type_code);
			$(target).parent().parent().parent().parent().find(".TechType").text(type_name);
			$(target).parent().parent().find("li").removeClass("on");
			$(target).parent().addClass("on");
			$(target).parent().parent().parent().css("display","none");
			$(target).parents().each(function(idx,ele){
				if ($(ele).hasClass("TechInNameBox")){
					$(ele).data("tech-id",type_code);
				}
			});
			
			$.ajax({
	            type: "post",
	        	url: "/expert/proc/receipt/techitem.do",
			 	data : {"techId": type_code}, 
			 	dataType : "json",
			 	success : function(data) { 
					// data 정보
					// resultCode: S(성공), F(실패)
					switch(data.resultCode){
						case "S":
							wp.setTechItem(target, data.resultList);
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
		
		wp.setTechItem = function(target, list) {
			
			var $techArea=null;
			$(target).parents().each(function(idx,ele){
				if ($(ele).hasClass("TechInNameBox")){
					$(ele).find("a.TechType.TechArea").text("기술 분야 해당 범위를 선택해주세요.");
					$techArea = $(ele).find("ul.TechAreaList");
				}
			});
			$techArea.empty();
			$(list).each(function(idx,item){
				$techArea.append(
					"<li><a href='#none'"+
					"   data-tech-item-id='"+item.techItemId+"'"+
					"   data-tech-ntc-gid='"+item.techNtcGid+"'"+
					"   data-tech-id='"+item.techId+"'"+
					"   value="+item.techItemId+""+
					"   class='TechAreaItem'>"+item.techItemName+
					"</a></li>");
			});
			/** 접수관리 > 신규 등록 > 기술범위 셀렉트 박스 펼침 기술 범위 선택 선택 */
			$techArea.find(".TechAreaItem").off().on("click", function(){
				wp.onClickTechAreaItem(this);
			});
		}
		
		$popup.find("a.techPlus").on("click",function(){
			$(".TechSelectHid").css("display","none");
			var $defaultTech = $popup.find("div.TechInNameBox.default");
			var $newTech=$defaultTech.clone().removeClass("default");

			/** 접수관리 > 신규 등록 > 기술분야 셀렉트 박스 선택 */
			/** 초기화 */
			$newTech.find("a.TechType").text("기술 분야를 선택해주세요.");
			$newTech.find("ul.TechSelecList li.on").removeClass("on");
			$newTech.find("a.TechType.TechArea").text("기술 분야 해당 범위를 선택해주세요.");
			$newTech.find("ul.TechAreaList").empty();
			$newTech.find(".new_com_input").val("");
			/** 초기화 */
			$newTech.find(".TechInSelect .TechType").on("click", function(){
				wp.onClickTechType(this);
			});
			/** 접수관리 > 신규 등록 > 기술분야 셀렉트 박스 펼침 기술 분야 선택 선택 */
			$newTech.find(".TechInSelect .TechItem").on("click", function(d1){
				wp.onClickTechItem(this);
			});
			
			$newTech.find("div.TechInNUM").html("<a href='#none' class='techdelete'>X</a>");
			$newTech.find("div.TechInNUM").find("a.techdelete").on("click",function(){
				$newTech.remove();
			})
			
			$defaultTech.after($newTech);
		})
		
		/** 접수관리 > 신규 등록 > 기술범위 셀렉트 박스 펼침 기술 범위 선택 선택 */
		$popup.find(".TechInSelect .TechAreaItem").on("click", function(){
			wp.onClickTechAreaItem(this);
		});
		
		wp.onClickTechAreaItem = function(target) {
			if(!$(target).parent().hasClass("on")){
				var type_code = $(target).attr("value");
				var type_name = $(target).text();
				$(target).parent().parent().parent().parent().find(".tech_area01").val(type_code);
				$(target).parent().parent().parent().parent().find(".TechType").text(type_name);
				$(target).parent().parent().find("li").removeClass("on");
				$(target).parent().addClass("on");
				$(target).parent().parent().parent().css("display","none");

				$(target).parents().each(function(idx,ele){
					if ($(ele).hasClass("TechInNameBox")){
						$(ele).data("tech-item-id",$(target).data("tech-item-id"));
						$(ele).data("tech-ntc-gid",$(target).data("tech-ntc-gid"));
					}
				});
			}
			
		};
		
		/** 접수관리 > 신규 등록 > 합병신고 신고 사유 체크 박스 */
		$popup.find(".LawSelList .check").on("click", function(){
			if(!$(this).parent().hasClass("checkOn")){
				$(this).parent().addClass("checkOn");
				$(this).parent().find(".lawItem").val("Y");
			}else{
				$(this).parent().removeClass("checkOn");
				$(this).parent().find(".lawItem").val("N");
			}
			
		});
		
		/** 접수관리 > 신규 등록 > 수출 사유 선택 */
		$popup.find(".rsnlList .rsnItem").on("click", function(){
			
			if(!$(this).parent().hasClass("on")){
			
				$(this).parent().parent().find("li").removeClass("on");
				$(this).parent().parent().find(".rsnItemchk").val("N");
				$(this).parent().parent().find(".new_com_input").attr("disabled",true); 
				$(this).parent().parent().find(".new_com_input").val("");
				
				$(this).parent().addClass("on");
				$(this).find(".rsnItemchk").val("Y");
				$(this).find(".new_com_input").removeAttr("disabled"); 
				
				
			}
			
		});
		
		
		/** 접수관리 > 신규 등록 > 대상국 검색 */ 
		$popup.find("#sch_country").on("keyup", function(){
			var sch_country = $(this).val();
			var $ulCountry = $popup.find("ul.sch_list");
			// Ajax 기업 DB 조회 후 sch_compay_preview li 요소 추가 후 display:block;
			if (sch_country.length <= 0) {
				$ulCountry.empty();
				return;
			}
			$(this).parent().find(".excountry_sch_list").css("display","block");
			$.ajax({
	            type: "post",
	        	url: "/expert/proc/receipt/country/list.do",
			 	data : {"conName": sch_country}, 
			 	dataType : "json",
			 	success : function(data) { 
					// data 정보
					// resultCode: S(성공), F(실패)
					switch(data.resultCode){
						case "S":
							wp.setCountryList(data.resultList);
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
		});
		
// /** 접수관리 > 신규 등록 > 대상국 검색 미리보기 대상국 선택 */
// $popup.find(".excountry_sch_box .sch_list_item").on("click", function(){
// var conCode = $(this).data("con-code");
// var conName = $(this).data("con-name");
// // Ajax 기업 DB 조회 기업 정보 호출 후 검색 미리보기 닫기
// $(this).parent().parent().parent().parent().find(".excountry_sch_list").css("display","none");
// $(this).parent().parent().parent().parent().find("#sch_country").val("");
//			
// var excountry_cnt =
// $(this).parent().parent().parent().parent().parent().find("#excountry_cnt").val();
//			
// var add_country =
// "<li class='country_item' data-con-code='"+conCode+"'
// data-con-name='"+conName+"'>"+
// "<div class='country_item_tit'>"+
// "<p class='count_name'>"+conName+"</p>"+
// "<a href='#none' class='country_del'>X</a>"+
// "</div>"+
// "<input type='text' name='buyer' id='buyer"+excountry_cnt+"'
// class='new_com_input' placeholder='매입자를 입력해주세요.' autocomplete='off'>"
// "</li>";
// excountry_cnt = Number(excountry_cnt) +1;
// $(this).parent().parent().parent().parent().parent().find("#excountry_cnt").val(excountry_cnt);
// $(this).parent().parent().parent().parent().parent().find(".excountry_sel_list").append(add_country);
//			
// $(this).parent().parent().parent().parent().parent().find(".excountry_sel_list").css("display","block");
// $(this).parent().parent().parent().parent().parent().find(".excountry_sch_info").css("display","none");
//			
//			
//			
// });
		
		
		/** 접수관리 > 신규 등록 > 대상국 삭제 */
		$(document).on("click",".excountry_sel_list .country_del",function(event){
            var count_cnt = $(this).parent().parent().parent().parent().find("#excountry_cnt").val();
			count_cnt = Number(count_cnt) -1;
			$(this).parent().parent().parent().parent().find("#excountry_cnt").val(count_cnt);
			if(count_cnt=="0"){
				$(this).parent().parent().parent().parent().find(".excountry_sel_list").css("display","none");
				$(this).parent().parent().parent().parent().find(".excountry_sch_info").css("display","block");
			}
			$(this).parent().parent().remove();
			
        });

		/** 접수관리 > 신규 등록 > 관련 안건 검색 */ 
		$popup.find("#sch_link_agd").on("keyup", function(){
			var sch_link_agd = $(this).val();
			var $ul_link_agd = $popup.find("ul.sch_agd_list");
			// Ajax 기업 DB 조회 후 sch_compay_preview li 요소 추가 후 display:block;
			if (link_agd_cnt.length <= 0) {
				$ul_link_agd.empty();
				return;
			}
			$(this).parent().find(".link_agd_box_sch_list").css("display","block");
			
		    $.ajax({
		    	type: "post",
	         	url: "/expert/proc/receipt/agenda/code/list.do",
			  	data : {"agdViewCode": sch_link_agd}, 
			  	dataType : "json",
			  	success : function(data) { 
			 		// data 정보
			 		// resultCode: S(성공), F(실패)
			 		switch(data.resultCode){
			 			case "S":
			 				wp.setLinkAgdList(data.resultList);
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
		});
		
		/** 접수관리 > 신규 등록 > 관련 안건 검색 미리보기 안건 선택 */
// $popup.find(".link_agd_sch_box .link_agd_item").on("click", function(){
// });
		
		
		/** 접수관리 > 신규 등록 > 이전 버튼 클릭 */
		$popup.find(".layer_popup_btn .btn_pre_1002").on("click", function(){
			$popup.find("div.layer_popup_body.content_01").css("display","block");
			$popup.find("div.layer_popup_body.content_02").css("display","none");
			$(this).css("display","none");
			$popup.find(".layer_popup_btn .btn_next_1002").css("display","inline-block");
			$popup.find(".layer_popup_btn .btn_save_1002").css("display","none");
		});
		
		/** 신청서 인쇄 버튼 클릭 이벤트 */
		$popup.find("div.layer_popup_btn a.btn.btn_next.btn_print").on("click", function(){
			// TODO
		});
		
		
		
	
		/** 저장 버튼 클릭 이벤트 */ 
		$popup.find("a.btn_save_1002").on("click", function(){
			// 저장 프로세스 후 팝업 종료
			wp.receiptTechList = [];
			var status = "S"; // S: 성공, F: 실패
			var errorMessage = ""; // 실패사유
			
			/**
			 * 안건명
			 */
			wp.rcptTitle = $("#AgdTitle").val();
			
			/**
			 * 기술 분야
			 */
			$popup.find("div.TechInNameBox").each(function(idx,tech){
				if (status === "F"){
					return;
				}
				var techId = $(tech).data("tech-id");
				if (!techId){
					status = "F";
					errorMessage = "기술 분야를 선택해주세요."
					return;
				}
				var techItemId = $(tech).data("tech-item-id");
				if (!techItemId){
					status = "F";
					errorMessage = "기술 분야 해당 범위를 선택해주세요."
					return;
				}
				var techRcptTechNm = $(tech).find("input[name=rcptTechNm]").val();
				wp.receiptTechList.push({ 
					rcptIdx: 'temp',
					techRcptNumSeq: idx+1,
					techNtcGid: $(tech).data("tech-ntc-gid"),
					techNctCode: techId,
					techUniqId: techItemId,
					techRcptTechNm: (techRcptTechNm == "" ? null : techRcptTechNm)
				});
				console.log(wp.receiptTechList);
			});
			
			/**
			 * 기술형태, 특성
			 */
			wp.receiptData.rcptTechForm = $popup.find(".rcptTechForm").val();
			wp.receiptData.rcptTechQua = $popup.find(".rcptTechQua").val();
			
			/**
			 * 신청 / 신고 / 승인사유
			 */
			switch($popup.find("ul.receipt_type_list li.on").find("a.receipt_type_item").attr("value")){
			case "01":
				wp.receiptData.rcptReason = $popup.find(".rcptReason1").val();
				break;
			case "02":
			case "03":
			case "04":
				break;
			case "05":
				wp.receiptData.rcptReason = $popup.find(".rcptReason1").val();
				break;
			case "06":
				wp.receiptData.rcptReason = $popup.find(".rcptReason2").val();
				break;
			case "07":
				wp.receiptData.rcptReason = $popup.find(".rcptReason1").val();
				break;
			case "08":
				wp.receiptData.rcptReason = $popup.find(".rcptReason1").val();
				break;
			case "09":
				wp.receiptData.rcptReason = $popup.find(".rcptReason1").val();
				break;
			case "10":
				wp.receiptData.rcptReason = $popup.find(".rcptReason1").val();
				break;
			case "11":
				wp.receiptData.rcptReason = $popup.find(".rcptReason1").val();
				break;
			}
			
			/**
			 * 수출사유
			 */
			var reasonExport = $popup.find("ul.rsnlList li.on").find("input[type=text]").val();
			switch($popup.find("ul.rsnlList li.on").find("input[type=text]").attr("id")){
			case "rsn01":
				wp.receiptData.rcptExReasonSale = "Y";
				wp.receiptData.rcptExReasonSCom = reasonExport;
				break;
			case "rsn02":
				wp.receiptData.rcptExReasonTrans = "Y";
				wp.receiptData.rcptExReasonTCom = reasonExport;
				break;
			case "rsn03":
				wp.receiptData.rcptExReasonEtc = "Y";
				wp.receiptData.rcptExReasonECom = reasonExport;
				break;
			}
			
			/**
			 * 수출 예정일
			 */
			wp.rcptExDate = $popup.find("#standate").val();
			if (wp.rcptExDate == null || wp.rcptExDate == "") {
				wp.rcptExDate = $popup.find("#eptDt2").val();
			}
			
			/**
			 * 수출 대상국
			 */
			wp.receiptCountryList = [];
			$popup.find("li.country_item").each(function(idx,country){
				var ctyBuyer = $(country).find("input[name=buyer]").val();
				wp.receiptCountryList.push({
					rcptIdx: 'temp',
					ctyRcptNumSeq: idx+1,
					ctyTargetCountry: $(country).data("con-code"),
					ctyBuyer: (ctyBuyer == '' ? null : ctyBuyer),
				});
			});
			
			/**
			 * 관련 안건
			 */
			wp.receiptLinkAgdList = [];
			$popup.find("li.add_link_item").each(function(idx,agd){
				var agdCode = $(agd).data("agdCode");
				wp.receiptLinkAgdList.push({
					agdCode: agdCode
				});
			});
			if (status === "F"){
				alert(errorMessage);
				return;
			}
			$.ajax({
				anyne:true,
				type:'POST',
				data: JSON.stringify({
					receiptData: wp.receiptData,
					receiptTechList: wp.receiptTechList,
					receiptCountryList: wp.receiptCountryList,
					receiptLinkAgdList: wp.receiptLinkAgdList
				}),
	        	url: "/expert/proc/receipt/save",
				dataType: "json",
				contentType: 'application/json;charset=UTF-8',
				success : function(data) {
					//wp.sendFileData(data.resultData.metaCode);
				},
				error: function(e) {
					alert("ERROR ");
				}
			});
		});
		
		$popup.find("#file_app").change(function(e){
			console.log(e);
			
			wp.appFileArr = [];
			
			$(e.target.files).each(function(index, field){
				
				if(field.size <= 0){
				
					alert(field.name + " : 파일 크기가 0 보다 커야 합니다.");
					return;
				}else{
// files.push(field);
					wp.appFileArr.push(field);
					$popup.find("#file_route_app").val(field.name);
				}
				
			});
		});
		
		$popup.find("#file_off").change(function(e){
			console.log(e);
			
			wp.officalNoticeFileArr = [];
			
			$(e.target.files).each(function(index, field){
				
				if(field.size <= 0){
					
					alert(field.name + " : 파일 크기가 0 보다 커야 합니다.");
					return;
				}else{
// files.push(field);
					wp.officalNoticeFileArr.push(field);
					$popup.find("#file_route_off").val(field.name);
				}
				
			});
		});

		
		$popup.find("#file_exp").change(function(e){
			console.log(e);
			
			wp.expFileArr = [];
			
			$(e.target.files).each(function(index, field){
				
				if(field.size <= 0){
				
					alert(field.name + " : 파일 크기가 0 보다 커야 합니다.");
					return;
				}else{
// files.push(field);
					wp.expFileArr.push(field);
					$popup.find("#file_route_exp").val(field.name);
				}
				
			});
		});

		
		$popup.find("#file_exp_c").change(function(e){
			console.log(e);
			
			wp.expChangeFileArr = [];
			
			$(e.target.files).each(function(index, field){
				
				if(field.size <= 0){
				
					alert(field.name + " : 파일 크기가 0 보다 커야 합니다.");
					return;
				}else{
// files.push(field);
					wp.expChangeFileArr.push(field);
					$popup.find("#file_route_exp_c").val(field.name);
				}
				
			});
		});
	};
	
	wp.setCountryList = function(list) {
		var $ulCountry = $popup.find("ul.sch_list");
		var liHtml = "";
		
		$ulCountry.empty();
		if (list.length === 0) {
			return;
		}
		for (var ent of list) {
			liHtml += "<li>";
			liHtml += "<a href='#none' data-con-code='"+ent.conCode+"' data-con-name='"+ent.conName+"' class='sch_list_item'>"+ent.conName+"</a>";
			liHtml += "</li>";
		}
		
		$ulCountry.html(liHtml);

		/** 접수관리 > 신규 등록 > 대상국 검색 미리보기 대상국 선택 */
		$ulCountry.find("li a.sch_list_item").on("click", function(){
			var conCode = $(this).data("con-code");
			var conName = $(this).data("con-name");
			// Ajax 기업 DB 조회 기업 정보 호출 후 검색 미리보기 닫기
			$(this).parent().parent().parent().parent().find(".excountry_sch_list").css("display","none");
			$(this).parent().parent().parent().parent().find("#sch_country").val("");
			
			var excountry_cnt = $(this).parent().parent().parent().parent().parent().find("#excountry_cnt").val();
			
			var add_country =
				"<li class='country_item' data-con-code='"+conCode+"' data-con-name='"+conName+"'>"+
					"<div class='country_item_tit'>"+
						"<p class='count_name'>"+conName+"</p>"+
						"<a href='#none' class='country_del'>X</a>"+
					"</div>"+
					"<input type='text' name='buyer' id='buyer"+excountry_cnt+"' class='new_com_input' placeholder='매입자를 입력해주세요.' autocomplete='off'>"
				"</li>";
			excountry_cnt = Number(excountry_cnt) +1;
			$(this).parent().parent().parent().parent().parent().find("#excountry_cnt").val(excountry_cnt); 
			$(this).parent().parent().parent().parent().parent().find(".excountry_sel_list").append(add_country);
			
			$(this).parent().parent().parent().parent().parent().find(".excountry_sel_list").css("display","block");
			$(this).parent().parent().parent().parent().parent().find(".excountry_sch_info").css("display","none");
		});
	};
	
	
	wp.setLinkAgdList = function(list) {
		var $ulAgd = $popup.find("ul.sch_agd_list");
		var liHtml = "";
		
		$ulAgd.empty();
		if (list.length === 0) {
			return;
		}
		for (var ent of list) {
			liHtml += "<li>";
			liHtml += "<a href='#none' data-agd-code='"+ent.agdCode+"' data-agd-view-code='"+ent.agdViewCode+"' class='link_agd_item'>"+ent.agdViewCode+"</a>";
			liHtml += "</li>";
		}
		
		$ulAgd.html(liHtml);
		
		/** 접수관리 > 신규 등록 > 안건 검색 미리보기 안건 선택 */
		$ulAgd.find("li a.link_agd_item").on("click", function(){
			var agdCode = $(this).data("agd-code");
			var agdViewCode = $(this).data("agd-view-code");
			// Ajax 기업 DB 조회 기업 정보 호출 후 검색 미리보기 닫기
			$(this).parent().parent().parent().parent().find(".link_agd_box_sch_list").css("display","none");
			$(this).parent().parent().parent().parent().find("#sch_link_agd").val("");
			
			var link_agd_cnt = $(this).parent().parent().parent().parent().parent().find("#link_agd_cnt").val();
			
			var add_link_agd =
				"<li class='add_link_item' data-agd-code='"+agdCode+"' data-agd-view-code='"+agdViewCode+"'>"+
					"<div class='link_agd_item_tit'>"+
						"<p class='link_agd_name'>"+agdViewCode+"</p>"+
						"<a href='#none' class='add_link_del'>X</a>"+
					"</div>"+
				"</li>";
			link_agd_cnt = Number(link_agd_cnt) +1;
			$(this).parent().parent().parent().parent().parent().find("#link_agd_cnt").val(link_agd_cnt); 
			$(this).parent().parent().parent().parent().parent().find(".link_agd_sel_list").append(add_link_agd);
			
			$(this).parent().parent().parent().parent().parent().find(".link_agd_sel_list").css("display","block");
			$(this).parent().parent().parent().parent().parent().find(".link_agd_sch_info").css("display","none");

			/** 접수관리 > 신규 등록 > 관련 안건 삭제 */
			$(document).on("click",".link_agd_sel_list .add_link_del",function(event){
				link_agd_cnt = Number(link_agd_cnt) -1;
				$(this).parent().parent().parent().parent().find("#link_agd_cnt").val(link_agd_cnt);
				if(link_agd_cnt=="0"){
					$(this).parent().parent().parent().parent().find(".link_agd_sel_list").css("display","none");
					$(this).parent().parent().parent().parent().find(".link_agd_sch_info").css("display","block");
				}
				$(this).parent().parent().remove();
				
	        });
		});
	};
	
	wp.sendFileData = function(metaCode) {
		// Formdata 생성
		var formData = new FormData();
		formData.append("metaCode",metaCode);
		
		// 파일 추가
		// fileArr: uploadForm.js { fileArr }
		if (wp.appFileArr.length === 0 
				&& wp.officalNoticeFileArr.length === 0 
				&& wp.expFileArr.length === 0 
				&& wp.expChangeFileArr.length === 0 
				&& fileArr.length === 0) {
			alert("접수 등록이 완료되었습니다.(파일미등록)");
			location.href="/expert/receiptList.do";
			return;
		}
		var fileDepth = $("#file-info").data("depth");
		var fileIdx = 0;
		// 신청서 파일
		$(wp.appFileArr).each(function(idx, file){
			formData.append(`fileList[${fileIdx}].file`, file);
			formData.append(`fileList[${fileIdx}].depth`, fileDepth);
			formData.append(`fileList[${fileIdx}].type`, $("#file-info").data("type2"));
			formData.append(`fileList[${fileIdx}].id`, fileIdx + 1);
			fileIdx++;
		});
		// 공문 파일
		$(wp.officalNoticeFileArr).each(function(idx, file){
            formData.append(`fileList[${fileIdx}].file`, file);
            formData.append(`fileList[${fileIdx}].depth`, fileDepth);
            formData.append(`fileList[${fileIdx}].type`, $("#file-info").data("type1"));
            formData.append(`fileList[${fileIdx}].id`, fileIdx + 1);
            fileIdx++;
        });
		// 국가핵심기술 설명자료 파일
		$(wp.expFileArr).each(function(idx, file){
			formData.append(`fileList[${fileIdx}].file`, file);
			formData.append(`fileList[${fileIdx}].depth`, fileDepth);
			formData.append(`fileList[${fileIdx}].type`, $("#file-info").data("type4"));
			formData.append(`fileList[${fileIdx}].id`, fileIdx + 1);
			fileIdx++;
		});
		// 변경 국가핵심기술 설명자료 파일
		$(wp.expChangeFileArr).each(function(idx, file){
			formData.append(`fileList[${fileIdx}].file`, file);
			formData.append(`fileList[${fileIdx}].depth`, fileDepth);
			formData.append(`fileList[${fileIdx}].type`, $("#file-info").data("type5"));
			formData.append(`fileList[${fileIdx}].id`, fileIdx + 1);
			fileIdx++;
		});
		// 첨부서류
		$(fileArr).each(function(idx, file){
			formData.append(`fileList[${fileIdx}].file`, file);
			formData.append(`fileList[${fileIdx}].depth`, fileDepth);
			formData.append(`fileList[${fileIdx}].type`, $("#file-info").data("type3"));
			formData.append(`fileList[${fileIdx}].id`, fileIdx + 1);
			fileIdx++;
		});
        $.ajax({
            type: "POST",
        	url: "/expert/proc/receipt/save/file.do",
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
						alert("접수 등록이 완료되었습니다.(파일등록)");
						location.href="/expert/receiptList.do";
						break;
					case 'F':
						alert('파일 저장 중 오류 발생');
						break;
				}
			},
            error : function(requestObject, error, errorThrown){
               	if(error === "error"){
					alert("파일 업로드에 실패하였습니다.\n파일이 열려있는지 확인하시고 다시 시도해주세요.");
					wp.deleteMeta(metaCode);
				}
				
            }
		});
	}
	
	wp.deleteMeta = function(metaCode) {
		$.ajax({
			type : "POST", 
			url : "/expert/proc/receipt/delete.do", 
		 	data : {"metaCode": metaCode}, 
		 	dataType : "json",
		 	success : function(data) { 
				// data 정보
				// resultCode: S(성공), F(실패)
				switch(data.resultCode){
					case "S":
						// 팝업 재 호출
						console.log("[성공] 파일 첨부 실패로 인한 메타 데이터 삭제");
						break;
					case "F":
						console.log("[실패] 파일 첨부 실패로 인한 메타 데이터 삭제"); 
						break;
				}
			},
		 	error : function() { 
		 		console.log("통신장애"); 
		 	} 
		});
	}

	// Step 1 데이터 검증
	// Return value (boolean) : true(성공) / false(실패)
	var dataVerifyStep1 = function(){
		// 데이터 검증
		
		return true;
	};
	
	return wp;
}();
	
/** ********** 접수내역 상세 팝업 Function *********** */
var ReceiptViewPopup = function(){
	var vp = {};
	
	var $popup = null;
	var popupUrl = '';
	
	var rcptIdx = '';
	var viewerType = '';
	var agendaCnt = 0;
	
	var isDirty = false;
	var comment = '';
	var currStatus = '';
	var nextStatus = '';
	
	var STATUS_READY = 'AP';
	var STATUS_COMPLETE = 'RC';
	var STATUS_COMPLETE_CANCEL = 'AP';
	var STATUS_RETURN = 'RJ';
	var STATUS_RETURN_CANCEL = 'AP';
	
	/** 팝업 종료 */
	vp.close = function(){
		comn.popupClose();
		
		// 변경된 데이터 있을 경우
		if (isDirty) {
			// 화면 재 호출
			location.reload();
		}
	};
	
	/** 팝업 새로고침 */
	vp.refresh = function(){
		if (!popupUrl){
			console.log("팝업 URL이 존재하지 않습니다.");
			return;
		}
		isDirty = true;
		
		comn.popupOpen(popupUrl, createEvent);
	};
	
	/** 화면에서 팝업 호출 */
	vp.open = function(rcptIdxParam, viewerType){
		if (!rcptIdxParam){
			console.log("잘못된 접근입니다.");
			return;
		}
		isDirty = false;
		rcptIdx = rcptIdxParam;
		viewerType = viewerType;
		popupUrl = "/expert/popup/receipt/detail.do?rcptIdx="+rcptIdx+"&viewerType="+viewerType;
		
		comn.popupOpen(popupUrl, createEvent);
	};
	
	/** 팝업 기능 생성 */
	var createEvent = function(popupElement){
		$popup = popupElement;
		agendaCnt = Number($("#agendaCnt").val());
		
		vp.setInitAuth();
	
		/** 닫기 버튼 클릭 이벤트 */
		$popup.find("div.layer_popup_btn a.btn_close").off().on("click",function(){
			vp.close();
		});
	
		/** 열람 및 의견 작성 권한 부여 분야 클릭 이벤트 */
		$popup.find("div.work_depth ul.work_dept_list li").off().on("click",function(){
			if ($(this).hasClass("dept_on")) {
				$(this).removeClass("dept_on");
			} else {
				$(this).addClass("dept_on");
			}
		});
		
		/** 열람 및 의견작성 권한 저장 버튼 클릭 이벤트 */
		$popup.find("div.work_depth div.work_tit a.depth_save_btn").off().on("click",function(){
			// 권한 설정 검증
			var isChecked = false;
			var auths = [];
			$popup.find("div.work_depth ul.work_dept_list li").each(function(idx,auth){
				if ($(auth).hasClass("dept_on")){
					isChecked = true;
					auths.push($(auth).data("techtype"));
				}
			});
			
			if (!isChecked){
				alert("1개 이상의 권한을 설정하세요.");
				vp.rollBackAuth();
				return;
			}
			
			vp.setAuth(auths);
		});
	
		/** 의견 작성 저장 버튼 클릭 이벤트 */
		$popup.find("div.work_comment a.comment_btn").off().on("click",function(){
			comment = $popup.find("#comment").val();
			// 의견 작성 여부 확인
			if (!comment) {
				alert("검토의견을 작성해주세요.");
				return;
			}
			
			vp.setComment();
		});
		
		/**삭제 이벤트  */
		$popup.find("div.layer_popup_btn a.btn_del:not(.btn_close)").off().on("click",function(){
			var isOk = false;
			isOk = confirm("\""+rcptIdx + "\"건을 삭제 하시겠습니까?");
			if(isOk){
			  vp.setDelete();	
			}
		});
			
			
		
		
		/** 반려/반려회수 버튼 클릭 이벤트 */
		$popup.find("div.layer_popup_btn a.btn_next:not(.btn_close)").off().on("click",function(){
			currStatus = $(this).data("rcpt-status");
			nextStatus = "";
			var isOK = false;
			switch(currStatus) {
				case STATUS_READY:
					// 반려 처리
					isOK = confirm("\""+rcptIdx + "\"건을 반려 처리 하시겠습니까?");
					nextStatus = STATUS_RETURN;
					break;
				case STATUS_RETURN:
					// 반려회수 처리
					isOK = confirm("\""+rcptIdx + "\"건을 반려 회수 하시겠습니까?");
					nextStatus = STATUS_RETURN_CANCEL;
					break;
			}
			if (isOK) {
				vp.setHistory();
			}
		});
		
		/** 승인/승인회수 버튼 클릭 이벤트 */
		$popup.find("div.layer_popup_btn a.btn_save").off().on("click",function(){
			currStatus = $(this).data("rcpt-status");
			nextStatus = "";
			var isOK = false;
			
			// 안건 유무 확인
			if (agendaCnt > 0) {
				// 안건이 있으면 회수 불가
				alert("\""+rcptIdx + "\"건은 검토요청이 완료되어 회수할 수 없습니다.");
				return;
			}
			
			switch(currStatus) {
				case STATUS_READY:
					// 승인 처리
					isOK = confirm("\""+rcptIdx + "\"건을 승인 처리 하시겠습니까?");
					nextStatus = STATUS_COMPLETE;
					break;
				case STATUS_COMPLETE:
					// 승인회수 처리
					isOK = confirm("\""+rcptIdx + "\"건을 승인 회수 하시겠습니까?");
					nextStatus = STATUS_COMPLETE_CANCEL;
					break;
			}
			if (isOK) {
				vp.setHistory();
			}
		});
		
		$popup.find("div.info_section.file_section p a").off().on("click", function(){
			var filePath = $(this).data("file-path")
			if (filePath === "LOCAL") {
				alert("서버에서 등록된 파일만 조회할 수 있습니다.");
				return;
			}
			filePath += $(this).data("file-name");
			var viewerPath = $(this).data("viewer-path");
			var fid = $(this).data("file-key");
			// HTML로 변환
			var convertType = "0";
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
	};
	
	
	/** 초기 권한 상태 체크 복원 */
	vp.rollBackAuth = function(){
		$popup.find("div.work_depth ul.work_dept_list li").each(function(idx, auth){
			if ($(auth).hasClass("ori_dept_on")){
				$(auth).addClass("dept_on");
			}
		});
	};
	
	/** 초기 권한에 추가 클래스(롤백 시 사용할 클래스) */
	vp.setInitAuth = function(){
		$popup.find("div.work_depth ul.work_dept_list li").each(function(idx, auth){
			if ($(auth).hasClass("dept_on")){
				$(auth).addClass("ori_dept_on");
			}
		});
	};
	
	/** 권한 설정 */
	vp.setAuth = function(auths){
		var formData = new FormData();
		
		formData.append('rcptIdx', rcptIdx);
		// 선택된 분야 확인
		$(auths).each(function(idx,tech){
			formData.append('techList['+idx+']', tech);
		});
		$.ajax({
            type: "post",
        	url: "/expert/proc/receipt/competence/save.do",
            data: formData,
            dataType: 'json',
            processData: false,
            contentType: false,
		 	success : function(data) { 
				// data 정보
				// resultCode: S(성공), F(실패)
				switch(data.resultCode){
					case "S":
						alert("권한이 저장되었습니다.");
						vp.refresh();
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
	};
	
	/** 의견 작성 */
	vp.setComment = function() {
		$.ajax({
			type : "POST", 
			url : "/expert/proc/receipt/comment/write.do", 
		 	data : {"rcptIdx": rcptIdx, "comment": comment}, 
		 	dataType : "json",
		 	success : function(data) { 
				// data 정보
				// resultCode: S(성공), F(실패)
				switch(data.resultCode){
					case "S":
						// 팝업 재 호출
						alert("의견이 작성되었습니다.");
						vp.refresh();
						break;
					case "F":
		 				alert("Failed"); 
						break;
				}
			},
		 	error : function() { 
		 		alert("통신장애"); 
		 	} 
		});
	};

	/** 삭제  */
    vp.setDelete = function(){
		$.ajax({
				type : "POST", 
				url : "/expert/proc/receipt/setDelete.do", 
			 	data : {"rcptIdx": rcptIdx}, 
			 	dataType : "json",
			 	success : function(data) { 
					// data 정보
					// resultCode: S(성공), F(실패)
					switch(data.resultCode){
						case "S":
							// 팝업 재 호출
							alert("삭제 되었니다.");
						    vp.close();
							break;
						case "F":
			 				alert("Failed"); 
							break;
					}
				},
			 	error : function() { 
			 		alert("통신장애"); 
			 	} 
			});
	};






	/** 접수 히스토리 및 상태 변경 */
	vp.setHistory = function() {
		$.ajax({
			type : "POST", 
			url : "/expert/proc/receipt/status/change.do", 
		 	data : {"rcptIdx": rcptIdx, "currStatus": currStatus, "nextStatus": nextStatus}, 
		 	dataType : "json",
		 	success : function(data) { 
				// data 정보
				// resultCode: S(성공), F(실패)
				switch(data.resultCode){
					case "S":
						// 팝업 재 호출
						alert("접수상태가 변경되었습니다.");
						vp.refresh();
						break;
					case "F":
		 				alert("Failed"); 
						break;
				}
			},
		 	error : function() { 
		 		alert("통신장애"); 
		 	} 
		});
	};
	
	return vp;
}();