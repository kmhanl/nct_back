<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <script type="text/javascript" src="/resources/js/expert/committeePopup.js"></script>
	<script type="text/javascript" src="/resources/js/expert/committeeWrite.js"></script>	
    	<input type="hidden" id="userGroup" value="${ user.admGroup }"/>
    	<input type="hidden" id="committeeIdx" value="${ exeInfoData.committeeIdx }"/>
    	<input type="hidden" id="committeeStatus" value="${ exeInfoData.committeeStatus }"/>
    	<input type="hidden" id="committeeTechId" value="${ exeInfoData.committeeTechId }"/>
    	<input type="hidden" id="committeeOptCom" value="${ exeInfoData.committeeOptCom }"/>
    	<input type="hidden" id="committeeSignViewYn" value="${exeInfoData.committeeSignViewYn}"/>
    	<input type="hidden" id="committeeSignWriteYn" value="${ exeInfoData.committeeSignWriteYn }"/>
    	<input type="hidden" id="committeeSignSaveYn" value="${ exeInfoData.committeeSignSaveYn }"/>
		<div class="body_wrapper04">
			<div class="ComWriteTit">
				<h1 class="ViewTitle">${ exeInfoData.committeeYear }년 ${ exeInfoData.committeeTechNum }회차 <span class="TitleTech">${ exeInfoData.committeeTechName }</span> 전문위원회 ${exeInfoData.committeeStatus}</h1>
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
						<input type="hidden" id="PageCnt" class="test" value="0" style="width:30px;" disabled="disabled">
						<input type="hidden" id="EditPage" class="test" value="" style="width:30px;" disabled="disabled">
						<input type="hidden" id="techType" class="test" value="KTS00701" style="width:65px;" disabled="disabled">
						</span>
						</h1>
						
					</div>
					<div class="AgendaTap">
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
					</div>
					
					<div class="ExAgendaBox">
					
						<ul class="ExAgendaList">
						<c:forEach items="${agendaOpList}" var="agendarow" begin="0" end="${fn:length(agendaOpList)}" varStatus="status">
							<li class="Agd${ agendarow.agdCode }" data-ex-idx=${ agendarow.committeeIdx } data-agd-type="${ agendarow.rcptTypeCode }" data-agd-idx="${ agendarow.agdCode }" data-agd-view-code="${ agendarow.agdViewCode }" data-rcpt-code="${ agendarow.rcptCode }" >
								<div class="ModifyAgenda">
									<c:if test="${exeInfoData.committeeStatus eq 'RD'}">
										<p class="Ingbox">현재 열람 중인 안건 입니다.</p>
									</c:if>
									<c:if test="${exeInfoData.committeeStatus eq 'EN'}">
										<p class="Ingbox">현재 열람 중인 안건 입니다.</p>
									</c:if>
									<c:if test="${exeInfoData.committeeStatus eq 'CO'}">
										<p class="Ingbox">현재 열람 중인 안건 입니다.</p>
									</c:if>
									<c:if test="${exeInfoData.committeeStatus eq 'IN'}">
										<p class="Ingbox">현재 작성 중인 안건 입니다.</p>
									</c:if>
								</div>
								<div class="ExAgendainfo" >
									<span class="ExAgendaCun">안건 ${ status.count }.</span>
									<p class="ExAgendaType">
									<c:if test="${agendarow.rcptTypeCode eq '01'}">
										여부판정
									</c:if>
									<c:if test="${agendarow.rcptTypeCode eq '02'}">
										사전검토
									</c:if>
									<c:if test="${agendarow.rcptTypeCode eq '03'}">
										수출신고
									</c:if>
									<c:if test="${agendarow.rcptTypeCode eq '04'}">
										수출승인
									</c:if>
									<c:if test="${agendarow.rcptTypeCode eq '05'}">
										해외인수·합병 사전검토
									</c:if>
									<c:if test="${agendarow.rcptTypeCode eq '06'}">
										해외인수·합병 신고
									</c:if>
									<c:if test="${agendarow.rcptTypeCode eq '07'}">
										해외인수·합병 승인
									</c:if>
									<c:if test="${agendarow.rcptTypeCode eq '08'}">
										지정
									</c:if>
									<c:if test="${agendarow.rcptTypeCode eq '09'}">
										변경
									</c:if>
									<c:if test="${agendarow.rcptTypeCode eq '10'}">
										해제
									</c:if>
									<c:if test="${agendarow.rcptTypeCode eq '11'}">
										기타
									</c:if>
									<%-- ${ agendarow.agdViewCode } --%>
									</p>
								</div>
								<div class="ExAgendaLinfo">
									<span>안건번호 :</span><p class="ExAgendaNum"> ${ agendarow.agdViewCode }</p>
								</div>
								<div class="ExAgendaTit"><!--  ${ row.techItemName } -->
									
									<c:forEach items="${agendaTitList}" var="agendaTrow" begin="0" end="${fn:length(agendaTitList)}" varStatus="status">
										<%-- ${agendarow.rcptMetaCode}/${agendaTrow.rcptMetaCode}/${agendaTrow.techRcptTechNm}<br> --%>
										
										<c:if test="${agendarow.rcptMetaCode eq agendaTrow.rcptMetaCode}">
											<p class="">${ agendaTrow.techRcptTechNm }<br></p>
										</c:if>
									</c:forEach>
									
									<p class="ExAgendaCom">접수번호 : ${ agendarow.rcptCode } | 대상기업 : ${ agendarow.cpnNm }</p>
								</div>
								<c:if test="${exData.committeeStatus eq 'IN' }">
									
									<span class="ExagendaFlag Flag_${ agendarow.committeeOptStatus eq 'PW' ? '01' : ( agendarow.committeeOptStatus eq 'TS' ? '02' : '03' ) }">
									${ agendarow.committeeOptStatus eq 'PW' ? '작성전' : ( agendarow.committeeOptStatus eq 'TS' ? '임시저장' : '작성완료' ) }
									</span>
								</c:if>
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
							<c:if test="${exeInfoData.committeeStatus eq 'RD' }">
								<a href="/expert/expMemList.do" class="TodoBtn ExitV">위원회 목록</a>
							</c:if>
							<c:if test="${exeInfoData.committeeStatus eq 'EN' }">
								<a href="/expert/expMemList.do" class="TodoBtn ExitV">위원회 목록</a>
							</c:if>
							<c:if test="${exeInfoData.committeeStatus eq 'CO' }">
								<a href="/expert/expMemList.do" class="TodoBtn ExitV">위원회 목록</a>
							</c:if>
							<c:if test="${exeInfoData.committeeStatus eq 'IN' }">
								<a href="/expert/expMemList.do" class="TodoBtn ExitV">위원회 나가기</a>
								<a href="#none" class="TodoBtn Save" data-ex-idx="${ exeInfoData.committeeIdx }">최종 의견 제출</a>
								
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
								<h1 class="MainTitle" style="margin:40px auto 40px;padding:20px;">
									[${exeInfoData.committeeType eq 'A' ? '대면' : '서면' }]${ exeInfoData.committeeYear }년 ${ exeInfoData.committeeTechNum }회차 
									<span style="color:#2a80eb">${ exeInfoData.committeeTechName }</span> 전문위원회
								</h1>
								<%-- <div class="ComInfomation">
									<p class="InfomationL">검토 안건 :<p><p class="InfomationC"> ${exeInfoData.committeeAgdCnt} 건</p>
								</div>
								 --%><!-- 대면인경우 시작  -->
								<c:if test="${ exeInfoData.committeeType eq 'A' }">
									<p class="InfomationL">열람기간 </p>
									
									
									<p class="InfomationC">${ exeInfoData.committeeModiSDisp } ~ ${ exeInfoData.committeeModiEDisp}</p>
									<div class="ComInfomation" style="margin:40px auto 00px">
										<p class="InfomationL">개최일 :</p><p class="InfomationC">${ exeInfoData.committeeDatePickDispKo }</p>
									</div>
									<div class="ComInfomation" style="margin:00px auto 00px">
										<p class="InfomationL">장소 :</p><p class="InfomationC">${ exeInfoData.committeeDateAdd }</p>
									</div>
								</c:if>
								<c:if test="${ exeInfoData.committeeType eq 'B' }">
									<p class="InfomationL">자료열람기간 <p>
									<p class="InfomationC">${ exeInfoData.committeeModiSDisp } ~ ${ exeInfoData.committeeModiEDisp}</p>
								</c:if>
								<!-- 대면인경우 끝 -->
								
								<%-- <div class="ComInfomation">
									<p class="InfomationL">의견 열람 동의 : <p><p class="InfomationC">${ loginMemStat.committeeSignViewYn }</p>
								</div>
								<div class="ComInfomation">
									<p class="InfomationL">의견 작성 동의 : <p><p class="InfomationC">${ loginMemStat.committeeSignWriteYn }</p>
								</div>
								<div class="ComInfomation">
									<p class="InfomationL">위원회 상태 : <p><p class="InfomationC">${ exData.committeeStatusName }(${ exData.committeeStatus })</p>
								</div> --%>
								<c:if test="${exeInfoData.committeeStatus eq 'RD' }">
									<div class="WriteInfomation" style="margin: 40px auto 0;">
										<p style="font-size:19px;color:#222;">자료 열람 안내</p>
										<ul class="WriteInfoList">
											<li class="ListItem Item01">
												전문위원회가 개회되기 전까지 안건의 자료 열람이 가능 합니다.
											</li>
											<li class="ListItem Item02">
												왼쪽 전문위원회 검토 안건 목록에서 안건을 선택 하시면 안건의 내용 및 첨부 파일을 확인 하실 수 있습니다.<br>
											</li>
											<li class="ListItem Item03">
												자료 열람에 대한 비밀 유지 동의서 대한 동의 및 서명 후 자료 열람이 가능합니다.
											</li>
										</ul>
									</div>
								</c:if>
								<c:if test="${exeInfoData.committeeStatus eq 'IN' }">
									<div class="WriteInfomation">
										<p style="font-size:19px;color:#222;">검토의견 작성 안내</p>
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
												비밀유지 동의서 및 검토 의견서 작성이 완료 된 후 최종 검토 의견을 버튼을 클릭 하시면 검토의견에 대한 서명작성후 최종 제출이 완료 됩니다.
											</li>
										</ul>
									</div>
									
								</c:if>
								
								<p>
									최종의견 제출 여부 : ${exeInfoData.committeeOptCom}
									유효의견 작성자 여부  : ${exeInfoData.committeeOptYn}
									비밀유지1 : ${exeInfoData.committeeSignViewYn}
									비밀유지2 : ${exeInfoData.committeeSignWriteYn}
									비밀유지3 : ${exeInfoData.committeeSignSaveYn}
								
								</p>
								
							</div>
						</div>
					</div>
				</div>
				
				
				
			</div>
			
        </div>
        