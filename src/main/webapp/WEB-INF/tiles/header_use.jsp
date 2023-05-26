<%--
  Created by IntelliJ IDEA.
  User: imtaeyeong
  Date: 2021/12/06
  Time: 4:06 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="kaits.nct.member.model.MemberVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div id="MainBobyWrapper" class="MainBobyWrapper">
		<div id="FullGnbBody" class="FullGnbBody">
			<div class="GnbContent">
				<div class="GnbContentTop">
					<h1>국가핵심기술 종합관리시스템</h1>
					<a href=#none" id="FullGnbClose" class="FullGnbClose"></a>
				</div>
				<div class="MenuWarpper">
					<div class="Section">
						<div class="MenuBox">
							<p class="depth01">전문위원회</p>
							<ul class="depth02List">
								<li><a href="/expert/receiptList.do" class="depth02Item">접수 현황</a>
								<li><a href="/expert/agendaList.do" class="depth02Item">안건 현황</a>
								<li><a href="/expert/readyList.do" class="depth02Item">검토 준비중</a>
								<li><a href="/expert/datepickList.do" class="depth02Item">참석일 선택</a>
								<li><a href="/expert/committeeList.do" class="depth02Item">위원회 현황</a>
							</ul>
						</div>
						<div class="MenuBox">
								<p class="depth01">보호위원회</p>
								<ul class="depth02List">
									<li><a href="/saexpert/agendaList.do" class="depth02Item">안건 현황</a>
									<li><a href="/saexpert/readyList.do" class="depth02Item">검토 준비중</a>
									<li><a href="/saexpert/committeeList.do" class="depth02Item">위원회 현황</a>
								</ul>
							</div>
							<div class="MenuBox">
								<p class="depth01">소위원회</p>
								<ul class="depth02List">
									<li><a href="/soexpert/agendaList.do" class="depth02Item">안건 현황</a>
									<li><a href="/soexpert/readyList.do" class="depth02Item">검토 준비중</a>
									<li><a href="/soexpert/committeeList.do" class="depth02Item">위원회 현황</a>
								</ul>
							</div>
						<c:if test="${ user.admGroup eq 'AMG00'}">
							
						</c:if>
						<div class="MenuBox">
							<p class="depth01">실태조사</p>
							<ul class="depth02List">
								<li><a href="/research/researchList.do" class="depth02Item">실태조사 설정</a></li>
								<li><a href="/rsc/comList.do" class="depth02Item">대상기업관리</a></li>
								<li><a href="/rsc/ansDataList.do" class="depth02Item">코딩데이터</a></li>
								<li><a href="/rsc/eveDataListSec01.do" class="depth02Item">점수 환산</a></li>
								<li><a href="/rsc/numDataListSec01.do" class="depth02Item">점수배점</a></li>
								<li><a href="/rsc/comEndList.do" class="depth02Item">결과리포트</a></li>
								<li><a href="#none" class="depth02Item">통계</a></li>
							</ul>
						</div>
						<div class="MenuBox">
							<p class="depth01">보유기술관리</p>
							<ul class="depth02List">
								<li><a href="/holdtech/holdtechCallList.do" class="depth02Item">대상기업 요청</a>
								<li><a href="/holdtech/holdtechData.do" class="depth02Item">보유기술 통계</a>
							</ul>
						</div>
					</div>
					<c:if test="${ user.admGroup eq 'AMG00' or user.admGroup eq 'AMG01' or user.admGroup eq 'AMG02'}">
					<div class="Section">
						<div class="MenuBox">
							<p class="depth01">기업 포털 회원 관리</p>
							<ul class="depth02List">
								<li><a href="/member/commemList" class="depth02Item">회원 관리</a>
								<!-- <li><a href="#none" class="depth02Item">안건 현황</a>
								<li><a href="#none" class="depth02Item">검토 준비중</a>
								<li><a href="#none" class="depth02Item">참석일 선택</a>
								<li><a href="#none" class="depth02Item">위원회 현황</a> -->
							</ul>
						</div>
						<div class="MenuBox">
							<p class="depth01">업무 포털 회원 관리</p>
							<ul class="depth02List">
								<li><a href="/member/invitationList" class="depth02Item">초대 관리</a>
								<li><a href="/member/memberList" class="depth02Item">회원 관리</a>
								<!-- <li><a href="#none" class="depth02Item">업무 처리 내역</a> -->
								<!-- <li><a href="#none" class="depth02Item">검토 준비중</a>
								<li><a href="#none" class="depth02Item">참석일 선택</a>
								<li><a href="#none" class="depth02Item">위원회 현황</a> -->
							</ul>
						</div>
						<div class="MenuBox">
							<p class="depth01">게시판 관리</p>
							<ul class="depth02List">
							   <li><a href="/board/informationList" class="depth02Item">정보마당</a></li>
							   <li><a href="/policy/policyList" class="depth02Item">기술유출상담</a></li>
								<!-- <li><a href="/system/techhisList" class="depth02Item">기술분야관리</a>
								<li><a href="#none" class="depth02Item">법령고시관리</a> -->
								<!-- <li><a href="#none" class="depth02Item">검토 준비중</a>
								<li><a href="#none" class="depth02Item">참석일 선택</a>
								<li><a href="#none" class="depth02Item">위원회 현황</a> -->
							</ul>
						</div>
						<div class="MenuBox">
							<p class="depth01">통계</p>
							<ul class="depth02List">
								<li><a href="/holdtech/statistics" class="depth02Item">통계</a>
							</ul>
						</div>
					</div>
					</c:if>
				</div>
			</div>
		</div>
    	<div id="BodyHeader" class="BodyHeader">
    		<div class="LoginCardHiden" id="LoginCard">
    			
				<div class="LoginUserInfo">
					<a href="javascript:ucardinfo();" class="layer_closer"></a>
					<div class="UserItem">
						<%-- <p >${user.admId}</p> --%>
						<p class="userName">${ user.admName} <span>님</span></p>
					</div>
					<div class="UserItem">
						<p class="userEmail">${user.admEmail}</p>
					</div>
					<div class="UserItem infoBtn">
						<a href="/mypage/myPage.do" class="cardbtn setupinfo">비밀번호 변경</a><a href="/member/logout.do" class="cardbtn">로그아웃</a>
					</div>
				</div>
				<div class="nct_guide">
					<c:if test="${ user.admGroup eq 'AMG00'}">
						<a href="/resources/files/국가핵심기술_종합관리시스템_사용자_매뉴얼_기술안보과_v0.1.pdf" target="_blank" class="user_manual">사용자 매뉴얼</a>
					</c:if>
					<c:if test="${ user.admGroup eq 'AMG01'}">
						<a href="/resources/files/국가핵심기술_종합관리시스템_사용자_매뉴얼_기술안보과_v0.1.pdf" target="_blank" class="user_manual">사용자 매뉴얼</a>
					</c:if>
					<c:if test="${ user.admGroup eq 'AMG02'}">
						<a href="/resources/files/국가핵심기술_종합관리시스템_사용자_매뉴얼_보호협회_v0.1.pdf" target="_blank" class="user_manual">사용자 매뉴얼</a>
					</c:if>
					<c:if test="${ user.admGroup eq 'AMG03'}">
						<a href="/resources/files/국가핵심기술_종합관리시스템_사용자_매뉴얼_기밀센터_v0.1.pdf" target="_blank" class="user_manual">사용자 매뉴얼</a>
					</c:if>
					<c:if test="${ user.admGroup eq 'AMG04'}">
						<a href="/resources/files/국가핵심기술_종합관리시스템_사용자_매뉴얼_소관과_v0.1.pdf" target="_blank" class="user_manual">사용자 매뉴얼</a>
					</c:if>
					<c:if test="${ user.admGroup eq 'AMG05' or user.admGroup eq 'AMG05'}">
						<a href="/resources/files/국가핵심기술_종합관리시스템_사용자_매뉴얼_v0.1.pdf" target="_blank" class="user_manual">사용자 매뉴얼</a>
					</c:if>
				</div>
			</div>
    		<div class="BodyHeaderTop">
    			<h1 class="TopLogo">
    				<!-- <img src="/resources/images/logo_n2.png" alt="국가핵심기술 종합관리시스템"> or user.admGroup eq 'AMG04' -->
    				<c:if test="${ user.admGroup eq 'AMG00' or user.admGroup eq 'AMG02' }">
					<a href="#none" id="nav-icon3" class="">
						<span></span>
						<span></span>
						<span></span>
					</a>
					</c:if>
					<p class="logo_tit">국가핵심기술 종합관리시스템</p>
    			</h1>
    			<div class="LoginCard">
    				<% MemberVO userInfo = (MemberVO)request.getAttribute("user"); %>
    				<a href="javascript:ucardinfo();" class="login_nm"><%= userInfo.getAdmName() %></a>
    				<%-- <p class="login_nmm" style="float:left;font-size:17px;color:#fff;padding:8px 10px;"><%= userInfo.getAdmName() %></p>
    				<a href="/member/logout" class="logout_btn">로그아웃</a> --%>
    				
                </div>
    			<div class="MainMenuBox">
    				<!-- <div id="nav-icon3" class="">
						<span></span>
						<span></span>
						<span></span>
					</div> -->
					
    				<h1 class="MainMenuTit">
    				<a href="#none" style="color:#fff;">
						<c:choose>
							<c:when test="${mainMenuType eq '100'}"><c:out value=""></c:out></c:when>
							<c:when test="${mainMenuType eq '00'}"><c:out value="전문위원회"></c:out></c:when>
							<c:when test="${mainMenuType eq '01'}"><c:out value="보호위원회"></c:out></c:when>
							<c:when test="${mainMenuType eq '02'}"><c:out value="소위원회"></c:out></c:when>
							<c:when test="${mainMenuType eq '03'}"><c:out value="실태조사관리"></c:out></c:when>
							<c:when test="${mainMenuType eq '04'}"><c:out value="보유기관관리"></c:out></c:when>
							<c:when test="${mainMenuType eq '05'}"><c:out value="기업포털회원관리"></c:out></c:when>
							<c:when test="${mainMenuType eq '06'}"><c:out value="업무포털회원관리"></c:out></c:when>
							<c:when test="${mainMenuType eq '07'}"><c:out value="게시판관리"></c:out></c:when>
							<c:when test="${mainMenuType eq '08'}"><c:out value="통계"></c:out></c:when>
							
						</c:choose>
					</a>
    				</h1>
