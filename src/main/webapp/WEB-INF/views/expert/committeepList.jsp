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
		<div class="body_wrapper03">
			<!-- <div class="BodyTopUtile02 ">
				<a href="#none" class="sch_btn">
						<svg version="1.1" id="Capa_1" x="0px" y="0px" fill="#888" viewBox="0 0 124.524 124.524" xml:space="preserve">
							<path d="M51,102.05c10.5,0,20.2-3.2,28.3-8.6l29.3,29.3c2.301,2.3,6.101,2.3,8.5,0l5.7-5.7c2.3-2.3,2.3-6.1,0-8.5L93.4,79.35		c5.399-8.1,8.6-17.8,8.6-28.3c0-28.1-22.9-51-51-51c-28.1,0-51,22.9-51,51C0,79.149,22.8,102.05,51,102.05z M51,20.05
		c17.1,0,31,13.9,31,31c0,17.1-13.9,31-31,31c-17.1,0-31-13.9-31-31C20,33.95,33.9,20.05,51,20.05z"/>
						</svg>
				</a>
				<ul class="BodyTopUtilTap tap_list" style="">
					<li class="on" data-status="ALL"><a href="#none" class="tap_item">전체 00</a></li>
					<li class="" data-status="AP"><a href="#none" class="tap_item">개최 예정</a></li>
					<li class="" data-status="AP"><a href="#none" class="tap_item">의견 작성중</a></li>
					<li class="" data-status="AP"><a href="#none" class="tap_item">의견 작성 완료</a></li>
					<li class="" data-status="AP"><a href="#none" class="tap_item">검토 완료</a></li>
				</ul>
			</div> -->
			<div class="BodyListP">
				<div class="WelcomBox">
					<p class="WelcomCom">
						<c:if test="${user.admGroup eq 'AMG05'}">
							전문위원
						</c:if>
						<c:if test="${user.admGroup eq 'AMG06'}">
							기술위원
						</c:if>
						<span class="WelcomName">${user.admName }</span>님 환영합니다.
					</p>
				</div>
				<!--검색결과가 없는 경우 : 시작-->
				<c:if test="${fn:length(datepickList) == 0 }">
				<div class="no_list" style="height:100px;">
					진행중 혹은 개최 예정인 전문위원회가 없습니다.
				</div>
				</c:if>
				<!--검색결과가 없는 경우 : 끝-->
				<!-- <div class="CommitListP">
					<div class="CommitListCard">
						<p class="ComTypeFlag">대면</p>
						<p class="CommitComNum">2022년 1회차 </p>
						<p class="CommitT"><span class="TitleTech">반도체</span> 전문위원회</p>
						<p class="CommitTechNum">- 통합 2022년 4회차 전문위원회 -</p>
						<p class="CommitDateNum">2000.00.00 00:00<br>한국산업기술보호협회 2층 회의실</p>
						<div class="TodoBox">
							<div class="ComInfoBox">
								<p class="CominfoLabel">검토 안건</p>
								<p class="CommitInfo">00 건</p>
							</div>
							<div class="ComInfoBox">
								<p class="CominfoLabel">의견 작성 기간</p>
								<p class="CommitInfo">2000.00.00 00:00 마감</p>
							</div>
							<p class="InfoCommen">의견 작성이 진행중입니다.<br>
							위원님의 검토 의견을 작성 및 제출 해주세요.</p>
							<a href="#none" class="DatePickBtn">의견 작성 하기</a>
						</div>
					</div>
					<div class="CommitListCard">
						<p class="ComTypeFlag">대면</p>
						<p class="CommitComNum">2022년 1회차 </p>
						<p class="CommitT"><span class="TitleTech">반도체</span> 전문위원회</p>
						<p class="CommitTechNum">- 통합 2022년 4회차 전문위원회 -</p>
						<p class="CommitDateNum">2000.00.00 00:00<br>한국산업기술보호협회 2층 회의실</p>
						<div class="TodoBox">
							<div class="ComInfoBox">
								<p class="CominfoLabel">검토 안건</p>
								<p class="CommitInfo">00 건</p>
							</div>
							<div class="ComInfoBox">
								<p class="CominfoLabel">의견 작성 기간</p>
								<p class="CommitInfo">2000.00.00 00:00 마감</p>
							</div>
							<p class="InfoCommen">의견 작성이 진행중입니다.<br>
							위원님의 검토 의견을 작성 및 제출 해주세요.</p>
							<a href="#none" class="DatePickBtn">의견 작성 하기</a>
						</div>
					</div>
					<div class="CommitListCard">
						<p class="ComTypeFlag">대면</p>
						<p class="CommitComNum">2022년 1회차 </p>
						<p class="CommitT"><span class="TitleTech">반도체</span> 전문위원회</p>
						<p class="CommitTechNum">- 통합 2022년 4회차 전문위원회 -</p>
						<p class="CommitDateNum">2000.00.00 00:00<br>한국산업기술보호협회 2층 회의실</p>
						<div class="TodoBox">
							<div class="ComInfoBox">
								<p class="CominfoLabel">검토 안건</p>
								<p class="CommitInfo">00 건</p>
							</div>
							<div class="ComInfoBox">
								<p class="CominfoLabel">의견 작성 기간</p>
								<p class="CommitInfo">2000.00.00 00:00 마감</p>
							</div>
							<p class="InfoCommen">의견 작성이 진행중입니다.<br>
							위원님의 검토 의견을 작성 및 제출 해주세요.</p>
							<a href="#none" class="DatePickBtn">의견 작성 하기</a>
						</div>
					</div>
				</div> -->
				<!--검색결과가 있는 경우 : 시작 -->
				<c:if test="${fn:length(datepickList) != 0 }">
				<div class="CommitListP">
					<c:forEach items="${datepickList}"
						var="dp"
						begin="${paging.startNo}"
						end="${paging.startNo + (paging.pageRows - 1)}"
						varStatus="status">
					<div class="CommitListCard">
						<p class="ComTypeFlag">${dp.committeeType eq 'A' ? '대면' : '서면' }</p>
						<p class="CommitComNum">${dp.committeeYear }년 ${dp.committeeTechNum }회차 </p>
						<p class="CommitT"><span class="TitleTech">${dp.committeeTechName }</span> 전문위원회</p>
						<p class="CommitTechNum">- 통합 ${dp.committeeYear }년 ${dp.committeeNum }회차 전문위원회 -</p>
						
						<div class="TodoBox">
							<div class="ComInfoBox">
								<p class="CominfoLabel">검토 안건</p>
								<p class="CommitInfo">${dp.agdCnt } 건</p>
							</div>
							<div class="ComInfoBox">
								<p class="CominfoLabel">
								<c:if test="${ dp.committeeConfirmYn eq 'N' }">
									참석일 선택 기간
								</c:if>
								<c:if test="${ dp.committeeConfirmYn eq 'Y' }">
									의견 열람 기간
								</c:if>
								</p>
								<c:choose>
								<c:when test="${dp.committeeType eq 'A' }">
									<c:if test="${ dp.committeeConfirmYn eq 'N' }">
										<p class="CommitInfo">${dp.committeeDatePickEDisp } 마감</p>
									</c:if>
									<c:if test="${ dp.committeeConfirmYn eq 'Y' }">
										<p class="CommitInfo">${dp.committeeModiEDisp } 마감</p>
									</c:if>
								</c:when>
								<c:when test="${dp.committeeType eq 'B' }">
									<p class="CommitInfo">${dp.committeeModiEDisp } 마감</p>
								</c:when>
								</c:choose>
							</div>
							<c:choose>
								<c:when test="${dp.committeeStatus eq 'CE' }">
									<!-- 개최예정 -->
									<c:if test="${ dp.committeeConfirmYn eq 'N' }">
										<!-- 개최일 미 확정 -->
										<c:if test="${dp.committeeDatePickS le nowDate and dp.committeeDatePickE ge nowDate and dp.committeeDatePickMember eq 'N' }">
										<p class="InfoCommen">개최 예정인 전문위원회 입니다.<br>
										위원님의 참석 가능한 날짜를 선택해주세요.</p>
										<a href="javascript:void(0);" data-exidx="${dp.committeeIdx }" class="DatePickBtn DatePickSetBtn">참석일 선택</a>
										</c:if>
										<c:if test="${dp.committeeDatePickS le nowDate and dp.committeeDatePickE ge nowDate and dp.committeeDatePickMember eq 'Y' }">
										<p class="InfoCommen">개최 예정인 전문위원회 입니다.<br>
										위원님의 참석 가능한 날짜 수정이 가능합니다.</p>
										<a href="/expert/committeepWrite.do?committeeIdx=${dp.committeeIdx }" class="DateModiBtn DatePickBtn">참석일 수정</a>
										</c:if>
										<c:if test="${dp.committeeDatePickE le nowDate}">
										<p class="InfoCommen">곧 계최일이 확정 됩니다.<br>
										개최일 확정 후 의견 작성이 가능 합니다.</p>
										<a href="/expert/committeepWrite.do?committeeIdx=${dp.committeeIdx }" class="ComReserBtn DatePickBtn">의견 작성 하기</a>
										</c:if>
									</c:if>
									<c:if test="${ dp.committeeConfirmYn eq 'Y' }">
										<!-- 개최일 미 확정 -->
										<c:if test="${dp.committeeModiS ge nowDate}">
										<p class="InfoCommen">개최 예정인 전문위원회 입니다.<br>
										의견 열람기간이 되면 자료를 열람할 수 있습니다.</p>
