<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <script type="text/javascript" src="/resources/js/expert/datepickPopup.js"></script>
	<script type="text/javascript" src="/resources/js/expert/datepickView.js"></script>	
    
		<div class="body_wrapper02">
			<div class="BodyViewTitle">
				<!-- <p class="ComCode">위원회 코드 : 2022-00001</p> -->
				<h1 class="ViewTitle">
					15회차 
					<span class="TitleTech">국가핵심기술 보유기관 대상 실태조사</span>
					
				</h1>
				<div class="ViewTitleBar"></div>
			</div>
			<div class="ComSummary">
				
				
			</div>
			<div class="ComViewerT01">
				<div class="ComViewSection ViewLeftBox">
					<div class="ComViewTBox">
						<h2 class="ComViewTit">실태조사 정보</span></h2>
						<a href="javascript:void(0);" class="TextBtn agdmodify" data-ex-idx="">정보 수정</a>
					</div>
					<div class="ComAgendaBox02">
						<p style="margin-top:10px;">조사 대상 : 국가핵심기술 보유기관(개별통보)</p>
						<p>조사 방법 : 온라인설문조사</p>
						<p>조사기관 : 산업통상자원부, 산업기밀보호센터, 한국산업기술보호협회</p>
					</div>
					<div class="ComViewTBox" style="margin-top:10px;">
						<h2 class="ComViewTit">초대 메일 발송 설정</span></h2>
						<a href="javascript:void(0);" class="TextBtn agdmodify" data-ex-idx="">설정</a>
					</div>
					<div class="ComAgendaBox03">
						<p style="margin-top:10px;">발송 제목 : [산보협] 국가핵심기술 보유기관 실태조사 협조 요청의 건{&기관명}</p>
						<p>발송 예약 : 2022년 09월 01일 10:00</p>
					</div>
				</div>
				<c:set var="committeeMemberCnt" value=""></c:set>
				<c:set var="datePickCnt" value="0"></c:set>
				<c:set var="datePickNoCnt" value="0"></c:set>
				<c:set var="datePick1Cnt" value="0"></c:set>
				<c:set var="datePick2Cnt" value="0"></c:set>
				<c:set var="datePick3Cnt" value="0"></c:set>
				<div class="ComViewSection ViewCenterBox">
					<div class="ComViewTBox">
						<h2 class="ComViewTit">실태조사 문항 설정</span></h2>
						<a href="#none" class="TextBtn " data-ex-idx="">문항설정</a>
					</div>
					<div class="ComHistoryBox">
						<ul class="QuestionSectionList">
							<li class="ComMemItem02">
			                    <div href="#none" class="QuestionSectionItem">
			                        <p class="tit">보안관리 체계 (규정·조직) 현황</p>
			                        <p class="cnt">12</p>
			                        <a href="#none" class="setupBtn">설정</a>
			                    </div>
			                </li>
			                <li class="ComMemItem02">
			                    <div href="#none" class="QuestionSectionItem">
			                        <p class="tit">보유자산의 분류 및 통제 현황</p>
			                        <p class="cnt">11</p>
			                        <a href="#none" class="setupBtn">설정</a>
			                    </div>
			                </li>
			                <li class="ComMemItem02">
			                	<div href="#none" class="QuestionSectionItem">
			                        <p class="tit">인력관리 현황</p>
			                        <p class="cnt">17</p>
			                        <a href="#none" class="setupBtn">설정</a>
			                    </div>
			                </li>
			                <li class="ComMemItem02">
			                    <div href="#none" class="QuestionSectionItem">
			                        <p class="tit">보호구역 관리 현황</p>
			                        <p class="cnt">8</p>
			                        <a href="#none" class="setupBtn">설정</a>
			                    </div>
			                </li>
			                <li class="ComMemItem02">
			                    <div href="#none" class="QuestionSectionItem">
			                        <p class="tit">정보시스템 관리 현황</p>
			                        <p class="cnt">10</p>
			                        <a href="#none" class="setupBtn">설정</a>
			                    </div>
			                </li>
			                <li class="ComMemItem02">
			                    <div href="#none" class="QuestionSectionItem">
			                        <p class="tit">유출사고 대응 및 복구 현황</p>
			                        <p class="cnt">21</p>
			                        <a href="#none" class="setupBtn">설정</a>
			                    </div>
			                </li>
			                <li class="ComMemItem02">
			                    <div href="#none" class="QuestionSectionItem">
			                        <p class="tit">산업보안 인식제고 현황</p>
			                        <p class="cnt">12</p>
			                        <a href="#none" class="setupBtn">설정</a>
			                    </div>
			                </li>
                   		</ul>
					</div>
				</div>
				<div class="ComViewSection ViewCenterBox">
					<div class="ComViewTBox">
						<h2 class="ComViewTit">대상기업설정</h2>
						<a href="#none" class="TextBtn " data-ex-idx="">대상 기업 등록</a>
						<a href="#none" class="TextBtn " data-ex-idx="" style="margin:10px 0 10px 10px">엑셀 일괄 등록</a>
					</div>
					
					<div class="DatePickStatBox" style="overflow-y:scroll">
						<ul class="tarketList">
							<li class="ComMemItem02">
			                    <div href="#none" class="tarketListItem">
			                        <p class="tit">
			                        	<span class="com">삼성전자 000-00-00000</span><br>
			                        	<span>홍길동 abcd@abcdcom</span>
			                        </p>
			                        <a href="#none" class="setupBtn">설정</a>
			                    </div>
			                </li>
			                <li class="ComMemItem02">
			                    <div href="#none" class="tarketListItem">
			                        <p class="tit">
			                        	<span class="com">삼성전자 000-00-00000</span><br>
			                        	<span>홍길동 abcd@abcdcom</span>
			                        </p>
			                        <a href="#none" class="setupBtn">설정</a>
			                    </div>
			                </li>
			                <li class="ComMemItem02">
			                    <div href="#none" class="tarketListItem">
			                        <p class="tit">
			                        	<span class="com">삼성전자 000-00-00000</span><br>
			                        	<span>홍길동 abcd@abcdcom</span>
			                        </p>
			                        <a href="#none" class="setupBtn">설정</a>
			                    </div>
			                </li>
			                <li class="ComMemItem02">
			                    <div href="#none" class="tarketListItem">
			                        <p class="tit">
			                        	<span class="com">삼성전자 000-00-00000</span><br>
			                        	<span>홍길동 abcd@abcdcom</span>
			                        </p>
			                        <a href="#none" class="setupBtn">설정</a>
			                    </div>
			                </li>
			                <li class="ComMemItem02">
			                    <div href="#none" class="tarketListItem">
			                        <p class="tit">
			                        	<span class="com">삼성전자 000-00-00000</span><br>
			                        	<span>홍길동 abcd@abcdcom</span>
			                        </p>
			                        <a href="#none" class="setupBtn">설정</a>
			                    </div>
			                </li>
			                <li class="ComMemItem02">
			                    <div href="#none" class="tarketListItem">
			                        <p class="tit">
			                        	<span class="com">삼성전자 000-00-00000</span><br>
			                        	<span>홍길동 abcd@abcdcom</span>
			                        </p>
			                        <a href="#none" class="setupBtn">설정</a>
			                    </div>
			                </li>
			                <li class="ComMemItem02">
			                    <div href="#none" class="tarketListItem">
			                        <p class="tit">
			                        	<span class="com">삼성전자 000-00-00000</span><br>
			                        	<span>홍길동 abcd@abcdcom</span>
			                        </p>
			                        <a href="#none" class="setupBtn">설정</a>
			                    </div>
			                </li>
			             </ul>
					</div>
				</div>
				<!-- <div class="ComViewSection ViewRightBox">
					<div class="ComViewTBox">
						<h2 class="ComViewTit">업무 처리 내역</h2>
						<a href="#none" class="TextBtn datemodify">SMS 발송</span></a>
						<a href="#none" class="TextBtn datemodify">Email 발송</span></a>
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
				</div> -->
				
			</div>
			<div class="BodyBottomUtil02">
				<a href="/research/researchList" class="btn">실태조사 목록</a>
			</div>
        </div>