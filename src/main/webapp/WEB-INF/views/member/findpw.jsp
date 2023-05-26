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
				<h1 class="Contit">비밀번호 재설정</h1>
				<p class="Contitsub firstInfo">본인인증 후 비밀번호를 재설정 할 수 있습니다.</p>
				<p class="Contitsub lastInfo" style="display:none">새로운 비밀번호를 입력해주세요.</p>
				<div class="form_register">
					<form name="form" id="niceApiform" action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/service.cb">
					    <input type="hidden" id="m" name="m" value="service" />
					    <input type="hidden" id="token_version_id" name="token_version_id" value="" />
					    <input type="hidden" id="enc_data" name="enc_data" />
					    <input type="hidden" id="integrity_value" name="integrity_value" />
					</form>	
					<input type="hidden" id="niceMode" name="niceMode" value="Find" />
            		<input type="hidden" id="phoneNum" name="phoneNUM" value="" />
            		<input type="hidden" id="memDi" name="memDi" value="" />
            		<!-- <div class="fisrform">
	            		<p class="login_inp login ">
							<label for="password" class="blind">아이디</label>
							<input type="text" id="cpnId" name="cpnId" placeholder="아이디를 입력해주세요." autocomplete="off">
						</p>
					</div> -->
            		<div class="lastform">
	            		<p class="login_inp login ">
							<label for="password" class="blind">비밀번호</label>
							<input type="password" id="rscMemPassword" name="rscMemPassword" placeholder="비밀번호">
						</p>
						<p class="login_inp login">
							<label for="password" class="blind">비밀번호 확인</label>
							<input type="password" id="rscMemPassword2" name="rscMemPassword2" placeholder="비밀번호 확인">
						</p>
					</div>
					
		        </div>
		        
				<div class="btn login">
            		<a href="javascript:void(0);" id="CallNicePBtn" class="CallNicePBtn">본인 인증 하기</a>
            		<a href="javascript:void(0);" id="SavePwassBtn" class="SavePwassBtn" style="display:none">비밀번호 저장</a>
            	</div>	
			</div>
			
			<div class="login_copy">
				<p>Copyright © 2022.<span>KAITS</span>. ALL RIGHTS RESERVED.</p>
			</div>
		</div>
	</div>
</div>
