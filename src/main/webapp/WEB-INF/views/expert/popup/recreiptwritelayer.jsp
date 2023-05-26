<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<div id="Layer_Content_Warpper" class="Layer_Content_Warpper Layer_Content_1001">
		<script type="text/javascript" src="/resources/js/uploadForm.js"></script>
		<script>
		jQuery(function($){
		var $standate = $('#standate');
			$standate.datepicker({
		        language: 'en',
		        autoClose: true,
		    })
		});
		</script>
       	<div class="layer_popup_tit">
			<h1 class="layer_tit">신규 접수 등록</h1>
			<a href="javascript:void(0);" class="layer_closer"></a>
		</div>
		 
		<div class="layer_popup_body content_01">
			<div class="LayerBodySection max-height">
				<div class="Section_tit">
					<input type="hidden" name="in_com" id="in_com" class="in_com" value="Y">
					<h2 class="layer_sub_tit">대상 기업 정보 설정</h2>
	                   <a href="#none" class="sch_chk_box active">
						<span class="pointer"></span>
						<span class="block">설정</span>
						<span class="none">미설정</span>
					</a>
				</div>
	            <div class="Section_bar"></div>
	            
	            <div class="ComIstFrom">
	            	<div class="not_company_info">
						<p>대상기업 정보 <span class="red">미설정</span>으로 등록됩니다.<br>아래 <span class="next">다음</span> 버튼 클릭 후 신청서를 작성해주세요.</p> 
					</div>
		            <div class="sch_company_wrap">
						<input type="hidden" name="com_new" id="com_new" class="com_new" value="S">
						
						<p class="tip">**기업포털에 가입된 기업회원의 DB를 검색 혹은 신규등록으로 대상기업으로 설정할수 있습니다.</p>
						<ul class="new_com_chk">
							<li class="new_com_on"><a href="#none" class="new_com_item search_add">검색등록</a></li>
							<li><a href="#none" class="new_com_item new_add">신규등록</a></li>
						</ul>
						<!-- <a href="#none" class="new_com_chk">신규 등록</a> -->
						<input type="text" id="sch_compay" name="sch_compay" class="sch_company" placeholder="대상 기업명을 입력하세요." autocomplete="off"/>
						<div class="sch_compay_preview">
							<ul class="compay_preview_list">
