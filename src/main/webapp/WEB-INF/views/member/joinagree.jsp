<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div id="JoinWrap" class="JoinWrap">
		<div class="Join_frm">
			<!-- <form name="loginForm" action="/member/loginProc" method="post" id="login_warp" class="loginbox" style="float:left;"> -->
			<div name="JoinForm" id="Joinbox" class="Joinbox">
				<h1 class="nct_logo"><img src="/resources/images/t_logo.png" alt="국가핵심기술 종합관리시스템"></h1>
				
				<div class="AgreeChk">
					<input type="hidden" name="JoinAgree01" class="JoinAgree"  id="JoinAgree01" value="N">
 					<a href="#none" class="AgreeChkBtn">
 						국가핵심기술 종합관리시스템 이용약관 동의 <span>(필수)</span>
 					</a>
				</div>
				<div class="AgreeTextBox">
					<div class="article">
					    <h3 class="article_title">환영합니다.</h3>
					    <p class="article_text">
						        국가핵심기술 종합관리시스템(이하 ‘시스템’)을 이용해 주셔서 감사합니다.
						        본 약관은 시스템을 제공하는 산업기술보호협회와
						        이를 이용하는  회원(이하 ‘회원’)의 관계를 설명하며,
						        아울러 여러분의 시스템 이용에 도움이 될 수 있는  정보를 포함하고 있습니다.
					    </p>
					    <p class="article_text">
						        시스템을 이용을 위해 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로,
						        잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.
					    </p>
					</div>
				</div>
				
				<div class="AgreeChk">
					<input type="hidden" name="JoinAgree02" class="JoinAgree" id="JoinAgree02" value="N">
 					<a href="#none" class="AgreeChkBtn">
 						개인정보 수집 및 이용 동의 <span>(필수)</span>
 					</a>
				</div>
				<div class="AgreeTextBox">
					<div class="article">
					    <p class="article_text">
						        개인정보보호법에 따라 네이버에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
					    </p>
					    <h3 class="article_title">1. 수집하는 개인정보</h3>
					    <p class="article_text">
						       이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 네이버 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 네이버는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
					    </p>
					    <p class="article_text">
						        시스템을 이용을 위해 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로,
						        잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.
					    </p>
					</div>
				</div>
				<div class="btn join">
					<a href="#none" id="CallNiceBtn" class="CallNiceBtn">본인 인증</a>
				</div>
				
			</div>
			<div class="login_copy">
				<p>Copyright © 2022.<span>KAITS</span>. ALL RIGHTS RESERVED.</p>
			</div>
			
			<form name="form" id="niceApiform" action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/service.cb">
			      <input type="hidden" id="m" name="m" value="service" />
			      <input type="hidden" id="token_version_id" name="token_version_id" value="" />
			      <input type="hidden" id="enc_data" name="enc_data" />
			      <input type="hidden" id="integrity_value" name="integrity_value" />
			</form>
		</div>
	</div>

	