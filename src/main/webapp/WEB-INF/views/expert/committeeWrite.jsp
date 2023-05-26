<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <script type="text/javascript" src="/resources/js/expert/datepickPopup.js"></script>
	<script type="text/javascript" src="/resources/js/expert/datepickView.js"></script>	
    
		<div class="body_wrapper02">
			<div class="BodyViewTitle">
				<!-- <p class="ComCode">위원회 코드 : 2022-00001</p> -->
				<h1 class="ViewTitle">
					${committeeData.committeeYear }년 ${committeeData.committeeTechNum }회차 
					<span class="TitleTech">${committeeData.committeeTechName }</span> 전문위원회
					<span class="ViewSubTitle">(통합 ${committeeData.committeeYear }년 ${committeeData.committeeNum}회차 전문위원회)</span>
				</h1>
				<div class="ViewTitleBar"></div>
			</div>
			<div class="ComSummary">
				
				
			</div>
			<div class="ComViewerT01">
				<div class="ComViewSection ViewLeftBox">
					<div class="ComViewTBox">
						<h2 class="ComViewTit">검토 안건 <span>총 ${committeeData.committeeAgdCnt } 건</span></h2>
						<a href="javascript:void(0);" class="TextBtn agdmodify" data-ex-idx="${committeeData.committeeIdx }">안건 설정</a>
					</div>
					<div class="ComAgendaBox">
						<ul id="sortable1" class="agenda_list connectedSortable ui-sortable" style="padding:5px;">
						<c:forEach items="${agendaList}"
							var="agd"
							begin="0"
							end="${fn:length(agendaList)}"
							varStatus="status">
							
							<c:if test="${committeeData.committeeIdx eq agd.agdExIdx }">
	            			<li class="agenda_list_item ui-sortable-handle" data-index="${status.index }" data-agd-code="${agd.agdCode }" data-rcptseq="0" style="position: relative; opacity: 1; left: 0px; top: 0px;">
								<div class="agenda_sub_item_01">
									<p class="agenda_no">3</p>
								</div>
								<div class="agenda_sub_item_02">
									<p class="type_flag">
										${agd.rcptTypeCodeName }
									</p>
									<span class="agenda_date">
										안건번호 : ${agd.agdViewCode }
									</span>
									<p class="agenda_tit">
										${agd.techItemName }
									</p>
									<p class="agenda_company">
										신청기관 : ${agd.cpnNm }
									</p>
								</div>
							</li>
							</c:if>
						</c:forEach>
						</ul>
					</div>
				</div>
				<c:set var="committeeMemberCnt" value="${committeeData.committeeAmg03Cnt + committeeData.committeeAmg04Cnt + committeeData.committeeAmg05Cnt + committeeData.committeeAmg06Cnt }"></c:set>
				<c:set var="datePickCnt" value="0"></c:set>
				<c:set var="datePickNoCnt" value="0"></c:set>
				<c:set var="datePick1Cnt" value="0"></c:set>
				<c:set var="datePick2Cnt" value="0"></c:set>
				<c:set var="datePick3Cnt" value="0"></c:set>
				<div class="ComViewSection ViewCenterBox">
					<div class="ComViewTBox">
						<h2 class="ComViewTit">위원회 구성원 <span>총 ${ committeeMemberCnt } 명</span></h2>
						<a href="#none" class="TextBtn memmodify" data-ex-idx="${committeeData.committeeIdx }" data-ex-tech-id="${committeeData.committeeTechId }">구성원 설정</a>
					</div>
					<div class="ComHistoryBox">
						<ul class="ComMemList">
						<c:forEach items="${memberList}"
							var="member"
							begin="0"
							end="${fn:length(memberList)}"
							varStatus="status">
							<c:if test="${member.committeeIdx eq committeeData.committeeIdx }">
                   			<li class="ComMemItem02 SelOn" data-id="useridOrPk">
                   				<div class="ComMemCard">
              						<p class="ComMemNum">${ member.admGroup eq 'AMG05' ? '전문위원 ' : '' } ${member.admCarYear ne null and member.admCarYear ne '' ? member.admCarYear += '년' : '' } ${member.admCarNum ne null and member.admCarNum ne '' ? member.admCarNum += '기' : '' }</p>
              						<p class="ComMemName">${ member.admName }<span class="ComMemDep"> ${ member.admDept } / ${ member.admPositon }</span></p>
              						<p class="ComMemCom">${ member.admCom }</p>
              						<p class="ComMemInfo">${ member.admMobile1 }-${ member.admMobile2 }-${ member.admMobile3 } | ${ member.admEmail }</p>
              					</div>
                   			</li>
                   			<c:if test="${ member.committeeDatePick eq 'Y' }">
                   				<c:set var="datePickCnt" value="${ datePickCnt + 1 }"></c:set>
								<c:choose>
									<c:when test="${member.committeeDatePick1 eq 'Y'}">
		                   				<c:set var="datePick1Cnt" value="${ datePick1Cnt + 1 }"></c:set>
									</c:when>
									<c:when test="${member.committeeDatePick2 eq 'Y'}">
		                   				<c:set var="datePick2Cnt" value="${ datePick2Cnt + 1 }"></c:set>
									</c:when>
									<c:when test="${member.committeeDatePick3 eq 'Y'}">
		                   				<c:set var="datePick3Cnt" value="${ datePick3Cnt + 1 }"></c:set>
									</c:when>
								</c:choose>
                   			</c:if>
                   			<c:if test="${ member.committeeDatePick eq 'N' }">
                   				<c:set var="datePickNoCnt" value="${ datePickNoCnt + 1 }"></c:set>
							</c:if>
							</c:if>
						</c:forEach>
                   		</ul>
					</div>
				</div>
				<div class="ComViewSection ViewCenterBox">
					<div class="ComViewTBox">
						<h2 class="ComViewTit">참석일 선택 현황</h2>
						<a href="#none" class="TextBtn datemodify" data-ex-idx="${committeeData.committeeIdx }">후보일 설정</a>
					</div>
					
					<div class="DatePickStatBox">
						<div class="ViewHelp">
							${committeeData.committeeDatePickEDisp } 마감 
						</div>
						<div class="DateRow">
							<div class="DatePickItem">
								<p class="DatePickLabel">${ committeeData.committeeDatePick1Disp }</p>
								<p class="DatePickLabel02">${ committeeData.committeeDateAdd1 }</p>
								<div class="PickBarBg">
									<div class="PickBar" style="width:${ datePick1Cnt / committeeMemberCnt * 100 }%;"></div>
									<div class="PickbarInfo">${ datePick1Cnt }명 / ${ committeeMemberCnt }명</div>
								</div>
							</div>
						</div>
						<div class="DateRow">
							<div class="DatePickItem">
								<p class="DatePickLabel">${committeeData.committeeDatePick2Disp }</p>
								<p class="DatePickLabel02">${ committeeData.committeeDateAdd2 }</p>
								<div class="PickBarBg">
									<div class="PickBar" style="width:${ datePick2Cnt / committeeMemberCnt * 100 }%;"></div>
									<div class="PickbarInfo">${ datePick2Cnt }명 / ${ committeeMemberCnt }명</div>
								</div>
							</div>
						</div>
						<div class="DateRow">
							<div class="DatePickItem">
								<p class="DatePickLabel">${committeeData.committeeDatePick3Disp }</p>
								<p class="DatePickLabel02">${ committeeData.committeeDateAdd3 }</p>
								<div class="PickBarBg">
									<div class="PickBar" style="width:${ datePick3Cnt / committeeMemberCnt * 100 }%;"></div>
									<div class="PickbarInfo">${ datePick3Cnt }명 / ${ committeeMemberCnt }명</div>
								</div>
							</div>
						</div>
						<div class="DateRow DateRowL">
							<div class="DatePickItem">
								<p class="DatePickLabel02">미참석</p>
								<div class="PickBarBg">
									<div class="PickBar" style="width:${ datePickNoCnt / committeeMemberCnt * 100 }%;"></div>
									<div class="PickbarInfo">${ datePickNoCnt }명 / ${ committeeMemberCnt }명</div>
								</div>
							</div>
						</div>
						<a href="#none" class="DatePickbtn">개최일 확정</a>
					</div>
				</div>
				<div class="ComViewSection ViewRightBox">
					<div class="ComViewTBox">
						<h2 class="ComViewTit">업무 처리 내역</h2>
						<!-- <a href="#none" class="TextBtn datemodify">SMS 발송</span></a>
						<a href="#none" class="TextBtn datemodify">Email 발송</span></a> -->
					</div>
					<div class="ComHistoryBox">
						<ul class="ComHistoryList">
							<li class="ComHisItem">
								<p class="date">2022.00.00 00:00</p>
								<p class="Stat">전문 위원회 구성</p>
								<p class="editor">By 홍길동 adminid </p>
							</li>
							<li class="ComHisItem">
								<p class="date">2022.00.00 00:00</p>
								<p class="Stat">안건 설정 수정</p>
								<p class="editor">By 홍길동 adminid </p>
							</li>
							<li class="ComHisItem">
								<p class="date">2022.00.00 00:00</p>
								<p class="Stat">개최 후보일 설정 수정</p>
								<p class="editor">By 홍길동 adminid </p>
							</li>
							<li class="ComHisItem">
								<p class="date">2022.00.00 00:00</p>
								<p class="Stat">구성원 설정 수정</p>
								<p class="editor">By 홍길동 adminid </p>
							</li>
							<li class="ComHisItem">
								<p class="date">2022.00.00 00:00</p>
								<p class="Stat">참석일 선택</p>
								<p class="editor">By 전문위원1 adminid </p>
							</li>
							
						</ul>
					</div>
				</div>
				
			</div>
			<div class="BodyBottomUtil02">
				<a href="/expert/datepickList.do" class="btn">개최예정 위원회 목록</a>
			</div>
        </div>