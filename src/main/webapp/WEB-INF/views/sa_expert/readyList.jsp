<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="/resources/js/expert/agendaPopup.js"></script>
<script type="text/javascript" src="/resources/js/expert/committeePopup.js"></script>
<script type="text/javascript" src="/resources/js/expert/readyList.js"></script>
		
		<div class="body_wrapper">
			<div class="BodyTopUtile ">
				<a href="#none" class="sch_btn">
						<svg version="1.1" id="Capa_1" x="0px" y="0px" fill="#888" viewBox="0 0 124.524 124.524" xml:space="preserve">
							<path d="M51,102.05c10.5,0,20.2-3.2,28.3-8.6l29.3,29.3c2.301,2.3,6.101,2.3,8.5,0l5.7-5.7c2.3-2.3,2.3-6.1,0-8.5L93.4,79.35		c5.399-8.1,8.6-17.8,8.6-28.3c0-28.1-22.9-51-51-51c-28.1,0-51,22.9-51,51C0,79.149,22.8,102.05,51,102.05z M51,20.05
		c17.1,0,31,13.9,31,31c0,17.1-13.9,31-31,31c-17.1,0-31-13.9-31-31C20,33.95,33.9,20.05,51,20.05z"/>
						</svg>
				</a>
<%-- 				<c:if test="${user.admGroup eq 'AMG04'}"> --%>
					<a href="javascript:void(0);" class="tap_btn commake01" data-user-group="${user.admGroup }" data-user-tech="${user.admAuthTech }">위원회구성</a>
