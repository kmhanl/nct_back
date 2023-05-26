<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:eval expression="@GlobalProps['fl.ex.dpt']" var="fdepth"/>
<spring:eval expression="@GlobalProps['fl.ex.tp01']" var="ft01"/>
<spring:eval expression="@GlobalProps['fl.ex.tp02']" var="ft02"/>
<spring:eval expression="@GlobalProps['fl.ex.tp03']" var="ft03"/>
<spring:eval expression="@GlobalProps['fl.ex.tp04']" var="ft04"/>
<spring:eval expression="@GlobalProps['fl.ex.tp05']" var="ft05"/>
<input type="hidden" id="file-info"
	data-depth="${ fdepth }" 
	data-type1="${ ft01 }" 
	data-type2="${ ft02 }" 
	data-type3="${ ft03 }" 
	data-type4="${ ft04 }" 
	data-type5="${ ft05 }"/>
<input type="hidden" id="rcptStatus" value="<%= (request.getParameter("rcptStatus") == null ? "" : request.getParameter("rcptStatus")) %>"/>
<script type="text/javascript" src="/resources/js/expert/receiptPopup.js"></script>
<script type="text/javascript" src="/resources/js/expert/receiptList.js"></script>
	
		<div class="body_wrapper">
			<div class="BodyTopUtile ">
				<a href="#none" class="sch_btn">
						<svg version="1.1" id="Capa_1" x="0px" y="0px" fill="#888" viewBox="0 0 124.524 124.524" xml:space="preserve">
							<path d="M51,102.05c10.5,0,20.2-3.2,28.3-8.6l29.3,29.3c2.301,2.3,6.101,2.3,8.5,0l5.7-5.7c2.3-2.3,2.3-6.1,0-8.5L93.4,79.35		c5.399-8.1,8.6-17.8,8.6-28.3c0-28.1-22.9-51-51-51c-28.1,0-51,22.9-51,51C0,79.149,22.8,102.05,51,102.05z M51,20.05
		c17.1,0,31,13.9,31,31c0,17.1-13.9,31-31,31c-17.1,0-31-13.9-31-31C20,33.95,33.9,20.05,51,20.05z"/>
						</svg>
				</a>
				<ul class="BodyTopUtilTap tap_list" style="">
					<c:set var="totCnt" value="0"></c:set>
					<c:set var="apCnt" value="0"></c:set>
					<c:set var="rcCnt" value="0"></c:set>
					<c:set var="raCnt" value="0"></c:set>
					<c:set var="rjCnt" value="0"></c:set>
					<c:set var="acCnt" value="0"></c:set>
					<c:forEach items="${tabList}" var="item">
						<c:set var="totCnt" value = "${totCnt + item.count}"/>
						<c:choose>
							<c:when test="${item.title eq 'AP'}">
								<c:set var="apCnt" value = "${item.count}"/>
							</c:when>
							<c:when test="${item.title eq 'RC'}">
								<c:set var="rcCnt" value = "${item.count}"/>
							</c:when>
							<c:when test="${item.title eq 'RA'}">
								<c:set var="raCnt" value = "${item.count}"/>
							</c:when>
							<c:when test="${item.title eq 'RJ'}">
								<c:set var="rjCnt" value = "${item.count}"/>
							</c:when>
							<c:when test="${item.title eq 'AC'}">
								<c:set var="acCnt" value = "${item.count}"/>
							</c:when>
						</c:choose>
					</c:forEach>
					<li class="${param.rcptStatus eq null ? 'on' : '' }" data-status="ALL"><a href="javascript:void(0);" class="tap_item">전체 ${totCnt }</a></li>
					<li class="${param.rcptStatus eq 'AP' ? 'on' : '' }" data-status="AP"><a href="javascript:void(0);" class="tap_item">접수검토 ${apCnt }</a></li>
					<li class="${param.rcptStatus eq 'RC' ? 'on' : '' }" data-status="RC"><a href="javascript:void(0);" class="tap_item">접수완료 ${rcCnt }</a></li>
					<li class="${param.rcptStatus eq 'RA' ? 'on' : '' }" data-status="RA"><a href="javascript:void(0);" class="tap_item">재접수요청 ${raCnt }</a></li>
					<li class="${param.rcptStatus eq 'RJ' ? 'on' : '' }" data-status="RJ"><a href="javascript:void(0);" class="tap_item">접수반려 ${rjCnt }</a></li>
					<li class="${param.rcptStatus eq 'AC' ? 'on' : '' }" data-status="AC"><a href="javascript:void(0);" class="tap_item">접수철회 ${acCnt }</a></li>
				</ul>
				<c:if test="${ user.admGroup eq 'AMG00' or user.admGroup eq 'AMG01' or user.admGroup eq 'AMG02' or user.admGroup eq 'AMG04'}">
					<a href="javascript:void(0);" class="tap_btn">신규 접수 등록</a>
				</c:if>
			</div>
            <div class="body_content_wrapper">
                <div class="main_body">
					<div class="search_wrapper">
						검색영역
					</div>
					<div class="content_wrapper">
						<!-- <div>
							<ul>
								<li>임시 저장</li>
								<li class="">접수 검토</li>
								<li class="">접수 완료</li>
								<li class="">재접수 요청 </li>
								<li class="">접수 반려</li>
								<li class="">접수 철회</li>
							</ul>
						</div> -->
						<div class="content_list">
							<!--검색결과가 없는 경우 : 시작-->
							<c:if test="${fn:length(receiptList) == 0 }">
								<div class="no_list">
									조회된 검색 결과가 없습니다.
								</div>
							</c:if>
							<!--검색결과가 없는 경우 : 끝-->
							<!--검색결과가 있는 경우 : 시작-->
							<c:if test="${fn:length(receiptList) != 0 }">
								<ul class="receipt_ist_t01" style="clear:both">
									<c:forEach items="${receiptList}"
										var="receipt"
										begin="${paging.startNo}"
										end="${paging.startNo + (paging.pageRows - 1)}"
										varStatus="status">
									<li>
										<div class="receipt_item">
											<p class="card_num">${paging.totalRows - status.index}</p>
											<div class="card_con">
												<div class="card_top">
													<span class="receipt_num">
														<!--접수번호 kaits_receipt RCPT_IDX-->
															${receipt.rcptCode}
	<!-- 														2021-0001 -->
													</span>
													<span class="receipt_company">
														<!--접수기업 kaits_receipt RCPT_COMPANY_NM-->
														<c:out value="${ receipt.rcptComType eq 'F' ? '대상기업없음' : receipt.rcptCompanyNm }"/>
													</span>
													<span class="receipt_date">
														<!--접수기업 kaits_receipt RCPT_REG_DATE-->
														${gActive }접수일 : ${receipt.rcptRegDateStr}
													</span>
												</div>
												<div class="card_bottom">
													<div class="receipt_t_type">
													<!--접수 분야 : 시작 kaits_receipt RCPT_TYPE_CODE // 01:여부판정 02:사전검토 03:수출신고 04:수출승인 05:해외인수·합병 사전검토 06:해외인수·합병 신고 07:해외인수·합병 승인 08:지정 09:변경 10:해제 11:기타-->
														<p class="type_icon">
															<c:if test="${receipt.rcptTypeCode eq '01' }">
																<svg class="svg-inline--fa fa-balance-scale fa-w-20" aria-hidden="true" data-prefix="fas" data-icon="balance-scale" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" data-fa-i2svg=""><path fill="currentColor" d="M256 336h-.02c0-16.18 1.34-8.73-85.05-181.51-17.65-35.29-68.19-35.36-85.87 0C-2.06 328.75.02 320.33.02 336H0c0 44.18 57.31 80 128 80s128-35.82 128-80zM128 176l72 144H56l72-144zm511.98 160c0-16.18 1.34-8.73-85.05-181.51-17.65-35.29-68.19-35.36-85.87 0-87.12 174.26-85.04 165.84-85.04 181.51H384c0 44.18 57.31 80 128 80s128-35.82 128-80h-.02zM440 320l72-144 72 144H440zm88 128H352V153.25c23.51-10.29 41.16-31.48 46.39-57.25H528c8.84 0 16-7.16 16-16V48c0-8.84-7.16-16-16-16H383.64C369.04 12.68 346.09 0 320 0s-49.04 12.68-63.64 32H112c-8.84 0-16 7.16-16 16v32c0 8.84 7.16 16 16 16h129.61c5.23 25.76 22.87 46.96 46.39 57.25V448H112c-8.84 0-16 7.16-16 16v32c0 8.84 7.16 16 16 16h416c8.84 0 16-7.16 16-16v-32c0-8.84-7.16-16-16-16z"></path></svg>
															</c:if>
															<c:if test="${receipt.rcptTypeCode eq '02' }">
																<svg class="svg-inline--fa fa-book-reader fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="book-reader" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M352 96c0-53.02-42.98-96-96-96s-96 42.98-96 96 42.98 96 96 96 96-42.98 96-96zM233.59 241.1c-59.33-36.32-155.43-46.3-203.79-49.05C13.55 191.13 0 203.51 0 219.14v222.8c0 14.33 11.59 26.28 26.49 27.05 43.66 2.29 131.99 10.68 193.04 41.43 9.37 4.72 20.48-1.71 20.48-11.87V252.56c-.01-4.67-2.32-8.95-6.42-11.46zm248.61-49.05c-48.35 2.74-144.46 12.73-203.78 49.05-4.1 2.51-6.41 6.96-6.41 11.63v245.79c0 10.19 11.14 16.63 20.54 11.9 61.04-30.72 149.32-39.11 192.97-41.4 14.9-.78 26.49-12.73 26.49-27.06V219.14c-.01-15.63-13.56-28.01-29.81-27.09z"></path></svg>
															</c:if>
															<c:if test="${receipt.rcptTypeCode eq '03' }">
																<svg class="svg-inline--fa fa-pen-nib fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="pen-nib" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M136.6 138.79a64.003 64.003 0 0 0-43.31 41.35L0 460l14.69 14.69L164.8 324.58c-2.99-6.26-4.8-13.18-4.8-20.58 0-26.51 21.49-48 48-48s48 21.49 48 48-21.49 48-48 48c-7.4 0-14.32-1.81-20.58-4.8L37.31 497.31 52 512l279.86-93.29a64.003 64.003 0 0 0 41.35-43.31L416 224 288 96l-151.4 42.79zm361.34-64.62l-60.11-60.11c-18.75-18.75-49.16-18.75-67.91 0l-56.55 56.55 128.02 128.02 56.55-56.55c18.75-18.75 18.75-49.15 0-67.91z"></path></svg>
															</c:if>
															<c:if test="${receipt.rcptTypeCode eq '04' }">
																<svg class="svg-inline--fa fa-envelope-open fa-w-16" aria-hidden="true" data-prefix="far" data-icon="envelope-open" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg="">
								                                    <path fill="currentColor" d="M494.586 164.516c-4.697-3.883-111.723-89.95-135.251-108.657C337.231 38.191 299.437 0 256 0c-43.205 0-80.636 37.717-103.335 55.859-24.463 19.45-131.07 105.195-135.15 108.549A48.004 48.004 0 0 0 0 201.485V464c0 26.51 21.49 48 48 48h416c26.51 0 48-21.49 48-48V201.509a48 48 0 0 0-17.414-36.993zM464 458a6 6 0 0 1-6 6H54a6 6 0 0 1-6-6V204.347c0-1.813.816-3.526 2.226-4.665 15.87-12.814 108.793-87.554 132.364-106.293C200.755 78.88 232.398 48 256 48c23.693 0 55.857 31.369 73.41 45.389 23.573 18.741 116.503 93.493 132.366 106.316a5.99 5.99 0 0 1 2.224 4.663V458zm-31.991-187.704c4.249 5.159 3.465 12.795-1.745 16.981-28.975 23.283-59.274 47.597-70.929 56.863C336.636 362.283 299.205 400 256 400c-43.452 0-81.287-38.237-103.335-55.86-11.279-8.967-41.744-33.413-70.927-56.865-5.21-4.187-5.993-11.822-1.745-16.981l15.258-18.528c4.178-5.073 11.657-5.843 16.779-1.726 28.618 23.001 58.566 47.035 70.56 56.571C200.143 320.631 232.307 352 256 352c23.602 0 55.246-30.88 73.41-45.389 11.994-9.535 41.944-33.57 70.563-56.568 5.122-4.116 12.601-3.346 16.778 1.727l15.258 18.526z"></path>
								                                </svg>
															</c:if>
															<c:if test="${receipt.rcptTypeCode eq '05' }">
																<svg class="svg-inline--fa fa-globe fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="globe" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 496 512" data-fa-i2svg=""><path fill="currentColor" d="M336.5 160C322 70.7 287.8 8 248 8s-74 62.7-88.5 152h177zM152 256c0 22.2 1.2 43.5 3.3 64h185.3c2.1-20.5 3.3-41.8 3.3-64s-1.2-43.5-3.3-64H155.3c-2.1 20.5-3.3 41.8-3.3 64zm324.7-96c-28.6-67.9-86.5-120.4-158-141.6 24.4 33.8 41.2 84.7 50 141.6h108zM177.2 18.4C105.8 39.6 47.8 92.1 19.3 160h108c8.7-56.9 25.5-107.8 49.9-141.6zM487.4 192H372.7c2.1 21 3.3 42.5 3.3 64s-1.2 43-3.3 64h114.6c5.5-20.5 8.6-41.8 8.6-64s-3.1-43.5-8.5-64zM120 256c0-21.5 1.2-43 3.3-64H8.6C3.2 212.5 0 233.8 0 256s3.2 43.5 8.6 64h114.6c-2-21-3.2-42.5-3.2-64zm39.5 96c14.5 89.3 48.7 152 88.5 152s74-62.7 88.5-152h-177zm159.3 141.6c71.4-21.2 129.4-73.7 158-141.6h-108c-8.8 56.9-25.6 107.8-50 141.6zM19.3 352c28.6 67.9 86.5 120.4 158 141.6-24.4-33.8-41.2-84.7-50-141.6h-108z"></path></svg>
															</c:if>
															<c:if test="${receipt.rcptTypeCode eq '06' }">
																<svg class="svg-inline--fa fa-at fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="at" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M256 8C118.941 8 8 118.919 8 256c0 137.059 110.919 248 248 248 48.154 0 95.342-14.14 135.408-40.223 12.005-7.815 14.625-24.288 5.552-35.372l-10.177-12.433c-7.671-9.371-21.179-11.667-31.373-5.129C325.92 429.757 291.314 440 256 440c-101.458 0-184-82.542-184-184S154.542 72 256 72c100.139 0 184 57.619 184 160 0 38.786-21.093 79.742-58.17 83.693-17.349-.454-16.91-12.857-13.476-30.024l23.433-121.11C394.653 149.75 383.308 136 368.225 136h-44.981a13.518 13.518 0 0 0-13.432 11.993l-.01.092c-14.697-17.901-40.448-21.775-59.971-21.775-74.58 0-137.831 62.234-137.831 151.46 0 65.303 36.785 105.87 96 105.87 26.984 0 57.369-15.637 74.991-38.333 9.522 34.104 40.613 34.103 70.71 34.103C462.609 379.41 504 307.798 504 232 504 95.653 394.023 8 256 8zm-21.68 304.43c-22.249 0-36.07-15.623-36.07-40.771 0-44.993 30.779-72.729 58.63-72.729 22.292 0 35.601 15.241 35.601 40.77 0 45.061-33.875 72.73-58.161 72.73z"></path></svg>
															</c:if>
															<c:if test="${receipt.rcptTypeCode eq '07' }">
																<svg class="svg-inline--fa fa-search fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="search" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M505 442.7L405.3 343c-4.5-4.5-10.6-7-17-7H372c27.6-35.3 44-79.7 44-128C416 93.1 322.9 0 208 0S0 93.1 0 208s93.1 208 208 208c48.3 0 92.7-16.4 128-44v16.3c0 6.4 2.5 12.5 7 17l99.7 99.7c9.4 9.4 24.6 9.4 33.9 0l28.3-28.3c9.4-9.4 9.4-24.6.1-34zM208 336c-70.7 0-128-57.2-128-128 0-70.7 57.2-128 128-128 70.7 0 128 57.2 128 128 0 70.7-57.2 128-128 128z"></path></svg>
															</c:if>
															<c:if test="${receipt.rcptTypeCode eq '08' }">
																<svg class="svg-inline--fa fa-bullseye fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="bullseye" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M256 72c101.689 0 184 82.295 184 184 0 101.689-82.295 184-184 184-101.689 0-184-82.295-184-184 0-101.689 82.295-184 184-184m0-64C119.033 8 8 119.033 8 256s111.033 248 248 248 248-111.033 248-248S392.967 8 256 8zm0 184c35.29 0 64 28.71 64 64s-28.71 64-64 64-64-28.71-64-64 28.71-64 64-64m0-64c-70.692 0-128 57.308-128 128s57.308 128 128 128 128-57.308 128-128-57.308-128-128-128z"></path></svg>
															</c:if>
															<c:if test="${receipt.rcptTypeCode eq '09' }">
																<svg class="svg-inline--fa fa-bullseye fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="bullseye" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M256 72c101.689 0 184 82.295 184 184 0 101.689-82.295 184-184 184-101.689 0-184-82.295-184-184 0-101.689 82.295-184 184-184m0-64C119.033 8 8 119.033 8 256s111.033 248 248 248 248-111.033 248-248S392.967 8 256 8zm0 184c35.29 0 64 28.71 64 64s-28.71 64-64 64-64-28.71-64-64 28.71-64 64-64m0-64c-70.692 0-128 57.308-128 128s57.308 128 128 128 128-57.308 128-128-57.308-128-128-128z"></path></svg>
															</c:if>
															<c:if test="${receipt.rcptTypeCode eq '10' }">
																<svg class="svg-inline--fa fa-bullseye fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="bullseye" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M256 72c101.689 0 184 82.295 184 184 0 101.689-82.295 184-184 184-101.689 0-184-82.295-184-184 0-101.689 82.295-184 184-184m0-64C119.033 8 8 119.033 8 256s111.033 248 248 248 248-111.033 248-248S392.967 8 256 8zm0 184c35.29 0 64 28.71 64 64s-28.71 64-64 64-64-28.71-64-64 28.71-64 64-64m0-64c-70.692 0-128 57.308-128 128s57.308 128 128 128 128-57.308 128-128-57.308-128-128-128z"></path></svg>
															</c:if>
															<c:if test="${receipt.rcptTypeCode eq '11' }">
																<svg class="svg-inline--fa fa-bullseye fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="bullseye" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M256 72c101.689 0 184 82.295 184 184 0 101.689-82.295 184-184 184-101.689 0-184-82.295-184-184 0-101.689 82.295-184 184-184m0-64C119.033 8 8 119.033 8 256s111.033 248 248 248 248-111.033 248-248S392.967 8 256 8zm0 184c35.29 0 64 28.71 64 64s-28.71 64-64 64-64-28.71-64-64 28.71-64 64-64m0-64c-70.692 0-128 57.308-128 128s57.308 128 128 128 128-57.308 128-128-57.308-128-128-128z"></path></svg>
															</c:if>
														</p>
														<p class="type_tit">${receipt.rcptTypeCodeNm}</p>
													</div>
													<div class="card_tit" data-rcpt-idx="${receipt.rcptCode }" >
														<p class="card_tech">
															<span class="tech_flag">
																<!-- 기술 분야, 범위, 명칭이 n개일 경우 kaits_receipt_tech 의 TECH_RCPT_NUM_SEQ 컬럼이 1인 1건만 출력 -->
																<!-- 기술 분야 코드 : 시작 kaits_receipt_tech TECH_NCT_CODE에 대한 kaits_tech TECH_NAME-->
																${receipt.techName}
															</span>
															<!-- 기술분야 범위 : kaits_receipt_tech TECH_UNIQ_ID 컬럼에 대한 kaits_tech_item TECH_ITEM_NAME-->
															<span class="tech_flag_tit">${receipt.techItemName}</span> 
															
														</p>
														<p class="card_tech_name">
															<!-- 기술명칭 : kaits_receipt_tech TECH_RCPT_TECH_NM-->
															${receipt.techRcptTechNm}
														</p>
													</div>
													<c:if test="${receipt.rcptStatus eq 'TS' }">
														<div class="card_stat stat_ts">
													</c:if>
													<c:if test="${receipt.rcptStatus eq 'AP' }">
														<div class="card_stat stat_ap">
													</c:if>
													<c:if test="${receipt.rcptStatus eq 'RA' }">
														<div class="card_stat stat_ra">
													</c:if>
													<c:if test="${receipt.rcptStatus eq 'RJ' }">
														<div class="card_stat stat_rj">
													</c:if>
													<c:if test="${receipt.rcptStatus eq 'RC' }">
														<div class="card_stat stat_rc">
													</c:if>
													<c:if test="${receipt.rcptStatus eq 'AC' }">
														<div class="card_stat stat_ac">
													</c:if>
													<c:if test="${receipt.rcptStatus eq '00' }">
														<div class="card_stat stat_00">
													</c:if>
													
														<p class="stat">${receipt.rcptStatusNm }</p>
														<p class="stat_date">${receipt.rcptStatusLast10 }</p>
													</div>
												</div>
											</div>
											
										</div>
										
									</li>
									</c:forEach>
								</ul>
							</c:if>
							<!--검색결과가 있는 경우 : 끝-->
						</div>
						
						<c:if test="${fn:length(receiptList) ne 0 }">
							<div class="pagination_warp">
								<ul class="pagination">
	                                <li class="prev"><a href="javascript:void(0);">«</a></li>
									<c:forEach var="i" begin="1" end="${paging.totalPage }">
		                                <li class="item ${i eq paging.pageNo ? 'current' : '' }"><a href="javascript:void(0);"><c:out value="${i}"/></a></li>
									</c:forEach>
	                                <li class="next"><a href="javascript:void(0);">»</a></li>
	                              </ul>
							</div>
						</c:if>
					</div>

				</div>
                
            </div>
        </div>