<!-- 								<li class="compay_preview_item"> -->
<!-- 									<span>(주)삼성디스플레이-[000-00-00000]-company01</span> -->
<!-- 									<span>대표:홍길동/담당자:홍길동</span> -->
<!-- 								</li> -->
<!-- 								<li class="compay_preview_item"> -->
<!-- 									<span>(주)삼성디스플레이-[000-00-00000]-company01</span> -->
<!-- 									<span>대표:홍길동/담당자:홍길동</span> -->
<!-- 								</li> -->
<!-- 								<li class="compay_preview_item"> -->
<!-- 									<span>(주)삼성디스플레이-[000-00-00000]-company01</span> -->
<!-- 									<span>대표:홍길동/담당자:홍길동</span> -->
<!-- 								</li> -->
							</ul>
						</div>
					</div>
					<div class="sch_sel_com">
						<div class="company_sch_info">
							대상기업을 검색 후 선택해주세요.
						</div>
						<div class="sch_sel_ative" >
	               			<div class="info_section">
		               			<div class="section_box_03 comname">
		                			<input type="hidden" name="com_name_s" id="com_name_s" value="테스트기업">
		                			<p class="section_label">기업명</p>
		                			<p class="section_item">테스트기업</p>
		                		</div>
		               			<div class="section_box_03 comceo">
		                			<input type="hidden" name="com_ceo_s" id="com_ceo_s" value="홍길동">
		                			<p class="section_label">대표명</p>
		                			<p class="section_item">홍길동</p>
		               			</div>
		               			<div class="section_box_03 comnum">
		                			<input type="hidden" name="com_reg_num_s" id="com_reg_num_s" value="1630111111" >
		                			<p class="section_label">사업자등록번호</p>
		                			<p class="section_item">1630111111</p>
		               			</div>
		               		</div>
		               		<div class="info_section">
		               			<div class="section_box_03 comadd">
		               				<input type="hidden" name="com_bon_add1_s" id="com_bon_add_s" value="서울시 영등포구 여의대로 128">
		                			<p class="section_label">본사 소재지</p>
		                			<p class="section_item">06732) 서울시 영등포구 여의대로 128  </p>
		               			</div>
		               			<div class="section_box_03 comphone">
		               				<input type="hidden" name="com_bon_phone_s" id="com_bon_phone_s" value="02-3773-1114">
		                			<p class="section_label">본사전화번호</p>
		                			<p class="section_item">02-3773-1114</p>
		               			</div>
		               			
		               		</div>
		               		<div class="info_section">
		               			<div class="section_box_03 comadd">
		               				<input type="hidden" name="com_sa_add_s" id="com_sa_add_s" value="서울 마포구 독막로3길 13 101">
		               				<input type="hidden" name="com_sa_post_s" id="com_sa_post_s" value="06732">
		                			<p class="section_label">사업장 소재지</p>
		                			<p class="section_item">06732) 서울 마포구 독막로3길 13 101</p>
		               			</div>
		               			<div class="section_box_03 comphone">
		               				<input type="hidden" name="com_sa_phone_s" id="com_sa_phone_s" value="02-2220-0876">
		                			<p class="section_label">사업장 전화번호</p>
		                			<p class="section_item">02-2220-0876</p>
		               			</div>
		               		</div>
		               		<div class="info_section">
		               			<div class="section_box_03 comadd">
		               				<input type="hidden" name="com_pm_name_s" id="com_pm_name_s" value="홍길동">
		                			<p class="section_label">담당자</p>
		                			<p class="section_item">홍길동</p>
		               			</div>
		               			<div class="section_box_03 comadd">
		               				<input type="hidden" name="com_pm_dept_s" id="com_pm_dept_s" value="경영지원팀">
		                			<p class="section_label">담당자부서</p>
		                			<p class="section_item">경영지원팀</p>
		               			</div>
		               			<div class="section_box_03 default">
		               				<input type="hidden" name="com_pm_position_s" id="com_pm_position_s" value="부장">
		                			<p class="section_label">담당자직책</p>
		                			<p class="section_item">부장</p>
		               			</div>
		               		</div>
		               		<div class="info_section">
		               			<div class="section_box_03 comadd">
		               				<input type="hidden" name="com_pm_phone_s" id="com_pm_phone_s" value="02-0000-0000">
		                			<p class="section_label">담당자 전화번호</p>
		                			<p class="section_item">02-0000-0000</p>
		               			</div>
		               			<div class="section_box_03 comadd">
		               				<input type="hidden" name="com_pm_mobile_s" id="com_pm_mobile_s" value="010-0000-0000">
		                			<p class="section_label">담당자 휴대폰</p>
		                			<p class="section_item">010-0000-0000</p>
		               			</div>
		               			<div class="section_box_03 default">
		                			<input type="hidden" name="com_pm_email_s" id="com_pm_email_s" value="abcdef@abcd.com">
		                			<p class="section_label">담당자이메일</p>
		                			<p class="section_item">abcdef@abcd.com</p>
		               			</div>
		               		</div>
		               	</div>
	               	</div>
					
					<div class="receipt_company_new">
	               		<div class="info_section">
	               			<div class="section_box_02 default">
	                			<p class="section_label">기업명</p>
	                			<input type="text" name="com_name_n" id="com_name_n" class="new_com_input" autocomplete="off">
	               			</div>
	               		</div>
	               		<div class="info_section">
	               			<div class="section_box_02 half_l">
	                			<p class="section_label">대표명</p>
	                			<input type="text" name="com_ceo_n" id="com_ceo_n" class="new_com_input" autocomplete="off">
	               			</div>
	               			<div class="section_box_02 half_r">
	                			<p class="section_label">사업자등록번호</p>
	                			<input type="text" name="com_reg_num_n" id="com_reg_num_n" class="new_com_input" autocomplete="off" maxlength="10">
	               			</div>
	               		</div>
	               		<div class="info_section">
	               			<div class="section_box_02 default">
	                			<p class="section_label">본사 소재지</p>
	                			<div>
	                				<input type="text" name="com_bon_post_n" id="com_bon_post_n" class="new_com_input02" autocomplete="off" disabled="disabled">
	                				<a href="#none" class="btn_add_sch" onclick="post.getPostAddr(this, 'com_bon_post_n', 'com_bon_add_n', 'com_bon_add2_n');return false;">주소검색</a>
	                			</div>
	                			<input type="text" name="com_bon_add_n" id="com_bon_add_n" class="new_com_input" autocomplete="off" placeholder="주소를 검색해주세요." disabled="disabled">
	                			<input type="text" name="com_bon_add2_n" id="com_bon_add2_n" class="new_com_input" autocomplete="off" placeholder="상세 주소를 입력해주세요.">
	               			</div>
	               		</div>
	               		<div class="info_section">
	               			<div class="section_box_02 default">
	                			<p class="section_label">사업장 소재지</p>
	                			<div>
	                				<input type="text" name="com_sa_post_n" id="com_sa_post_n" class="new_com_input02" autocomplete="off" disabled="disabled">
	                				<a href="#none" class="btn_add_sch" onclick="post.getPostAddr(this, 'com_sa_post_n', 'com_sa_add_n', 'com_sa_add2_n');return false;">주소검색</a>
	                			</div>
	                			<input type="text" name="com_sa_add_n" id="com_sa_add_n" class="new_com_input" autocomplete="off" placeholder="주소를 검색해주세요." disabled="disabled">
	                			<input type="text" name="com_sa_add2_n" id="com_sa_add2_n" class="new_com_input" autocomplete="off" placeholder="상세 주소를 입력해주세요.">
	               			</div>
	               		</div>
	               		<div class="info_section">
	               			<div class="section_box_02 half_l">
	                			<p class="section_label">본사 전화번호</p>
	                			<input type="text" name="com_bon_phone_n" id="com_bon_phone_n1" class="new_com_input" autocomplete="off">
	                			<input type="text" name="com_bon_phone_n" id="com_bon_phone_n2" class="new_com_input" autocomplete="off" maxlength="4">
	                			<input type="text" name="com_bon_phone_n" id="com_bon_phone_n3" class="new_com_input" autocomplete="off" maxlength="4">
	               			</div>
	               			<div class="section_box_02 half_r">
	                			<p class="section_label">사업장 전화번호</p>
	                			<input type="text" name="com_sa_phone_n" id="com_sa_phone_n1" class="new_com_input" autocomplete="off">
	                			<input type="text" name="com_sa_phone_n" id="com_sa_phone_n2" class="new_com_input" autocomplete="off" maxlength="4">
	                			<input type="text" name="com_sa_phone_n" id="com_sa_phone_n3" class="new_com_input" autocomplete="off" maxlength="4">
	               			</div>
	               		</div>
	               		<div class="info_section">
	               			<div class="section_box_02 comadd">
	                			<p class="section_label">담당자</p>
	                			<input type="text" name="com_pm_name_n" id="com_pm_name_n" class="new_com_input" autocomplete="off">
	               			</div>
	               			<div class="section_box_02 comadd">
	                			<p class="section_label">담당자부서</p>
	                			<input type="text" name="com_pm_dept_n" id="com_pm_dept_n" class="new_com_input" autocomplete="off">
	               			</div>
	               			<div class="section_box_02 default">
	                			<p class="section_label">담당자직책</p>
	                			<input type="text" name="com_pm_position_n" id="com_pm_position_n" class="new_com_input" autocomplete="off">
	               			</div>
	               		</div>
	               		<div class="info_section">
	               			<div class="section_box_02 comadd">
	                			<p class="section_label">담당자 전화번호</p>
	                			<input type="text" name="com_pm_phone_n" id="com_pm_phone_n1" class="new_com_input" autocomplete="off">
	                			<input type="text" name="com_pm_phone_n" id="com_pm_phone_n2" class="new_com_input" autocomplete="off" maxlength="4">
	                			<input type="text" name="com_pm_phone_n" id="com_pm_phone_n3" class="new_com_input" autocomplete="off" maxlength="4">
	               			</div>
	               			<div class="section_box_02 comadd">
	                			<p class="section_label">담당자 휴대폰</p>
	                			<input type="text" name="com_pm_mobile_n" id="com_pm_mobile_n1" class="new_com_input" autocomplete="off">
	                			<input type="text" name="com_pm_mobile_n" id="com_pm_mobile_n2" class="new_com_input" autocomplete="off" maxlength="4">
	                			<input type="text" name="com_pm_mobile_n" id="com_pm_mobile_n3" class="new_com_input" autocomplete="off" maxlength="4">
	               			</div>
	               			<div class="section_box_02 default">
	                			<p class="section_label">담당자이메일</p>
	                			<input type="text" name="com_pm_email_n" id="com_pm_email_n" class="new_com_input" autocomplete="off" maxlength="100">
	               			</div>
	               		</div>
	               		
	               	</div>
				</div>
				<div style="height:15px;display:block;"></div>
	        </div>
		</div>
		
		<div class="layer_popup_body content_02">
			<div class="LayerBodySection">
				<div class="Section_tit">
					<input type="hidden" name="in_com" id="in_com" class="in_com" value="Y">
					<h2 class="layer_sub_tit">접수 분야 설정</h2>
	            </div>
				<div class="Section_bar"></div>
				<div class="receipt_type_select">
	                 <h2 class="layer_sub_tit"></h2>
	                 <div class="lavel_bar"></div>
	                 <input type="hidden" name="receipt_type" id="receipt_type" class="receipt_type_val" value="">
	                 <ul class="receipt_type_list t1">
	                     <li>
	                         <a href="#none" class="receipt_type_item" value="01">여부 판정</a>
	                     </li>
	                 </ul>
	                 <ul class="receipt_type_list t1">
	                     <li>
	                         <a href="#none" class="receipt_type_item" value="03">수출신고</a>
	                     </li>
	                     <li>
	                         <a href="#none" class="receipt_type_item" value="04">수출승인</a>
	                     </li>
	                     <li>
	                         <a href="#none" class="receipt_type_item" value="02">사전검토</a>
	                     </li>
	                 </ul>
	                 <ul class="receipt_type_list t1">
	                 	 <li>
	                         <a href="#none" class="receipt_type_item" value="06">해외인수·합병 신고</a>
	                     </li>
	                     <li>
	                         <a href="#none" class="receipt_type_item" value="07">해외인수·합병 승인</a>
	                     </li>
	                     <li>
	                         <a href="#none" class="receipt_type_item" value="05">해외인수·합병 사전검토</a>
	                     </li>
	                </ul>
	                 <ul class="receipt_type_list t1">
	                     <li>
	                         <a href="#none" class="receipt_type_item" value="08">국가핵심기술 지정</a>
	                     </li>
	                     <li>
	                         <a href="#none" class="receipt_type_item" value="09">국가핵심기술 변경</a>
	                     </li>
	                     <li>
	                         <a href="#none" class="receipt_type_item" value="10">국가핵심기술 해제</a>
	                     </li>
	                     <li>
	                         <a href="#none" class="receipt_type_item" value="11">기타</a>
	                     </li>
	                     
	                 </ul>
	             </div>
	        </div>
	        <div class="RctpFormInfo">
           		접수 분야를 선택 후 신청서를 작성해주세요. 
           	</div>
	        <div class='WriteFormSection'>
             	<div class="WriteForm">
             		<div class="WriteTit">
	             		<h2 class="rctp_t rctp_01">국가핵심기술 여부 판정 신청서 </h2>
		                <h2 class="rctp_t rctp_02">국가핵심기술 사전검토 신청서</h2>
		                <h2 class="rctp_t rctp_03">국가핵심기술 수출신고 신청서</h2>
		                <h2 class="rctp_t rctp_04">국가핵심기술 수출승인 신청서</h2>
		                <h2 class="rctp_t rctp_05">국가핵심기술 해외인수·합병 사전검토 신청서</h2>
		                <h2 class="rctp_t rctp_06">국가핵심기술 해외인수·합병 신고 신청서</h2>
		                <h2 class="rctp_t rctp_07">국가핵심기술 해외인수·합병 승인 신청서</h2>
		                <h2 class="rctp_t rctp_08">국가핵심기술 지정 신청서</h2>
		                <h2 class="rctp_t rctp_09">국가핵심기술 변경 신청서</h2>
		                <h2 class="rctp_t rctp_10">국가핵심기술 해제 신청서</h2>
		                <h2 class="rctp_t rctp_11">기타 신청서</h2>
             		</div>
             		<div class="lavel_bar"></div>
             		<div class="WriteFormItem">
             			<div class="write_section insert_item insert_item_00">
		                	<div class="write_section_tit">
		            			<p class="section_label">안건명</p> 
		            		</div>
		            		<div class="ept_box">
		            			<input type="text" name="AgdTitle" id="AgdTitle" maxlength="10" class="new_com_input" placeholder="안건명을 입력해주세요." autocomplete="off">
		            		</div>
		            	</div>
             			<div class="write_section">
		                	<div class="write_section_tit">
		            			<p class="section_label">기술 명칭</p> 
		            			<p class="label_help">「국가핵심기술 지정 등에 관한 고시」 (산업통상자원부 고시 제2019-111호, 2019.07.08)</p>
		            			<a href='#none' class='techPlus'>+</a>
		            		</div>
		            		
			            	<div class='TechAdd'>
			            		<div class='TechInNameBox default' data-tech-ntc-gid data-tech-id data-tech-item-id>
			            			<div class='TechInName'>
			            				<div class='TechInSelect'> 
			            					<input type="hidden" name="techCtrgCd" id="techCtrgCd0" class='tech_type01' value="">
			            					<a href='#none' class='TechType'>기술 분야를 선택해주세요.</a>
			            					<div class='TechSelectHid'>
                        					<c:forEach var='tech' items="${techList}" varStatus='status'>
                       						<c:if test="${status.index eq 0 }">
			            						<ul class="TechSelecList">
                       						</c:if>
											<c:if test="${status.index ne 0 and status.index % 6 eq 0 }">
		            							</ul>
			            						<ul class="TechSelecList">
                       						</c:if>
                       							<li><a href='#none' value="${tech.techId }" class='TechItem'>${tech.techName }</a></li>
											<c:if test="${status.index + 1 eq fn:length(techList) }">
		            							</ul>
                       						</c:if>
                       						
                         					</c:forEach>
