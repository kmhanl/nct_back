<%--

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link type="text/css" rel="stylesheet" href="/resources/css/nct_ui.css"/>
<script type="text/javascript" src="/resources/js/member/mypage.js"></script>
<div class="mypage_wrapper">
	<div class="nct_content_body nct_scroll">
		<div class="mypage_content_wrap">
			<div class="memberInfomation">
				<h1 class="info_title" style="margin-bottom:40px;">회원 정보</h1>
				<div class="flexbox">
					<div class="infoBox flexitem flexitemL">
						<div class="infoLabel">아이디</div>
						<input type="hidden" id=admId value="${user.admId}" >
						<div class="infoData">${user.admId}</div>
					</div>
					<div class="infoBox flexitem flexitemR">
						<div class="infoLabel">이름</div>
						<div class="infoData">${user.admName}</div>
					</div>
				</div>
				<div class="flexbox">
					<div class="infoBox flexitem flexitemL">
						<div class="infoLabel">휴대폰 번호</div>
						<div class="infoData">${user.admMobile1}-${user.admMobile2}-${user.admMobile3}</div>
					</div>
					<div class="infoBox flexitem flexitemR">
						<div class="infoLabel">이메일</div>
						<div class="infoData">${user.admEmail}</div>
					</div>
				</div>
				<div class="flexbox">
					<div class="infoBox flexitem flexitemL">
						<div class="infoLabel">소속 기관</div>
						<div class="infoData">${user.admCom}</div>
					</div>
					
				</div>
				<div class="flexbox">
					<div class="infoBox flexitem flexitemL">
						<div class="infoLabel">부서</div>
						<div class="infoData">${user.admDept}</div>
					</div>
					<div class="infoBox flexitem flexitemR">
						<div class="infoLabel">직책</div>
						<div class="infoData">${user.admPositon}</div>
					</div>
				</div>
			</div>
			<div class="infoSetup">
				<p class="setup_tit">비밀번호 변경</p>
				<div class="setup_input_item">
					<p class="setup_lavel">현재 비밀번호</p>
					<p class="setup_item">
						<input type="Password" id="OriPw" name="setup_input" class="setup_input" placeholder="현재 비밀번호" autocomplete="off">
					</p>
				</div>
				<div class="setup_input_item">
					<p class="setup_lavel">새 비밀번호</p>
					<p class="setup_item">
						<input type="Password" id="Password1" name="setup_input" class="setup_input" placeholder="새 비밀번호" autocomplete="off">
					</p>
				</div>
				<div class="setup_input_item">
					<p class="setup_lavel">새 비밀번호 확인</p>
					<p class="setup_item">
						<input type="Password" id="Password2" name="setup_input" class="setup_input" placeholder="새 비밀번호 확인" autocomplete="off">
					</p>
				</div>
			</div>
			<div class="infoSetupBtn">
				<a href="javascript:userSetupSave();" class="SetupSave">비밀번호 저장</a>
			</div>
		</div>
	</div>
</div>	
