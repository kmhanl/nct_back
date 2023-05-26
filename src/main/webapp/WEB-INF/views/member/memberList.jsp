<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<input type="hidden" id="admStat" value="<%= (request.getParameter("admStat") == null ? "" : request.getParameter("admStat")) %>"/>
<script type="text/javascript" src="/resources/js/member/memberPopup.js"></script>
<script type="text/javascript" src="/resources/js/member/memberList.js"></script>
<script type="text/javascript" src="/resources/js/member/commonSend.js"></script>
	
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
					<c:set var="cnt200" value="0"></c:set>
					<c:set var="cnt300" value="0"></c:set>
					<c:set var="cnt400" value="0"></c:set>
					<c:forEach items="${tabList}" var="item">
						<c:set var="totCnt" value = "${totCnt + item.count}"/>
						<c:choose>
							<c:when test="${item.title eq '200'}">
								<c:set var="cnt200" value = "${item.count}"/>
							</c:when>
							<c:when test="${item.title eq '300'}">
								<c:set var="cnt300" value = "${item.count}"/>
							</c:when>
							<c:when test="${item.title eq '400'}">
								<c:set var="cnt400" value = "${item.count}"/>
							</c:when>
						</c:choose>
					</c:forEach>
					<li  class="${param.admStat eq null ? 'on' : '' }" data-status="ALL"><a href="javascript:void(0);" class="tap_item">전체 ${ totCnt }</a></li>
					<li class="${param.admStat eq '200' ? 'on' : '' }" data-status="200"><a href="javascript:void(0);" class="tap_item">사용중 ${ cnt200 }</a></li>
					<li class="${param.admStat eq '400' ? 'on' : '' }" data-status="400"><a href="javascript:void(0);" class="tap_item">승인대기 ${ cnt400 }</a></li>
					<li class="${param.admStat eq '300' ? 'on' : '' }" data-status="300"><a href="javascript:void(0);" class="tap_item">사용정지 ${ cnt300 }</a></li>
					
				</ul>
			</div>
            <div class="body_content_wrapper">
                <div class="main_body">
					<div class="search_wrapper">
						검색영역
					</div>
					<div class="content_wrapper">
						<div class="content_list BodyList">
							<!--검색결과가 없는 경우 : 시작-->
							<c:if test="${fn:length(memberList) == 0 }">
								<div class="no_list">
									조회된 검색 결과가 없습니다.
								</div>
							</c:if>
							<!--검색결과가 없는 경우 : 끝-->
							<!--검색결과가 있는 경우 : 시작-->
							<c:if test="${fn:length(memberList) != 0 }">
								<ul class="CommitListD AdminMemList" style="clear:both">
									<c:forEach items="${memberList}" var="data" begin="${paging.startNo}" end="${paging.startNo + (paging.pageRows - 1)}" varStatus="status">
									<li data-adm-id="${data.admId}" data-invi-key="${data.admInviKey}" data-admstat="${data.admStat}">
										<div class="ListSection SecNo">
											${paging.totalRows - status.index}
										</div> 
										<c:if test="${data.admInviYn eq 'Y'}">
											<div class="ListSection DateCnt">
												<p href="#none" class="btn memoff">초대</p>
											</div>
										</c:if>
										<c:if test="${data.admInviYn eq 'N'}">
											<div class="ListSection DateCnt">
												<p href="#none" class="btn memoff">일반</p>
											</div>
										</c:if>
										<div class="ListSection CommitTit">
											<p class="CommitT">
												<span class="TitleTech" style="float:left;">${ data.admId }</span>
												<span class="TitleMemName" style="float:left;">${ data.admName }<span class="poname">${ data.admPositon }</span></span>
												<span class="ListLabel" style="float:left;padding:7px 0 0 5px">${data.admInviKey} | ${data.admCom} | ${data.admMobile1}-${data.admMobile2}-${data.admMobile3} | ${data.admEmail}</span>
											</p>
										</div>
										<div class="ListSection Alert">
											<div class="card_stat stat_${ data.admStat eq '400' ? '600' : (data.admStat eq '200' ? '500' : '600') }">
												<p class="stat">${ data.admStat eq '400' ? '승인 대기' : data.admStatNm }</p>
											</div>
										</div>
										
									</li>
									</c:forEach>
								</ul>
							</c:if>
<!-- 									<li> -->
<!-- 										<div class="ListSection SecNo"> -->
<!-- 											55 -->
<!-- 										</div>  -->
<!-- 										<div class="ListSection CommitTit" data-ex-idx="2022-0001"> -->
<!-- 											<p class="CommitT"> -->
<!-- 												<span class="TitleTech" style="float:left;">adm_01_09</span> -->
<!-- 												<span class="ListLabel" style="float:left;padding:7px 0 0 5px">OO대학교 전문위원9 교수</span> -->
<!-- 												<span class="ListLabel" style="float:left;padding:7px 0 0 5px">OO대학교</span> -->
<!-- 											</p> -->
											
<!-- 										</div> -->
<!-- 										<div class="ListSection DateCnt"> -->
<!-- 											<p class="ListLabel">회원 가입  :<span class="cntnum">2022-02-01</span></p> -->
<!-- 										</div> -->
<!-- 										<div class="ListSection Alert"> -->
<!-- 											<div class="card_stat stat_500"> -->
<!-- 												<p class="stat">사용중</p> -->
<!-- 											</div> -->
<!-- 										</div> -->
										
<!-- 									</li> -->
							
							<!--검색결과가 있는 경우 : 끝-->
						</div>
						
						<c:if test="${fn:length(memberList) ne 0 }">
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