<%-- 				</c:if> --%>
<%-- 				<c:if test="${ user.admGroup eq 'AMG00' or user.admGroup eq 'AMG01' or user.admGroup eq 'AMG02'}"> --%>
<!-- 					<a href="javascript:void(0);" class="tap_btn commake02">위원회구성1</a> -->
<%-- 				</c:if> --%>
			</div>
	
            <div class="body_content_wrapper">
                <div class="main_body">
					<div class="search_wrapper">
						검색영역
					</div>
					<div class="content_wrapper">
						
						<div class="content_list">
							<!--검색결과가 없는 경우 : 시작-->
							<c:if test="${fn:length(agendaList) == 0 }">
								<div class="no_list">
									조회된 검색 결과가 없습니다.
								</div>
							</c:if>
							<!--검색결과가 없는 경우 : 끝-->
							<!--검색결과가 있는 경우 : 시작-->
							<c:if test="${fn:length(agendaList) != 0 }">
							<ul class="receipt_ist_t01" style="clear:both">
								<c:forEach items="${agendaList}"
									var="agenda"
									begin="${paging.startNo}"
									end="${paging.startNo + (paging.pageRows - 1)}"
									varStatus="status">
								<li>
									<div class="receipt_item">
										<p class="card_num">
											${paging.totalRows - status.index}
											<c:if test="${agenda.agdCode eq null }">
												<input type="checkbox" name ="agdCheck" class="" value="${agenda.rcptCode}">
											</c:if>
										</p>
										<div class="card_con">
											<div class="card_top">
												<span class="receipt_num">${agenda.agdViewCode == null ? agenda.rcptCode : agenda.agdViewCode}</span>
												<span class="receipt_company">${agenda.cpnNm}</span>
												<span class="receipt_date">접수일 : ${agenda.agdRegDateStr}</span>
											</div>
											<div class="card_bottom">
												<div class="receipt_t_type">
													<p class="type_icon">
														<c:if test="${agenda.rcptTypeCode eq '01' }">
														    <svg class="svg-inline--fa fa-balance-scale fa-w-20" aria-hidden="true" data-prefix="fas" data-icon="balance-scale" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" data-fa-i2svg=""><path fill="currentColor" d="M256 336h-.02c0-16.18 1.34-8.73-85.05-181.51-17.65-35.29-68.19-35.36-85.87 0C-2.06 328.75.02 320.33.02 336H0c0 44.18 57.31 80 128 80s128-35.82 128-80zM128 176l72 144H56l72-144zm511.98 160c0-16.18 1.34-8.73-85.05-181.51-17.65-35.29-68.19-35.36-85.87 0-87.12 174.26-85.04 165.84-85.04 181.51H384c0 44.18 57.31 80 128 80s128-35.82 128-80h-.02zM440 320l72-144 72 144H440zm88 128H352V153.25c23.51-10.29 41.16-31.48 46.39-57.25H528c8.84 0 16-7.16 16-16V48c0-8.84-7.16-16-16-16H383.64C369.04 12.68 346.09 0 320 0s-49.04 12.68-63.64 32H112c-8.84 0-16 7.16-16 16v32c0 8.84 7.16 16 16 16h129.61c5.23 25.76 22.87 46.96 46.39 57.25V448H112c-8.84 0-16 7.16-16 16v32c0 8.84 7.16 16 16 16h416c8.84 0 16-7.16 16-16v-32c0-8.84-7.16-16-16-16z"></path></svg>
														</c:if>
														<c:if test="${agenda.rcptTypeCode eq '02' }">
														    <svg class="svg-inline--fa fa-book-reader fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="book-reader" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M352 96c0-53.02-42.98-96-96-96s-96 42.98-96 96 42.98 96 96 96 96-42.98 96-96zM233.59 241.1c-59.33-36.32-155.43-46.3-203.79-49.05C13.55 191.13 0 203.51 0 219.14v222.8c0 14.33 11.59 26.28 26.49 27.05 43.66 2.29 131.99 10.68 193.04 41.43 9.37 4.72 20.48-1.71 20.48-11.87V252.56c-.01-4.67-2.32-8.95-6.42-11.46zm248.61-49.05c-48.35 2.74-144.46 12.73-203.78 49.05-4.1 2.51-6.41 6.96-6.41 11.63v245.79c0 10.19 11.14 16.63 20.54 11.9 61.04-30.72 149.32-39.11 192.97-41.4 14.9-.78 26.49-12.73 26.49-27.06V219.14c-.01-15.63-13.56-28.01-29.81-27.09z"></path></svg>
														</c:if>
														<c:if test="${agenda.rcptTypeCode eq '03' }">
														    <svg class="svg-inline--fa fa-pen-nib fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="pen-nib" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M136.6 138.79a64.003 64.003 0 0 0-43.31 41.35L0 460l14.69 14.69L164.8 324.58c-2.99-6.26-4.8-13.18-4.8-20.58 0-26.51 21.49-48 48-48s48 21.49 48 48-21.49 48-48 48c-7.4 0-14.32-1.81-20.58-4.8L37.31 497.31 52 512l279.86-93.29a64.003 64.003 0 0 0 41.35-43.31L416 224 288 96l-151.4 42.79zm361.34-64.62l-60.11-60.11c-18.75-18.75-49.16-18.75-67.91 0l-56.55 56.55 128.02 128.02 56.55-56.55c18.75-18.75 18.75-49.15 0-67.91z"></path></svg>
														</c:if>
														<c:if test="${agenda.rcptTypeCode eq '04' }">
														</c:if>
														<c:if test="${agenda.rcptTypeCode eq '05' }">
														    <svg class="svg-inline--fa fa-globe fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="globe" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 496 512" data-fa-i2svg=""><path fill="currentColor" d="M336.5 160C322 70.7 287.8 8 248 8s-74 62.7-88.5 152h177zM152 256c0 22.2 1.2 43.5 3.3 64h185.3c2.1-20.5 3.3-41.8 3.3-64s-1.2-43.5-3.3-64H155.3c-2.1 20.5-3.3 41.8-3.3 64zm324.7-96c-28.6-67.9-86.5-120.4-158-141.6 24.4 33.8 41.2 84.7 50 141.6h108zM177.2 18.4C105.8 39.6 47.8 92.1 19.3 160h108c8.7-56.9 25.5-107.8 49.9-141.6zM487.4 192H372.7c2.1 21 3.3 42.5 3.3 64s-1.2 43-3.3 64h114.6c5.5-20.5 8.6-41.8 8.6-64s-3.1-43.5-8.5-64zM120 256c0-21.5 1.2-43 3.3-64H8.6C3.2 212.5 0 233.8 0 256s3.2 43.5 8.6 64h114.6c-2-21-3.2-42.5-3.2-64zm39.5 96c14.5 89.3 48.7 152 88.5 152s74-62.7 88.5-152h-177zm159.3 141.6c71.4-21.2 129.4-73.7 158-141.6h-108c-8.8 56.9-25.6 107.8-50 141.6zM19.3 352c28.6 67.9 86.5 120.4 158 141.6-24.4-33.8-41.2-84.7-50-141.6h-108z"></path></svg>
														</c:if>
														<c:if test="${agenda.rcptTypeCode eq '06' }">
														    <svg class="svg-inline--fa fa-at fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="at" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M256 8C118.941 8 8 118.919 8 256c0 137.059 110.919 248 248 248 48.154 0 95.342-14.14 135.408-40.223 12.005-7.815 14.625-24.288 5.552-35.372l-10.177-12.433c-7.671-9.371-21.179-11.667-31.373-5.129C325.92 429.757 291.314 440 256 440c-101.458 0-184-82.542-184-184S154.542 72 256 72c100.139 0 184 57.619 184 160 0 38.786-21.093 79.742-58.17 83.693-17.349-.454-16.91-12.857-13.476-30.024l23.433-121.11C394.653 149.75 383.308 136 368.225 136h-44.981a13.518 13.518 0 0 0-13.432 11.993l-.01.092c-14.697-17.901-40.448-21.775-59.971-21.775-74.58 0-137.831 62.234-137.831 151.46 0 65.303 36.785 105.87 96 105.87 26.984 0 57.369-15.637 74.991-38.333 9.522 34.104 40.613 34.103 70.71 34.103C462.609 379.41 504 307.798 504 232 504 95.653 394.023 8 256 8zm-21.68 304.43c-22.249 0-36.07-15.623-36.07-40.771 0-44.993 30.779-72.729 58.63-72.729 22.292 0 35.601 15.241 35.601 40.77 0 45.061-33.875 72.73-58.161 72.73z"></path></svg>
														</c:if>
														<c:if test="${agenda.rcptTypeCode eq '07' }">
														    <svg class="svg-inline--fa fa-search fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="search" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M505 442.7L405.3 343c-4.5-4.5-10.6-7-17-7H372c27.6-35.3 44-79.7 44-128C416 93.1 322.9 0 208 0S0 93.1 0 208s93.1 208 208 208c48.3 0 92.7-16.4 128-44v16.3c0 6.4 2.5 12.5 7 17l99.7 99.7c9.4 9.4 24.6 9.4 33.9 0l28.3-28.3c9.4-9.4 9.4-24.6.1-34zM208 336c-70.7 0-128-57.2-128-128 0-70.7 57.2-128 128-128 70.7 0 128 57.2 128 128 0 70.7-57.2 128-128 128z"></path></svg>
														</c:if>
														<c:if test="${agenda.rcptTypeCode eq '08' }">
														    <svg class="svg-inline--fa fa-bullseye fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="bullseye" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M256 72c101.689 0 184 82.295 184 184 0 101.689-82.295 184-184 184-101.689 0-184-82.295-184-184 0-101.689 82.295-184 184-184m0-64C119.033 8 8 119.033 8 256s111.033 248 248 248 248-111.033 248-248S392.967 8 256 8zm0 184c35.29 0 64 28.71 64 64s-28.71 64-64 64-64-28.71-64-64 28.71-64 64-64m0-64c-70.692 0-128 57.308-128 128s57.308 128 128 128 128-57.308 128-128-57.308-128-128-128z"></path></svg>
														</c:if>
														<c:if test="${agenda.rcptTypeCode eq '09' }">
														    <svg class="svg-inline--fa fa-bullseye fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="bullseye" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M256 72c101.689 0 184 82.295 184 184 0 101.689-82.295 184-184 184-101.689 0-184-82.295-184-184 0-101.689 82.295-184 184-184m0-64C119.033 8 8 119.033 8 256s111.033 248 248 248 248-111.033 248-248S392.967 8 256 8zm0 184c35.29 0 64 28.71 64 64s-28.71 64-64 64-64-28.71-64-64 28.71-64 64-64m0-64c-70.692 0-128 57.308-128 128s57.308 128 128 128 128-57.308 128-128-57.308-128-128-128z"></path></svg>
														</c:if>
														<c:if test="${agenda.rcptTypeCode eq '10' }">
														    <svg class="svg-inline--fa fa-bullseye fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="bullseye" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M256 72c101.689 0 184 82.295 184 184 0 101.689-82.295 184-184 184-101.689 0-184-82.295-184-184 0-101.689 82.295-184 184-184m0-64C119.033 8 8 119.033 8 256s111.033 248 248 248 248-111.033 248-248S392.967 8 256 8zm0 184c35.29 0 64 28.71 64 64s-28.71 64-64 64-64-28.71-64-64 28.71-64 64-64m0-64c-70.692 0-128 57.308-128 128s57.308 128 128 128 128-57.308 128-128-57.308-128-128-128z"></path></svg>
														</c:if>
														<c:if test="${agenda.rcptTypeCode eq '11' }">
														    <svg class="svg-inline--fa fa-bullseye fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="bullseye" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M256 72c101.689 0 184 82.295 184 184 0 101.689-82.295 184-184 184-101.689 0-184-82.295-184-184 0-101.689 82.295-184 184-184m0-64C119.033 8 8 119.033 8 256s111.033 248 248 248 248-111.033 248-248S392.967 8 256 8zm0 184c35.29 0 64 28.71 64 64s-28.71 64-64 64-64-28.71-64-64 28.71-64 64-64m0-64c-70.692 0-128 57.308-128 128s57.308 128 128 128 128-57.308 128-128-57.308-128-128-128z"></path></svg>
														</c:if>
