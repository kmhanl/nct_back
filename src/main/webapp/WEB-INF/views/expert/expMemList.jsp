<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 현재 년도 날짜 -->
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="nowDate"><fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" /></c:set>

<script type="text/javascript" src="/resources/js/expert/datepickPopup.js"></script>
<script type="text/javascript" src="/resources/js/expert/datepickList.js"></script>		
		<div class="body_wrapper03" style="padding: 56px 0px 50px 0px;background: #ededed;">
			<div class=BodyListP>
				<div class="WelcomBox">
					<p class="WelcomCom">
						안녕하세요. <span class="WelcomName">${user.admName }</span>님 <br> 전문위원회에 오신걸 환영합니다.
					</p>
				</div>
				
				<!--검색결과가 없는 경우 : 시작-->
				<c:if test="${fn:length(datepickList) == 0 }">
				<div class="no_list">
					<p>진행중 혹은 개최 예정인 전문위원회가 없습니다.</p>
				</div>
				</c:if>
				<!--검색결과가 없는 경우 : 끝-->
				
				
				<!--검색결과가 있는 경우 : 시작 -->
				<c:if test="${fn:length(datepickList) != 0 }">
				<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd HH:mm"/>
				<fmt:formatDate var="chktoday" value="${now}" pattern="yyyyMMddHHmmss"/>
				
				<div class="CommitListP">
					<c:forEach items="${datepickList}"
						var="dp"
						begin="${paging.startNo}"
						end="${paging.startNo + (paging.pageRows - 1)}"
						varStatus="status">
					<div class="CommitListCard">
						<p class="ComTypeFlag">${dp.committeeType eq 'A' ? '대면' : '서면' } <%-- ${dp.committeeIdx }/ ${dp.committeeStatus} --%></p>
						
						<p class="CommitComNum">${dp.committeeYear }년 ${dp.committeeTechNum }회차 </p>
						<p class="CommitT"><span class="TitleTech">${dp.committeeTechName }</span> 전문위원회</p>
						<p class="CommitTechNum">- 통합 ${dp.committeeYear }년 ${dp.committeeNum }회차 전문위원회 -</p>
						
						
						<%-- ${dp.committeeDatePickS} --%>
						
						<%-- ${today} / ${chktoday}<br>
						<br>
						
						${dp.committeeDatePickS} / 
						<c:if test="${chktoday >= dp.committeeDatePickS}">
							Y
						</c:if> --%>
						<%-- <br>
						${dp.committeeDatePickE}<br>
						<br>
						${dp.committeeModiS}<br>
						${dp.committeeModiE}<br> 
						<c:if test="${today >= dp.committeeDatePickS}">
							
							참석일 선택 선택일이 현재보다 지남
						</c:if>--%>
						
						
						<div class="TodoBox">
							<div class="ComInfoBox">
								<p class="CominfoLabel">검토 안건</p>
								<p class="CommitInfo">${dp.committeeAgdCnt } 건       <%-- ${ dp.committeeConfirmYn} / ${ dp.committeeType} --%></p>
							</div>
							<c:choose>
								<c:when test="${dp.committeeStatus eq 'DP' }">
									<div class="ComInfoBox">
										<p class="CominfoLabel">
										참석일 선택 기간
										</p>
										<p class="CommitInfo">${dp.committeeDatePickEDisp } 마감</p>
									</div>
									<c:if test="${chktoday <= dp.committeeDatePickS}">
										<p class="InfoCommen dpstat03">
											${dp.committeeDatePickSDisp }부터 <br>참석일 선택이  가능 합니다.
										</p>
										<a href="javascript:void(0);" data-exidx="${dp.committeeIdx }" class="DatePickBtn" style="background:#888;">위원회 준비중</a>
									</c:if>
									<c:if test="${chktoday >= dp.committeeDatePickS}">
										<c:if test="${chktoday <= dp.committeeDatePickE}">
											<p class="InfoCommen dpstat02">
												참석일 선택 기간 입니다. <br>참석가능한 날짜를 선택해주세요.
											</p>
											<a href="javascript:void(0);" data-exidx="${dp.committeeIdx }" class="DatePickBtn DatePickSetBtn">참석일 선택</a>
										</c:if>
										<c:if test="${chktoday >= dp.committeeDatePickE}">
											<p class="InfoCommen dpstat01">
												참석일 선택 기간이 종료 되었습니다.
												<br>곧 위원회 개최가 확정 됩니다.
											</p>
											<a href="javascript:void(0);" data-exidx="${dp.committeeIdx }" class="DatePickBtn" style="background:#888;">위원회 준비중</a>
										</c:if>
									</c:if>
								</c:when>
								<c:when test="${dp.committeeStatus eq 'RD' }">
									<div class="ComInfoBox">
										<c:if test="${ dp.committeeType eq 'A' }">
											<c:if test="${ dp.committeeConfirmYn eq 'N' }">
												<p class="CominfoLabel">참석일 선택 기간</p>
												<p class="CommitInfo">${dp.committeeDatePickEDisp } 마감</p>
											</c:if>
											<c:if test="${ dp.committeeConfirmYn eq 'Y' }">
												<p class="CominfoLabel">의견 열람 기간</p>
												<p class="CommitInfo">${dp.committeeModiEDisp } 마감</p>
											</c:if>
										</c:if>
										<c:if test="${ dp.committeeType eq 'B' }">
											<p class="CominfoLabel">의견 열람 기간</p>
											<p class="CommitInfo">${dp.committeeModiEDisp } 마감</p>
										</c:if>
									</div>
									<!-- 열람 시작 기간  -->
									<c:if test="${chktoday <= dp.committeeModiS}">
										<p class="InfoCommen dpstat03">
											개최 예정인 전문위원회 입니다.<br> ${dp.committeeModiSDisp }부터 자료 열람이 가능 합니다.
										</p>
										<a href="javascript:void(0);" data-exidx="${dp.committeeIdx }" class="DatePickBtn" style="background:#888;">위원회 대기중</a>
									</c:if>
									<c:if test="${chktoday >= dp.committeeModiS}">
										<c:if test="${chktoday <= dp.committeeModiE}">
											<p class="InfoCommen dpstat02">
												개최 예정인 전문위원회 입니다.<br>
												위원회 개최 후 의견작성이 가능합니다.
											</p>
											<a href="/expert/expMemView.do?committeeIdx=${dp.committeeIdx }" class="ComWriteXBtn DatePickBtn" data-strdate="2022.00.00 00:00">자료 열람  하기</a>
										</c:if>
										<c:if test="${chktoday >= dp.committeeModiE}">
											<p class="InfoCommen dpstat01">
												개최 예정인 전문위원회 입니다.
												<br>자료 열람 기간이 종료 되었습니다.
											</p>
											<a href="javascript:void(0);" data-exidx="${dp.committeeIdx }" class="DatePickBtn" style="background:#888;">위원회 대기중</a>
										</c:if>
										
									</c:if>	
									<%-- <a href="/expert/committeepWrite.do?committeeIdx=${dp.committeeIdx }" class="ComWriteXBtn DatePickBtn" data-strdate="2022.00.00 00:00">의견 열람  하기</a> --%>
								
								
								</c:when>
								<c:when test="${dp.committeeStatus eq 'IN' }">
									<div class="ComInfoBox">
										<p class="CominfoLabel">
											의견 작성 기간
										</p>
										<p class="CommitInfo">${dp.committeeDatePickEDisp } 마감</p>
									</div>
									<p class="InfoCommen dpstat02">
										전문위원회가 진행중 입니다.<br>
										위원님의 검토 의견을 작성해주세요.
									</p>
									<a href="/expert/expMemWrite.do?committeeIdx=${dp.committeeIdx }" class="ComWriteXBtn DatePickBtn" data-strdate="2022.00.00 00:00">의견 작성  하기</a>
									
								</c:when>
							</c:choose>
						</div>
					</div>
					</c:forEach>
					
