<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <div id="Dimmed_Layer_Warpper" class="Dimmed_Layer_Warpper">
    <script type="text/javascript" src="/resources/js/signature.js"></script>
		<div id="Layer_Content_Warpper" class="Layer_Content_Warpper Layer_Content_5001">
        	<div class="layer_popup_tit">
				<h1 class="layer_tit">비밀유지의무 동의서 </h1>
			</div>
			<div class="layer_popup_body">
				<div class="secretAgreeBody">
					<h1 class="agreeTit">전문위원회 검토 의견 제출 비밀유지의무 동의</h1>
					<div class="ViewDateOn">
                		전문위원회 참석 및 작성해주신 검토 의견에 대한 비밀 유지에 동의 해주세요.  
                	</div>
                	<p class="agreelow">
                	본인은 국가핵심기술 여부판정, 수출신고 등을 검토하기 위한 아래 분야의 산업기술보호전문위원회 참석함에,「산업기술의 유출방지 및 보호에 관한 법률」<br>제 34조(비밀유지의무) 1, 2 및 3호에 따라 직무상 알게 된 비밀을 누설하거나 도용하지 않을 것이며, 이를 위반하였을 시에는 모든 책임을 질 것을 서약합니다.
                	</p>
                	
	                <div class="AgreeSubmitBox">
                    	<div class="AgreeSubmitInfo">
                    		<div class="AgreeTitle">
	                            [관련근거] 산업기술의 유출방지 및 보호에 관한 법률
		                    </div>
		                	<div class="law_content">
							    <p class="law_content_tit">
							        제34조(비밀유지의무)
							    </p>
							    <p class="law_content_depth_01">
							        다음 각 호의 어느 하나에 해당하거나 해당하였던 자는 그 직무상 알게 된 비밀을 누설하거나 도용하여서는 아니 된다.
							    </p>
							    <ol class="law_list_t_01">
							        <li class="li_item_01">
							            대상기관의 임·직원(교수·연구원·학생을 포함한다)
							        </li>
							        <li class="li_item_02">
							            제9조의 규정에 따라 국가핵심기술의 지정·변경 및 해제 업무를 수행하는 자 또는 제16조의 규정에 따라 국가핵심기술의 보호·관리 등에 관한 지원 업무를 수행하는 자
							        </li>
							        <li class="li_item_03">
							            제11조 및 제11조의2에 따라 국가핵심기술의 수출 및 해외인수·합병 등에 관한 사항을 검토하거나 사전검토, 조사업무를 수행하는 자
							        </li>
							    </ol>
							    <p class="law_content_tit">
							        제36조(벌칙)
							    </p>
							    <ol class="law_list_t_02">
							        <li class="li_item_01 active">
							            제34조의 규정을 위반하여 비밀을 누설하거나 도용한 자는 5년 이하의 징역이나 10년 이하의 자격정지 또는 5천만원 이하의 벌금에 처한다.
							        </li>
							    </ol>
							</div>
						</div>
                    	
                    	<div class="AgreeSubmitWrite">
                    		<div class="AgreeTitle">
	                                       	약관 동의 및 서명
		                    </div>
		                    <div class="AgreeChkBox">
		                    	<input type="hidden" id="AgreeOnYN" name="AgreeOnYN" value="N"/>
		                    	<input type="hidden" id="SignatureYN" name="SignatureYN" value="N"/>
		                    	<a href="javascript:void(0);" class="AgreeChkBtn">
							       	 본인은 비밀유지에 대한 의무를 자세히 읽고 숙지 하였으며, 정보 보호에 관한 법률에 동의 합니다.
							    </a>
							    <p class="AgreeNameBox"><span class="MemAMG">검토자</span><span class="MemName">${user.admName }</span></p>
		                    </div>
		                    <div class="signatureBox">
		                    	<p class="signatureInfo">서명</p>
		                    	<a href="javascript:void(0);" id="clear" class="signatureClerBtn">지우기</a>
		                    	<div id="sig" class="signatureWrap">
		                    	</div>
		                    </div>
                    	</div>
                    </div>
                </div>
            </div>
			<div class="layer_popup_btn">
                <a href="#none" class="btn btn_AgreeCommite" data-admid="${user.admId }" data-exidx="${ exData.committeeIdx}">동의 및 최종 의견 제출</a>
            </div>
		</div>
	</div>
