<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <script type="text/javascript" src="/resources/js/member/memberPopup.js"></script>
    <div id="Dimmed_Layer_Warpper" class="Dimmed_Layer_Warpper" style="display:none;">
</div>
	<div id="loginWrap" class="loginWrap">
		<div class="login_frm">
			<!-- <form name="loginForm" action="/member/loginProc" method="post" id="login_warp" class="loginbox" style="float:left;"> -->
			<div name="loginForm" id="login_warp" class="loginbox">
				<h1 class="nct_logo"><img src="/resources/images/t_logo.png" alt="국가핵심기술 종합관리시스템"></h1>
				
				<div class="info_message otp">
 					<p class="opt_message" style="display:block;">
 						OTP인증번호가 <strong>010-****-0000</strong>으로 발송되었습니다.<br>
 						확인 후 OTP 인증번호를 입력해주세요.
 					</p>
				</div>
				<div class="form_register">
					<p class="login_inp otp">
 						<label for="otp" class="blind">OTP인증번호</label>
 						<input type="text" id="otp" placeholder="OTP인증번호를 입력해주세요."  value="" autocomplete="off"> 
 					</p>
					<p class="login_inp login">
						<label for="inputId" class="blind">아이디</label>
							<input type="text" id="cpnId" name="cpnId" value="" placeholder="아이디">
					</p>
					<p class="login_inp login">
						<label for="password" class="blind">비밀번호</label>
						<input type="password" id="cpnPassword" name="cpnPassword" placeholder="비밀번호">
					</p>
				</div>
				<div class="wrong_message">
					<p id="fail_message" style="">아이디 또는 비밀번호가 일치하지 않습니다.</p>
				</div>
				<div class="otp_message">
					<p class="OtpTime">제한 시간 :
						<input type="hidden" id="OtpTimeStat" value="ing"/> 
						<span class="OtpTimecntdown"><span class="TMin">03</span>:<span class="TSeconds">00</span>
					</p>
 					<a href="javascript:void(0);" id="otpSendBtn" class="otpSendBtn">OTP인증번호 다시 받기</a>
 				</div>
				<div class="btn login">
					<a href="javascript:void(0);" id="loginBtn" class="login_normal">로그인</a>
				</div>
				<div class="btn otp">
					<a href="javascript:void(0);" id="otpBtn" class="otp_normal">확인</a>
				</div>
			</div>

			<div class="check_info" style="clear: both;">
				<ul class="check_item">
					<li>
						<a href="/member/findid.do" id="findIdBtn" class="item check_id ingdev">아이디 찾기</a>
					</li>
					<li>
						<a href="/member/findpw.do" id="findIdBtn" class="item check_pw ingdev">비밀번호 찾기</a>
					</li>
					<li>
						<a href="/member/join.do" id="findIdBtn" class="item check_join ingdev">회원가입</a>
					</li>
				</ul>
			</div>
			<div class="login_copy">
				<p>Copyright © 2022.<span>KAITS</span>. ALL RIGHTS RESERVED.</p>
			</div>
		</div>
	</div>