<!-- 												<ul class="TechSelecList"> -->
<!-- 			            							<li><a href='#none' value="KTS00701" class='TechItem'>반도체</a></li> -->
<!-- 													<li><a href='#none' value="KTS00702" class='TechItem'>디스플레이</a></li> -->
<!-- 													<li><a href='#none' value="KTS00703" class='TechItem'>전기전자</a></li> -->
<!-- 													<li><a href='#none' value="KTS00704" class='TechItem'>자동차ㆍ철도</a></li> -->
<!-- 													<li><a href='#none' value="KTS00705" class='TechItem'>철강</a></li> -->
<!-- 													<li><a href='#none' value="KTS00706" class='TechItem'>조선</a></li> -->
<!-- 		            							</ul> -->
<!-- 												<ul class="TechSelecList"> -->
<!-- 													<li><a href='#none' value="KTS00707" class='TechItem'>원자력</a></li> -->
<!-- 													<li><a href='#none' value="KTS00708" class='TechItem'>정보통신</a></li> -->
<!-- 													<li><a href='#none' value="KTS00709" class='TechItem'>우주</a></li> -->
<!-- 													<li><a href='#none' value="KTS00710" class='TechItem'>생명공학</a></li> -->
<!-- 													<li><a href='#none' value="KTS00711" class='TechItem'>기계</a></li> -->
<!-- 													<li><a href='#none' value="KTS00712" class='TechItem'>로봇</a></li> -->
<!-- 			            						</ul> -->
			            					</div>
			            				</div>
			            				<div class='TechInSelect'>
			            					<input type="hidden" name="techUniqId" id="techUniqId0" class='tech_area01' value="">
			            					<a href='#none' class='TechType TechArea'>기술 분야 해당 범위를 선택해주세요.</a>
			            					<div class='TechSelectHid'>
			            						<ul class="TechAreaList">
			            							<li><a href='#none' value="TECHID_0100000001" class='TechAreaItem'>30나노 이하급 D램에 해당되는 설계·공정·소자기술 및 3차원 적층형성 기술</a></li>
													<li><a href='#none' value="TECHID_0100000002" class='TechAreaItem'>D램에 해당되는 적층조립기술 및 검사기술</a></li>
													<li><a href='#none' value="TECHID_0100000003" class='TechAreaItem'>30나노 이하급 또는 적층 3D 낸드플래시에 해당되는 설계·공정·소자 기술</a></li>
													<li><a href='#none' value="TECHID_0100000004" class='TechAreaItem'>낸드플래시에 해당되는 적층조립기술 및 검사기술</a></li>
													<li><a href='#none' value="TECHID_0100000005" class='TechAreaItem'>30나노급 이하 파운드리에 해당되는 공정·소자기술 및 3차원 적층형성 기술</a></li>
													<li><a href='#none' value="TECHID_0100000006" class='TechAreaItem'>모바일 Application Processor SoC 설계·공정기술</a></li>
													<li><a href='#none' value="TECHID_0100000007" class='TechAreaItem'>LTE/LTE_adv/5G Baseband Modem 설계기술</a></li>
													<li><a href='#none' value="TECHID_0100000008" class='TechAreaItem'>대구경(300mm 이상) 반도체 웨이퍼 제조를 위한 단결정 성장 기술</a></li>
													<li><a href='#none' value="TECHID_0100000009" class='TechAreaItem'>픽셀 1㎛ 이하 이미지센서 설계·공정·소자 기술</a></li>
													<li><a href='#none' value="TECHID_0100000010" class='TechAreaItem'>시스템반도체용 첨단 패키지 (FO-WLP, FO-PLP, FO-PoP 등) 조립·검사 기술</a></li>
													<li><a href='#none' value="TECHID_0100000011" class='TechAreaItem'>HD급 이상의 디스플레이 패널 구동을 위한 DDI(Display Driver IC) 설계 및 제조기술</a></li>
													
												</ul>
											</div>
			            				</div>
			            				<input type="text" name="rcptTechNm" id="rcptTechNm0" class="new_com_input" placeholder="신청기술명" autocomplete="off">
			            			</div>	
			            			<div class='TechInNUM'>
			            				<p>-</p>
			            			</div>
			            		</div>
