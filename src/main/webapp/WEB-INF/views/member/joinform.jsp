<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div id="JoinWrap" class="JoinWrap">
		<div class="Join_frm">
			<!-- <form name="loginForm" action="/member/loginProc" method="post" id="login_warp" class="loginbox" style="float:left;"> -->
			<div name="JoinForm" id="Joinbox" class="Joinbox">
				<h1 class="nct_logo"><img src="/resources/images/t_logo.png" alt="국가핵심기술 종합관리시스템"></h1>
				
				<div class="JoinRregister">
					<p style="display:block;">아이디</p>
					<p class="JoinInput Input01 ">
						<input type="text" id="JoinId" name="JoinId" class="JoinId" value="" placeholder="아이디" autocomplete="off" style="width:calc(100% - 105px);float: left;">
						<a href="#none" class="IdChk">중복 확인</a>
						<input type="hidden" id="checkId" value="F"/>
					</p>
					<p class="JoinInput Input01">
						<label for="password">비밀번호</label>
						<input type="password" id="JoinPassword" name="JoinPassword" placeholder="비밀번호" autocomplete="off">
					</p>
					<p class="JoinInput Input01">
						<label for="password">비밀번호 확인</label>
						<input type="password" id="JoinPasswordC" name="JoinPasswordC" placeholder="비밀번호" autocomplete="off">
					</p>
					<p class="JoinInput Input02">
						<label for="JoinId" >이름</label>
						<input type="text" id="JoinName" name="JoinName" class="JoinName" value="" placeholder="이름" autocomplete="off">
					</p>
					<div class="JoinCompany">
						<p>소속</p>
						<input type="hidden" name="JoinCompany" id="JoinCompany" value="">
						<ul class="JoinCompanyList">
							<li class=""><a href="#none" class="JoinCompanyItem">산업통상자원부 기술안보과</a></li>
							<li><a href="#none" class="JoinCompanyItem">한국산업기술보호협회</a></li>
							<li><a href="#none" class="JoinCompanyItem">국정원 산업기밀보호센터</a></li>
						</ul>
					</div>
					<div class="JoinDepth">
						<p class="JoinInput Input01 Depart">
							<label for="JoinId" >부서명</label>
							<input type="text" id="JoinDepart" name="JoinDepart" class="JoinDepart" value="" placeholder="부서명" autocomplete="off">
						</p>
						<p class="JoinInput Input01 Position">
							<label for="JoinId" >직책</label>
							<input type="text" id="JoinPositio" name="JoinPositio" class="JoinPositio" value="" placeholder="직책" autocomplete="off">
						</p>
					</div>
					<div class="JoinPhone">
						<p style="display:block;">휴대폰 번호</p>
						<p class="JoinInput Input01 phone">
							<input type="text" id="JoinPhone1" name="JoinPhone1" class="JoinPhone1" placeholder="'-'을 제외한 휴대폰 번호를 입력해주세요." value="" autocomplete="off">
						</p>
					</div>
					<p class="JoinInput Input02">
						<label for="JoinId" >이메일</label>
						<input type="text" id="JoinEmail" name="JoinEmail" class="JoinEmail" value="" placeholder="이메일" autocomplete="off">
					</p>
				</div>
				<div class="btn join">
					<a href="#none" id="JoinMemBtn" class="JoinMemBtn">회원 가입</a>
				</div>
				
			</div>
			<div class="login_copy">
				<p>Copyright © 2022.<span>KAITS</span>. ALL RIGHTS RESERVED.</p>
			</div>
		</div>
	</div>

	