<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<input type="hidden" id="admInviStat" value="<%= request.getParameter("admInviStat") %>"/>
<script type="text/javascript" src="/resources/js/member/memberPopup.js"></script>
<script type="text/javascript" src="/resources/js/member/invitationList.js"></script>
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
		<c:set var="cnt400" value="0"></c:set>
		<c:forEach items="${tabList}" var="item">
			<c:set var="totCnt" value = "${totCnt + item.count}"/>
			<c:choose>
				<c:when test="${item.title eq '200'}">
					<c:set var="cnt200" value = "${item.count}"/>
				</c:when>
				<c:when test="${item.title eq '400'}">
					<c:set var="cnt400" value = "${item.count}"/>
				</c:when>
			</c:choose>
		</c:forEach>
		<li  class="${param.admInviStat eq null ? 'on' : '' }" data-status="ALL"><a href="javascript:void(0);" class="tap_item">전체 ${ totCnt }</a></li>
		<li class="${param.admInviStat eq '400' ? 'on' : '' }" data-status="400"><a href="javascript:void(0);" class="tap_item">가입전 ${ cnt400 }</a></li>
		<li class="${param.admInviStat eq '200' ? 'on' : '' }" data-status="200"><a href="javascript:void(0);" class="tap_item">가입 완료 ${ cnt200 }</a></li>
	</ul>
	<a href="#none" class="tap_btn NewInvi">신규 회원 초대</a>
</div>
<div class="nctContentWrapper wrapTypq01">
	<div class="nctContentbody">
		<!--검색결과가 없는 경우 : 시작-->
		<c:if test="${fn:length(invitationList) == 0 }">
			<div style="display:flex;padding:20px 0 20px 40px;"> 
				
				<div style="padding: 80px 80px;align-items: center;justify-content: center;
	    display: flex;
	    font-size:20px;
	    text-align:center;
	    flex: 1;
	    height: 100%;
	    -webkit-box-sizing: border-box;
	    box-sizing: border-box;
	    background: #fff;
	    border-radius: 10px;
	    brder: ;
	    -webkit-box-shadow: 0 3px 10px rgb(0 0 0 / 7%);
	    box-shadow: 0 3px 10px rgb(0 0 0 / 7%);">
					조회된 검색 결과가 없습니다.
					</div>
			</div>
		</c:if>
		<!--검색결과가 없는 경우 : 끝-->
		<!--검색결과가 있는 경우 : 시작-->
		<c:if test="${fn:length(invitationList) != 0 }">
			<ul class="nctConList">
				<c:forEach items="${invitationList}" var="data" begin="${paging.startNo}" end="${paging.startNo + (paging.pageRows - 1)}" varStatus="status">
				<li class="">
					<div class="listConItem SecNo">
						${paging.totalRows - status.index}
					</div>
					<a href="javascript:void(0);" class="listConItem CommitTit " >
						<div class="inviKeybox rowItem CommitTitItem">
							<p class="label">초대키</p>
							<p class="inviKey">${ data.admInviId }</p>
						</div>
						<div class="memIDbox CommitTitItem">
							<p class="label">소속</p>
							<p class="cpnCeo">
							<c:if test="${data.admInviGroup eq 'AMG04'}">
								소관과										
							</c:if>
							<c:if test="${data.admInviGroup eq 'AMG05'}">
								전문위원										
							</c:if>
							<c:if test="${data.admInviGroup eq 'AMG06'}">
								기술간사										
							</c:if>
							<c:if test="${data.admInviGroup eq 'AMG03'}">
								국정원										
							</c:if>
							<c:if test="${data.admInviGroup eq 'AMG02'}">
								보호협회										
							</c:if>
							</p>
						</div>
						<div class="memIDbox CommitTitItem">
							<p class="label">이름</p>
							<p class="cpnCeo">${ data.admInviName }</p>
						</div>
						<div class="CommitTitItem">
							<p class="label">휴대폰</p>
							<p class="cpnId">${data.admInviMobile1}-${data.admInviMobile2}-${data.admInviMobile3}</p>
						</div>
						<div class="CommitTitItem">
							<p class="label">이메일</p>
							<p class="cpnId">${data.admInviEmail}</p>
						</div>
					</a>
					<div class="listConItem DateCnt">
						<div class="rowItem">
							<p class="label">초대 요청일</p>
							<p class="regDate">${ data.admInviRegDate10 }</p>
						</div>
					</div>
					<div class="listConItem Status">
						<div class="ListStatus stat_${ data.admInviStat }">
							${ data.admInviStatNm }
						</div>
					</div>
				</li>
					
					
				</c:forEach>
			</ul>
		</c:if>
		<!--검색결과가 있는 경우 : 끝-->
	</div>
</div>	
<div class="nctContentFooter">
	<c:if test="${fn:length(invitationList) ne 0 }">
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
	
	
