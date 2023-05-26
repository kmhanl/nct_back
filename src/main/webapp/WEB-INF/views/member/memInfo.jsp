<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<div id="JoinInfoWrap" class="JoinInfoWrap">
		<div class="Join_frm">
			<!-- <form name="loginForm" action="/member/loginProc" method="post" id="login_warp" class="loginbox" style="float:left;"> -->
			<div name="JoinForm" id="Joinbox" class="Joinbox">
				<h1 class="nct_logo"><img src="/resources/images/t_logo.png" alt="국가핵심기술 종합관리시스템"></h1>
				<div class="RregisterInfo">
					<c:if test="${infoCode eq '300' }">
						<h1 class="TopInfo" style="color:#ff0000;">
							사용권한이 중지 되었습니다.
						</h1>
						<p class="BottomInfo">
							담당자에게 문의 해주세요.<br>
						</p>
					</c:if>
					<c:if test="${infoCode eq '400' }">
						<h1 class="TopInfo" style="">
							회원 가입 승인 대기 중입니다.
						</h1>
						<p class="BottomInfo">
							담당자의 <span>승인</span> 이후 국가핵심기술 종합관리시스템 이용이 가능 합니다.<br>
						</p>
					</c:if>
					
					
					<!-- <div class="JoinRegi">
						<p>회원 가입 정보</p>
						<ul class="JoinRegiList">
							<li>
								<p class="RegiL">아이디 :</p><p class="class="RegiI"></p>
							</li>
							<li>
								<p class="RegiL">이름 :</p><p class="class="RegiI"> ㅇㅇㅇㅇ</p>
							</li>
							<li>
								<p class="RegiL">휴대폰 :</p><p class="class="RegiI"> ㅇㅇㅇㅇ</p>
							</li>
							<li>
								<p class="RegiL">이메일 :</p><p class="class="RegiI"> ㅇㅇㅇㅇ</p>
							</li>
						</ul>
					</div> -->
					<div class="CustomerInfo">
						<p>※ 회원 가입 및 승인 관련 궁금하신 사항은 문의 해주세요.</p>
						<p class="Customer" style="padding:10px 0 10px 20px;">
							한국산업기술보호협회 정책운영팀 <br>
							02-3489-7030, 7035 / help@kaits.or.kr
						</p>
						
					</div>
				</div>
				<div class="btn join">
					<a href="/member/login" id="JoinMemBtn" class="JoinMemBtn">확인</a>
				</div>
			</div>
			<div class="login_copy">
				<p>Copyright © 2022.<span>KAITS</span>. ALL RIGHTS RESERVED.</p>
			</div>
		</div>
	</div>

	