<!-- 			            		<div class='TechInNameBox'> -->
<!-- 			            			<div class='TechInName'> -->
<!-- 			            				<div class='TechInSelect'>  -->
<!-- 			            					<input type="hidden" name="techCtrgCd" id="techCtrgCd0" class='tech_type01' value=""> -->
<!-- 			            					<a href='#none' class='TechType'>기술 분야 해당 범위를 선택해주세요.</a> -->
<!-- 			            					<div class='TechSelectHid'> -->
<!-- 			            						<ul class="TechSelecList"> -->
<!-- 			            							<li><a href='#none' value="KTS00701" class='TechItem'>반도체</a></li> -->
<!-- 													<li><a href='#none' value="KTS00702" class='TechItem'>디스플레이</a></li> -->
<!-- 													<li><a href='#none' value="KTS00703" class='TechItem'>전기전자</a></li> -->
<!-- 													<li><a href='#none' value="KTS00704" class='TechItem'>자동차ㆍ철도</a></li> -->
<!-- 													<li><a href='#none' value="KTS00705" class='TechItem'>철강</a></li> -->
<!-- 													<li><a href='#none' value="KTS00706" class='TechItem'>조선</a></li> -->
<!-- 												</ul> -->
<!-- 												<ul class="TechSelecList"> -->
<!-- 													<li><a href='#none' value="KTS00707" class='TechItem'>원자력</a></li> -->
<!-- 													<li><a href='#none' value="KTS00708" class='TechItem'>정보통신</a></li> -->
<!-- 													<li><a href='#none' value="KTS00709" class='TechItem'>우주</a></li> -->
<!-- 													<li><a href='#none' value="KTS00710" class='TechItem'>생명공학</a></li> -->
<!-- 													<li><a href='#none' value="KTS00711" class='TechItem'>기계</a></li> -->
<!-- 													<li><a href='#none' value="KTS00712" class='TechItem'>로봇</a></li> -->
<!-- 			            						</ul> -->
<!-- 			            					</div> -->
<!-- 			            				</div> -->
<!-- 			            				<div class='TechInSelect'> -->
<!-- 			            					<input type="hidden" name="techUniqId" id="techUniqId1" class='tech_area01' value=""> -->
<!-- 			            					<a href='#none' class='TechType'>기술 분야를 선택해주세요.</a> -->
<!-- 			            					<div class='TechSelectHid'> -->
<!-- 			            						<ul class="TechAreaList"> -->
<!-- 			            							<li><a href='#none' value="TECHID_0100000001" class='TechAreaItem'>30나노 이하급 D램에 해당되는 설계·공정·소자기술 및 3차원 적층형성 기술</a></li> -->
<!-- 													<li><a href='#none' value="TECHID_0100000002" class='TechAreaItem'>D램에 해당되는 적층조립기술 및 검사기술</a></li> -->
<!-- 													<li><a href='#none' value="TECHID_0100000003" class='TechAreaItem'>30나노 이하급 또는 적층 3D 낸드플래시에 해당되는 설계·공정·소자 기술</a></li> -->
<!-- 													<li><a href='#none' value="TECHID_0100000004" class='TechAreaItem'>낸드플래시에 해당되는 적층조립기술 및 검사기술</a></li> -->
<!-- 													<li><a href='#none' value="TECHID_0100000005" class='TechAreaItem'>30나노급 이하 파운드리에 해당되는 공정·소자기술 및 3차원 적층형성 기술</a></li> -->
<!-- 													<li><a href='#none' value="TECHID_0100000006" class='TechAreaItem'>모바일 Application Processor SoC 설계·공정기술</a></li> -->
<!-- 													<li><a href='#none' value="TECHID_0100000007" class='TechAreaItem'>LTE/LTE_adv/5G Baseband Modem 설계기술</a></li> -->
<!-- 													<li><a href='#none' value="TECHID_0100000008" class='TechAreaItem'>대구경(300mm 이상) 반도체 웨이퍼 제조를 위한 단결정 성장 기술</a></li> -->
<!-- 													<li><a href='#none' value="TECHID_0100000009" class='TechAreaItem'>픽셀 1㎛ 이하 이미지센서 설계·공정·소자 기술</a></li> -->
<!-- 													<li><a href='#none' value="TECHID_0100000010" class='TechAreaItem'>시스템반도체용 첨단 패키지 (FO-WLP, FO-PLP, FO-PoP 등) 조립·검사 기술</a></li> -->
<!-- 													<li><a href='#none' value="TECHID_0100000011" class='TechAreaItem'>HD급 이상의 디스플레이 패널 구동을 위한 DDI(Display Driver IC) 설계 및 제조기술</a></li> -->
													
