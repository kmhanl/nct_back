<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<div class="browser_alert_box">
				브라우저 알럿
			</div>
			
			
			<div class="sub_browser side_004">
				<div class="browser_block">
				
					<div class="block_title_box type02">
						<h1 class="block_title">전문위원회  검토 안건</h1>
					</div>
					<div class="section_utile_box">
						<a href="#none" class="util_chk">전체 선택</a>
						<a href="#none" class="util_btn">선택 안건 삭제</a>
						<div class="util_tap"></div>
						<a href="#none" class="util_btn">위로</a>
						<a href="#none" class="util_btn">아래로</a>
					</div>
					<div class="content_section nct_scroll">
						<ul class="nct_agd_list type01">
							<li class="selected Agd2023-01-0003 " data-ex-idx="2023-000001" data-agd-type="01" data-agd-idx="2023-01-0003" data-agd-view-code="E-2023-03-0003" data-rcpt-code="2023-03-0003">
								<a href="#none" class="agd_item_box">
									<div class="agd_num">
										<p class="">1</p>
									</div>
									<div class="agd_body type01">
										<div class="agd_tit_box">
											<p class="agd_rep_type">해외인수·합병 사전검토</p>
										</div>
										<div class="agd_rep_idx">
											<p class="agd_num"><span class="list_label">안건번호 :</span> E-2023-03-0003</p>
										</div>
										<div class="agd_rep_info">
											<p class="rep_tit">반도체 여부판정 전문위원회 반도체</p>
											<p class="list_sub_info">접수번호 : 2023-03-0003 | 대상기업 : 한국산업기술보호협회</p>
										</div>
										<!-- <span class="ExagendaFlag Flag_01">
											작성전
										</span> -->
									</div>
								</a>
								<div class="ModifyAgenda">
									<p class="Ingbox">현재 작성 중인 안건 입니다.</p>
								</div>
							</li>
							<li class="Agd2023-01-0003" data-ex-idx="2023-000001" data-agd-type="01" data-agd-idx="2023-01-0003" data-agd-view-code="E-2023-03-0003" data-rcpt-code="2023-03-0003">
								<a href="#none" class="agd_item_box">
									<div class="agd_num">
										<p class="">1</p>
									</div>
									<div class="agd_body type01">
										<div class="agd_tit_box">
											<p class="agd_rep_type">해외인수·합병 사전검토</p>
										</div>
										<div class="agd_rep_idx">
											<p class="agd_num"><span class="list_label">안건번호 :</span> E-2023-03-0003</p>
										</div>
										<div class="agd_rep_info">
											<p class="rep_tit">반도체 여부판정 전문위원회 반도체</p>
											<p class="list_sub_info">접수번호 : 2023-03-0003 | 대상기업 : 한국산업기술보호협회</p>
										</div>
										<!-- <span class="ExagendaFlag Flag_01">
											작성전
										</span> -->
									</div>
								</a>
							</li>
							<li class="Agd2023-01-0003" data-ex-idx="2023-000001" data-agd-type="01" data-agd-idx="2023-01-0003" data-agd-view-code="E-2023-03-0003" data-rcpt-code="2023-03-0003">
								<a href="#none" class="agd_item_box">
									<div class="agd_num">
										<p class="">1</p>
									</div>
									<div class="agd_body type01">
										<div class="agd_tit_box">
											<p class="agd_rep_type">해외인수·합병 사전검토</p>
										</div>
										<div class="agd_rep_idx">
											<p class="agd_num"><span class="list_label">안건번호 :</span> E-2023-03-0003</p>
										</div>
										<div class="agd_rep_info">
											<p class="rep_tit">반도체 여부판정 전문위원회 반도체 여부판정 전문위원회반도체 여부판정 전문위원회반도체 여부판정 전문위원회반도체 여부판정 전문위원회</p>
											<p class="list_sub_info">접수번호 : 2023-03-0003 | 대상기업 : 한국산업기술보호협회</p>
										</div>
										<!-- <span class="ExagendaFlag Flag_01">
											작성전
										</span> -->
									</div>
								</a>
							</li>
							<li class="Agd2023-01-0003" data-ex-idx="2023-000001" data-agd-type="01" data-agd-idx="2023-01-0003" data-agd-view-code="E-2023-03-0003" data-rcpt-code="2023-03-0003">
								<a href="#none" class="agd_item_box">
									<div class="agd_num">
										<p class="">1</p>
									</div>
									<div class="agd_body type01">
										<div class="agd_tit_box">
											<p class="agd_rep_type">해외인수·합병 사전검토</p>
										</div>
										<div class="agd_rep_idx">
											<p class="agd_num"><span class="list_label">안건번호 :</span> E-2023-03-0003</p>
										</div>
										<div class="agd_rep_info">
											<p class="rep_tit">반도체 여부판정 전문위원회 반도체 여부판정 전문위원회반도체 여부판정 전문위원회반도체 여부판정 전문위원회반도체 여부판정 전문위원회</p>
											<p class="list_sub_info">접수번호 : 2023-03-0003 | 대상기업 : 한국산업기술보호협회</p>
										</div>
										<!-- <span class="ExagendaFlag Flag_01">
											작성전
										</span> -->
									</div>
								</a>
							</li>
							<li class="Agd2023-01-0003" data-ex-idx="2023-000001" data-agd-type="01" data-agd-idx="2023-01-0003" data-agd-view-code="E-2023-03-0003" data-rcpt-code="2023-03-0003">
								<a href="#none" class="agd_item_box">
									<div class="agd_num">
										<p class="">1</p>
									</div>
									<div class="agd_body type01">
										<div class="agd_tit_box">
											<p class="agd_rep_type">해외인수·합병 사전검토</p>
										</div>
										<div class="agd_rep_idx">
											<p class="agd_num"><span class="list_label">안건번호 :</span> E-2023-03-0003</p>
										</div>
										<div class="agd_rep_info">
											<p class="rep_tit">반도체 여부판정 전문위원회 반도체 여부판정 전문위원회반도체 여부판정 전문위원회반도체 여부판정 전문위원회반도체 여부판정 전문위원회</p>
											<p class="list_sub_info">접수번호 : 2023-03-0003 | 대상기업 : 한국산업기술보호협회</p>
										</div>
										<!-- <span class="ExagendaFlag Flag_01">
											작성전
										</span> -->
									</div>
								</a>
							</li>
							<li class="Agd2023-01-0003" data-ex-idx="2023-000001" data-agd-type="01" data-agd-idx="2023-01-0003" data-agd-view-code="E-2023-03-0003" data-rcpt-code="2023-03-0003">
								<a href="#none" class="agd_item_box">
									<div class="agd_num">
										<p class="">1</p>
									</div>
									<div class="agd_body type01">
										<div class="agd_tit_box">
											<p class="agd_rep_type">해외인수·합병 사전검토</p>
										</div>
										<div class="agd_rep_idx">
											<p class="agd_num"><span class="list_label">안건번호 :</span> E-2023-03-0003</p>
										</div>
										<div class="agd_rep_info">
											<p class="rep_tit">반도체 여부판정 전문위원회 반도체 여부판정 전문위원회반도체 여부판정 전문위원회반도체 여부판정 전문위원회반도체 여부판정 전문위원회</p>
											<p class="list_sub_info">접수번호 : 2023-03-0003 | 대상기업 : 한국산업기술보호협회</p>
										</div>
										<!-- <span class="ExagendaFlag Flag_01">
											작성전
										</span> -->
									</div>
								</a>
							</li>
							<li class="Agd2023-01-0003" data-ex-idx="2023-000001" data-agd-type="01" data-agd-idx="2023-01-0003" data-agd-view-code="E-2023-03-0003" data-rcpt-code="2023-03-0003">
								<a href="#none" class="agd_item_box">
									<div class="agd_num">
										<p class="">1</p>
									</div>
									<div class="agd_body type01">
										<div class="agd_tit_box">
											<p class="agd_rep_type">해외인수·합병 사전검토</p>
										</div>
										<div class="agd_rep_idx">
											<p class="agd_num"><span class="list_label">안건번호 :</span> E-2023-03-0003</p>
										</div>
										<div class="agd_rep_info">
											<p class="rep_tit">반도체 여부판정 전문위원회 반도체 여부판정 전문위원회반도체 여부판정 전문위원회반도체 여부판정 전문위원회반도체 여부판정 전문위원회</p>
											<p class="list_sub_info">접수번호 : 2023-03-0003 | 대상기업 : 한국산업기술보호협회</p>
										</div>
										<!-- <span class="ExagendaFlag Flag_01">
											작성전
										</span> -->
									</div>
								</a>
							</li>
							<li class="Agd2023-01-0003" data-ex-idx="2023-000001" data-agd-type="01" data-agd-idx="2023-01-0003" data-agd-view-code="E-2023-03-0003" data-rcpt-code="2023-03-0003">
								<a href="#none" class="agd_item_box">
									<div class="agd_num">
										<p class="">1</p>
									</div>
									<div class="agd_body type01">
										<div class="agd_tit_box">
											<p class="agd_rep_type">해외인수·합병 사전검토</p>
										</div>
										<div class="agd_rep_idx">
											<p class="agd_num"><span class="list_label">안건번호 :</span> E-2023-03-0003</p>
										</div>
										<div class="agd_rep_info">
											<p class="rep_tit">반도체 여부판정 전문위원회 반도체 여부판정 전문위원회반도체 여부판정 전문위원회반도체 여부판정 전문위원회반도체 여부판정 전문위원회</p>
											<p class="list_sub_info">접수번호 : 2023-03-0003 | 대상기업 : 한국산업기술보호협회</p>
										</div>
										<!-- <span class="ExagendaFlag Flag_01">
											작성전
										</span> -->
									</div>
								</a>
							</li>
							<li class="Agd2023-01-0003" data-ex-idx="2023-000001" data-agd-type="01" data-agd-idx="2023-01-0003" data-agd-view-code="E-2023-03-0003" data-rcpt-code="2023-03-0003">
								<a href="#none" class="agd_item_box">
									<div class="agd_num">
										<p class="">1</p>
									</div>
									<div class="agd_body type01">
										<div class="agd_tit_box">
											<p class="agd_rep_type">해외인수·합병 사전검토</p>
										</div>
										<div class="agd_rep_idx">
											<p class="agd_num"><span class="list_label">안건번호 :</span> E-2023-03-0003</p>
										</div>
										<div class="agd_rep_info">
											<p class="rep_tit">반도체 여부판정 전문위원회 반도체 여부판정 전문위원회반도체 여부판정 전문위원회반도체 여부판정 전문위원회반도체 여부판정 전문위원회</p>
											<p class="list_sub_info">접수번호 : 2023-03-0003 | 대상기업 : 한국산업기술보호협회</p>
										</div>
										<!-- <span class="ExagendaFlag Flag_01">
											작성전
										</span> -->
									</div>
								</a>
							</li>
							<li class="Agd2023-01-0003" data-ex-idx="2023-000001" data-agd-type="01" data-agd-idx="2023-01-0003" data-agd-view-code="E-2023-03-0003" data-rcpt-code="2023-03-0003">
								<a href="#none" class="agd_item_box">
									<div class="agd_num">
										<p class="">1</p>
									</div>
									<div class="agd_body type01">
										<div class="agd_tit_box">
											<p class="agd_rep_type">해외인수·합병 사전검토</p>
										</div>
										<div class="agd_rep_idx">
											<p class="agd_num"><span class="list_label">안건번호 :</span> E-2023-03-0003</p>
										</div>
										<div class="agd_rep_info">
											<p class="rep_tit">반도체 여부판정 전문위원회 반도체 여부판정 전문위원회반도체 여부판정 전문위원회반도체 여부판정 전문위원회반도체 여부판정 전문위원회</p>
											<p class="list_sub_info">접수번호 : 2023-03-0003 | 대상기업 : 한국산업기술보호협회</p>
										</div>
										<!-- <span class="ExagendaFlag Flag_01">
											작성전
										</span> -->
									</div>
								</a>
							</li>
						</ul>
						
					</div>
					<div class="browser_con_btn_box">
						<a href="#none" class="con_btn">위원회 목록</a>
						<a href="#none" class="con_btn">최종 의견 제출</a>
					</div>
				</div>
			</div>
			
		
			<div class="browser_col_tap tap01"></div>
		
		
		
			<div class="sub_browser side_dual">
				<div class="browser_alert_box" style="display:none">
					브라우저 알럿
				</div>
				<div class="sub_child">
					<div class="browser_block">
						
						<div class="section_title_box type02">
							<h1 class="section_title">안건 상세</h1>
						</div>
						<div class="content_section agd_view nct_scroll">
							<div class="nct_bro_item type_01">
								<div class="item_label">
									<p>기술명칭</p>
								</div>
								<div class="item_box"> 
									<ul class="meta_tech_list">
										<li class="meta_tech">
											<div class="meta_tech_id">
												반도체
											</div>
											<div class="meta_tech_info">
												<p class="meta_tech_area">30나노 이하급 D램에 해당되는 설계·공정·소자기술 및 3차원 적층형성 기술</p>
												<p class="meta_tech_name">기술명칭 테스트 1</p>
											</div>
										</li>
									
										<li class="meta_tech">
											<div class="meta_tech_id">
												반도체
											</div>
											<div class="meta_tech_info">
												<p class="meta_tech_area">D램에 해당되는 적층조립기술 및 검사기술</p>
												<p class="meta_tech_name">기술명칭 테스트 2</p>
											</div>
										</li>
									
										<li class="meta_tech">
											<div class="meta_tech_id">
												반도체
											</div>
											<div class="meta_tech_info">
												<p class="meta_tech_area">30나노 이하급 또는 적층 3D 낸드플래시에 해당되는 설계·공정·소자 기술</p>
												<p class="meta_tech_name">기술명칭 테스트 3</p>
											</div>
										</li>
									
										<li class="meta_tech">
											<div class="meta_tech_id">
												디스플레이
											</div>
											<div class="meta_tech_info">
												<p class="meta_tech_area">8세대급(2200x2500mm) 이상 TFT-LCD 패널 설계‧공정‧제조(모듈조립 공정기술은 제외)‧구동기술</p>
												<p class="meta_tech_name">기술명칭 테스트 4</p>
											</div>
										</li>
									
										<li class="meta_tech">
											<div class="meta_tech_id">
												디스플레이
											</div>
											<div class="meta_tech_info">
												<p class="meta_tech_area">AMOLED 패널 설계·공정·제조(모듈조립공정기술은 제외)‧구동기술</p>
												<p class="meta_tech_name">기술명칭 테스트 5</p>
											</div>
										</li>
									</ul>
								</div>
								<div class="item_tap"></div>
								<div class="item_label">
									<p>기술 형태</p>
								</div>
								<div class="item_box"> 
									<p class="ta">기술형태 입력값 테스트
												기술형태 입력값 테스트
												기술형태 입력값 테스트</p>
								</div>
								<div class="item_tap"></div>
								<div class="item_label">
									<p>기술 특성</p>
								</div>
								<div class="item_box"> 
									<p class="ta">기술 특성 입력값 테스트
											기술 특성 입력값 테스트
								</div>
								<div class="item_tap"></div>
								<div class="item_label">
									<p>신청 사유</p>
								</div>
								<div class="item_box"> 
									<p class="ta">신고사유 입력값 테스트
										신고사유 입력값 테스트
										신고사유 입력값 테스트</p>
								</div>
								<div class="item_tap"></div>
								<div class="item_label">
									<p>신고 사유</p>
								</div>
								<div class="item_box"> 
									<p class="ta">신고사유 입력값 테스트
										신고사유 입력값 테스트
										신고사유 입력값 테스트</p>
									<p class="reasonflag tap_on">「산업기술의 유출방지 및 보호에 관한 법률」 제11조의2제2항, 같은 법 시행령 제18조의4제1항</p>
									<p class="reasonflag tap_on">「산업기술의 유출방지 및 보호에 관한 법률」 제11조의2제5항, 같은 법 시행령 제18조의5제1항</p>
									<p class="reasonflag tap_on">「산업기술의 유출방지 및 보호에 관한 법률」 제11조의2제6항, 같은 법 시행령 제18조의5제2항</p>
								</div>
								<div class="item_tap"></div>
								<div class="item_label">
									<p>수출 사유</p>
								</div>
								<div class="item_box"> 
									<div class="meta_ex_type">
										<div class="meta_ex_type_id">
											매각
										</div>
										<div class="meta_ex_type_info">
											<p class="meta_ex_type_name">수출 매각 사유  입력값</p>
										</div>
									</div>
								</div>
								<div class="item_tap"></div>
								<div class="item_label">
									<p>수출 대상국</p>
								</div>
								<div class="item_box"> 
									<ul class="meta_cty_list">
										<li class="meta_cty">
											<div class="meta_cty_flag">
												<img src="/resources/images/icon/flag_b_us.png.png" alt="US">
											</div>
											<div class="meta_cty_info">
												<p class="meta_cty_buyer">[미국] 미국 매입 대상자1</p>
											</div>
										</li>
										<li class="meta_cty">
											<div class="meta_cty_flag">
												<img src="/resources/images/icon/flag_b_fi.png.png" alt="FI">
											</div>
											<div class="meta_cty_info">
												<p class="meta_cty_buyer">[핀란드] 핀란드 매입 대상자2</p>
											</div>
										</li>
										<li class="meta_cty">
											<div class="meta_cty_flag">
												<img src="/resources/images/icon/flag_b_gb.png.png" alt="GB">
											</div>
											<div class="meta_cty_info">
												<p class="meta_cty_buyer">[영국] 영국 매입 대상자3</p>
											</div>
										</li>
									</ul>
								</div>
								<div class="item_tap"></div>
								<div class="item_label">
									<p>수출 예정일</p>
								</div>
								<div class="item_box"> 
									<p>2023.04.30</p>
									<p class="tran_day_ment">수출 예정일 미지정 입력값</p>
								</div>
							</div>
							<div class="nct_bro_item type_01">
								<div class="item_label">
									<p>신청 공문 <span style="color:#ff0000">첨부파일 업로드 방식 변경 수정중</span></p>
								</div>
								<div class="item_box"> 
									<p>신청 공문 파일</p>
								</div>
							</div>
							<div class="nct_bro_item type_01">
								<div class="item_label">
									<p>신청서 파일 <span style="color:#ff0000">첨부파일 업로드 방식 변경 수정중</span></p>
								</div>
								<div class="item_box"> 
									<p>신청서 파일</p>
								</div>
							</div>
							<div class="nct_bro_item type_01">
								<div class="item_label">
									<p>첨부파일 <span style="color:#ff0000">첨부파일 업로드 방식 변경 수정중</span></p>
								</div>
								<div class="item_box"> 
									<p>첨부 파일1</p>
									<p>첨부 파일2</p>
									<p>첨부 파일3</p>
									<p>첨부 파일4</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				
			
				<div class="browser_col_tap tap02"></div>
				
				
				
				<div class="sub_child">
					<div class="browser_block">
						<div class="section_title_box type02">
							<h1 class="section_title">검토 의견 작성</h1>
						</div>
						<div class="content_section opt_write nct_scroll">
							<div class="nct_bro_item type_03">
								<div class="item_label">
									<p>기관명</p>
								</div>
								<div class="item_box"> 
									<input type="text" id="schCompay" class="company_search_input" value="" placeholder="대상 기업명을 입력하세요." autocomplete="off">
								</div>
								<div class="item_tap type01"></div>
								<div class="item_label">
									<p>검토 의견</p>
								</div>
								<div class="item_box"> 
									<textarea name="coment" id="coment" class="textareaf"></textarea>
								</div>
								<div class="item_tap type01"></div>
								
								<div class="item_label">
									<p>기관명</p>
								</div>
								<div class="item_box"> 
									<input type="text" id="schCompay" class="company_search_input" value="" placeholder="대상 기업명을 입력하세요." autocomplete="off">
								</div>
								<div class="item_tap type01"></div>
								<div class="item_label">
									<p>기관명</p>
								</div>
								<div class="item_box"> 
									<input type="text" id="schCompay" class="company_search_input" value="" placeholder="대상 기업명을 입력하세요." autocomplete="off">
								</div>
								<div class="item_tap type01"></div>
								<div class="item_label">
									<p>기관명</p>
								</div>
								<div class="item_box"> 
									<input type="text" id="schCompay" class="company_search_input" value="" placeholder="대상 기업명을 입력하세요." autocomplete="off">
								</div>
							</div>
							<div class="content_alert_box type01"> 
								<p>위원회에 포함 될 구성원을 등록 해주세요.</p>
								<a href="#none" class="">구성원 등록</a>
							</div>
							<div class="nct_form_item item_type_01">
								<div class="write_item_label">
									기술 분야
								</div>
								<div class="write_item_into"> 
									기술분야를 먼저 선택 해주세요.
								</div>
							</div>
							<div class="nct_form_item item_type_02">
								<p class="write_item_label">기술 분야</p>
								<div class="write_item_into"> 
									기술분야를 먼저 선택 해주세요.
								</div>
							</div>
							<div class="write_item_box">
								<p class="write_item_label">기술 분야</p>
								<div class="write_item_into"> 
									기술분야를 먼저 선택 해주세요.
								</div>
							</div>
							<div class="write_item_box">
								<p class="write_item_label">위원회 회차</p>
								<div class="write_item_into"> 
									기술분야를 먼저 선택 해주세요.
								</div>
							</div>
							<div class="write_item_box">
								<div class="write_item_label">관리 제목</div>
								<div class="" style="float:left;">
									<input type="text" id="" name="" class="nct_input" />
									<p style="font-size:13px;color:#888;font-weight:200;">스마트폰, 아웃룩 등에서 네이버 메일을 확인할 수 있도록 POP3/SMTP를 설정합니다.</p>
								</div>
								
							</div>
							<div class="write_item_box">
								<p class="write_item_label">진행 형태</p>
							</div>
							<div class="write_item_box">
								<p class="write_item_label">개최 후보일1</p>
							</div>
							<div class="write_item_box">
								<p class="write_item_label">참석여부 조사 기간 설정</p>
							</div>
						</div>
						<div class="browser_con_btn_box">
							<a href="#none" class="con_btn">임시 저장</a>
							<a href="#none" class="con_btn">의견 제출</a>
						</div>	
					</div>
				</div>
				
			</div>
			
			
			
			<div id ="Opt2000-00-0000" class="sub_browser side_dual" style="display:none;">
				
				<div class="sub_child">
					<div class="browser_block">
						
						<div class="section_title_box type02">
							<h1 class="section_title">안건 상세</h1>
						</div>
						<div class="section_utile_box">
							<a href="#none" class="util_chk">전체 선택</a>
							<a href="#none" class="util_btn">선택 안건 삭제</a>
							<div class="util_tap"></div>
							<a href="#none" class="util_btn">위로</a>
							<a href="#none" class="util_btn">아래로</a>
						</div>
						<div class="content_section nct_scroll">
							<div class="content_alert_box type01"> 
								<p>위원회에 포함될 안건을 등록 해주세요.</p>
								<a href="#none" class="">안건 등록</a>
							</div>
							<ul class="nct_agd_list">
								<li class="Agd2023-01-0003" data-ex-idx="2023-000001" data-agd-type="01" data-agd-idx="2023-01-0003" data-agd-view-code="E-2023-03-0003" data-rcpt-code="2023-03-0003">
									<a href="#none" class="agd_item_box">
										<div class="agd_num">
											<p class="">1</p>
										</div>
										<div class="agd_body type01">
											<div class="agd_tit_box">
												<p class="agd_rep_type">해외인수·합병 사전검토</p>
											</div>
											<div class="agd_rep_idx">
												<p class="agd_num"><span class="list_label">안건번호 :</span> E-2023-03-0003</p>
											</div>
											<div class="agd_rep_info">
												<p class="rep_tit">반도체 여부판정 전문위원회 반도체 여부판정 전문위원회반도체 여부판정 전문위원회반도체 여부판정 전문위원회반도체 여부판정 전문위원회</p>
												<p class="list_sub_info">접수번호 : 2023-03-0003 | 대상기업 : 한국산업기술보호협회</p>
											</div>
											<!-- <span class="ExagendaFlag Flag_01">
												작성전
											</span> -->
										</div>
									</a>
								</li>
								<li class="Agd2023-01-0003" data-ex-idx="2023-000001" data-agd-type="01" data-agd-idx="2023-01-0003" data-agd-view-code="E-2023-03-0003" data-rcpt-code="2023-03-0003">
									<a href="#none" class="agd_item_box">
										<div class="agd_num">
											<p class="">1</p>
										</div>
										<div class="agd_body type01">
											<div class="agd_tit_box">
												<p class="agd_rep_type">해외인수·합병 사전검토</p>
											</div>
											<div class="agd_rep_idx">
												<p class="agd_num"><span class="list_label">안건번호 :</span> E-2023-03-0003</p>
											</div>
											<div class="agd_rep_info">
												<p class="rep_tit">반도체 여부판정 전문위원회 반도체 여부판정 전문위원회반도체 여부판정 전문위원회반도체 여부판정 전문위원회반도체 여부판정 전문위원회</p>
												<p class="list_sub_info">접수번호 : 2023-03-0003 | 대상기업 : 한국산업기술보호협회</p>
											</div>
											<!-- <span class="ExagendaFlag Flag_01">
												작성전
											</span> -->
										</div>
									</a>
								</li>
								<li class="Agd2023-01-0003" data-ex-idx="2023-000001" data-agd-type="01" data-agd-idx="2023-01-0003" data-agd-view-code="E-2023-03-0003" data-rcpt-code="2023-03-0003">
									<a href="#none" class="agd_item_box">
										<div class="agd_num">
											<p class="">1</p>
										</div>
										<div class="agd_body type01">
											<div class="agd_tit_box">
												<p class="agd_rep_type">해외인수·합병 사전검토</p>
											</div>
											<div class="agd_rep_idx">
												<p class="agd_num"><span class="list_label">안건번호 :</span> E-2023-03-0003</p>
											</div>
											<div class="agd_rep_info">
												<p class="rep_tit">반도체 여부판정 전문위원회 반도체 여부판정 전문위원회반도체 여부판정 전문위원회반도체 여부판정 전문위원회반도체 여부판정 전문위원회</p>
												<p class="list_sub_info">접수번호 : 2023-03-0003 | 대상기업 : 한국산업기술보호협회</p>
											</div>
											<!-- <span class="ExagendaFlag Flag_01">
												작성전
											</span> -->
										</div>
									</a>
								</li>
								<li class="Agd2023-01-0003" data-ex-idx="2023-000001" data-agd-type="01" data-agd-idx="2023-01-0003" data-agd-view-code="E-2023-03-0003" data-rcpt-code="2023-03-0003">
									<a href="#none" class="agd_item_box">
										<div class="agd_num">
											<p class="">1</p>
										</div>
										<div class="agd_body type01">
											<div class="agd_tit_box">
												<p class="agd_rep_type">해외인수·합병 사전검토</p>
											</div>
											<div class="agd_rep_idx">
												<p class="agd_num"><span class="list_label">안건번호 :</span> E-2023-03-0003</p>
											</div>
											<div class="agd_rep_info">
												<p class="rep_tit">반도체 여부판정 전문위원회 반도체 여부판정 전문위원회반도체 여부판정 전문위원회반도체 여부판정 전문위원회반도체 여부판정 전문위원회</p>
												<p class="list_sub_info">접수번호 : 2023-03-0003 | 대상기업 : 한국산업기술보호협회</p>
											</div>
											<!-- <span class="ExagendaFlag Flag_01">
												작성전
											</span> -->
										</div>
									</a>
								</li>
								<li class="Agd2023-01-0003" data-ex-idx="2023-000001" data-agd-type="01" data-agd-idx="2023-01-0003" data-agd-view-code="E-2023-03-0003" data-rcpt-code="2023-03-0003">
									<a href="#none" class="agd_item_box">
										<div class="agd_num">
											<p class="">1</p>
										</div>
										<div class="agd_body type01">
											<div class="agd_tit_box">
												<p class="agd_rep_type">해외인수·합병 사전검토</p>
											</div>
											<div class="agd_rep_idx">
												<p class="agd_num"><span class="list_label">안건번호 :</span> E-2023-03-0003</p>
											</div>
											<div class="agd_rep_info">
												<p class="rep_tit">반도체 여부판정 전문위원회 반도체 여부판정 전문위원회반도체 여부판정 전문위원회반도체 여부판정 전문위원회반도체 여부판정 전문위원회</p>
												<p class="list_sub_info">접수번호 : 2023-03-0003 | 대상기업 : 한국산업기술보호협회</p>
											</div>
											<!-- <span class="ExagendaFlag Flag_01">
												작성전
											</span> -->
										</div>
									</a>
								</li>
								<li class="Agd2023-01-0003" data-ex-idx="2023-000001" data-agd-type="01" data-agd-idx="2023-01-0003" data-agd-view-code="E-2023-03-0003" data-rcpt-code="2023-03-0003">
									<a href="#none" class="agd_item_box">
										<div class="agd_num">
											<p class="">1</p>
										</div>
										<div class="agd_body type01">
											<div class="agd_tit_box">
												<p class="agd_rep_type">해외인수·합병 사전검토</p>
											</div>
											<div class="agd_rep_idx">
												<p class="agd_num"><span class="list_label">안건번호 :</span> E-2023-03-0003</p>
											</div>
											<div class="agd_rep_info">
												<p class="rep_tit">반도체 여부판정 전문위원회 반도체 여부판정 전문위원회반도체 여부판정 전문위원회반도체 여부판정 전문위원회반도체 여부판정 전문위원회</p>
												<p class="list_sub_info">접수번호 : 2023-03-0003 | 대상기업 : 한국산업기술보호협회</p>
											</div>
											<!-- <span class="ExagendaFlag Flag_01">
												작성전
											</span> -->
										</div>
									</a>
								</li>
							</ul>
							
						</div>
					</div>
				</div>
				
				
				
			
				<div class="browser_col_tap tap02"></div>
				
				
				
				<div class="sub_child">
					<div class="browser_block">
						<div class="section_title_box type02">
							<h1 class="section_title">검토 의견 작성</h1>
						</div>
						<div class="section_utile_box">
							<a href="#none" class="util_chk">전체 선택</a>
							<a href="#none" class="util_btn">선택 삭제</a>
						</div>
						<div class="content_section nct_scroll">
							<div class="content_alert_box type01"> 
								<p>위원회에 포함 될 구성원을 등록 해주세요.</p>
								<a href="#none" class="">구성원 등록</a>
							</div>
							<div class="nct_form_item item_type_01">
								<div class="write_item_label">
									기술 분야
								</div>
								<div class="write_item_into"> 
									기술분야를 먼저 선택 해주세요.
								</div>
							</div>
							<div class="nct_form_item item_type_02">
								<p class="write_item_label">기술 분야</p>
								<div class="write_item_into"> 
									기술분야를 먼저 선택 해주세요.
								</div>
							</div>
							<div class="write_item_box">
								<p class="write_item_label">기술 분야</p>
								<div class="write_item_into"> 
									기술분야를 먼저 선택 해주세요.
								</div>
							</div>
							<div class="write_item_box">
								<p class="write_item_label">위원회 회차</p>
								<div class="write_item_into"> 
									기술분야를 먼저 선택 해주세요.
								</div>
							</div>
							<div class="write_item_box">
								<div class="write_item_label">관리 제목</div>
								<div class="" style="float:left;">
									<input type="text" id="" name="" class="nct_input" />
									<p style="font-size:13px;color:#888;font-weight:200;">스마트폰, 아웃룩 등에서 네이버 메일을 확인할 수 있도록 POP3/SMTP를 설정합니다.</p>
								</div>
								
							</div>
							<div class="write_item_box">
								<p class="write_item_label">진행 형태</p>
							</div>
							<div class="write_item_box">
								<p class="write_item_label">개최 후보일1</p>
							</div>
							<div class="write_item_box">
								<p class="write_item_label">참석여부 조사 기간 설정</p>
							</div>
						</div>
						<div class="browser_con_btn_box">
							<a href="#none" class="con_btn">임시 저장</a>
							<a href="#none" class="con_btn">의견 제출</a>
						</div>	
					</div>
				</div>
				
			</div>
		
		
		
		</div>
	</div>
</div>