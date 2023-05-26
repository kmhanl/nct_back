<%@ page import="kaits.nct.member.model.MemberVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- HEADER - A START  -->
<div class="nct_haeder">
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
 	<h1 class="header_logo">
 		<a href="#none" class="main_logo">국가핵심기술<br>종합관리시스템</a>
 		<a href="#none" class="sub_logo">전문위원회</a>
 	</h1>
 	<div class="BodyHeaderBar"></div>
 	<ul class="TopGnbList">
		<li class="${mainMenuCode eq 'EXP001' ? 'TopGnbOn' : '' }"><a href="/expcom/expRecList.do" class="TopGnbItem">접수현황</a></li>
		<li class="${mainMenuCode eq 'EXP002' ? 'TopGnbOn' : '' }"><a href="/expcom/expAgdList.do" class="TopGnbItem">안건현황</a></li>
		<li class="${mainMenuCode eq 'EXP003' ? 'TopGnbOn' : '' }"><a href="/expcom/expRdyList.do" class="TopGnbItem">검토준비중</a></li>
		<li class="${mainMenuCode eq 'EXP004' ? 'TopGnbOn' : '' }"><a href="/expcom/expDpkList.do" class="TopGnbItem">참석일선택</a></li>
		<li class="${mainMenuCode eq 'EXP005' ? 'TopGnbOn' : '' }"><a href="/expcom/expComList.do" class="TopGnbItem">위원회현황</a></li>
	</ul>
	<div class="LoginCard">
		<% MemberVO userInfo = (MemberVO)request.getAttribute("user"); %>
		<a href="javascript:ucardinfo();" class="login_nm"><%= userInfo.getAdmName() %></a>
	</div>
</div>

<%-- <div class="nct_left_haeder">
 	<h1 class="header_logo">
 		<a href="#none" class="main_logo">국가핵심기술<br>종합관리시스템</a>
 		<a href="#none" class="sub_logo">전문위원회</a>
 	</h1>
 	<div class="BodyHeaderBar"></div>
 	<ul class="TopGnbList">
		<li class="${mainMenuCode eq 'EXP001' ? 'TopGnbOn' : '' }"><a href="/expcom/expRepList.do" class="TopGnbItem">접수현황</a></li>
		<li class="${mainMenuCode eq 'EXP002' ? 'TopGnbOn' : '' }"><a href="/expcom/expAgdList.do" class="TopGnbItem">안건현황</a></li>
		<li class="${mainMenuCode eq 'EXP003' ? 'TopGnbOn' : '' }"><a href="/expcom/expRdyList.do" class="TopGnbItem">검토준비중</a></li>
		<li class="${mainMenuCode eq 'EXP004' ? 'TopGnbOn' : '' }"><a href="/expcom/expDpkList.do" class="TopGnbItem">참석일선택</a></li>
		<li class="${mainMenuCode eq 'EXP005' ? 'TopGnbOn' : '' }"><a href="/expcom/expComList.do" class="TopGnbItem">위원회현황</a></li>
	</ul>
</div> --%>
<!--// HEADER - A START  -->