<!-- 												</ul> -->
<!-- 											</div> -->
<!-- 			            				</div> -->
<!-- 			            				<input type="text" name="rcptTechNm" id="rcptTechNm1" class="new_com_input" placeholder="신청기술명" autocomplete="off"> -->
<!-- 			            			</div> -->
<!-- 			            			<div class='TechInNUM'> -->
<!-- 			            				<a href='#none' class='techdelete'>X</a> -->
<!-- 			            			</div>	 -->
<!-- 			            		</div> -->
			            	</div>
		           			
		                </div>
		                <div class="write_section insert_item insert_item_00_01">
		                	<div class="write_section_tit">
		            			<p class="section_label">기술 형태</p> 
		            		</div>
		            		<textarea class="rcptTechForm" name="techForm" rows="4" title="기술형태"></textarea>
		            	</div>
		            	<div class="write_section insert_item insert_item_01">
		                	<div class="write_section_tit">
		            			<p class="section_label">기술 특성</p> 
		            		</div>
		            		<textarea class="rcptTechQua" name="techCrt" rows="4" title="기술특성"></textarea>
		            	</div>
		            	<div class="write_section insert_item insert_item_02" >
		                	<div class="write_section_tit">
		            			<p class="section_label">신청 사유</p> 
		            		</div>
		            		<textarea class="rcptReason1" name="rptRsn" rows="4" title="신청 사유"></textarea>
		            	</div>
		            	<div class="write_section insert_item insert_item_03">
		                	<div class="write_section_tit">
		            			<p class="section_label">신고 사유</p> 
		            		</div>
		            		<textarea class="rcptReason2" name="rptRsn1" rows="4" title="신고 사유"></textarea>
		            		
		            		<ul class='LawSelList'>
		            			<li>
		            				<a href="#hone" class='LawSelItem'>
		            					<input type="hidden" id="law01" name="law01" class="lawItem" value="N">
		            					<span class='check'></span>
		            					「산업기술의 유출방지 및 보호에 관한 법률」 제11조의2제2항, 같은 법 시행령 제18조의4제1항
		            				</a>
		            			</li>
		            			<li>
		            				<a href="#hone" class='LawSelItem'>
		            					<input type="hidden" id="law02" name="law02" class="lawItem" value="N">
		            					<span class='check'></span>
		            					「산업기술의 유출방지 및 보호에 관한 법률」 제11조의2제5항, 같은 법 시행령 제18조의5제1항
		            				</a>
		            			</li>
		            			<li>
		            				<a href="#hone" class='LawSelItem'>
		            					<input type="hidden" id="law03" name="law03" class="lawItem" value="N">
		            					<span class='check'></span>
		            					「산업기술의 유출방지 및 보호에 관한 법률」 제11조의2제6항, 같은 법 시행령 제18조의5제2항
		            				</a>
		            			</li>
		            		</ul>
		            	</div>
		            	<div class="write_section insert_item insert_item_04">
		                	<div class="write_section_tit">
		            			<p class="section_label">승인 신청 사유</p> 
		            		</div>
		            		<textarea class="rcptReason3" name="rptRsn3" rows="4" title="승인 신청 사유"></textarea>
		            	</div>
		            	<div class="write_section insert_item_05">
		                	<div class="write_section_tit">
		            			<p class="section_label">수출 사유</p> 
		            		</div>
		            		<ul class='rsnlList'>
		            			<li>
		            				<a href="#hone" class='rsnItem'>
		            					<span class='rsn_label'>매각</span>
		            					<input type="hidden" id="eptRsn01" name="eptRsn01" class="rsnItemchk" value="N">
		            					<input type="text" name="rsn01" id="rsn01" class="new_com_input" placeholder="매각 사유" autocomplete="off" style="margin:0;width:calc(100% - 36px)">
		            				</a>
		            			</li>
		            			<li>
		            				<a href="#hone" class='rsnItem'>
		            					<span class='rsn_label'>이전</span>
		            					<input type="hidden" id="eptRsn01" name="eptRsn01" class="rsnItemchk" value="N">
		            					<input type="text" name="rsn02" id="rsn02" class="new_com_input" placeholder="이전 사유" autocomplete="off" style="margin:0;width:calc(100% - 36px)">
		            				</a>
		            			</li>
		            			<li>
		            				<a href="#hone" class='rsnItem'>
		            					<span class='rsn_label'>기타</span>
		            					<input type="hidden" id="eptRsn01" name="eptRsn01" class="rsnItemchk" value="N">
		            					<input type="text" name="rsn03" id="rsn03" class="new_com_input" placeholder="기타 사유" autocomplete="off" style="margin:0;width:calc(100% - 36px)">
		            				</a>
		            			</li>
		            		</ul>
		            	</div>
		            	
		            	
		            	<div class="write_section insert_item insert_item_06">
		                	<div class="write_section_tit">
		            			<p class="section_label">수출 예정일</p> 
		            		</div>
		            		<div class="ept_box">
		            			<input type="text" name="eptDt1" id="standate" class="new_com_input" placeholder="예정일 선택" autocomplete="off" style="width:150px" data-date-format="yyyy-mm-dd" autocomplete="off">
		            			<input type="text" name="eptDt2" id="eptDt2" name="eptDt2" maxlength="10" class="new_com_input" placeholder="날짜 미입력시 입력" autocomplete="off" >
		            		</div>
		            	</div>
		            	<div class="write_section insert_item insert_item_07">
		                	<div class="write_section_tit">
		            			<p class="section_label">수출 대상국/매입자</p> 
		            		</div>
		            		<div class="excountry_box">
		            			<div class="excountry_sch_box">
		            				<input type="text" name="sch_country" id="sch_country" class="new_com_input" placeholder="대상국 검색" autocomplete="off" >
		            				<div class="excountry_sch_list">
		            					<ul class="sch_list">
