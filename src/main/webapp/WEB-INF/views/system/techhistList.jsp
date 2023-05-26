<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
					<a href="javascript:void(0);" class="tap_btn">고시 등록</a>
			</div>
            <div class="body_content_wrapper">
                <div class="main_body">
					<div class="search_wrapper">
						검색영역
					</div>
					<div class="content_wrapper">
						<div class="content_list">
							<c:if test="${fn:length(techList) == 0 }">
								<div class="no_list">
									조회된 검색 결과가 없습니다.
								</div>
							</c:if>
							<c:if test="${fn:length(techList) != 0 }">
							<ul class="receipt_ist_t01" style="clear:both">
								<c:forEach items="${techList}"
									var="tech"
									begin="${paging.startNo}"
									end="${paging.startNo + (paging.pageRows - 1)}"
									varStatus="status">
								<li>
									<div class="receipt_item">
										
										${tech.techId}<br>
										${tech.techName}<br>
										${tech.techSort}<br>
										${tech.techDelYn}<br>
										${tech.techShwYn}<br>
										${tech.techUseYn}<br>
										${tech.techReg}<br>
										${tech.techRegId}<br>
										${tech.techUpdate}<br>
										${tech.techUpdateId}<br>
										
									</div>
									
								</li>
								</c:forEach>
							</ul>
							</c:if>
								
								
						</div>
						<div class="pagination_warp">
							<ul class="pagination">
                                <li class="prev"><a href="#none">«</a></li>
	                            <li class="item"><a href="#none">1</a></li>
                                <li class="next"><a href="#none">»</a></li>
                              </ul>
						</div>
						
					</div>

				</div>
                
            </div>
        </div>