<!-- 														<svg class="svg-inline--fa fa-balance-scale fa-w-20" aria-hidden="true" data-prefix="fas" data-icon="balance-scale" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" data-fa-i2svg=""><path fill="currentColor" d="M256 336h-.02c0-16.18 1.34-8.73-85.05-181.51-17.65-35.29-68.19-35.36-85.87 0C-2.06 328.75.02 320.33.02 336H0c0 44.18 57.31 80 128 80s128-35.82 128-80zM128 176l72 144H56l72-144zm511.98 160c0-16.18 1.34-8.73-85.05-181.51-17.65-35.29-68.19-35.36-85.87 0-87.12 174.26-85.04 165.84-85.04 181.51H384c0 44.18 57.31 80 128 80s128-35.82 128-80h-.02zM440 320l72-144 72 144H440zm88 128H352V153.25c23.51-10.29 41.16-31.48 46.39-57.25H528c8.84 0 16-7.16 16-16V48c0-8.84-7.16-16-16-16H383.64C369.04 12.68 346.09 0 320 0s-49.04 12.68-63.64 32H112c-8.84 0-16 7.16-16 16v32c0 8.84 7.16 16 16 16h129.61c5.23 25.76 22.87 46.96 46.39 57.25V448H112c-8.84 0-16 7.16-16 16v32c0 8.84 7.16 16 16 16h416c8.84 0 16-7.16 16-16v-32c0-8.84-7.16-16-16-16z"></path></svg> -->
													</p>
													<p class="type_tit">${agenda.rcptTypeCodeName}</p>
												</div>
												<div class="card_tit" data-agd-code="${agenda.agdCode }">
													<!-- <p class="card_info">신청정보</p> -->
													<p class="card_tech">
														<span class="tech_flag">${agenda.techName}</span><span class="tech_flag_tit">${agenda.techItemName}</span> 
													</p>
													<p class="card_tech_name">
														${agenda.techRcptTechNm}
													</p>
												</div>
												
												<div class="card_stat">
													<p class="stat">검토준비중</p>
													<p class="stat_date">${agenda.agdStatusLastStr }</p>
												</div>
											</div>
										</div>
										
									</div>
									
								</li>
								</c:forEach>
							</ul>
							</c:if>
						</div>
						
						<c:if test="${fn:length(agendaList) ne 0 }">
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