<!-- 		            						<li><a href="#none" class="sch_list_item">미국</a></li> -->
<!-- 		            						<li><a href="#none" class="sch_list_item">미국</a></li> -->
<!-- 		            						<li><a href="#none" class="sch_list_item">미국</a></li> -->
<!-- 		            						<li><a href="#none" class="sch_list_item">미국</a></li> -->
		            					</ul>
		            				</div>
		            			</div>
		            			<div class="excountry_sel_box">
		            				<div class="excountry_sch_info">
		            					대상국을 검색하여 선택해주세요.
		            				</div>
		            				<input type="hidden" name="excountry_cnt" id="excountry_cnt" class="new_com_input" value="0">
			            			<ul class="excountry_sel_list">
			            				
			            			</ul>
			            		</div>
		            		</div>
		            		
		            	</div>
		            	<div class="write_section insert_item insert_item_08">
		                	<div class="write_section_tit">
		            			<p class="section_label">관련 안건 번호</p> 
		            		</div>
		            		<div class="link_agd_box">
		            			<div class="link_agd_sch_box">
		            				<input type="text" name="sch_link_agd" id="sch_link_agd" class="new_com_input" placeholder="안건 검색" autocomplete="off" >
		            				<div class="link_agd_box_sch_list">
		            					<ul class="sch_agd_list">