<!--     				<h1 class="MainMenuTit"></h1> -->
<!--     				<h1 class="MainMenuTit"></h1> -->
<!--     				<h1 class="MainMenuTit"></h1> -->
<!--     				<h1 class="MainMenuTit"></h1> -->
    			</div>
    		</div>
    		<!-- 대시보드 인경우  <div class="BodyHeaderBottom"> 출력 없음 -->
    		<!--  전문위원회 메뉴 시작 -->
   			    <c:if test="${mainMenuType eq '00' }">
    			<div class="BodyHeaderBottom">
	    			<ul class="TopGnbList">
	    				<li class="${subMenuType eq '00' ? 'TopGnbOn' : '' }"><a href="/expert/receiptList.do" class="TopGnbItem">접수현황</a></li>
	    				<li class="${subMenuType eq '01' ? 'TopGnbOn' : '' }"><a href="/expert/agendaList.do" class="TopGnbItem">안건현황</a></li>
	    				<li class="${subMenuType eq '02' ? 'TopGnbOn' : '' }"><a href="/expert/readyList.do" class="TopGnbItem">검토준비중</a></li>
	    				<li class="${subMenuType eq '03' ? 'TopGnbOn' : '' }"><a href="/expert/datepickList.do" class="TopGnbItem">참석일선택</a></li>
	    				<li class="${subMenuType eq '04' ? 'TopGnbOn' : '' }"><a href="/expert/committeeList.do" class="TopGnbItem">위원회현황</a></li>
	    			</ul>
   				</div>
  				</c:if>
  				<c:if test="${mainMenuType eq '01' }">
  				<div class="BodyHeaderBottom">
	    			<ul class="TopGnbList">
	    				<li class="${subMenuType eq '00' ? 'TopGnbOn' : '' }"><a href="/saexpert/agendaList.do" class="TopGnbItem">안건현황</a></li>
	    				<li class="${subMenuType eq '01' ? 'TopGnbOn' : '' }"><a href="/saexpert/readyList.do" class="TopGnbItem">검토 준비중</a></li>
	    				<li class="${subMenuType eq '02' ? 'TopGnbOn' : '' }"><a href="/saexpert/committeeList.do" class="TopGnbItem">위원회현황</a></li>
	    			</ul>
   				</div>
  				</c:if>
  				<c:if test="${mainMenuType eq '02' }">
   				<div class="BodyHeaderBottom">
	    			<ul class="TopGnbList">
	    				<li class="${subMenuType eq '00' ? 'TopGnbOn' : '' }"><a href="/soexpert/agendaList.do" class="TopGnbItem">안건현황</a></li>
	    				<li class="${subMenuType eq '01' ? 'TopGnbOn' : '' }"><a href="/soexpert/readyList.do" class="TopGnbItem">검토 준비중</a></li>
	    				<li class="${subMenuType eq '02' ? 'TopGnbOn' : '' }"><a href="/soexpert/committeeList.do" class="TopGnbItem">위원회현황</a></li>
	    			</ul>
   				</div>
  				</c:if>
  				<c:if test="${mainMenuType eq '03' }">
   				<div class="BodyHeaderBottom">
	    			<ul class="TopGnbList">
	    				<li class="${subMenuType eq '00' ? 'TopGnbOn' : '' }"><a href="/research/researchList.do" class="TopGnbItem">실태조사설정</a></li>
	    				<li class="${subMenuType eq '01' ? 'TopGnbOn' : '' }"><a href="/rsc/comList.do" class="TopGnbItem">대상기업관리</a></li>
	    				<li class="${subMenuType eq '02' ? 'TopGnbOn' : '' }"><a href="/rsc/ansDataList.do" class="TopGnbItem">코딩데이터</a></li>
	    				<li class="${subMenuType eq '03' ? 'TopGnbOn' : '' }"><a href="/rsc/eveDataListSec01.do" class="TopGnbItem">점수환산</a></li>
	    				<li class="${subMenuType eq '04' ? 'TopGnbOn' : '' }"><a href="/rsc/numDataListSec01.do" class="TopGnbItem">점수배점</a></li>
	    				<li class="${subMenuType eq '05' ? 'TopGnbOn' : '' }"><a href="/rsc/comEndList.do" class="TopGnbItem">결과리포트</a></li>
	    				<li class="${subMenuType eq '06' ? 'TopGnbOn' : '' }"><a href="#none" class="TopGnbItem">통계</a></li>
	    				<%-- <li class="${subMenuType eq '07' ? 'TopGnbOn' : '' }"><a href="/research/targetSendList03.do" class="TopGnbItem">-</a></li> --%>
	    			</ul>
   				</div>
  				</c:if>
  				<c:if test="${mainMenuType eq '04' }">
   				<div class="BodyHeaderBottom">
	    			<ul class="TopGnbList">
	    				<li class="${subMenuType eq '00' ? 'TopGnbOn' : '' }"><a href="/holdtech/holdtechCallList.do" class="TopGnbItem">대상기업 요청</a></li>
	    				<li class="${subMenuType eq '01' ? 'TopGnbOn' : '' }"><a href="/holdtech/holdtechData.do" class="TopGnbItem">보유기술 통계</a></li>
	    			</ul>
   				</div>
  				</c:if>
  				<c:if test="${mainMenuType eq '05' }">
   				<div class="BodyHeaderBottom">
	    			<ul class="TopGnbList">
	    				<li class="${subMenuType eq '00' ? 'TopGnbOn' : '' }"><a href="/member/commemList" class="TopGnbItem">회원관리</a></li>
	    			</ul>
   				</div>
  				</c:if>
  				<c:if test="${mainMenuType eq '06' }">
   				<div class="BodyHeaderBottom">
	    			<ul class="TopGnbList">
	    				<li class="${subMenuType eq '00' ? 'TopGnbOn' : '' }"><a href="/member/invitationList" class="TopGnbItem">초대관리</a></li>
	    				<li class="${subMenuType eq '01' ? 'TopGnbOn' : '' }"><a href="/member/memberList" class="TopGnbItem">회원관리</a></li>
	    				<%-- <li class="${subMenuType eq '02' ? 'TopGnbOn' : '' }"><a href="#none" class="TopGnbItem">업무처리내역</a></li> --%>
	    			</ul>
   				</div>
  				</c:if>
  				<c:if test="${mainMenuType eq '07' }">
   				<div class="BodyHeaderBottom">
	    			<ul class="TopGnbList">
	    			    <li class="${subMenuType eq '00' ? 'TopGnbOn' : '' }"><a href="/board/informationList" class="TopGnbItem">정보마당</a></li>
	    				<li class="${subMenuType eq '01' ? 'TopGnbOn' : '' }"><a href="/policy/policyList" class="TopGnbItem">유출상담</a></li>
	    				<%-- <li class="${subMenuType eq '00' ? 'TopGnbOn' : '' }"><a href="#none" class="TopGnbItem">기업회원관리</a></li>
	    				<li class="${subMenuType eq '01' ? 'TopGnbOn' : '' }"><a href="#none" class="TopGnbItem">업무회원관리</a></li>
	    				<li class="${subMenuType eq '02' ? 'TopGnbOn' : '' }"><a href="#none" class="TopGnbItem">전문위원관리</a></li>
	    				<li class="${subMenuType eq '03' ? 'TopGnbOn' : '' }"><a href="#none" class="TopGnbItem">기술위원관리</a></li>
	    				<li class="${subMenuType eq '04' ? 'TopGnbOn' : '' }"><a href="#none" class="TopGnbItem">국가핵심기술코드관리</a></li> --%>
	    			</ul>
   				</div>
  				</c:if>
    			
    		<!--  전문위원회 메뉴 끝 -->
    		<!--  보호위원회 메뉴 시작 -->
    		<!-- <div class="BodyHeaderBottom">
    			<ul class="TopGnbList">
    				<li class="TopGnbOn"><a href="/expert/agendaList.do" class="TopGnbItem">안건현황</a></li>
    				<li><a href="/expert/readyList.do" class="TopGnbItem">검토중</a></li>
    				<li><a href="/expert/datepickList.do" class="TopGnbItem">결과 등록</a></li>
    			</ul>
    		</div> -->
    		<!--  보호위원회 메뉴 끝 -->
    		<!--  소위원회 메뉴 시작 -->
    		<!-- <div class="BodyHeaderBottom">
    			<ul class="TopGnbList">
    				<li class="TopGnbOn"><a href="/expert/agendaList.do" class="TopGnbItem">안건현황</a></li>
    				<li><a href="/expert/readyList.do" class="TopGnbItem">검토중</a></li>
    				<li><a href="/expert/datepickList.do" class="TopGnbItem">결과 등록</a></li>
    			</ul>
    		</div> -->
    		<!--  소위원회 메뉴 끝 -->
    		<!--  스템 관리 메뉴 시작 -->
    		<!-- <div class="BodyHeaderBottom">
    			<ul class="TopGnbList">
    				<li class="TopGnbOn"><a href="/expert/agendaList.do" class="TopGnbItem">기업회원관리</a></li>
    				<li><a href="/expert/readyList.do" class="TopGnbItem">업무회원관리</a></li>
    				<li><a href="/expert/readyList.do" class="TopGnbItem">전문위원관리</a></li>
    				<li><a href="/expert/readyList.do" class="TopGnbItem">기술위원관리</a></li>
    				<li><a href="/expert/readyList.do" class="TopGnbItem">국가핵심기술코드관리</a></li>
    			</ul>
    		</div> -->
    		<!--  시스템 관리 메뉴 끝 -->
    		<div class="BodyHeaderBar"></div>
    	</div>
