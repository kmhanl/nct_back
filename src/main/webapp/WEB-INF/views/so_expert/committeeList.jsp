<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="/resources/js/expert/datepickPopup.js"></script>
<script type="text/javascript" src="/resources/js/expert/committeePopup.js"></script>
<script type="text/javascript" src="/resources/js/expert/committeeList.js"></script>	
		<input type="hidden" id="committeeStatus" value="<%= (request.getParameter("committeeStatus") == null ? "" : request.getParameter("committeeStatus")) %>"/>	
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
					<c:set var="ceCnt" value="0"></c:set>
					<c:set var="ciCnt" value="0"></c:set>
					<c:set var="ccCnt" value="0"></c:set>
					<c:set var="seCnt" value="0"></c:set>
					<c:set var="icCnt" value="0"></c:set>
					<c:forEach items="${tabList}" var="item">
						<c:set var="totCnt" value = "${totCnt + item.count}"/>
						<c:choose>
							<c:when test="${item.title eq 'CE'}">
								<c:set var="ceCnt" value = "${item.count}"/>
							</c:when>
							<c:when test="${item.title eq 'CI'}">
								<c:set var="ciCnt" value = "${item.count}"/>
							</c:when>
							<c:when test="${item.title eq 'CC'}">
								<c:set var="ccCnt" value = "${item.count}"/>
							</c:when>
							<c:when test="${item.title eq 'SE'}">
								<c:set var="seCnt" value = "${item.count}"/>
							</c:when>
							<c:when test="${item.title eq 'IC'}">
								<c:set var="icCnt" value = "${item.count}"/>
							</c:when>
						</c:choose>
					</c:forEach>
					<li class="${param.committeeStatus eq null ? 'on' : '' }" data-status="ALL"><a href="#none" class="tap_item">전체 ${ totCnt }</a></li>
					<li class="${param.committeeStatus eq 'CE' ? 'on' : '' }" data-status="CE"><a href="#none" class="tap_item">전문위예정${ ceCnt }</a></li>
					<li class="${param.committeeStatus eq 'CI' ? 'on' : '' }" data-status="CI"><a href="#none" class="tap_item">전문위진행중${ ciCnt }</a></li>
					<li class="${param.committeeStatus eq 'CC' ? 'on' : '' }" data-status="CC"><a href="#none" class="tap_item">협회결과도출중${ ccCnt }</a></li>
					<li class="${param.committeeStatus eq 'SE' ? 'on' : '' }" data-status="SE"><a href="#none" class="tap_item">소관과결과도출정${ seCnt }</a></li>
					<li class="${param.committeeStatus eq 'IC' ? 'on' : '' }" data-status="IC"><a href="#none" class="tap_item">최종검토완료${ icCnt }</a></li>
				</ul>
			</div>
			<div class="BodyList">
				<!--검색결과가 없는 경우 : 시작-->
				<c:if test="${fn:length(datepickList) == 0 }">
				<div class="no_list" style="height:100px;">
					조회된 전문위원회가 없습니다.
				</div>
				</c:if>
				<!--검색결과가 없는 경우 : 끝-->
				<!--검색결과가 있는 경우 : 시작
				<div class="card">
					<a href="javascript:void(0);" class="tap_btn agdmodify" data-ex-idx="2022-0001">안건설정</a>
				</div>
				<div class="card">
					<a href="javascript:void(0);" class="tap_btn memmodify" data-ex-idx="2022-0001">위원설정</a>
				</div>
				<div class="card">
					<a href="javascript:void(0);" class="tap_btn datemodify" data-ex-idx="2022-0001">개최예정일설정</a>
				</div>
				-->
				<c:if test="${fn:length(datepickList) != 0 }">
				<ul class="CommitListD" style="clear:both">
					<c:forEach items="${datepickList}"
						var="dp"
						begin="${paging.startNo}"
						end="${paging.startNo + (paging.pageRows - 1)}"
						varStatus="status">
					<li class="">
						<div class="ListSection SecNo">
							${paging.totalRows - status.index}
						</div>
						<div class="ListSection CommitTech">
							<p class="CommitTechIcon">${dp.committeeStatusName }</p>
						</div>
						
						<div class="ListSection CommitTit" data-ex-idx="${dp.committeeIdx}">
							<p class="CommitT">
							<span class="TitleTech">${ dp.committeeType eq 'A' ? '[대면]' : '[서면]' }</span>
								${dp.committeeYear }년 ${dp.committeeTechNum }회차 
							<span class="TitleTech">${dp.committeeTechName }</span> 전문위원회
							<span class="CommitTechNum">(통합 ${dp.committeeYear }년 ${dp.committeeNum }회차 전문위원회)</span></p>
							<c:choose>
							<c:when test="${dp.committeeType eq 'A' }">
								<p class="CommitIdx"><span class="ListLabel">개최일 : ${dp.committeeDatePickDisp } (${ dp.committeeDateAdd })</span></p>
								<p class="CommitIdx"><span class="ListLabel">자료 열람 기간 : ${dp.committeeModiSDisp } ~ ${dp.committeeModiEDisp }</span></p>
							</c:when>
							<c:when test="${dp.committeeType eq 'B' }">
								<p class="CommitIdx"><span class="ListLabel">검토의견 작성 기간 : ${dp.committeeModiSDisp } ~ ${dp.committeeModiEDisp }</span></p>
							</c:when>
							</c:choose>
						</div>
						<div class="ListSection AgdCnt">
							<p class="ListLabel">의견 작성<span class="cntnum">${ dp.committeeOpinionYCnt } / ${ dp.committeeOpinionYCnt + dp.committeeOpinionNCnt }</span>건</p>
							<c:choose>
							<c:when test="${ dp.committeeStatus eq 'CE' }">
								<!-- 전문위 예정 -->
								<a href="#none" class="btnB goopinion" data-ex-idx="${dp.committeeIdx }">자료 열람</a>
								<c:choose>
								<c:when test="${ user.admGroup eq 'AMG01' or user.admGroup eq 'AMG02' }">
									<a href="#none" class="btnB cancleCom" data-ex-idx="${dp.committeeIdx }">개최 취소</a>
								</c:when>
								<c:when test="${ user.admGroup eq 'AMG04' }">
									<a href="#none" class="btnB cancleCom" data-ex-idx="${dp.committeeIdx }">개최 취소</a>
									<c:if test="${ dp.open }">
										<a href="javascript:void(0);" class="btnB sendagd open-committee" data-ex-idx="${dp.committeeIdx }">전문위 개회</a>
									</c:if>
								</c:when>
								</c:choose>
							</c:when>
							<c:when test="${ dp.committeeStatus eq 'CI' }">
								<!-- 전문위 진행중 -->
								<c:choose>
									<c:when test="${ user.admGroup eq 'AMG01' }">
										<a href="#none" class="btnB goopinion" data-ex-idx="${dp.committeeIdx }">자료 열람</a>
									</c:when>
									<c:when test="${ user.admGroup eq 'AMG02' }">
										<a href="#none" class="btnB goopinion" data-ex-idx="${dp.committeeIdx }">자료 열람</a>
										<a href="#none" class="btnB cancleCom close-committee" data-ex-idx="${dp.committeeIdx }">전문위 종료</a>
									</c:when>
									<c:when test="${ user.admGroup eq 'AMG03' }">
										<a href="#none" class="btnB goopinion" data-ex-idx="${dp.committeeIdx }">의견 작성</a>
									</c:when>
									<c:when test="${ user.admGroup eq 'AMG04' }">
										<a href="#none" class="btnB goopinion" data-ex-idx="${dp.committeeIdx }">의견 작성</a>
										<a href="#none" class="btnB cancleCom close-committee" data-ex-idx="${dp.committeeIdx }">전문위 종료</a>
									</c:when>
								</c:choose>
							</c:when>
							<c:when test="${ dp.committeeStatus eq 'CC' or dp.committeeStatus eq 'SE' }">
								<!-- 협회결과도출중, 소관과의견도출중 -->
								<c:choose>
								<c:when test="${ user.admGroup eq 'AMG01' }">
									<a href="#none" class="btnB goopinion" data-ex-idx="${dp.committeeIdx }">자료 열람</a>
								</c:when>
								<c:when test="${ user.admGroup eq 'AMG02' }">
									<a href="#none" class="btnB sendagd" data-ex-idx="${dp.committeeIdx }">협회결과 등록</a>
								</c:when>
								<c:when test="${ user.admGroup eq 'AMG03' }">
									<a href="#none" class="btnB goopinion" data-ex-idx="${dp.committeeIdx }">자료 열람</a>
								</c:when>
								<c:when test="${ user.admGroup eq 'AMG04' }">
									<a href="#none" class="btnB sendagd" data-ex-idx="${dp.committeeIdx }">기술안보과 이관</a>
								</c:when>
								</c:choose>
							</c:when>
							<c:when test="${ dp.committeeStatus eq 'IC' }">
								<!-- 최종검토완료 -->
								<c:choose>
								<c:when test="${ user.admGroup eq 'AMG01' }">
								</c:when>
								<c:when test="${ user.admGroup eq 'AMG02' }">
									<a href="#none" class="btnB cancleCom" data-ex-idx="${dp.committeeIdx }">이관 회수</a>
								</c:when>
								<c:when test="${ user.admGroup eq 'AMG03' }">
								</c:when>
								<c:when test="${ user.admGroup eq 'AMG04' }">
									<a href="#none" class="btnB cancleCom" data-ex-idx="${dp.committeeIdx }">이관 회수</a>
								</c:when>
								</c:choose>
							</c:when>
							</c:choose>