<!-- 		            						<li><a href="#none" class="link_agd_item">2022-01-0001</a></li> -->
<!-- 		            						<li><a href="#none" class="link_agd_item">2022-01-0002</a></li> -->
<!-- 		            						<li><a href="#none" class="link_agd_item">2022-01-0003</a></li> -->
<!-- 		            						<li><a href="#none" class="link_agd_item">2022-01-0004</a></li> -->
		            					</ul>
		            				</div>
		            			</div>
		            			<div class="link_agd_sel_box">
		            				<div class="link_agd_sch_info">
		            					관련 안건번호를검색해주세요.
		            				</div>
		            				<input type="hidden" name="link_agd_cnt" id="link_agd_cnt" class="new_com_input" value="0">
			            			<ul class="link_agd_sel_list">
			            				
			            			</ul>
			            		</div>
		            		</div>
		            		
		            	</div>
		            	<div class="write_section insert_item insert_item_sin">
		                	<div class="write_section_tit ">
		            			<p class="section_label">신청서 첨부</p> 
		            		</div>
		            		<div class="file_input">
							     <input type="text" readonly="readonly" title="File Route" id="file_route_app" class="new_com_input" value="신청서 원본을 첨부해주세요.">
							     <label>
							          파일선택
							         <input id="file_app" type="file">
							     </label>
							</div>
							
		            	</div>
		            	<div class="write_section insert_item insert_item_gong">
		                	<div class="write_section_tit ">
		            			<p class="section_label">공문 첨부</p> 
		            		</div>
		            		<div class="file_input">
							     <input type="text" readonly="readonly" title="File Route" id="file_route_off" class="new_com_input" value="공문을 첨부해주세요.">
							     <label>
							          파일선택
							         <input id="file_off" type="file">
							     </label>
							</div>
							
		            	</div>
		            	<div class="write_section insert_item insert_item_thecinfo">
		                	<div class="write_section_tit ">
		            			<p class="section_label">국가핵심기술 설명자료</p> 
		            		</div>
		            		<div class="file_input">
							     <input type="text" readonly="readonly" title="File Route" id="file_route_exp" class="new_com_input" value="국가핵심기술 설명자료를 첨부해주세요.">
							     <label>
							          파일선택
							         <input id="file_exp" type="file">
							     </label>
							</div>
							
		            	</div>
		            	<div class="write_section insert_item insert_item_thecinfo2">
		                	<div class="write_section_tit ">
		            			<p class="section_label">변경 국가핵심기술 설명자료</p> 
		            		</div>
		            		<div class="file_input">
							     <input type="text" readonly="readonly" title="File Route" id="file_route_exp_c" class="new_com_input" value="국가핵심기술 설명자료를 첨부해주세요.">
							     <label>
							          파일선택
							         <input id="file_exp_c" type="file">
							     </label>
							</div>
							
		            	</div>
		            	<div class="write_section insert_item insert_item_multi">
		                	<div class="write_section_tit">
		            			<p class="section_label">첨부 서류</p> 
		            		</div>
		            		<ul class="file_info" style="border-bottom:1px dashed #d3d3d3;">
								<li>1. 국가핵심기술의 매각 또는 이전 계약서(임시계약서를 포함한다)</li> 
								<li>2. 국가핵심기술의 매입자 또는 이전받으려는 자에 관한 사항</li> 
								<li>3. 국가핵심기술의 용도와 성능을 표시하는 기술자료</li> 
								<li>4. 국가핵심기술의 제공 조건과 방법</li> 
								<li>5. 국가핵심기술을 사용한 관련 제품의 시장 규모와 경쟁력 수준</li> 
								<li>6. 국가로부터 지원받은 연구개발비에 관한 자료</li> 
							</ul>
		            		<div class="ept_box" >
		            			<div class="new_file_box">
		                            <div class="new_file_box_brn_warp">
		                                <a href="javascript:attachFile();" class="file_box_brn add_file">파일첨부</a>
		                                <a href="javascript:deleteAllFile();" class="file_box_brn select_all">전체삭제</a>
		                            </div>
		                            <div class="new_file_box_list">
		                                <!-- 첨부파일 선택 전 -->
		                                <p class="file-list_info">
		                                     	파일을 첨부해주세요.
		                                </p>
		                                <!-- 첨부파일 선택 전 -->
		                                <!-- 파일 첨부 이후  -->
		                                <ul class="file_list">
