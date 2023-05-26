<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="/resources/js/expert/receiptPopup.js"></script>
<script type="text/javascript" src="/resources/js/research/researchList.js"></script>
	
		<div class="body_wrapper">
			<div class="BodyTopUtile ">
				<a href="#none" class="sch_btn">
						<svg version="1.1" id="Capa_1" x="0px" y="0px" fill="#888" viewBox="0 0 124.524 124.524" xml:space="preserve">
							<path d="M51,102.05c10.5,0,20.2-3.2,28.3-8.6l29.3,29.3c2.301,2.3,6.101,2.3,8.5,0l5.7-5.7c2.3-2.3,2.3-6.1,0-8.5L93.4,79.35		c5.399-8.1,8.6-17.8,8.6-28.3c0-28.1-22.9-51-51-51c-28.1,0-51,22.9-51,51C0,79.149,22.8,102.05,51,102.05z M51,20.05
		c17.1,0,31,13.9,31,31c0,17.1-13.9,31-31,31c-17.1,0-31-13.9-31-31C20,33.95,33.9,20.05,51,20.05z"/>
						</svg>
				</a>
				<ul class="BodyTopUtilTap tap_list" style="">
					<!-- <li class="" data-status="ALL"><a href="#none" class="tap_item">전체 00</a></li>
					<li class="" data-status="ALL"><a href="#none" class="tap_item">전체 00</a></li> -->
					
				</ul>
				
				<a href="javascript:void(0);" class="tap_btn">신규 실태조사 등록</a>
				
			</div>
            <div class="body_content_wrapper">
                <div class="main_body">
					<div class="search_wrapper">
						검색영역
					</div>
					<div class="content_wrapper">
						<div class="content_list">
							<c:if test="${fn:length(researchList) == 0 }">
								<div class="no_list">
									조회된 검색 결과가 없습니다.
								</div>
							</c:if>
							<!--검색결과가 있는 경우 : 시작-->
							<c:if test="${fn:length(researchList) != 0 }">
								<ul class="receipt_ist_t01" style="clear:both">
									<c:forEach items="${researchList}"
										var="research"
										begin="${paging.startNo}"
										end="${paging.startNo + (paging.pageRows - 1)}"
										varStatus="status">
									<li>
										<div class="receipt_item">
											<p class="card_num">${paging.totalRows - status.index}</p>
											<div class="card_con">
												<div class="card_top">
													<span class="receipt_num">
														${research.rscCode}
													</span>
												</div>
												<div class="card_bottom">
											<!-- 		<div class="receipt_t_type">
														
													</div> -->
													<div class="card_tit" data-rcpt-idx="" >
														<p class="card_tech_name">
															${research.rscTitle}
														</p>
														<p class="card_tech">
															<!-- 기술분야 범위 : kaits_receipt_tech TECH_UNIQ_ID 컬럼에 대한 kaits_tech_item TECH_ITEM_NAME-->
															<span class="tech_flag_tit">실태조사 기간 : ${research.rscStrDate8Ko} ~ ${research.rscEndDate8Ko}</span> 
														</p>
													</div>
													<div class="card_stat stat_ts">
														<p class="stat">${research.rscStatusNm}</p>
														<p class="stat_date">${research.rscRegDate8Ko}</p>
													</div>
												</div>
											</div>
											
										</div>
										
									</li>	
									
							</c:forEach>
							</ul>
							</c:if>
								
						</div>
						
						<div class="pagination_warp">
							<ul class="pagination">
                                <li class="prev"><a href="#none">«</a></li>
					                <li class="item on"><a href="#none"><c:out value=""/>1</a></li>
					            <li class="next"><a href="#none">»</a></li>
                              </ul>
						</div>
						
					</div>

				</div>
                
            </div>
        </div>