<%-- 										<a href="/expert/committeepWrite.do?committeeIdx=${dp.committeeIdx }" class="ComWriteXBtn DatePickBtn" data-strdate="2022.00.00 00:00">자료 열람 하기</a> --%>
										</c:if>
										<c:if test="${dp.committeeModiS lt nowDate}">
										<p class="InfoCommen">개최 예정인 전문위원회 입니다.<br>
										위원회 개최 후 의견작성이 가능합니다.</p>
										<a href="/expert/committeepWrite.do?committeeIdx=${dp.committeeIdx }" class="ComWriteXBtn DatePickBtn" data-strdate="2022.00.00 00:00">자료 열람 하기</a>
										</c:if>
									</c:if>
								</c:when>
								<c:when test="${dp.committeeStatus eq 'CI' }">
									<!-- 결과입력중 -->
									<c:if test="${dp.committeeModiS ge nowDate}">
									<p class="InfoCommen">개최 예정인 전문위원회 입니다.<br>
									위원회 개최 후 의견작성이 가능합니다.</p>
									<a href="/expert/committeepWrite.do?committeeIdx=${dp.committeeIdx }" class="ComWriteXBtn DatePickBtn" data-strdate="2022.00.00 00:00">의견 작성 하기</a>
									</c:if>
									<c:if test="${dp.committeeModiS le nowDate and dp.committeeModiE ge nowDate}">
									<p class="InfoCommen">진행중인 전문위원회 입니다.<br>
									위원님의 검토 의견을 작성해주세요.</p>
									<a href="/expert/committeepWrite.do?committeeIdx=${dp.committeeIdx }" class="ComWriteBtn DatePickBtn" data-strdate="2022.00.00 00:00">의견 작성 하기</a>
									</c:if>
								</c:when>
								<c:when test="${dp.committeeStatus eq 'CC' }">
									<!-- 결과입력완료 -->
									<c:if test="${dp.committeeModiE le nowDate}">
									<p class="InfoCommen">수고하셨습니다.<br>
									위원님의 검토 의견 제출이 완료되었습니다.</p>
									<a href="/expert/committeepWrite.do?committeeIdx=${dp.committeeIdx }" class="ComModiBtn DatePickBtn">의견 수정 하기</a>
									</c:if>
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