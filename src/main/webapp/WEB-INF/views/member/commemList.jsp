<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<input type="hidden" id="admInviStat" value="<%= request.getParameter("admInviStat") %>"/>
<script type="text/javascript" src="/resources/js/member/memberPopup.js"></script>
<script type="text/javascript" src="/resources/js/member/comMemberList.js"></script>
<script type="text/javascript" src="/resources/js/member/commonSend.js"></script>
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
					<li  class="${param.cpnStat eq null ? 'on' : '' }" data-status="ALL"><a href="javascript:void(0);" class="tap_item">전체 ${ totCnt }</a></li>
					<li class="${param.cpnStat eq '200' ? 'on' : '' }" data-status="200"><a href="javascript:void(0);" class="tap_item">사용중 ${ cnt200 }</a></li>
					<li class="${param.cpnStat eq '400' ? 'on' : '' }" data-status="400"><a href="javascript:void(0);" class="tap_item">승인대기 ${ cnt400 }</a></li>
					<li class="${param.cpnStat eq '300' ? 'on' : '' }" data-status="300"><a href="javascript:void(0);" class="tap_item">사용정지 ${ cnt300 }</a></li>
	</ul>
	
</div>
<div class="nctContentWrapper wrapTypq01">
	<div class="nctContentbody">
		<!--검색결과가 없는 경우 : 시작-->
		<c:if test="${fn:length(memberList) == 0 }">
			<div class="no_list">
				조회된 검색 결과가 없습니다.
			</div>
		</c:if>
		<!--검색결과가 없는 경우 : 끝-->
		<!--검색결과가 있는 경우 : 시작-->
		<c:if test="${fn:length(memberList) != 0 }">
			<ul class="nctConList">
				<c:forEach items="${memberList}"
					var="data"
					begin="${paging.startNo}"
					end="${paging.startNo + (paging.pageRows - 1)}"
					varStatus="status">
				<li class="">
					<div class="listConItem SecNo">
						${paging.totalRows - status.index}
					</div>
					<a href="javascript:void(0);" class="listConItem CommitTit " data-adm-id="${ data.cpnId }">
						<div class="memIDbox rowItem CommitTitItem">
							<p class="label">아이디</p>
							<p class="cpnId">${ data.cpnId }</p>
						</div>
						<div class="memIDbox CommitTitItem">
							<p class="label">대표</p>
							<p class="cpnCeo">${ data.cpnCeo }</p>
						</div>
						<div class="CommitTitItem">
							<p class="label">담당자</p>
							<p class="cpnId">${ data.cpnCeo } ( ${ data.cpnPNm } / ${ data.cpnPMobile1 }-${ data.cpnPMobile2 }-${ data.cpnPMobile3 } )</p>
						</div>
					</a>
					<div class="listConItem DateCnt">
						<div class="rowItem">
							<p class="label">회원가입일</p>
							<p class="regDate">${ data.cpnRefDate8Ko }</p>
						</div>
					</div>
					
					<div class="listConItem Status">
						<c:if test="${ data.cpnStat eq '200' }">
							<div class="ListStatus ComMem200">
								사용중
							</div>										
						</c:if>
						<c:if test="${ data.cpnStat eq '300' }">
							<div class="ListStatus ComMem300">
								재직등록전
							</div>										
						</c:if>
						<c:if test="${ data.cpnStat eq '400' }">
							<div class="ListStatus ComMem400">
								승인 대기
							</div>										
						</c:if>
						<c:if test="${ data.cpnStat eq '500' }">
							<div class="ListStatus ComMem500">
								사용중지
							</div>										
						</c:if>
					</div>
				</li>
					
					
				</c:forEach>
			</ul>
		</c:if>
		<!--검색결과가 있는 경우 : 끝-->
	</div>
</div>	
<div class="nctContentFooter">
	<c:if test="${fn:length(memberList) ne 0 }">
		<div class="paginatbox">
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
	
	