<%-- 							<a href="#none" class="btnB goopinion" data-ex-idx="${dp.committeeIdx }">자료 열람</a> --%>
<%-- 							<a href="#none" class="btnB cancleCom" data-ex-idx="${dp.committeeIdx }">개최 취소</a> --%>
<%-- 							<a href="#none" class="btnB sendagd" data-ex-idx="${dp.committeeIdx }">전문위 개회</a> --%>
<%-- 							<a href="#none" class="btnB cancleCom" data-ex-idx="${dp.committeeIdx }">전문위 종료</a> --%>
<%-- 							<a href="#none" class="btnB goopinion" data-ex-idx="${dp.committeeIdx }">의견 작성</a> --%>
						</div>
						<c:if test="${ false }">
						<div class="ListSection AgdCnt">
							<p class="ListLabel">안건<span class="cntnum">${dp.committeeAgdCnt }</span>건</p>
							<a href="javascript:void(0);" class="btn agdmodify" data-ex-idx="${dp.committeeIdx }">안건 설정</a>
						</div>
						<div class="ListSection MemCnt">
							<p class="ListLabel">구성원<span class="cntnum">${dp.committeeAmg03Cnt + dp.committeeAmg04Cnt + dp.committeeAmg05Cnt + dp.committeeAmg06Cnt }</span>명</p>
							<a href="#none" class="btn memmodify" data-ex-idx="${dp.committeeIdx }" data-ex-tech-id="${dp.committeeTechId }">구성원 설정</a>
						</div>
						<div class="ListSection DateCnt">
							<p class="ListLabel">참석일 선택 <span class="cntnum">${dp.committeeMemberCnt }</span>명</p>
							<a href="#none" class="btn datemodify" data-ex-idx="${dp.committeeIdx }">후보일 설정</a>
							<a href="#none" class="btn datestat1" data-ex-idx="${dp.committeeIdx }">참석일 현황</a>
						</div>
						</c:if>
						<div class="ListSection Alert">
							<p class="ListLabel">알림</p>
							<a href="javascript:void(0);" class="btn sendsms" data-ex-idx="${dp.committeeIdx }">SMS</a>
							<a href="javascript:void(0);" class="btn sendemail" data-ex-idx="${dp.committeeIdx }">E-mail</a>
						</div>
					</li>
					</c:forEach>