<!-- 					</div> -->
<!-- 					<div class="CommitListCard"> -->
<!-- 						<p class="ComTypeFlag">대면</p> -->
<!-- 						<p class="CommitComNum">2022년 1회차 </p> -->
<!-- 						<p class="CommitT"><span class="TitleTech">반도체</span> 전문위원회</p> -->
<!-- 						<p class="CommitTechNum">- 통합 2022년 4회차 전문위원회 -</p> -->
<!-- 						<p class="CommitDateNum">2000.00.00 00:00<br>한국산업기술보호협회 2층 회의실</p> -->
<!-- 						<div class="TodoBox"> -->
<!-- 							<div class="ComInfoBox"> -->
<!-- 								<p class="CominfoLabel">검토 안건</p> -->
<!-- 								<p class="CommitInfo">00 건</p> -->
<!-- 							</div> -->
<!-- 							<div class="ComInfoBox"> -->
<!-- 								<p class="CominfoLabel">의견 작성 기간</p> -->
<!-- 								<p class="CommitInfo">2000.00.00 00:00 마감</p> -->
<!-- 							</div> -->
<!-- 							<p class="InfoCommen">수고하셨습니다.<br> -->
<!-- 							위원님의 검토의견 제출이 완료 되었습니다.</p> -->
<!-- 							<a href="#none" class="DatePickBtn">의견 수정 하기</a> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="CommitListCard"> -->
<!-- 						<p class="ComTypeFlag">비대면</p> -->
<!-- 						<p class="CommitComNum">2022년 1회차 </p> -->
<!-- 						<p class="CommitT"><span class="TitleTech">반도체</span> 전문위원회</p> -->
<!-- 						<p class="CommitTechNum">- 통합 2022년 4회차 전문위원회 -</p> -->
					
<!-- 						<div class="TodoBox"> -->
<!-- 							<div class="ComInfoBox"> -->
<!-- 								<p class="CominfoLabel">검토 안건</p> -->
<!-- 								<p class="CommitInfo">00 건</p> -->
<!-- 							</div> -->
<!-- 							<div class="ComInfoBox">  -->
<!-- 								<p class="CominfoLabel">자료 열람 기간</p> -->
<!-- 								<p class="CommitInfo">2000.00.00 00:00 마감</p> -->
<!-- 							</div> -->
<!-- 							<p class="InfoCommen">의견 작성이 진행중입니다.<br> -->
<!-- 								위원님의 검토 의견을 작성 및 제출 해주세요.</p> -->
<!-- 							<a href="#none" class="DatePickBtn">의견 작성 하기</a> -->
<!-- 						</div> -->
<!-- 					</div> -->
				</div>
				</c:if>
				<!--검색결과가 있는 경우 : 끝-->
			</div>
		</div>