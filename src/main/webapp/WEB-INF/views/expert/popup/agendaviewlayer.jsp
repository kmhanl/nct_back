<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <div id="Dimmed_Layer_Warpper" class="Dimmed_Layer_Warpper">
		<div id="Layer_Content_Warpper" class="Layer_Content_Warpper Layer_Content_1001">
        	<div class="layer_popup_tit">
				<h1 class="layer_tit">안건 상세 보기</h1>
				<a href="javascript:void(0);" class="layer_closer"></a>
			</div>
			<div class="layer_popup_body content_01">
				<div class="detail_info">
               		<div class="receipt_t_type">
						<!--접수 분야 : 시작 kaits_receipt RCPT_TYPE_CODE // 01:여부판정 02:사전검토 03:수출신고 04:수출승인 05:해외인수·합병 사전검토 06:해외인수·합병 신고 07:해외인수·합병 승인 08:지정 09:변경 10:해제 11:기타-->
						<p class="type_icon">
							<c:if test="${agdData.rcptTypeCode eq '01' }">
								<svg class="svg-inline--fa fa-balance-scale fa-w-20" aria-hidden="true" data-prefix="fas" data-icon="balance-scale" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" data-fa-i2svg=""><path fill="currentColor" d="M256 336h-.02c0-16.18 1.34-8.73-85.05-181.51-17.65-35.29-68.19-35.36-85.87 0C-2.06 328.75.02 320.33.02 336H0c0 44.18 57.31 80 128 80s128-35.82 128-80zM128 176l72 144H56l72-144zm511.98 160c0-16.18 1.34-8.73-85.05-181.51-17.65-35.29-68.19-35.36-85.87 0-87.12 174.26-85.04 165.84-85.04 181.51H384c0 44.18 57.31 80 128 80s128-35.82 128-80h-.02zM440 320l72-144 72 144H440zm88 128H352V153.25c23.51-10.29 41.16-31.48 46.39-57.25H528c8.84 0 16-7.16 16-16V48c0-8.84-7.16-16-16-16H383.64C369.04 12.68 346.09 0 320 0s-49.04 12.68-63.64 32H112c-8.84 0-16 7.16-16 16v32c0 8.84 7.16 16 16 16h129.61c5.23 25.76 22.87 46.96 46.39 57.25V448H112c-8.84 0-16 7.16-16 16v32c0 8.84 7.16 16 16 16h416c8.84 0 16-7.16 16-16v-32c0-8.84-7.16-16-16-16z"></path></svg>
							</c:if>
							<c:if test="${agdData.rcptTypeCode eq '02' }">
								<svg class="svg-inline--fa fa-book-reader fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="book-reader" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M352 96c0-53.02-42.98-96-96-96s-96 42.98-96 96 42.98 96 96 96 96-42.98 96-96zM233.59 241.1c-59.33-36.32-155.43-46.3-203.79-49.05C13.55 191.13 0 203.51 0 219.14v222.8c0 14.33 11.59 26.28 26.49 27.05 43.66 2.29 131.99 10.68 193.04 41.43 9.37 4.72 20.48-1.71 20.48-11.87V252.56c-.01-4.67-2.32-8.95-6.42-11.46zm248.61-49.05c-48.35 2.74-144.46 12.73-203.78 49.05-4.1 2.51-6.41 6.96-6.41 11.63v245.79c0 10.19 11.14 16.63 20.54 11.9 61.04-30.72 149.32-39.11 192.97-41.4 14.9-.78 26.49-12.73 26.49-27.06V219.14c-.01-15.63-13.56-28.01-29.81-27.09z"></path></svg>
							</c:if>
							<c:if test="${agdData.rcptTypeCode eq '03' }">
								<svg class="svg-inline--fa fa-pen-nib fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="pen-nib" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M136.6 138.79a64.003 64.003 0 0 0-43.31 41.35L0 460l14.69 14.69L164.8 324.58c-2.99-6.26-4.8-13.18-4.8-20.58 0-26.51 21.49-48 48-48s48 21.49 48 48-21.49 48-48 48c-7.4 0-14.32-1.81-20.58-4.8L37.31 497.31 52 512l279.86-93.29a64.003 64.003 0 0 0 41.35-43.31L416 224 288 96l-151.4 42.79zm361.34-64.62l-60.11-60.11c-18.75-18.75-49.16-18.75-67.91 0l-56.55 56.55 128.02 128.02 56.55-56.55c18.75-18.75 18.75-49.15 0-67.91z"></path></svg>
							</c:if>
							<c:if test="${agdData.rcptTypeCode eq '04' }">
							</c:if>
							<c:if test="${agdData.rcptTypeCode eq '05' }">
								<svg class="svg-inline--fa fa-globe fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="globe" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 496 512" data-fa-i2svg=""><path fill="currentColor" d="M336.5 160C322 70.7 287.8 8 248 8s-74 62.7-88.5 152h177zM152 256c0 22.2 1.2 43.5 3.3 64h185.3c2.1-20.5 3.3-41.8 3.3-64s-1.2-43.5-3.3-64H155.3c-2.1 20.5-3.3 41.8-3.3 64zm324.7-96c-28.6-67.9-86.5-120.4-158-141.6 24.4 33.8 41.2 84.7 50 141.6h108zM177.2 18.4C105.8 39.6 47.8 92.1 19.3 160h108c8.7-56.9 25.5-107.8 49.9-141.6zM487.4 192H372.7c2.1 21 3.3 42.5 3.3 64s-1.2 43-3.3 64h114.6c5.5-20.5 8.6-41.8 8.6-64s-3.1-43.5-8.5-64zM120 256c0-21.5 1.2-43 3.3-64H8.6C3.2 212.5 0 233.8 0 256s3.2 43.5 8.6 64h114.6c-2-21-3.2-42.5-3.2-64zm39.5 96c14.5 89.3 48.7 152 88.5 152s74-62.7 88.5-152h-177zm159.3 141.6c71.4-21.2 129.4-73.7 158-141.6h-108c-8.8 56.9-25.6 107.8-50 141.6zM19.3 352c28.6 67.9 86.5 120.4 158 141.6-24.4-33.8-41.2-84.7-50-141.6h-108z"></path></svg>
							</c:if>
							<c:if test="${agdData.rcptTypeCode eq '06' }">
								<svg class="svg-inline--fa fa-at fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="at" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M256 8C118.941 8 8 118.919 8 256c0 137.059 110.919 248 248 248 48.154 0 95.342-14.14 135.408-40.223 12.005-7.815 14.625-24.288 5.552-35.372l-10.177-12.433c-7.671-9.371-21.179-11.667-31.373-5.129C325.92 429.757 291.314 440 256 440c-101.458 0-184-82.542-184-184S154.542 72 256 72c100.139 0 184 57.619 184 160 0 38.786-21.093 79.742-58.17 83.693-17.349-.454-16.91-12.857-13.476-30.024l23.433-121.11C394.653 149.75 383.308 136 368.225 136h-44.981a13.518 13.518 0 0 0-13.432 11.993l-.01.092c-14.697-17.901-40.448-21.775-59.971-21.775-74.58 0-137.831 62.234-137.831 151.46 0 65.303 36.785 105.87 96 105.87 26.984 0 57.369-15.637 74.991-38.333 9.522 34.104 40.613 34.103 70.71 34.103C462.609 379.41 504 307.798 504 232 504 95.653 394.023 8 256 8zm-21.68 304.43c-22.249 0-36.07-15.623-36.07-40.771 0-44.993 30.779-72.729 58.63-72.729 22.292 0 35.601 15.241 35.601 40.77 0 45.061-33.875 72.73-58.161 72.73z"></path></svg>
							</c:if>
							<c:if test="${agdData.rcptTypeCode eq '07' }">
								<svg class="svg-inline--fa fa-search fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="search" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M505 442.7L405.3 343c-4.5-4.5-10.6-7-17-7H372c27.6-35.3 44-79.7 44-128C416 93.1 322.9 0 208 0S0 93.1 0 208s93.1 208 208 208c48.3 0 92.7-16.4 128-44v16.3c0 6.4 2.5 12.5 7 17l99.7 99.7c9.4 9.4 24.6 9.4 33.9 0l28.3-28.3c9.4-9.4 9.4-24.6.1-34zM208 336c-70.7 0-128-57.2-128-128 0-70.7 57.2-128 128-128 70.7 0 128 57.2 128 128 0 70.7-57.2 128-128 128z"></path></svg>
							</c:if>
							<c:if test="${agdData.rcptTypeCode eq '08' }">
								<svg class="svg-inline--fa fa-bullseye fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="bullseye" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M256 72c101.689 0 184 82.295 184 184 0 101.689-82.295 184-184 184-101.689 0-184-82.295-184-184 0-101.689 82.295-184 184-184m0-64C119.033 8 8 119.033 8 256s111.033 248 248 248 248-111.033 248-248S392.967 8 256 8zm0 184c35.29 0 64 28.71 64 64s-28.71 64-64 64-64-28.71-64-64 28.71-64 64-64m0-64c-70.692 0-128 57.308-128 128s57.308 128 128 128 128-57.308 128-128-57.308-128-128-128z"></path></svg>
							</c:if>
							<c:if test="${agdData.rcptTypeCode eq '09' }">
								<svg class="svg-inline--fa fa-bullseye fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="bullseye" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M256 72c101.689 0 184 82.295 184 184 0 101.689-82.295 184-184 184-101.689 0-184-82.295-184-184 0-101.689 82.295-184 184-184m0-64C119.033 8 8 119.033 8 256s111.033 248 248 248 248-111.033 248-248S392.967 8 256 8zm0 184c35.29 0 64 28.71 64 64s-28.71 64-64 64-64-28.71-64-64 28.71-64 64-64m0-64c-70.692 0-128 57.308-128 128s57.308 128 128 128 128-57.308 128-128-57.308-128-128-128z"></path></svg>
							</c:if>
							<c:if test="${agdData.rcptTypeCode eq '10' }">
								<svg class="svg-inline--fa fa-bullseye fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="bullseye" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M256 72c101.689 0 184 82.295 184 184 0 101.689-82.295 184-184 184-101.689 0-184-82.295-184-184 0-101.689 82.295-184 184-184m0-64C119.033 8 8 119.033 8 256s111.033 248 248 248 248-111.033 248-248S392.967 8 256 8zm0 184c35.29 0 64 28.71 64 64s-28.71 64-64 64-64-28.71-64-64 28.71-64 64-64m0-64c-70.692 0-128 57.308-128 128s57.308 128 128 128 128-57.308 128-128-57.308-128-128-128z"></path></svg>
							</c:if>
							<c:if test="${agdData.rcptTypeCode eq '11' }">
								<svg class="svg-inline--fa fa-bullseye fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="bullseye" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M256 72c101.689 0 184 82.295 184 184 0 101.689-82.295 184-184 184-101.689 0-184-82.295-184-184 0-101.689 82.295-184 184-184m0-64C119.033 8 8 119.033 8 256s111.033 248 248 248 248-111.033 248-248S392.967 8 256 8zm0 184c35.29 0 64 28.71 64 64s-28.71 64-64 64-64-28.71-64-64 28.71-64 64-64m0-64c-70.692 0-128 57.308-128 128s57.308 128 128 128 128-57.308 128-128-57.308-128-128-128z"></path></svg>
							</c:if>
						</p>
						<p class="type_tit">${agdData.rcptTypeCodeName}</p>
						<!-- 접수 분야 : 끝-->
					</div>
               		<div class="receipt_num_box">
               			<p class="info_labrl">접수번호</p>
               			<p class="receipt_num_item">${agdData.rcptCode}</p>
               			<!-- kaits_receipt RCPT_IDX-->
               		</div>
               		<div class="receipt_date_box">
               			<p class="info_labrl">접수일</p>
               			<p class="receipt_date_item">${agdData.agdStatusLastStr}</p>
               			<!-- kaits_receipt RCPT_REG_DATE -->
               		</div>
               		<div class="receipt_com_box">
               			<p class="info_labrl">대상기업</p>
               			<p class="receipt_com_item">${agdData.cpnNm}</p>
               			<!-- kaits_receipt RCPT_COM_TYPE컬럼 타입이 M, N일경우 RCPT_COMPANY_NM 출력 F일경우 해당사항업음 문구 출력 -->
               		</div>
               	</div>
               	<div class="detail_content">
               		<c:if test="${agdData.rcptComCode ne null}">
	                	<h2 class="info_tit">신청인 정보</h2>
	                	<div class="receipt_company_info" style="height:auto;border-bottom:0;">
	                		<div class="info_section">
	                			<div class="section_box_03 comname">
		                			<p class="section_label">기관명</p>
		                			<p class="section_item">${agdData.cpnNm}</p>
	                			</div>
	                			<div class="section_box_03 comceo">
		                			<p class="section_label">대표명</p>
		                			<p class="section_item">${agdData.cpnCeo}</p>
	                			</div>
	                			<div class="section_box_03 comnum">
		                			<p class="section_label">사업자등록번호</p>
		                			<p class="section_item">${agdData.cpnSNo}</p>
	                			</div>
	                		</div>
	                		<div class="info_section">
	                			<div class="section_box_03 comadd">
		                			<p class="section_label">본사 소재지</p>
		                			<p class="section_item">(${agdData.cpnBZip}) ${agdData.cpnBAdd1} ${agdData.cpnBAdd2}</p>
	                			</div>
	                			<div class="section_box_03 comphone">
		                			<p class="section_label">본사전화번호</p>
		                			<p class="section_item">${agdData.cpnBPhone1}-${agdData.cpnBPhone2}-${agdData.cpnBPhone3}</p>
	                			</div>
	                			
	                		</div>
	                		<div class="info_section">
	                			<div class="section_box_03 comadd">
		                			<p class="section_label">사업장 소재지</p>
		                			<p class="section_item">(${agdData.cpnSZip}) ${agdData.cpnSAdd1} ${agdData.cpnSAdd1}</p>
	                			</div>
	                			<div class="section_box_03 comphone">
		                			<p class="section_label">본사전화번호</p>
		                			<p class="section_item">${agdData.cpnSPhone1}-${agdData.cpnSPhone2}-${agdData.cpnSPhone3}</p>
	                			</div>
	                		</div>
	                		<div class="info_section">
	                			<div class="section_box_03 comadd" style="border-right:0;">
		                			<p class="section_label">담당자</p>
		                			<p class="section_item">${agdData.cpnPNm } ${agdData.cpnPPosition } | ${agdData.cpnPDept }</p>
		                			<p class="section_item">${agdData.cpnPPhone1 }-${agdData.cpnPPhone2 }-${agdData.cpnPPhone3 } | ${agdData.cpnPMobile1 }-${agdData.cpnPMobile2 }-${agdData.cpnPMobile3 } | ${agdData.cpnPEmail }</p>
	                			</div>
	                		</div>
	                	</div>
               		</c:if>
               		<h2 class="info_tit">신청 내용</h2>
	                	<div class="receipt_info">
	                		<%-- <div class="info_section">
	                			<div class="section_box_03 default">
		                			<p class="section_label">기술명칭</p>
		                			<p class="section_item">
		                				<ul>
		                				<c:forEach items="${receiptTechList }" var="rcptTech" varStatus="status">
		                					<c:if test="${status.index ne 0 }"></c:if>
		                					<li>[${rcptTech.techName}]:${ rcptTech.techRcptTechNm }(${ rcptTech.techItemName })</li>
		                				</c:forEach>
		                				</ul>
		                			</p>
		                		</div>
	                		</div> --%>
	                		<div class="info_section">
	                			<div class="section_box_03 default">
		                			<p class="section_label">기술 형태</p>
		                			<p class="section_item" style="white-space:pre-line;">${agdData.rcptTechForm}</p>
	                			</div>
	                		</div>
	                		<c:if test="${agdData.rcptTypeCode eq '01' or agdData.rcptTypeCode eq '05' or agdData.rcptTypeCode eq '06' or agdData.rcptTypeCode eq '07'}">
	                		<div class="info_section">
	                			<div class="section_box_03 default">
		                			<p class="section_label">기술 특성</p>
		                			<p class="section_item" style="white-space:pre-line;"><c:out value="${agdData.rcptTechQua}"></c:out></p>
	                			</div>
	                		</div>
	                		</c:if>
	                		<c:if test="${agdData.rcptTypeCode eq '01' or agdData.rcptTypeCode eq '05' or agdData.rcptTypeCode eq '07' or agdData.rcptTypeCode eq '08'  or agdData.rcptTypeCode eq '09'  or agdData.rcptTypeCode eq '10'  or agdData.rcptTypeCode eq '11'}">
		                		<div class="info_section">
		                			<div class="section_box_03 default">
		                				<c:if test="${agdData.rcptTypeCode eq '01' or agdData.rcptTypeCode eq '05' or agdData.rcptTypeCode eq '08'  or agdData.rcptTypeCode eq '09'  or agdData.rcptTypeCode eq '10'  or agdData.rcptTypeCode eq '11'}">
			                				<p class="section_label"">신청 사유</p>
			                			</c:if>
			                			<c:if test="${agdData.rcptTypeCode eq '07'}">
			                				<p class="section_label"">승인 신청 사유</p>
			                			</c:if>
			                			<p class="section_item" style="white-space:pre-line;">${agdData.rcptReason}</p>
		                			</div>
		                		</div>
	                		</c:if>
	                		<c:if test="${agdData.rcptTypeCode eq '06'}">
		                		<div class="info_section">
		                			<div class="section_box_03 default">
			                			<p class="section_label">신고사유</p>
			                			<p class="section_item" style="white-space:pre-line;">${agdData.rcptReason}</p>
			                			<ul class="section_sub_list">
		                					<li class="on">${agdData.rcptLaw01 }</li>
		                					<li>${agdData.rcptLaw02 }</li>
		                					<li>${agdData.rcptLaw03 }</li>
		                				</ul>
		                			
		                			</div>
		                			
		                		</div>
	                		</c:if>
	                		<c:if test="${
	                			agdData.rcptTypeCode eq '02'
	                			or agdData.rcptTypeCode eq '03'
	                			or agdData.rcptTypeCode eq '04'
	                		}">
	                		<div class="info_section">
	                			<div class="section_box_03 default">
		                			<p class="section_label">수출 사유</p>
		                			<p class="section_item" style="white-space:pre-line;">
		                				<c:if test="${agdData.rcptExReasonSale eq 'Y' }">${agdData.rcptExReasonSCom }</c:if>
		                				<c:if test="${agdData.rcptExReasonTrans eq 'Y' }">${agdData.rcptExReasonTCom }</c:if>
		                				<c:if test="${agdData.rcptExReasonEtc eq 'Y' }">${agdData.rcptExReasonECom }</c:if>
									</p>
		                			<p class="section_label">수출 예정일</p>
	                				<p class="section_item">${receipt.rcptExDate10 }</p>
	                			</div>
	                		</div>
	                		</c:if>
               		
	                		<c:if test="${
	                			agdData.rcptTypeCode eq '02'
	                			or agdData.rcptTypeCode eq '03'
	                			or agdData.rcptTypeCode eq '04'
	                			or agdData.rcptTypeCode eq '05'
	                			or agdData.rcptTypeCode eq '06'
	                			or agdData.rcptTypeCode eq '07'
	                		}">
		                		<div class="info_section">
		                			<div class="section_box_03 default">
			                			<p class="section_label">대상국</p>
			                			<ul class="section_sub_list">
			                				<c:forEach items="${receiptCountryList }" var="rcptCty" varStatus="status">
			                					<li>${rcptCty.ctyTargetCountryName }[${rcptCty.ctyTargetCountry }] : ${rcptCty.ctyBuyer }</li>
			                				</c:forEach>
	<!-- 	                					<li>대상국[대상국코드] : 대상 기업</li> -->
	<!-- 	                					<li>대상국[대상국코드] : 대상 기업</li> -->
		                				</ul>
		                			</div>
		                			
		                		</div>
	                		</c:if>
	                		<!--  ** 신청공문 파일 조회 -->
	                		<div class="info_section file_section">
	                			<div class="section_box_03 default">
                					<p class="section_label">신청 공문</p>
	             				<c:forEach items="${receiptFileList }" var="file" varStatus="status">
	             				<c:if test="${fn:contains(file.fileRcptSeq, '1001')}">
		                			<p class="section_item">
		                				<a 	data-viewer-path="${ viewerPath }"
		                					data-file-path="/home/tomcat/live/upload/file/"
		                					data-file-key="${ file.fileKey }"
											data-file-name="${ file.fileNm }"
											data-user-name="${ user.admName }"
											data-user-position="${ user.admPositon }"
											data-user-com="${ user.admCom }"
											data-user-dept="${ user.admDept }"
											data-user-phone1="${ user.admMobile1 }"
											data-user-phone2="${ user.admMobile2 }"
											data-user-phone3="${ user.admMobile3 }"
											data-user-email="${ user.admEmail }" href="javascript:void(0);">${file.fileOriginNm }</a>
		                			</p>
	             				</c:if>
	               				</c:forEach>
	                			</div>
	                		</div>
               		<!--  ** 신청서 파일 조회 -->
	                		<div class="info_section file_section">
	                			<div class="section_box_03 default">
                					<p class="section_label">신청서 파일</p>
	             				<c:forEach items="${receiptFileList }" var="file" varStatus="status">
	             				<c:if test="${fn:contains(file.fileRcptSeq, '1002')}">
		                			<p class="section_item">
		                				<a 	data-viewer-path="${ viewerPath }"
		                					data-file-path="/home/tomcat/live/upload/file/"
		                					data-file-key="${ file.fileKey }"
											data-file-name="${ file.fileNm }"
											data-user-name="${ user.admName }"
											data-user-position="${ user.admPositon }"
											data-user-com="${ user.admCom }"
											data-user-dept="${ user.admDept }"
											data-user-phone1="${ user.admMobile1 }"
											data-user-phone2="${ user.admMobile2 }"
											data-user-phone3="${ user.admMobile3 }"
											data-user-email="${ user.admEmail }" href="javascript:void(0);">${file.fileOriginNm }</a>
									</p>
	             				</c:if>
	               				</c:forEach>
	                			</div>
	                		</div>
               		<!--  ** 첨부 파일 조회 -->
	                		<div class="info_section file_section">
	                			<div class="section_box_03 default">
		                			<p class="section_label">첨부 서류</p>
	                				<c:forEach items="${receiptFileList }" var="file" varStatus="status">
	                					<c:if test="${fn:contains(file.fileRcptSeq, '1003')}">
				                			<p class="section_item">
				                				<a 	data-viewer-path="${ viewerPath }"
				                					data-file-path="/home/tomcat/live/upload/file/"
				                					data-file-key="${ file.fileKey }"
													data-file-name="${ file.fileNm }"
													data-user-name="${ user.admName }"
													data-user-position="${ user.admPositon }"
													data-user-com="${ user.admCom }"
													data-user-dept="${ user.admDept }"
													data-user-phone1="${ user.admMobile1 }"
													data-user-phone2="${ user.admMobile2 }"
													data-user-phone3="${ user.admMobile3 }"
													data-user-email="${ user.admEmail }" href="javascript:void(0);">${file.fileOriginNm }</a>
				                			</p>
	                					</c:if>
	                				</c:forEach>
	                			</div>
	                		</div>
	                	</div>
	                	
               		
               		
               	</div>
                <%-- 안건 상세 보기 레이어<br><br><br>
		접수번호: ${agdData.rcptCode}<br>
		안건번호: ${agdData.agdCode}<br>
		안건번호(조회용): ${agdData.agdViewCode}<br>
		핵심기술 분야코드(KTS007): ${agdData.agdTechId}<br>
		전문위원회 번호: ${agdData.agdExIdx}<br>
		신청서 메타 데이터 코드: ${agdData.rcptMetaCode}<br>
		진행상태: ${agdData.agdStatus}<br>
		진행상태표기명: ${agdData.agdStatusName}<br>
		안건등록ID: ${agdData.agdRegId}<br>
		안건등록일: ${agdData.agdRegDate}<br>
		안건등록일(조회용): ${agdData.agdRegDateStr}<br>
		진행상태 라스트 업데이트: ${agdData.agdStatusLast}<br>
		진행상태 라스트 업데이트(조회용): ${agdData.agdStatusLastStr}<br>
		접수분야: ${agdData.rcptTypeCode}<br>
	    접수분야표기명: ${agdData.rcptTypeCodeName}<br>
		대상 기업 회원 ID : ${agdData.rcptComCode}<br>
		재검토 접수 여부 : ${agdData.rctpReYn}<br>
		재검토인경우 이전 접수 번호 고유 코드: ${agdData.rctpReCode}<br>
		기술형태: ${agdData.rcptTechForm}<br>
		수출사유-매각: ${agdData.rcptExReasonSale}<br>
		수출사유-매각사유: ${agdData.rcptExReasonSCom}<br>
		수출사유-이전: ${agdData.rcptExReasonTrans}<br>
		수출사유-이전사유: ${agdData.rcptExReasonTCom}<br>
		수출사유-기타: ${agdData.rcptExReasonEtc}<br>
		수출사유-기타사유: ${agdData.rcptExReasonECom}<br>
		수출예정일: ${agdData.rcptExDate}<br>
		기술특성: ${agdData.rcptTechQua}<br>
		신고사유: ${agdData.rcptReason}<br>
		법률01: ${agdData.rcptLaw01}<br>
		법률02: ${agdData.rcptLaw02}<br>
		법률03: ${agdData.rcptLaw03}<br>
		사업자등록번호: ${agdData.cpnSNo}<br>
		법인등록번호: ${agdData.cpnBNo}<br>
		기업명: ${agdData.cpnNm}<br>
		대표이사: ${agdData.cpnCeo}<br>
		우편번호: ${agdData.cpnBZip}<br>
		주소: ${agdData.cpnBAdd1}<br>
		상세주소: ${agdData.cpnBAdd2}<br>
		기업지역번호: ${agdData.cpnBPhone1}<br>
		기업중간전화번호: ${agdData.cpnBPhone2}<br>
		기업끝전화번호: ${agdData.cpnBPhone3}<br>
		기업지역번호: ${agdData.cpnBFax1}<br>
		기업중간전화번호: ${agdData.cpnBFax2}<br>
		기업끝전화번호: ${agdData.cpnBFax3}<br>
		업종코드: ${agdData.cpnDutyCode}<br>
		사업장우편번호: ${agdData.cpnSZip}<br>
		사업장주소: ${agdData.cpnSAdd1}<br>
		사업장상세주소: ${agdData.cpnSAdd2}<br>
		사업장지역번호: ${agdData.cpnSPhone1}<br>
		사업장중간전화번호: ${agdData.cpnSPhone2}<br>
		사업장끝전화번호: ${agdData.cpnSPhone3}<br>
		담당자명: ${agdData.cpnPNm}<br>
		담당자부서: ${agdData.cpnPDept}<br>
		담당자직위: ${agdData.cpnPPosition}<br>
		담당자지역번: ${agdData.cpnPPhone1}<br>
		담당자중간전화번호: ${agdData.cpnPPhone2}<br>
		담당자끝전화번호: ${agdData.cpnPPhone3}<br>
		담당자앞휴대번호: ${agdData.cpnPMobile1}<br>
		담당자중간휴대번호: ${agdData.cpnPMobile2}<br>
		담당자끝휴대번호: ${agdData.cpnPMobile3}<br>
		담당자이메일주소: ${agdData.cpnPEmail}<br>
		기술명: ${agdData.techName}<br>
		기술분야: ${agdData.techItemName}<br>
		접수기술분야: ${agdData.techRcptTechNm}<br> --%>
			</div>
            <div class="layer_popup_btn">
                <a href="#none" class="btn btn_close">닫기</a>
            </div>
		</div>
	</div>
