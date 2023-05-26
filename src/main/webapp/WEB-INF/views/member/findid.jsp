<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div class="membershipWrapper">
	<div id="loginWrap" class="membershipBox">
		<div class="login_frm">
			<!-- <form name="loginForm" action="/member/loginProc" method="post" id="login_warp" class="loginbox" style="float:left;"> -->
			
			<div id="login_warp" class="contentbox">
				<h1 class="nct_logo"><img src="/resources/images/t_logo.png" alt="국가핵심기술 종합관리시스템"></h1>
				<h1 class="Contit">아이디 찾기</h1>
				<p class="Contitsub firstInfo">본인인증을 통해 아이디를 확인 할수 있습니다.</p>
				<p class="Contitsub lastInfo lastMent1" style="display:none">새로운 비밀번호를 입력해주세요.</p>
				<div class="form_register">
					<form name="form" id="niceApiform" action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/service.cb">
					    <input type="hidden" id="m" name="m" value="service" />
					    <input type="hidden" id="token_version_id" name="token_version_id" value="" />
					    <input type="hidden" id="enc_data" name="enc_data" />
					    <input type="hidden" id="integrity_value" name="integrity_value" />
					</form>	
					<input type="hidden" id="niceMode" name="niceMode" value="FindID" />
            		<input type="hidden" id="phoneNum" name="phoneNUM" value="" />
            		<input type="hidden" id="memDi" name="memDi" value="" />
            		<div class="lastform">
	            		<p Class="FindIDRE" id="FindIDRE" style="font-size:28px;color:#4d84ff;text-align:center;padding: 15px 10px 15px 10px;
    border: 1px solid #d3d3d3;"></p>
					</div>
					
		        </div>
		        
				<div class="btn login">
            		<a href="javascript:void(0);" id="CallNicePBtn" class="CallNicePBtn">본인 인증 하기</a>
            		<a href="/member/login.do" id="LinkLogin" class="LinkLogin" style="display:none">로그인</a>
            		<a href="/member/joinagree.do" id="LinkJoin" class="LinkJoin" style="display:none">회원가입</a>
            		
            	</div>	
			</div>
			<div class="login_copy">
				<p>Copyright © 2022.<span>KAITS</span>. ALL RIGHTS RESERVED.</p>
			</div>
		</div>
	</div>
</div>
