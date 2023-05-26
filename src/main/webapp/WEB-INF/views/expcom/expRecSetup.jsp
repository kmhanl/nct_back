<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 현재 년도 날짜 -->
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="nowDate"><fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" /></c:set>

<script type="text/javascript" src="/resources/js/expert/datepickPopup.js"></script>
<script type="text/javascript" src="/resources/js/expert/datepickList.js"></script>	
	
<div class="nct_content_wrap">
	<!-- 뷰어타입 바디 시작  -->
	<div class="nct_browser_wrapper">
		<!-- 뷰어타입 : 브라우저  -->
		<div class="nct_browser">
			<div class="sub_browser side_001">
				<div id="leftBlock" class="browser_block mode_s">
					<div class="block_title_box type02">
						<h1 class="block_title">대상 기업 설정</h1>
					</div>
					<div class="section_utile_box type02">
						<input type="hidden" name="comType" id="comType" value="C101">
						<ul class="com_type_list t1">
							<li class="chkOn">
								<a href="javascript:void(0);" class="com_type_item" data-ctype="C101" data-cmode="mode_s">검색 등록</a>
							</li>
							<li>
								<a href="javascript:void(0);" class="com_type_item" data-ctype="C102" data-cmode="mode_n">신규 등록</a>
							</li>
							<li>
								<a href="javascript:void(0);" class="com_type_item" data-ctype="C103" data-cmode="mode_d">미설정</a>
							</li>
						</ul>
					</div>
					
					<div class="content_section company_search nct_scroll">
						<div class="company_search_box">
							<div class="company_search_inner Schbox"><!-- keyup -->
								<input type="text" id="schCompay" class="company_search_input" value="" placeholder="대상 기업명을 입력하세요." autocomplete="off">
								<input type="hidden" name="comType" id="comInchk" value="N">
								<div class="search_hidden_wrap no_sch"><!-- no_sch no_result add_result -->
									<p class="no_sch_result">검색결과가 없습니다.</p>
									<div class="sch_result_list nct_scroll">
										<ul id="schResultList"></ul>
									</div>
								</div>
							</div>
							<p class="search_info">※기업포털에 가입된 기업회원의 DB를 검색 혹은 신규등록으로 대상기업으로 설정할 수 있습니다.</p>
						</div>
						<div id="schSelectInfo" class="content_alert_box type01 "> 
							<p class="box_tit"><span class="bold_b">대상 기업</span>을 검색해주세요.</p>
						</div>
						<div id="schSelected" class="nct_bro_item type_01 sch_elected">
							<div class="item_label">
								<p>기관명</p>
							</div>
							<div class="item_box"> 
								<p class="ta com_nm"></p>
								<p class="ta com_info" ><span class="sub_label">대표명 : </span><span class="sub_label">사업자등록번호 : </span>
								</p>
							</div>
							<div class="item_tap"></div>
							<div class="item_label">
								<p>본사 소재지</p>
							</div>
							<div class="item_box"> 
								<p class="ta com_b_add"></p>
								<p class="ta com_b_phone"><span class="sub_label">전화번호 : </span>
								</p>
							</div>
							<div class="item_tap"></div>
							<div class="item_label">
								<p>사업장 소재지</p>
							</div>
							<div class="item_box"> 
								<p class="ta com_s_add"></p>
								<p class="ta com_s_phone"><span class="sub_label">전화번호 : </span>
								</p>
							</div>
							<div class="item_tap"></div>
							<div class="item_label">
								<p>담당자</p>
							</div>
							<div class="item_box"> 
								<p class="ta com_pm"> <span class="sub_label"></span></p>
								<p class="ta compm_phone"><span class="sub_label">연락처 : </span> <span class="sub_label"> | </span>  <span class="sub_label"> | </span> 
								</p>
							</div>
						</div>
					</div>
					<div class="content_section company_new nct_scroll">
						
						<div class="nct_bro_item type_03">
							<div class="item_label">
								<p>기관명</p>
							</div>
							<div class="item_box"> 
								<input type="text" id="newCompayNm" class="base_input" value="" value="" autocomplete="off" />
							</div>
							<div class="item_tap type01"></div>
							<div class="nct_bro_inner">
								<div class="data_name">
									<div class="item_label">
										<p>대표명</p>
									</div>
									<div class="item_box"> 
										<input type="text" id="newCompayCeo" class="base_input" value="" value="" autocomplete="off" />
									</div>
								</div>
								<div class="item_row_tap"></div>
								<div>
									<div class="item_label">
										<p>사업자등록번호</p>
									</div>
									<div class="item_box data_no"> 
										<input type="text" id="newCompayNo1" class="base_input no_only" value="" value="" maxlength="3" autocomplete="off" />
										<span class="dash"> - </span>
										<input type="text" id="newCompayNo2" class="base_input no_only" value="" value="" maxlength="2" autocomplete="off" />
										<span class="dash"> - </span>
										<input type="text" id="newCompayNo3" class="base_input no_only" value="" value="" maxlength="5" autocomplete="off" />
									</div>
								</div>
							</div>
							<div class="item_tap type01"></div>
							<div class="item_label">
								<p>본사 소재지</p> 
							</div>
							<div class="item_box address"> 
								<div class="post_box">
									<input type="text" id="newComBoPost" class="base_input" value="" autocomplete="off" disabled="disabled"/>
									<a href="javascript:void(0);" class="sch_add" onclick="post.getPostAddr(this, 'newComBoPost', 'newComBoAdd1', 'newComBoAdd2');return false;">주소 검색</a>
								</div>
								<input type="text" id="newComBoAdd1" class="base_input" value="" autocomplete="off" disabled="disabled"/>
								<input type="text" id="newComBoAdd2" class="base_input" value="" placeholder="상세주소" autocomplete="off" />
							</div>
							<div class="item_tap type01"></div>
							<div class="nct_bro_inner">
								<div>
									<div class="item_label">
										<p>본사 전화번호</p>
									</div>
									<div class="item_box data_no"> 
										<input type="text" id="newBoPhone1" class="base_input no_01 no_only" value="" maxlength="3" autocomplete="off" />
										<span class="dash"> - </span>
										<input type="text" id="newBoPhone2" class="base_input no_only" value="" maxlength="4" autocomplete="off" />
										<span class="dash"> - </span>
										<input type="text" id="newBoPhone3" class="base_input no_only" value="" maxlength="4" autocomplete="off" />
									</div>
								</div>
								<div></div>
							</div>
							<div class="item_tap type01"></div>
							<div class="item_label">
								<p>사업장 소재지</p> 
							</div>
							<div class="item_box address"> 
								<div class="post_box">
									<input type="text" id="newComSaPost" class="base_input" value="" autocomplete="off" disabled="disabled" />
									<a href="javascript:void(0);" class="sch_add" onclick="post.getPostAddr(this, 'newComSaPost', 'newComSaAdd1', 'newComSaAdd2');return false;">주소 검색</a>
									<a href="javascript:void(0);" class="add_copy">본사와 동일</a>
								</div>
								<input type="text" id="newComSaAdd1" class="base_input" value="" autocomplete="off" disabled="disabled"/>
								<input type="text" id="newComSaAdd2" class="base_input" value="" placeholder="상세주소" autocomplete="off" />
							</div>
							<div class="item_tap type01"></div>
							<div class="nct_bro_inner">
								<div>
									<div class="item_label">
										<p>사업장 전화번호</p>
									</div>
									<div class="item_box data_no"> 
										<input type="text" id="newSaPhone1" class="base_input no_01 no_only" value="" maxlength="3" autocomplete="off" />
										<span class="dash"> - </span>
										<input type="text" id="newSaPhone2" class="base_input no_only" value="" maxlength="4" autocomplete="off" />
										<span class="dash"> - </span>
										<input type="text" id="newSaPhone3" class="base_input no_only" value="" maxlength="4" autocomplete="off" />
									</div>
								</div>
								<div></div>
							</div>
							<div class="item_tap type01"></div>
							<div class="nct_bro_inner">
								<div class="data_name">
									<div class="item_label">
										<p>담당자명</p>
									</div>
									<div class="item_box"> 
										<input type="text" id="newPmName" class="base_input" value="" autocomplete="off" />
									</div>
								</div>
								<div class="item_row_tap"></div>
								<div>
									<div class="item_label">
										<p>이메일</p>
									</div>
									<div class="item_box"> 
										<input type="text" id="newPmEmail" class="base_input" value="" autocomplete="off" />
									</div>
								</div>
							</div>
							<div class="item_tap type01"></div>
							<div class="nct_bro_inner">
								<div>
									<div class="item_label">
										<p>부서</p>
									</div>
									<div class="item_box"> 
										<input type="text" id="newPmDepth" class="base_input" value="" autocomplete="off" />
									</div>
								</div>
								<div class="item_row_tap"></div>
								<div>
									<div class="item_label">
										<p>직책</p>
									</div>
									<div class="item_box"> 
										<input type="text" id="newPmPosi" class="base_input" value="" autocomplete="off" />
									</div>
								</div>
							</div>
							<div class="item_tap type01"></div>
							<div class="nct_bro_inner">
								<div>
									<div class="item_label">
										<p>전화번호</p>
									</div>
									<div class="item_box data_no"> 
										<input type="text" id="newPmPhone1" class="base_input no_01 no_only" value="" maxlength="3" autocomplete="off" />
										<span class="dash"> - </span>
										<input type="text" id="newPmPhone2" class="base_input no_only" value="" maxlength="4" autocomplete="off" />
										<span class="dash"> - </span>
										<input type="text" id="newPmPhone3" class="base_input no_only" value="" maxlength="4" autocomplete="off" />
									</div>
								</div>
								<div class="item_row_tap"></div>
								<div>
									<div class="item_label">
										<p>휴대폰</p>
									</div>
									<div class="item_box data_no"> 
										<input type="text" id="newPmMobile1" class="base_input no_01 no_only" value="" maxlength="3" autocomplete="off" />
										<span class="dash"> - </span>
										<input type="text" id="newPmMobile2" class="base_input no_only" value="" maxlength="4" autocomplete="off" />
										<span class="dash"> - </span>
										<input type="text" id="newPmMobile3" class="base_input no_only" value="" maxlength="4" autocomplete="off" />
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="content_section company_search_no nct_scroll">
						<div class="content_alert_box type01"> 
							<p class="box_tit"><span class="bold_b">대상기업</span> 정보를 <span class="bold_r">미설정</span>으로 등록됩니다.</p>
						</div>
					</div>
				</div>
			</div>
			
			<div class="browser_col_tap tap01"></div>
			
			<div class="sub_browser side_001">
				<div class="rec_type_sel_box" style="display:;">
					<div class="rec_type_sel_inner">
						<p class="box_tit"><span class="bold_b">접수 분야</span>를 선택 해주세요.</p>
						<ul class="meta_type_list t1">
							<li class="on">
								<a href="javascript:void(0);" class="meta_type_item" data-mtype="T101">여부 판정</a>
							</li>
						</ul>
						<ul class="meta_type_list t1">
							<li>
								<a href="javascript:void(0);" class="meta_type_item" data-mtype="T201">수출신고</a>
							</li>
							<li>
								<a href="javascript:void(0);" class="meta_type_item" data-mtype="T202">수출승인</a>
							</li>
							<li>
								<a href="javascript:void(0);" class="meta_type_item" data-mtype="T203">사전검토</a>
							</li>
						</ul>
						<ul class="meta_type_list t1">
							<li>
								<a href="javascript:void(0);" class="meta_type_item" data-mtype="T301">해외인수·합병 신고</a>
							</li>
							<li>
								<a href="javascript:void(0);" class="meta_type_item" data-mtype="T302">해외인수·합병 승인</a>
							</li>
							<li>
								<a href="javascript:void(0);" class="meta_type_item" data-mtype="T303">해외인수·합병 사전검토</a>
							</li>
						</ul>
						<ul class="meta_type_list t1">
							<li>
								<a href="javascript:void(0);" class="meta_type_item" data-mtype="T401">국가핵심기술 지정</a>
							</li>
							<li>
								<a href="javascript:void(0);" class="meta_type_item" data-mtype="T402">국가핵심기술 변경</a>
							</li>
							<li>
								<a href="javascript:void(0);" class="meta_type_item" data-mtype="T403">국가핵심기술 해제</a>
							</li>
						</ul>
						<ul class="meta_type_list t1">
							<li>
								<a href="javascript:void(0);" class="meta_type_item" data-mtype="T001">기타</a>
							</li>
						</ul>	
					</div>
				</div>
				<div class="browser_block">
					<div class="block_title_box type02">
						<h1 class="block_title">신청서 설정</h1>
					</div>
					<div class="section_utile_box type03">
						<div class="meta_form_title">
							<p id="metaFormTitle">국가핵심기술 여부 판정 신청서</p>
						</div>
					</div>
					<div class="section_utile_box type05">
						<a href="javascript:recFormReset()" class="util_chk">접수 분야 변경</a>
					</div>
					<div id="metaForm" class="content_section metaFormSection nct_scroll">
						<input type="hidden" name="metaType" id="metaType" value="">
						<div class="nct_bro_item type_03 metaForm">
							<div class="item_label formItem agd_title">
								<p>안건 제목</p>
							</div>
							<div class="item_box formItem agd_title"> 
								<input type="text" id="agdTitle" class="base_input" value="" placeholder="안건 제목을 입력해주세요." autocomplete="off">
							</div>
							<div class="item_tap type01 formItem agd_title"></div>
							<div class="item_label meta_tech_tit">
								<p>기술분야 및 기술명칭</p>
								<a href="javascript:void(0);" class="add_meta_tech">기술명칭 등록</a>
							</div>
							<div class="item_box meta_tech_box add_tech_result"> 
								<input type="hidden" name="metaType" id="metaTechCnt" value="5">
								<div class="meta_tech_nolist">기술 명칭을 등록해주세요.</div> 
								<ul class="meta_tech_list">
									<li class="meta_tech" data-tech-gid="NTC_2021_0001" data-tech-code="KTS00701" data-tech-uniqid="NCT_KTS00701_001">
										<div class="meta_tech_no">
											1
										</div>
										<div class="meta_tech_id">
											반도체1
										</div>
										<div class="meta_tech_info">
											<p class="meta_tech_area">30나노 이하급 D램에 해당되는 설계·공정·소자기술 및 3차원 적층형성 기술</p>
											<p class="meta_tech_name">기술명칭 테스트 1</p>
										</div>
										<div class="meta_tech_btn">
											<a href="javascript:void(0);" class="meta_tech_up"></a>
											<a href="javascript:void(0);" class="meta_tech_del"></a>
											<a href="javascript:void(0);" class="meta_tech_down"></a>	
										</div>
									</li>
								
									<li class="meta_tech" data-tech-gid="NTC_2021_0001" data-tech-code="KTS00701" data-tech-uniqid="NCT_KTS00701_002">
										<div class="meta_tech_no">
											2
										</div>
										<div class="meta_tech_id">
											반도체2
										</div>
										<div class="meta_tech_info">
											<p class="meta_tech_area">D램에 해당되는 적층조립기술 및 검사기술</p>
											<p class="meta_tech_name">기술명칭 테스트 2</p>
										</div>
										<div class="meta_tech_btn">
											<a href="javascript:void(0);" class="meta_tech_up"></a>
											<a href="javascript:void(0);" class="meta_tech_del"></a>
											<a href="javascript:void(0);" class="meta_tech_down"></a>	
										</div>
									</li>
								
									<li class="meta_tech" data-tech-gid="NTC_2021_0001" data-tech-code="KTS00701" data-tech-uniqid="NCT_KTS00701_003">
										<div class="meta_tech_no">
											3
										</div>
										<div class="meta_tech_id">
											반도체3
										</div>
										<div class="meta_tech_info">
											<p class="meta_tech_area">30나노 이하급 또는 적층 3D 낸드플래시에 해당되는 설계·공정·소자 기술</p>
											<p class="meta_tech_name">기술명칭 테스트 3</p>
										</div>
										<div class="meta_tech_btn">
											<a href="javascript:void(0);" class="meta_tech_up"></a>
											<a href="javascript:void(0);" class="meta_tech_del"></a>
											<a href="javascript:void(0);" class="meta_tech_down"></a>	
										</div>
									</li>
								
									<li class="meta_tech" data-tech-gid="NTC_2021_0001" data-tech-code="KTS00702" data-tech-uniqid="NCT_KTS00702_001">
										<div class="meta_tech_no">
											4
										</div>
										<div class="meta_tech_id">
											디스플레이4
										</div>
										<div class="meta_tech_info">
											<p class="meta_tech_area">8세대급(2200x2500mm) 이상 TFT-LCD 패널 설계‧공정‧제조(모듈조립 공정기술은 제외)‧구동기술</p>
											<p class="meta_tech_name">기술명칭 테스트 4</p>
										</div>
										<div class="meta_tech_btn">
											<a href="javascript:void(0);" class="meta_tech_up"></a>
											<a href="javascript:void(0);" class="meta_tech_del"></a>
											<a href="javascript:void(0);" class="meta_tech_down"></a>	
										</div>
									</li>
								
									<li class="meta_tech" data-tech-gid="NTC_2021_0001" data-tech-code="KTS00702" data-tech-uniqid="NCT_KTS00702_002">
										<div class="meta_tech_no">
											5
										</div>
										<div class="meta_tech_id">
											디스플레이5
										</div>
										<div class="meta_tech_info">
											<p class="meta_tech_area">AMOLED 패널 설계·공정·제조(모듈조립공정기술은 제외)‧구동기술</p>
											<p class="meta_tech_name">기술명칭 테스트 5</p>
										</div>
										<div class="meta_tech_btn">
											<a href="javascript:void(0);" class="meta_tech_up"></a>
											<a href="javascript:void(0);" class="meta_tech_del"></a>
											<a href="javascript:void(0);" class="meta_tech_down"></a>	
										</div>
									</li>
								</ul>
							</div>
							<div class="item_tap type01 formItem meta_form" ></div>
							<div class="item_label formItem meta_form">
								<p>기술 형태</p>
							</div>
							<div class="item_box formItem meta_form"> 
								<textarea name="coment" id="newMetaForm" class="textareaf"></textarea>
							</div>
							<div class="item_tap type01 formItem meta_qua"></div>
							<div class="item_label formItem meta_qua">
								<p>기술 특성</p>
							</div>
							<div class="item_box formItem meta_qua"> 
								<textarea name="coment" id="newMetaQua" class="textareaf"></textarea>
							</div>
							<div class="item_tap type01 formItem meta_reason meta_reason2 meta_reason3"></div>
							<div class="item_label formItem meta_reason">
								<p>신청 사유</p>
							</div>
							<div class="item_label formItem meta_reason2">
								<p>신고 사유</p>
							</div>
							<div class="item_label formItem meta_reason3">
								<p>승인 신청 사유</p>
							</div>
							<div class="item_box formItem meta_reason meta_reason2 meta_reason3"> 
								<textarea name="coment" id="newMetaReason" class="textareaf"></textarea>
								<a href="javascript:void(0);" id="newMetaLaw01" class="reasonflag meta_reason2">「산업기술의 유출방지 및 보호에 관한 법률」 제11조의2제2항, 같은 법 시행령 제18조의4제1항</a>
								<a href="javascript:void(0);" id="newMetaLaw02" class="reasonflag meta_reason2">「산업기술의 유출방지 및 보호에 관한 법률」 제11조의2제5항, 같은 법 시행령 제18조의5제1항</a>
								<a href="javascript:void(0);" id="newMetaLaw03" class="reasonflag meta_reason2">「산업기술의 유출방지 및 보호에 관한 법률」 제11조의2제6항, 같은 법 시행령 제18조의5제2항</a>
							</div>
							<div class="item_tap type01 formItem ex_reason"></div>
							<div class="item_label formItem ex_reason">
								<p>수출 사유</p>
							</div>
							<div class="item_box formItem ex_reason"> 
								<input type="hidden" name="metaType" id="exReasonType" value="">
								<ul id="reason_type_list" class="reason_type_list">
									<li><a href="javascript:void(0);" class="reason_type_item" data-exrtype="ER01">매각</a></li>
									<li><a href="javascript:void(0);" class="reason_type_item" data-exrtype="ER02">이전</a></li>
									<li><a href="javascript:void(0);" class="reason_type_item" data-exrtype="EX03">기타</a></li>
								</ul>
								<input type="text" id="newExReason" class="base_input" value="" placeholder="사유를 입력해주세요." autocomplete="off">
							</div>
							<div class="item_tap type01 formItem ex_date"></div>
							<div class="item_label formItem ex_date">
								<p>수출 예정일</p>
							</div>
							<div class="item_box formItem ex_date"> 
								<input type="text" id="exDatePick" class="base_input ex_date_pick" value="" placeholder="예정일 선택" autocomplete="off" >
								<input type="text" id="exDateEtc" class="base_input ex_date_etc" value="" placeholder="날짜 미입력시 입력" autocomplete="off">
							</div>
							<div class="item_tap type01 formItem ex_coutury"></div>
							<div class="item_label ex_coutury_tit formItem ex_coutury">
								<p>수출 대상국 및 매입자</p>
								<a href="javascript:void(0);" class="add_ex_coutury">대상국 등록</a>
							</div>
							<div class="item_box formItem ex_coutury add_meta_cty">
								<input type="hidden" name="metaType" id="metaCtyCnt" value="3">
								<div class="meta_cty_nolist">수출 대상국가를 등록해주세요.</div> 
								<ul class="meta_cty_list">
									<li class="meta_cty" data-cty-code="US">
										<div class="meta_cty_no">
											1
										</div>
										<div class="meta_cty_flag">
											<img src="/resources/images/icon/flag_b_us.png.png" alt="US">
										</div>
										<div class="meta_cty_info">
											<p class="meta_cty_buyer">[미국] <span class="meta_cty_buyer_nm">미국 매입 대상자2</span></p>
										</div>
										<div class="meta_cty_btn">
											<a href="javascript:void(0);" class="meta_cty_up"></a>
											<a href="javascript:void(0);" class="meta_cty_del"></a>
											<a href="javascript:void(0);" class="meta_cty_down"></a>	
										</div>
									</li>
									<li class="meta_cty" data-cty-code="FI">
										<div class="meta_cty_no">
											2
										</div>
										<div class="meta_cty_flag">
											<img src="/resources/images/icon/flag_b_fi.png.png" alt="FI">
										</div>
										<div class="meta_cty_info">
											<p class="meta_cty_buyer">[핀란드] <span class="meta_cty_buyer_nm">핀란드 매입 대상자2</span></p>
										</div>
										<div class="meta_cty_btn">
											<a href="javascript:void(0);" class="meta_cty_up"></a>
											<a href="javascript:void(0);" class="meta_cty_del"></a>
											<a href="javascript:void(0);" class="meta_cty_down"></a>	
										</div>
									</li>
									<li class="meta_cty" data-cty-code="GB">
										<div class="meta_cty_no">
											3
										</div>
										<div class="meta_cty_flag">
											<img src="/resources/images/icon/flag_b_gb.png.png" alt="GB">
										</div>
										<div class="meta_cty_info">
											<p class="meta_cty_buyer">[영국] <span class="meta_cty_buyer_nm">영국 매입 대상자3</span></p>
										</div>
										<div class="meta_cty_btn">
											<a href="javascript:void(0);" class="meta_cty_up"></a>
											<a href="javascript:void(0);" class="meta_cty_del"></a>
											<a href="javascript:void(0);" class="meta_cty_down"></a>	
										</div>
									</li>
								</ul>
							</div>
							<div class="item_tap type01 formItem meta_rec_file1"></div>
							<input type="hidden" name="addFileCtn" id="addFileCtn" value="0">
							<div class="item_label formItem meta_rec_file1">
								<p>신청서 첨부</p>
							</div>
							<div class="item_box formItem meta_rec_file1 ">
								<div class="file_input" >
								    <input type="text" readonly="readonly" title="File Route" id="file_route_app" class="new_com_input file_name" value="신청서 원본을 첨부해주세요.">
								    <label> 파일선택<input id="file_app" class="singleUpload" type="file" data-fcode="FC001"></label>
								</div> 
							</div>
							<div class="item_tap type01 formItem meta_rec_file2"></div>
							<div class="item_label formItem meta_rec_file2">
								<p>공문 첨부</p>
							</div>
							<div class="item_box formItem meta_rec_file2"> 
								<div class="file_input" data-fcode="FC002" >
								    <input type="text" readonly="readonly" title="File Route" id="file_route_app1" class="new_com_input file_name" value="공문을 첨부해주세요.">
								    <label> 파일선택<input id="file_app1" class="singleUpload" type="file" data-fcode="FC002"></label>
								</div>
							</div>
							<div class="item_tap type01 formItem meta_rec_file3"></div>
							<div class="item_label formItem meta_rec_file3">
								<p>국가핵심기술 설명자료</p>
							</div>
							<div class="item_box formItem meta_rec_file3"> 
								<div class="file_input">
								    <input type="text" readonly="readonly" title="File Route" id="file_route_app2" class="new_com_input file_name" value="국가핵심기술 설명자료를 첨부해주세요.">
								    <label> 파일선택<input id="file_app" class="singleUpload" type="file" data-fcode="FC003"></label>
								</div>
							</div>
							<div class="item_tap type01 formItem meta_rec_file4"></div>
							<div class="item_label formItem meta_rec_file4">
								<p>변경 국가핵심기술 설명자료</p>
							</div>
							<div class="item_box formItem meta_rec_file4"> 
								<div class="file_input">
								    <input type="text" readonly="readonly" title="File Route" id="file_route_app3" class="new_com_input file_name" value="국가핵심기술 설명자료를 첨부해주세요.">
								    <label> 파일선택<input id="file_app" class="singleUpload" type="file" data-fcode="FC004"></label>
								</div>
							</div>
						</div>
						<div class="nct_bro_item type_03">
							<div class="item_label formItem">
								<p class="item_label_l">기타 관련 첨부파일 <!-- <span style="color:#ff0000">첨부파일 업로드 방식 변경 수정중</span> --></p>
								<a href="javascript:void(0);" class="file_up_info">?
									<div class="file_up_info_box"> 
										<ul class="file_info_list">
											<li>1. 국가핵심기술의 매각 또는 이전 계약서(임시계약서를 포함한다)</li> 
											<li>2. 국가핵심기술의 매입자 또는 이전받으려는 자에 관한 사항</li> 
											<li>3. 국가핵심기술의 용도와 성능을 표시하는 기술자료</li> 
											<li>4. 국가핵심기술의 제공 조건과 방법</li> 
											<li>5. 국가핵심기술을 사용한 관련 제품의 시장 규모와 경쟁력 수준</li> 
											<li>6. 국가로부터 지원받은 연구개발비에 관한 자료</li> 
										</ul>
									</div>
								</a>
								
								
							</div>
							<div class="item_box formItem"> 
								<div class="nct_multy_file_wrap "><!-- addFile -->
									<div class="nct_multy_btn_box">
										<a href="javascript:addmultiFile();" class="btn">파일 첨부</a>
										<a href="javascript:delAllFile();" class="btn">전체 삭제</a>
									</div>
									<div class="nct_multy_file_list_box nct_scroll ">
										<div class="no_add_file">
											<p>첨부파일을 등록 해주세요.</p>
										</div>
										<div class="nct_multy_file_box">
											<input type="hidden" name="addmultiFileCtn" id="addmultiFileCtn" value="0">
											<ul class="nct_multy_file_list">
												<li>
													<div class="add_file_item">
														<div class="add_file_no">
															1
														</div>
														<p style="flex:1;">파일 이름</p>
														<div class="add_file_btn">
															<a href="javascript:void(0);" class="add_sort_up"></a>
															<a href="javascript:void(0);" class="add_file_del"></a>
															<a href="javascript:void(0);" class="add_sort_down"></a>	
														</div>
													</div>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
						
					</div>
					
				</div>
			</div>
			<!-- //뷰어타입 : 브라우저  -->	
		</div>
		
	</div>
	<!-- 뷰어타입 바디 시작  -->
</div>
<div class="upload_layer_wrap">
	<div class="upload_layer_content">
		<div class="uploadMessegeTit">
			첨부 파일을 업로드 중입니다.<br>
			잠시만 기다려 주세요.<span class='colorR'></span>
		</div>
		<div class="upload_box_wrap">
			<div class="upload_info">
				<p>업로드 파일 : </p>
				<p>업로드 용량 : </p>
			</div>
			<div class="upload_list_box">
				<ul class="upload_list">
				</ul>
			</div>
		</div>
	</div>
</div>
<div class="nct_footer">
	<a href="javascript:cancleRec();" class="nct_btn to300">취소</a>
	<a href="javascript:recSaveChk();" class="nct_btn to500">저장</a>
</div>