<!-- 											<li> -->
<!-- 												<p style="float:left;">첨부 파일명.pdf</p> -->
<!-- 												<a href="#none" class="delete_row_file">삭제</a> -->
<!-- 											</li> -->
<!-- 											<li> -->
<!-- 												<p style="float:left;">첨부 파일명.pdf</p> -->
<!-- 												<a href="#none" class="delete_row_file">삭제</a> -->
<!-- 											</li> -->
<!-- 											<li> -->
<!-- 												<p style="float:left;">첨부 파일명.pdf</p> -->
<!-- 												<a href="#none" class="delete_row_file">삭제</a> -->
<!-- 											</li> -->
<!-- 											<li> -->
<!-- 												<p style="float:left;">첨부 파일명.pdf</p> -->
<!-- 												<a href="#none" class="delete_row_file">삭제</a> -->
<!-- 											</li> -->
										</ul>
		                            </div>
		                        </div> 
		            		</div>
		            	</div>
             		</div>
             		
             		
             		
            		
            	</div>
            	
                
            </div>
		</div>
		
        <div class="layer_popup_btn">
            <!-- <a href="#none" class="btn btn_next btn_print">신청서 인쇄</a> -->
            <a href="#none" class="btn btn_next_1002">다음</a>
            <a href="#none" class="btn btn_pre_1002">이전</a>
            <a href="#none" class="btn btn_save_1002">저장</a>
        </div>
	</div>
    
