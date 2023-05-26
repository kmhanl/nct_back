<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="nct_content_wrap">
	<div class="mem_auth_info">
		<div class="mem_auth_box">
			<h1 class="auth_logo"><img src="/resources/images/t_logo.png" alt="국가핵심기술 종합관리시스템"></h1>
			<p class="auth_info_tit">
				메뉴 <span class="color_B">접근 권한</span>이 없습니다.	
			</p> 
			<p class="auth_info_sub">
				관리자에게 문의 해주세요.
			</p>
			<a href="javascript:history.back();" class="back_btn">이전 페이지로 이동</a>
		</div>
		<div class="auth_copy">
			<p>Copyright © 2022.<span>KAITS</span>. ALL RIGHTS RESERVED.</p>
		</div>
	<c:if test="${ user.admGroup eq 'AMG05' or user.admGroup eq 'AMG06'}">
		<!-- <a href="/resources/files/국가핵심기술_종합관리시스템_사용자_매뉴얼_v0.1.pdf" target="_blank" class="user_manual">위원회 현황</a> -->
	</c:if>
	</div>
</div>
