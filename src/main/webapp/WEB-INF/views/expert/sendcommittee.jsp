<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <script type="text/javascript" src="/resources/js/expert/committeePopup.js"></script>
	<script type="text/javascript" src="/resources/js/expert/committeeWrite.js"></script>
	<script type="text/javascript" src="/resources/js/expert/exList.js"></script>
	<script type="text/javascript" src="/resources/js/expert/exListPopup.js"></script>
			
    	<input type="hidden" id="userGroup" value="${ user.admGroup }"/>
    	<input type="hidden" id="committeeIdx" value="${ exData.committeeIdx }"/>
    	<input type="hidden" id="committeeStatus" value="${ exData.committeeStatus }"/>
    	<input type="hidden" id="committeeOptCom" value="${ loginMemStat.committeeOptCom }"/>
    	<input type="hidden" id="committeeSignViewYn" value="${ loginMemStat.committeeSignViewYn }"/>
    	<input type="hidden" id="committeeSignWriteYn" value="${ loginMemStat.committeeSignWriteYn }"/>
		<div class="body_wrapper04">
			<div class="ComWriteTit">
				<h1 class="ViewTitle">${ exInfo.committeeYear }년 ${ exInfo.committeeTechNum }회차 <span class="TitleTech">${ exInfo.committeeTechName }</span> 전문위원회</h1>
			</div>
			<!-- <span class="ViewSubTitle">(통합 2022년 4회차 전문위원회)</span> -->
			<div class="ComBoardBox">
				<div class="TodoListBox">
					<div class="ExPageLoding">
							선택하신 안건을 불러오는 중입니다.<br>
							잠시만 기다려주세요.
					</div>
					<div class="TodoLisTitBox">
						<h1 class="TodoLisTit">
						전문위원회 검토 완료 안건
						<span style="font-size:13px;color:#888;">
						<input type="hidden" id="PageCnt" class="test" value="0" style="width:30px;" disabled="disabled">
						<input type="hidden" id="EditPage" class="test" value="" style="width:30px;" disabled="disabled">
						<input type="hidden" id="techType" class="test" value="KTS00701" style="width:65px;" disabled="disabled">
						</span>
						</h1>
					</div>
					<%-- <div class="AgendaTap">
						<ul class="AgendaTapList">
							<c:set var="totCnt" value="0"></c:set>
							<c:set var="preCnt" value="0"></c:set>
							<c:set var="tsvCnt" value="0"></c:set>
							<c:set var="comCnt" value="0"></c:set>
							<c:forEach items="${opinionTabList}" var="item">
								<c:set var="totCnt" value="${ totCnt + item.committeeOptStatusCount }"></c:set>
								<c:choose>
									<c:when test="${item.committeeOptStatus eq 'PW'}">
										<c:set var="preCnt" value = "${item.committeeOptStatusCount}"/>
									</c:when>
									<c:when test="${item.committeeOptStatus eq 'TS'}">
										<c:set var="tsvCnt" value = "${item.committeeOptStatusCount}"/>
									</c:when>
									<c:when test="${item.committeeOptStatus eq 'SA'}">
										<c:set var="comCnt" value = "${item.committeeOptStatusCount}"/>
									</c:when>
								</c:choose>
							</c:forEach>
							<li class="TapOn"><a href="#none" class="AgendaTapItem">전체  <span class="Num">${ totCnt }</span></a></li>
							<li><a href="#none" class="AgendaTapItem">작성전  <span class="Num">${ preCnt }</span></a></li>
							<li><a href="#none" class="AgendaTapItem">임시저장 <span class="Num"> ${ tsvCnt }</span></a></li>
							<li><a href="#none" class="AgendaTapItem">작성완료  <span class="Num">${ comCnt }</span></a></li>
						</ul> 
					</div> --%>
					<div class="ExAgendaBox" style="height:calc(100% - 133px)">
						<ul class="ExAgendaList">
						<c:forEach items="${agdList}" var="row" begin="0" end="${fn:length(agdList)}" varStatus="status">
							<li class="Agd${ row.agdCode } ComsendAgd" data-ex-idx=${ row.agdExIdx } data-agd-type="${ row.rcptTypeCode }" data-agd-idx="${ row.agdCode }" data-agd-view-code="${ row.agdViewCode }" >
								<div class="ModifyAgenda">
									<p class="Ingbox">현재 검토 중인 안건 입니다.</p>
								</div>
								<div class="ExAgendainfo" >
									<span class="ExAgendaCun">안건 ${ status.count }.</span>
									<p class="ExAgendaType">
									<c:if test="${row.rcptTypeCode eq '01'}">
										여부판정
									</c:if>
									<c:if test="${row.rcptTypeCode eq '02'}">
										사전검토
									</c:if>
									<c:if test="${row.rcptTypeCode eq '03'}">
										수출신고
									</c:if>
									<c:if test="${row.rcptTypeCode eq '04'}">
										수출승인
									</c:if>
									<c:if test="${row.rcptTypeCode eq '05'}">
										해외인수·합병 사전검토
									</c:if>
									<c:if test="${row.rcptTypeCode eq '06'}">
										해외인수·합병 신고
									</c:if>
									<c:if test="${row.rcptTypeCode eq '07'}">
										해외인수·합병 승인
									</c:if>
									<c:if test="${row.rcptTypeCode eq '08'}">
										지정
									</c:if>
									<c:if test="${row.rcptTypeCode eq '09'}">
										변경
									</c:if>
									<c:if test="${row.rcptTypeCode eq '10'}">
										해제
									</c:if>
									<c:if test="${row.rcptTypeCode eq '11'}">
										기타
									</c:if>
									<%-- ${ agendarow.agdViewCode } --%>
									</p>
								</div>
								<div class="ExAgendaLinfo">
									<span>안건번호 :</span><p class="ExAgendaNum"> ${ row.agdViewCode }</p>
								</div>
								<div class="ExAgendaTit">
									<c:forEach items="${agendaTitList}" var="aTrow" begin="0" end="${fn:length(agendaTitList)}" varStatus="statusat">
										<c:if test="${aTrow.rcptMetaCode eq row.rcptMetaCode}">
											<p class="">${aTrow.techrcptTechNm }</p>
										</c:if>
									</c:forEach>
									
									<p class="ExAgendaCom">접수번호 : ${row.rcptCode} | 대상기업 : ${row.cpnNm }</p>
								</div>
							</li>
						</c:forEach>
						</ul>
					</div>
					<div class="TotoBottom">
						<!-- <div class="MandatoryBox">
							<div class="MandatoryItem Mandatory01">
								<p class="ManTit">비밀유지의무 동의서</p>
								<p class="Maninfor01">동의서에 서명을 작성해주세요. <a href="#none" class="MandatoryBtn MandatoryBtn01 BtnSEdit">작성하기</a></p>
								<p class="Maninfor02">작성완료. <a href="#none" class="MandatoryBtn MandatoryBtn02 BtnSEdit">수정하기</a></p>
							</div>
							AGM05,06인 경우에만 출력 : 시작
							<div class="MandatoryItem Mandatory02">
								<p class="ManTit">예금계좌이체 승낙서</p>
								<p class="Maninfor01">작성전입니다.<a href="#none" class="MandatoryBtn MandatoryBtn01 BtnBEdit">작성하기</a></p>
								<p class="Maninfor02">승낙서 작성이 완료되었습니다. <a href="#none" class="MandatoryBtn MandatoryBtn02 BtnBEdit">수정하기</a></p>
							</div>
							AGM05,06인 경우에만 출력 : 끝
						</div> -->
						
						<div class="TodoBtnBox">
							<c:if test="${ user.admGroup eq 'AMG00' or user.admGroup eq 'AMG02'}">
								<a href="#none" class="TodoBtn ExitV">위원회 목록</a>
								<a href="#none" class="TodoBtn Save" data-ex-idx="${ exData.committeeIdx }">저장</a>
							</c:if>
							<c:if test="${user.admGroup eq 'AMG04'}">
								<a href="#none" class="TodoBtn ExitV">위원회 목록</a>
								<a href="#none" class="TodoBtn SendSaveAdmin" data-ex-idx="${committeeIdx }">기술안보과 이관</a>
							</c:if>
						</div>
							
					</div>
				</div>
				<div class="ComBrowser">
					<div class="BrowserUtil">	
						<div class="BrowserTapBox">
							<ul class="BrowserTapList">
							
							</ul>
						</div>
						<div class="BrowserTool">
							<a href="#none" class="Tool TapPre"></a>
							<a href="#none" class="Tool TapNext"></a>
							<a href="#none" class="Tool TapGuide">?</a>
						</div>
					</div>
					<div id="ComBrowserBoard" class="ComBrowserBoard">
						<div class="PageLoding">
							선택하신 안건을 불러오는 중입니다.<br>
							잠시만 기다려주세요.
						</div>
						<div class="ComBrowserGuide ComBrowserPage">
							<div class="GuideBox">
								<h1 class="MainTitle">${ exInfo.committeeYear }년 ${ exInfo.committeeTechNum }회차 <span style="color:#2a80eb">${ exInfo.committeeTechName }</span> 전문위원회</h1>
								<div class="ComInfomation">
									<p class="InfomationL">검토 안건 :<p><p class="InfomationC"> ${exInfo.committeeAgdCnt} 건</p>
								</div>
								<c:if test="${ user.admGroup ne 'AMG04'}">
									<div class="ComInfomation">
										전문위원회를 통해 도출된 검토 의견을 열람 할 수 있습니다.<br>
										안건 리스트에서 열람 하고자 하는 안건을 선택해주세요.
									</div>
								</c:if>
								<c:if test="${ user.admGroup eq 'AMG04'}">
									<div class="ComInfomation">
										전문위원회를 통해 도출된 검토 의견을 열람 하고 
										<br>소관과의 최종 의견을 작성해주세요.<br><br>
										안건 리스트에서 열람 하고자 하는 안건을 선택해주세요.
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
				
				
				
			</div>
			
        </div>
        