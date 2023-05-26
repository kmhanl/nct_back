<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="nowDate"><fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" /></c:set>
<script type="text/javascript" src="/resources/js/expert/datepickPopup.js"></script>
<script type="text/javascript" src="/resources/js/expert/datepickList.js"></script>		
<script type="text/javascript" src="/resources/js/expert/exList.js"></script>
<script type="text/javascript" src="/resources/js/expert/exListPopup.js"></script>	
		<div class="body_wrapper">
			<div class="BodyTopUtile ">
				<a href="#none" class="sch_btn">
					<svg version="1.1" id="Capa_1" x="0px" y="0px" fill="#888" viewBox="0 0 124.524 124.524" xml:space="preserve">
						<path d="M51,102.05c10.5,0,20.2-3.2,28.3-8.6l29.3,29.3c2.301,2.3,6.101,2.3,8.5,0l5.7-5.7c2.3-2.3,2.3-6.1,0-8.5L93.4,79.35		c5.399-8.1,8.6-17.8,8.6-28.3c0-28.1-22.9-51-51-51c-28.1,0-51,22.9-51,51C0,79.149,22.8,102.05,51,102.05z M51,20.05
		c17.1,0,31,13.9,31,31c0,17.1-13.9,31-31,31c-17.1,0-31-13.9-31-31C20,33.95,33.9,20.05,51,20.05z"/>
					</svg>
				</a>
			</div>
			<div class="BodyList">
				<fmt:formatDate var="chktoday" value="${now}" pattern="yyyyMMddHHmmss"/>
					
				<!--검색결과가 없는 경우 : 시작-->
				<c:if test="${fn:length(datepickList) == 0 }">
					<div class="no_list" style="height:100px;">
						개최 예정인 전문위원회가 없습니다.
					</div>
				</c:if>
				<!--검색결과가 없는 경우 : 끝-->
				<!--검색결과가 있는 경우 : 시작
				<!-- <p>계최 예정인 전문위원회 목록 입니다. 개최일이 확정 되면 위원회 현황으로 이관 됩니다.</p> -->
				<c:if test="${fn:length(datepickList) != 0 }">
				
				<ul class="CommitListD" style="clear:both">
					
					<c:forEach items="${datepickList}" var="dp" begin="${paging.startNo}"
						end="${paging.startNo + (paging.pageRows - 1)}"
						varStatus="status">
					<li>
						<div class="ListSection SecNo">
							${paging.totalRows - status.index}
						</div>
						<div class="ListSection CommitTech">
							<p class="CommitTechIcon">
							위원회 예정<br>
							</p>
						</div>
						<div class="ListSection CommitTit" data-ex-idx="${dp.committeeIdx }">
							<%-- <c:if test="${dp.dateCheckYn ne 'Y'}">
								<div class="DateEndMessege">
									<p>참석일 선택 기간이 종료 되었습니다.</p>
								</div>${dp.committeeIdx }
							</c:if> --%>
							<p class="CommitT">
							<span class="TitleTech">${ dp.committeeType eq 'A' ? '[대면]' : '[서면]' } </span>
							${dp.committeeYear }년 ${dp.committeeTechNum }회차 
							<span class="TitleTech">${dp.committeeTechName }</span> 전문위원회
							<span class="CommitTechNum">(통합 ${dp.committeeYear }년 ${dp.committeeNum }회차 전문위원회)${dp.committeeStatus}</span></p>
							<p class="ListLabel">등록일 : ${dp.lastUpdt} | 참석일 선택 기간 : ${dp.committeeDatePickSDisp } ~ ${dp.committeeDatePickEDisp }</p>
							
							<c:if test="${chktoday <= dp.committeeDatePickS}">
								<span class="ListPreLabel">${dp.committeeDatePickSDisp }부터 참석일 선택이  가능 합니다.</span>
							</c:if>
							<c:if test="${chktoday >= dp.committeeDatePickS}">
								<c:if test="${chktoday <= dp.committeeDatePickE}">
									<span class="ListIngLabel">참석일 선택 기간 입니다. 참석가능한 날짜를 선택해주세요.</span>
								</c:if>
								<c:if test="${chktoday >= dp.committeeDatePickE}">
									<span class="ListEndLabel">참석일 선택 기간이 종료 되었습니다.</span>
								</c:if>
								
							</c:if>
						</div>
						
						<%-- <div class="ListSection AgdCnt">${dp.committeeStatus}
							<p class="ListLabel">안건<span class="cntnum">${dp.committeeAgdCnt }</span>건</p>
							<c:if test="${ user.admGroup eq 'AMG01' or user.admGroup eq 'AMG02' or user.admGroup eq 'AMG03' }">
								<a href="javascript:void(0);" class="btn agdmodify" data-ex-idx="${dp.committeeIdx }">안건 확인</a>
							</c:if>
							<c:if test="${ user.admGroup eq 'AMG04'}">
								<a href="javascript:void(0);" class="btn agdmodify" data-ex-idx="${dp.committeeIdx }" data-ex-tech="${dp.committeeTechId }">안건 설정</a>
							</c:if>
						</div>
						<div class="ListSection MemCnt">
							<p class="ListLabel">구성원<span class="cntnum">${dp.committeeAmg03Cnt + dp.committeeAmg04Cnt + dp.committeeAmg05Cnt + dp.committeeAmg06Cnt }</span>명</p>
							<a href="javascript:void(0);" class="btn memmodify" data-ex-idx="${dp.committeeIdx }">구성원 설정</a>
						</div> --%>
						
						<%-- <div class="ListSection DateCnt">
							<p class="ListLabel">참석일 선택 <span class="cntnum">${dp.committeeMemberCnt} / ${dp.committeeAmg03Cnt + dp.committeeAmg04Cnt + dp.committeeAmg05Cnt + dp.committeeAmg06Cnt }</span>명</p>
							<c:if test="${ user.admGroup eq 'AMG01' or user.admGroup eq 'AMG02' or user.admGroup eq 'AMG03' }">
								<a href="javascript:void(0);" class="btn datestat2" data-ex-idx="${dp.committeeIdx }">참석일 현황</a>
							</c:if>
							<c:if test="${ user.admGroup eq 'AMG04'}">
								<a href="javascript:void(0);" class="btn datemodify" data-ex-idx="${dp.committeeIdx }">후보일 설정</a>
								<c:if test="${dp.memInYn ne null}">
									<a href="javascript:void(0);" class="btn datestat1" data-ex-idx="${dp.committeeIdx }">참석일 선택</a>
								</c:if>
							</c:if>
						</div> --%>
						<%-- <c:if test="${ user.admGroup eq 'AMG02' or user.admGroup eq 'AMG04'}">
						<div class="ListSection AgdCnt">
							<div class="ListSection Datecho" style="border-right:0;">
								<a href="javascript:void(0);" class="btn datestat2" data-ex-idx="${dp.committeeIdx }" data-user-group="${user.admGroup }" data-user-tech="${user.admAuthTech }">위원회 설정 수정</a>
							</div>
						</div>
						</c:if> --%>
						<c:if test="${ user.admGroup eq 'AMG01'or user.admGroup eq 'AMG03'}">
							<div class="ListSection Datecho">
								<a href="javascript:void(0);" class="btn datestat1" data-ex-idx="${dp.committeeIdx }">참석일 선택 현황</a>
							</div>
						</c:if>
						<c:if test="${user.admGroup eq 'AMG02'}">
							<div class="ListSection Datecho">
								<a href="javascript:cancelEx('${dp.committeeIdx}','leady');" class="btn canEx" data-ex-idx="${dp.committeeIdx }">전문위 취소</a>
								<a href="javascript:void(0);" class="btn datestat1 btnDateP" data-ex-idx="${dp.committeeIdx }">참석일 선택 현황</a>
							</div>
						</c:if>
						<c:if test="${ user.admGroup eq 'AMG04'}">
							<div class="ListSection Datecho">
								<a href="javascript:cancelEx('${dp.committeeIdx}','leady');" class="btn canEx" data-ex-idx="${dp.committeeIdx }">전문위 취소</a>
								<a href="javascript:void(0);" class="btn datestat3 btnDateP" data-ex-idx="${dp.committeeIdx }">개최일 확정</a>
							</div>
						</c:if>
						<div class="ListSection Alert">
							<p class="ListLabel">알림</p>
							<a href="javascript:void(0);" class="btn sendsms" data-ex-idx="${dp.committeeIdx }">SMS</a>
							<a href="javascript:void(0);" class="btn sendemail" data-ex-idx="${dp.committeeIdx }">E-mail</a>
						</div>
					</li>
						
					</c:forEach>
				</ul>
				</c:if>
				<!--검색결과가 있는 경우 : 끝-->
			</div>
						
			<c:if test="${fn:length(datepickList) ne 0 }">
			<div class="BodyBottomUtil02">
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