<!-- 					<li class=""> -->
<!-- 						<div class="ListSection SecNo"> -->
<!-- 							999 -->
<!-- 						</div> -->
<!-- 						<div class="ListSection CommitTech"> -->
<!-- 							<p class="CommitTechIcon">결과 입력중</p> -->
<!-- 						</div> -->
<!-- 						<div class="ListSection CommitTit" data-ex-idx="2022-0001"> -->
<!-- 							<p class="CommitT">2022년 1회차 <span class="TitleTech">반도체</span> 전문위원회<span class="CommitTechNum">(통합 2022년 4회차 전문위원회)</span></p> -->
<!-- 							<p class="CommitIdx"><span class="ListLabel">참석일 선택 기간 : 2022.00.00 00:00 ~ 2022.00.00 00:00</span></p> -->
<!-- 						</div> -->
<!-- 						<div class="ListSection AgdCnt"> -->
<!-- 							<p class="ListLabel">안건<span class="cntnum">000</span>건</p> -->
<!-- 							<a href="#none" class="btn agdmodify" data-ex-idx="2022-0001">안건 설정</a> -->
<!-- 						</div> -->
<!-- 						<div class="ListSection MemCnt"> -->
<!-- 							<p class="ListLabel">구성원<span class="cntnum">000</span>명</p> -->
<!-- 							<a href="#none" class="btn memmodify" data-ex-idx="2022-0001">구성원 설정</a> -->
<!-- 						</div> -->
<!-- 						<div class="ListSection DateCnt"> -->
<!-- 							<p class="ListLabel">참석일 선택 <span class="cntnum">000</span>명</p> -->
<!-- 							<a href="#none" class="btn datemodify" data-ex-idx="2022-0001">후보일 설정</a> -->
<!-- 							<a href="#none" class="btn datestat1" data-ex-idx="2022-0001">참석일 현황</a> -->
<!-- 						</div> -->
<!-- 						<div class="ListSection Alert"> -->
<!-- 							<p class="ListLabel">알림</p> -->
<!-- 							<a href="#none" class="btn sendsms" data-ex-idx="2022-0001">SMS</a> -->
<!-- 							<a href="#none" class="btn sendemail" data-ex-idx="2022-0001">E-mail</a> -->
<!-- 						</div> -->
<!-- 					</li> -->
<!-- 					<li class=""> -->
<!-- 						<div class="ListSection SecNo"> -->
<!-- 							999 -->
<!-- 						</div> -->
<!-- 						<div class="ListSection CommitTech"> -->
<!-- 							<p class="CommitTechIcon">결과 입력 완료</p> -->
<!-- 						</div> -->
<!-- 						<div class="ListSection CommitTit" data-ex-idx="2022-0001"> -->
<!-- 							<p class="CommitT">2022년 1회차 <span class="TitleTech">반도체</span> 전문위원회<span class="CommitTechNum">(통합 2022년 4회차 전문위원회)</span></p> -->
<!-- 							<p class="CommitIdx"><span class="ListLabel">참석일 선택 기간 : 2022.00.00 00:00 ~ 2022.00.00 00:00</span></p> -->
<!-- 						</div> -->
<!-- 						<div class="ListSection AgdCnt"> -->
<!-- 							<p class="ListLabel">안건<span class="cntnum">000</span>건</p> -->
<!-- 							<a href="#none" class="btn agdmodify" data-ex-idx="2022-0001">안건 설정</a> -->
<!-- 						</div> -->
<!-- 						<div class="ListSection MemCnt"> -->
<!-- 							<p class="ListLabel">구성원<span class="cntnum">000</span>명</p> -->
<!-- 							<a href="#none" class="btn memmodify" data-ex-idx="2022-0001">구성원 설정</a> -->
<!-- 						</div> -->
<!-- 						<div class="ListSection DateCnt"> -->
<!-- 							<p class="ListLabel">참석일 선택 <span class="cntnum">000</span>명</p> -->
<!-- 							<a href="#none" class="btn datemodify" data-ex-idx="2022-0001">후보일 설정</a> -->
<!-- 							<a href="#none" class="btn datestat1" data-ex-idx="2022-0001">참석일 현황</a> -->
<!-- 						</div> -->
<!-- 						<div class="ListSection Alert"> -->
<!-- 							<p class="ListLabel">처리</p> -->
<!-- 							<a href="#none" class="btn sendsms" data-ex-idx="2022-0001">기술안보과 이관</a> -->
							
<!-- 						</div> -->
<!-- 					</li> -->
<!-- 					<li class=""> -->
<!-- 						<div class="ListSection SecNo"> -->
<!-- 							999 -->
<!-- 						</div> -->
<!-- 						<div class="ListSection CommitTech"> -->
<!-- 							<p class="CommitTechIcon">검토 완료</p> -->
<!-- 						</div> -->
<!-- 						<div class="ListSection CommitTit" data-ex-idx="2022-0001"> -->
<!-- 							<p class="CommitT">2022년 1회차 <span class="TitleTech">반도체</span> 전문위원회<span class="CommitTechNum">(통합 2022년 4회차 전문위원회)</span></p> -->
<!-- 							<p class="CommitIdx"><span class="ListLabel">참석일 선택 기간 : 2022.00.00 00:00 ~ 2022.00.00 00:00</span></p> -->
<!-- 						</div> -->
<!-- 					</li> -->
					
				</ul>
				</c:if>
				<!--검색결과가 있는 경우 : 끝-->
			</div>
						
			<c:if test="${fn:length(datepickList) ne 0 }">
			<div class="BodyBottomUtil">
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