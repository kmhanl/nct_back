<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="/resources/js/member/commonSend.js"></script>
<div id="JoinWrap" class="JoinWrap">
	<input type="hidden" id="niceMode" name="niceMode" value="Join" />
	<input type="hidden" id="joinMode" name="joinMode" value="${joinMode}" />
	<input type="hidden" id="nctCode" name="nctCode" value="${nctCode}" />
	<input type="hidden" id="phoneNum" name="phoneNUM" value="" />
	<input type="hidden" id="memDi" name="memDi" value="" />
	<form name="form" id="niceApiform" action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/service.cb">
	      <input type="hidden" id="m" name="m" value="service" />
	      <input type="hidden" id="token_version_id" name="token_version_id" value="" />
	      <input type="hidden" id="enc_data" name="enc_data" />
	      <input type="hidden" id="integrity_value" name="integrity_value" />
	</form>
	<div class="Join_frm">
		<div name="JoinForm" id="Joinbox" class="Joinbox">
			<h1 class="nct_logo"><img src="/resources/images/t_logo.png" alt="국가핵심기술 종합관리시스템"></h1>
			<%-- ${nctCode} --%>
			<div class="joinStep02">
				<div class="JoinRregister">
					<p style="display:block;">아이디</p>
					<p class="JoinInput Input01 ">
						<input type="text" id="JoinId" name="JoinId" class="JoinId" value="" placeholder="아이디" autocomplete="off" style="width:calc(100% - 105px);float: left;">
						<a href="javascript:void(0);" class="IdChk">중복 확인</a>
						<input type="hidden" id="checkId" value="F"/>
						<c:if test="${joinMode eq 'InviJoin'}">
							<input type="hidden" id="admInviYn" value="Y"/>
							<input type="hidden" id="admInviKey" value="${nctCode}"/>
						</c:if>
						<c:if test="${joinMode eq 'NewJoin'}">
							<input type="hidden" id="admInviYn" value="N"/>
							<input type="hidden" id="admInviKey" value=""/>
						</c:if>
						
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
						<input type="text" id="JoinName" name="JoinName" class="JoinName" value="" placeholder="이름" disabled="disabled" autocomplete="off" style="background: #f9f9f9;border: 1px solid #e7e7e7;">
					</p>
					<c:if test="${joinMode eq 'InviJoin'}">
	                	<p class="JoinInput Input02">
							<label for="JoinId" >소속</label>
							<input type="hidden" name="JoinCompany" id="JoinCompany" value="${inviChk.admInviGroup}">
							<input type="hidden" name="admInviSamu" id="admInviSamu" value="${inviChk.admInviSamu}">
							<input type="hidden" name="admInviProYn" id="admInviProYn" value="${inviChk.admInviProYn}">
							<input type="hidden" name="admInviSaveYn" id="admInviSaveYn" value="${inviChk.admInviSaveYn}">
							<input type="hidden" name="admInviSubYn" id="admInviSubYn" value="${inviChk.admInviSubYn}">
							<input type="text" id="JoinComName" name="JoinComName" class="JoinComName" value="" placeholder="소속" autocomplete="off">
						</p>
	                </c:if>
	                <c:if test="${joinMode eq 'NewJoin'}">
						<%-- <div class="JoinCompany">
							<p>소속</p>
							<input type="hidden" name="JoinCompany" id="JoinCompany" value="${inviChk.admInviGroup}">
							<ul class="JoinCompanyList">
								<li class=""><a href="#none" class="JoinCompanyItem">산업통상자원부 기술안보과</a></li>
								<li><a href="#none" class="JoinCompanyItem">한국산업기술보호협회</a></li>
								<li><a href="#none" class="JoinCompanyItem">국정원 산업기밀보호센터</a></li>
							</ul>
						</div> --%>
						<p class="JoinInput Input02">
							<label for="JoinId" >소속</label>
							<input type="text" id="JoinComName" name="JoinComName" class="JoinComName" value="" placeholder="소속" autocomplete="off">
						</p>
					</c:if>
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
							<input type="text" id="JoinPhone1" name="JoinPhone1" class="JoinPhone1" disabled="disabled" value="" autocomplete="off" style="background: #f9f9f9;border: 1px solid #e7e7e7;">
						</p>
					</div>
					<p class="JoinInput Input02">
						<label for="JoinId" >이메일</label>
						<input type="text" id="JoinEmail" name="JoinEmail" class="JoinEmail" value="" placeholder="이메일" autocomplete="off">
					</p>
				</div>
				<div class="btn join">
					<a href="javascript:void(0);" id="JoinMemBtn" class="JoinMemBtn">회원 가입</a>
				</div>
			</div>
			
			<div class="joinStep01"> 
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
						        국가핵심기술 종합관리시스템(이하 ‘시스템’)을 이용해 주셔서 감사합니다.<br>
						        본 약관은 시스템을 제공하는 한국산업기술보호협회와 이를 이용하는  회원(이하 ‘회원’)의 관계를 설명하며,
						        아울러 여러분의 시스템 이용에 도움이 될 수 있는  정보를 포함하고 있습니다.
					    </p>
					    <p class="article_text">
						        시스템을 이용을 위해 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로,
						        잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.
					    </p>
					</div>
					<div class="agreebox">
						<h1 class="agreeDeTit">제 1장 총칭</h1>
						<p class="agreeTit">제 1조 목적</p>
						<p class="agreePtext">
							본 약관은 한국산업기술보호협회(이하 “협회”라 한다)가 제공하는 국가핵심기술종합관리시스템(“이하 “시스템”이라 한다)의 모든 서비스 이용조건 및 절차, 권리, 의무, 책임사항과 기타 필요한 사항에 대해 규정함을 목적으로 합니다.
						</p>
						<p class="agreeTit">제2조 약관의 효력과 변경</p>
						<ul class="agreeliList">
							<li class="agreelitext">
								이용자가 본 약관 내용에 동의하는 경우, 다른 법령에서 규정하는 경우를 제외하고는 본 약관이 우선적으로 적용됩니다.
							</li>
							<li class="agreelitext">
								협회는 본 약관을 변경할 수 있습니다. 변경된 약관은 효력 발생 30일 이전에 시스템에 공지하거나 회원에게 통보하며, 공지 또는 통보 이후 30일이 경과함과 동시에 그 효력이 발생됩니다. 회원이 변경된 약관에 동의하지 않는 경우, 회원은 회원등록을 취소 (회원탈퇴)할 수 있으며 계속 사용의 경우는 약관 변경에 대한 동의로 간주됩니다.
							</li>
						</ul>
						<p class="agreeTit">제3조 약관 외 준칙</p>
						<ul class="agreeliList">
							<li class="agreelitext">
							본 약관에 명시되지 않은 사항은 관련 법령의 규정에 의합니다.
							</li>
						</ul>
						
						<p class="agreeTit">제4조 용어의 정의</p>
						
						<p class="agreePtext">본 약관에서 사용하는 용어의 정의는 다음과 같습니다.</p>
						<ul class="agreeliList">
							<li class="agreelitext">이용자 : 본 약관에 따라 시스템이 제공하는 서비스를 받는 자</li>
							<li class="agreelitext">회원가입 : 본 약관과 개인정보의 수집 · 이용에 동의하고 시스템이 제공하는 신청 양식에 필수 정보를 입력하여 서비스 이용계약을 완료시키는 행위</li>
							<li class="agreelitext">회원 : 회원가입을 한 자로서 시스템이 제공하는 서비스를 이용할 수 있는 자</li>
							<li class="agreelitext">비밀번호 : 영문 대소문자, 숫자, 특수문자를 적절히 조합한 것</li>
							<li class="agreelitext">탈퇴 : 회원이 이용계약을 종료시키는 행위</li>
							<li class="agreelitext">이용요금 : 서비스를 이용한 대가로 별도 부과기준 및 체계에 따라 산정되어 부과되는 금액</li>
						</ul>
						<h1 class="agreeDeTit">제2장 서비스 제공 및 이용</h1>
						<p class="agreeTit">제5조 이용계약의 성립</p>
						
						<p class="agreePtext">이용계약은 신청자가 온라인으로 본 약관과 개인정보의 수집 · 이용을 동의하고 필수 정보를 입력하는 절차를 완료하여야 성립됩니다.
						협회는 다음 각 호에 해당하는 이용계약에 대하여는 성립 이후라도 취소할 수 있습니다.</p>
						<ul class="agreeliList">
							<li class="agreelitext02">가. 다른 이용자의 명의를 도용하여 신청 하였을 때</li>
							<li class="agreelitext02">나. 이용자가 회원가입 정보를 허위로 입력하여 신청하였을 때</li>
							<li class="agreelitext02">다. 다른 이용자의 시스템 서비스 이용을 방해 하였을 때</li>
							<li class="agreelitext02">라. 시스템을 이용하여 관련 법령과 본 약관이 금지하는 행위를 하는 경우</li>
							<li class="agreelitext02">마. 기타 이용신청 요건이 미비 되었을 때</li>
						</ul>
						<p class="agreeTit">제6조 개인정보 수집 및 이용</p>
						
						<ul class="agreeliList">
							<li class="agreelitext">회원의 개인정보는 개인정보보호법에 의해 보호됩니다.</li>
							<li class="agreelitext">개인정보 보호에 관한 구체적인 사항은 개인정보처리방침에서 정한 바에 따릅니다.</li>
						</ul>
						
						<p class="agreeTit">제7조 이용자의 정보보안</p>
						
						<ul class="agreeliList">
							<li class="agreelitext">이용자는 회원가입을 완료하는 순간부터 시스템 서비스 사용 입력한 정보의 비밀을 유지할 책임이 있으며, 회원의 ID와 비밀번호를 사용하여 발생하는 모든 결과에 대한 책임은 회원에게 있습니다.</li>
							<li class="agreelitext">회원은 시스템 서비스의 사용 종료 시마다 정확히 접속을 종료해야 하며, 정확히 종료하지 아니함으로써 제3자가 회원 정보를 이용하게 되는 등의 결과로 인해 발생하는 손해 및 손실에 대하여 협회는 책임을 부담하지 아니합니다.</li>
						</ul>
						
						<p class="agreeTit">제8조 서비스의 이용 개시</p>
						<ul class="agreeliList">
							<li class="agreelitext">회원가입이 완료된 때부터 서비스를 개시합니다.</li>
							<li class="agreelitext">서비스의 이용은 특별한 지장이 없는 한 연중무휴, 1일 24시간을 원칙으로 합니다. 다만 서비스 내용에 따라 이용시간을 별도로 정할 수 있습니다.</li>
						</ul>
						
						<p class="agreeTit">제9조 서비스의 내용</p>
							<ul class="agreeliList">
								<li class="agreelitext">산업기술의 유출방지 및 보호에 관한 법률상 국가핵심기술 관련 민원서비스</li>
							</ul>						
						
						<p class="agreeTit">제10조 서비스의 중지 및 변경</p>
						<ul class="agreeliList">
							<li class="agreelitext">협회는 이용자가 관련 법령의 규정과 본 약관의 내용에 위배되는 행동을 한 경우, 강제로 서비스 사용을 제한하거나 중지할 수 있습니다.</li>
							<li class="agreelitext">협회는 필요 시 서비스의 내용을 추가, 변경, 삭제할 수 있으며 이에 따른 사항은 시스템에 별도로 공지하는 내용에 따릅니다.</li>
						</ul>
						
						<p class="agreeTit">제11조 이용계약의 해지</p>
						
						<ul class="agreeliList">
							<li class="agreelitext">회원이 서비스 이용계약을 해지하고자 할 경우에는 회원 스스로 탈퇴 처리를 할 수 있습니다.</li>
							<li class="agreelitext">
							협회는 다음 각 호의 1에 해당하는 사유가 발생한 때에는 이용계약을 해지할 수 있으며 일정기간 내에 재가입을 제한 할 수 있습니다.
							<ul class="agreeliList">
								<li class="agreelitext02">가. 관계 법령의 규정과 본 약관을 위반하여 1회 이상의 시정요구를 받고 이에 불응하여 업무상 지장을 초래한 경우</li>
								<li class="agreelitext02">나. 기타 이용자로서 부적당하고 판단한 경우</li>
							</ul>
							</li>
						</ul>
						<p class="agreeTit">제12조 게시물의 저작권</p>
						
						<ul class="agreeliList">
							<li class="agreelitext">이용자가 게시한 게시물의 내용에 대한 권리는 이용자에게 있습니다.</li>
							<li class="agreelitext">협회는 관계 법령의 규정과 본 약관에 따라 시스템에 게시된 내용을 사전 통보 없이 편집, 이동, 삭제할 수 있는 권리를 보유합니다.</li>
							<li class="agreelitext">이용자의 게시물이 다른 저작권을 침해함으로써 발생하는 민, 형사상의 책임은 전적으로 해당 이용자가 부담하여야 합니다.</li>
						</ul>
						
						<h1 class="agreeDeTit">제3장 의무 및 책임</h1>
						<p class="agreeTit">제13조 한국산업기술보호협회의 의무</p>
						
						<ul class="agreeliList">
							<li class="agreelitext">협회는 시스템의 회원정보를 동의 없이 제3자에게 제공하거나 목적 외로 이용하지 않습니다. 다만, 개인정보보호법 등 관계 법령 등의 규정에 근거한 경우에는 그러하지 아니합니다.</li>
						</ul>
						
						<p class="agreeTit">제14조 회원의 의무</p>
						
						<ul class="agreeliList">
							<li class="agreelitext">회원가입 시에 요구되는 정보는 정확하게 입력하여야 합니다. 또한 이미 제공된 정보가 정확한 정보가 되도록 유지, 갱신하여야 하며, 회원은 자신의 ID 및 비밀번호를 제3자가 이용하게 해서는 안 됩니다.</li>
							<li class="agreelitext">회원은 협회의 사전 승낙 없이는 서비스를 이용하여 어떠한 영리행위도 할 수 없습니다.</li>
							<li class="agreelitext">이용자는 서비스 이용에 대한 대가로서 본 약관에서 정한 요금 등을 납입하여야 합니다.</li>
						</ul>
						
						<h1 class="agreeDeTit">제4장 기타</h1>
						
						<p class="agreeTit">제15조 양도금지</p>
						
						<ul class="agreeliList">
							<li class="agreelitext">회원이 서비스의 이용권한, 기타 이용계약 상 지위를 타인에게 양도, 증여할 수 없습니다.</li>
						</ul>
						
						<p class="agreeTit">제16조 손해배상</p>
						
						<ul class="agreeliList">
							<li class="agreelitext">협회는 무료로 제공되는 서비스와 관련하여 회원에게 어떠한 손해가 발생하더라도 고의 · 중과실로 행한 범죄행위를 제외하고는 이에 대하여 책임을 부담하지 아니합니다.</li>
						</ul>
						
						<p class="agreeTit">제17조 면책조항</p>
						
						<ul class="agreeliList">
							<li class="agreelitext">협회는 시스템에 게시된 이용자나 회원 의견에 대해 관련 법령의 규정과 본 약관의 내용에 위배되지 않는다면 어떠한 경우라도 승인, 반대 또는 수정하지 않습니다. 또한 회원이 서비스에 담긴 정보에 의존해 얻은 이득이나 입은 손해에 대해 책임이 없습니다.</li>
							<li class="agreelitext">협회는 회원이 서비스 이용을 통해 기대하는 이익과 회원간 또는 회원과 제3자간에 서비스를 매개로 하는 금전적 거래 등에 관련하여 어떠한 책임도 부담하지 않습니다.</li>
						</ul>
						
						<p class="agreeTit">제18조 재판관할</p>
						<ul class="agreeliList">
							<li class="agreelitext">
								협회 시스템과 이용자간에 발생한 서비스 이용에 관한 분쟁에 대하여는 대한민국 법을 적용하며, 본 분쟁으로 인한 소송 관할은 대한민국의 법원에 전속합니다.
							</li>
						</ul>
					
					</div>
				</div>
				<div class="AgreeChk">
					<input type="hidden" name="JoinAgree02" class="JoinAgree" id="JoinAgree02" value="N">
					<a href="#none" class="AgreeChkBtn">
						개인정보 수집 및 이용 동의 <span>(필수)</span>
					</a>
				</div>
				
				<div class="AgreeTextBox">
					<div class="agreebox">
						<p class="article_text">
						한국산업기술보호협회가 취급하는 모든 개인정보는 개인정보 보호법 및 산업통상자원부 개인정보 보호지침 등 관련 법령상의 개인정보 보호 규정을 준수하여 수집․보유․처리되고 있습니다. 한국산업기술보호협회는 개인정보 보호법에 따라 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다. 한국산업기술보호협회는 개인정보 처리방침을 변경하는 경우에는 시행의 시기, 변경된 내용을 정보주체가 쉽게 확인할 수 있도록 변경 전·후를 비교하여 공개하고 있습니다.
						</p>
						<p class="agreeTit">1. 개인정보의 처리 목적, 개인정보의 처리 및 보유기간, 처리하는 개인정보의 항목</p>
						<p class="agreePtext">
						한국산업기술보호협회는 개인정보 처리 목적에 필요한 최소한의 정보주체 개인정보 항목만을 수집하고, 그 목적의 범위에서 이용하고 있습니다. 개인정보파일 보유기간의 경과, 개인정보의 처리 목적 달성 등 그 개인정보가 불필요하게 되었을 때에는 지체 없이 그 개인정보를 파기합니다. 다만, 다른 법령에 따라 보존하여야 하는 경우에는 그러하지 아니합니다.
						</p>
						<div class="table_con">
						<table class="table_type_01">
			                <colgroup>
			                    <col width="11%">
			                    <col width="33%">
			                    <col width="33%">
			                    <col width="33%">
			                </colgroup>
			                <thead>
			                    <tr>
			                        <th class="stat">구분</th>
			                        <th class="stat">수집하려는 개인정보의 항목</th>
			                        <th class="stat">개인정보의 수집 · 이용 목적</th>
			                        <th class="stat">개인정보의 보유 및 이용기간</th>
			                    </tr>
			                </thead>
			                <tbody>
			                    <tr>
			                   		<th class="stat">
				                   		기업 회원<br>
										(필수)
									</th>
			                   		<td class="tit">
			                   			사업자 등록번호, 상호, 대표자 성명, 사업장 주소, 사업장 전화번호, 업태, 종목, 기업구분(회계기준), 사용자 ID, 비밀번호, 성명, 연락처, 휴대폰, 이메일, 부서, 직책
			                   		</td>
			                   		<td class="tit">
			                   			국가핵심기술 여부판정, 사전검토, 수출신고, 수출승인, M&amp;A사전검토, M&amp;A신고, M&amp;A승인 등 국가핵심기술 신청을 위한 접수	
			                   		</td>
			                   		<td class="tit">
			                   			회원탈퇴 시 까지<br>(단, 관련 법령의 규정에 따름)	
			                   		</td>
			                   	</tr>
			               	</tbody>
			            </table>
					</div>
					</div>
					<div class="article">
					    <p class="article_text">
						        한국산업기술보호협회가 취급하는 모든 개인정보는 개인정보 보호법 및 산업통상자원부 개인정보 보호지침 등 관련 법령상의 개인정보 보호 규정을 준수하여 수집․보유․처리되고 있습니다. 한국산업기술보호협회는 개인정보 보호법에 따라 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다. 한국산업기술보호협회는 개인정보 처리방침을 변경하는 경우에는 시행의 시기, 변경된 내용을 정보주체가 쉽게 확인할 수 있도록 변경 전·후를 비교하여 공개하고 있습니다.
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
					<a href="javascript:void(0);" id="CallNiceBtn" class="CallNiceBtn">본인 인증 하기</a>
				</div>
			</div>
		</div>
		<div class="login_copy">
			<p>Copyright © 2022.<span>KAITS</span>. ALL RIGHTS RESERVED.</p>
			
		</div>
		
	</div>
</div>

	