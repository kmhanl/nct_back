<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <script type="text/javascript" src="/resources/js/expert/committeePopup.js"></script>
	<script type="text/javascript" src="/resources/js/expert/committeeWrite.js"></script>	
    	<input type="hidden" id="userGroup" value="${ user.admGroup }"/>
		<div class="body_wrapper04">
			<div class="ComWriteTit">
				<h1 class="ViewTitle">${ exData.committeeYear }년 ${ exData.committeeTechNum }회차 <span class="TitleTech">${ exData.committeeTechName }</span> 전문위원회</h1>
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
						전문위원회 검토 안건
						<span style="font-size:13px;color:#888;">
						열린창 <input type="text" id="PageCnt" class="test" value="0" style="width:30px;" disabled="disabled">
						편집창 <input type="text" id="EditPage" class="test" value="" style="width:30px;" disabled="disabled">
						<input type="text" id="techType" class="test" value="KTS00701" style="width:65px;" disabled="disabled">
						</span>
						</h1>
						
					</div>
					<div class="AgendaTap">
						<ul class="AgendaTapList">
							<li class="TapOn"><a href="#none" class="AgendaTapItem">전체  <span class="Num">${fn:length(agdList)}</span></a></li>
							<li><a href="#none" class="AgendaTapItem">작성전  <span class="Num">${fn:length(agdList)}</span></a></li>
							<li><a href="#none" class="AgendaTapItem">임시저장 <span class="Num"> 00</span></a></li>
							<li><a href="#none" class="AgendaTapItem">작성완료  <span class="Num">00</span></a></li>
						</ul>
					</div>
					<div class="ExAgendaBox">
						<ul class="ExAgendaList">
						<c:forEach items="${agdList}"
							var="row"
							begin="0"
							end="${fn:length(agdList)}"
							varStatus="status">
							<li class="Agd${ row.agdCode } ComsendAgd" data-agd-type="${ row.rcptTypeCode }" data-agd-idx="${ row.agdCode }" data-agd-view-code="${ row.agdViewCode }">
								<div class="ModifyAgenda">
									<p class="Ingbox">현재 작성 중인 안건 입니다.</p>
								</div>
								<div class="ExAgendainfo" >
									<span class="ExAgendaCun">안건 ${ status.count }.</span><p class="ExAgendaNum">${ row.rcptTypeCodeName } ${ row.agdViewCode }</p>
								</div>
								<div class="ExAgendaTit">
									<p class="">${ row.techItemName }<br>${ row.techRcptTechNm } </p>
									<p class="ExAgendaCom">대상기업 : ${ row.cpnNm } </p>
								</div>
								<span class="ExagendaFlag Flag_01">작성전</span>
<!-- 								<span class="ExagendaFlag Flag_02">임시저장</span> -->
<!-- 								<span class="ExagendaFlag Flag_03">작성완료</span> -->
							</li>
						</c:forEach>
						</ul>
					</div>
					<div class="TotoBottom">
						<div class="MandatoryBox">
							<div class="MandatoryItem Mandatory01">
								<p class="ManTit">회의록 첨부</p>
								<!-- <p class="Maninfor01">동의서에 서명을 작성해주세요. <a href="#none" class="MandatoryBtn MandatoryBtn01 BtnSEdit">작성하기</a></p> -->
								<p class="Maninfor02">작성완료. <a href="#none" class="MandatoryBtn MandatoryBtn02 BtnSEdit02">수정하기</a></p>
							</div>
						</div>
						<div class="TodoBtnBox">
							<a href="#none" class="TodoBtn SendExit">위원회 목록</a>
							<a href="#none" class="TodoBtn SendSave" data-ex-idx="<%= request.getParameter("committeeIdx") %>">기술안보과 이관</a>
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
							<h1 class="MainTitle">${ exData.committeeYear }년 ${ exData.committeeTechNum }회차 ${ exData.committeeTechName } 전문위원회 검토의견 입니다.</h1>
							<div class="ComInfomation">
								<p class="InfomationL">검토 안건 : <p><p class="InfomationC"> ${ fn:length(agdList) } 건</p>
							</div>
							<!-- 대면인경우 시작  -->
							<c:if test="${ exData.committeeType eq 'A' }">
							<div class="ComInfomation">
								<p class="InfomationL">개최일 : <p><p class="InfomationC">${ exData.committeeDatePickDispKo }</p>
							</div>
								<div class="ComInfomation">
									<p class="InfomationL">장소 : <p><p class="InfomationC">${ exData.committeeDateAdd }</p>
								</div>
							</c:if>
							<!-- 대면인경우 끝 -->
							<!-- 서면인 경우 개최일 , 장소 출력 없음  -->
							<div class="ComInfomation">
								<p class="InfomationL">의견작성기간 : <p><p class="InfomationC">${ exData.committeeModiSDisp } ~ ${ exData.committeeModiEDisp } </p>
							</div>
							<div class="WriteInfomation">
								<p style="font-size:19px;color:#222;">기술안보과 이관 안내</p>
								<ul class="WriteInfoList">
									<li class="ListItem Item01">
										안건별 이관 의견을  작성해주세요.
										왼쪽 전문위원회 검토 안건 목록에서 안건을 선택 하시면 검토의견서 작성 양식을 확인 하실 수 있습니다.<br>
									</li>
									<li class="ListItem Item02">
										상단 탭 메뉴를 통해 작성중인 검토의견서를 선택하여 보실 수 있습니다.<br>
										검토 의견은 각각 안건별로 임시 저장이 가능 하며, 모든 안건의 의견 제출을 완료해주세요.<br>
									</li>
									<li class="ListItem Item03">
										동의서 및 검토 의견서 작성이 완료 된 후 최종 검토 의견을 버튼을 클릭 하시면 검토의견에 대한 서명작성후 최종 제출이 완료 됩니다.
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				
				
				
			</div>
			
        </div>
        