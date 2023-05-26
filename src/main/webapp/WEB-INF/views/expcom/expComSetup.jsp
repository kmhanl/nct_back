<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="nct_content_wrap">
	<!-- 뷰어타입 바디 시작  -->
	<div class="nct_browser_wrapper">
		<!-- 뷰어타입 : 브라우저  -->
		<div id="expSetup" class="nct_browser ${fn:length(haveTechList) != 1 ? 'tech_setup_ok' : '' }">
			<c:if test="${fn:length(haveTechList) != 1 }">
				<div class="browser_alert_box exp_com_setup_info">
					<div class="exp_tech_setup_box">
						<p class="tech_setup_info_tit">
						<c:if test="${user.admGroup eq 'AMG00'}">
							<span>한국산업기술보호협회</span>
						</c:if>
						<c:if test="${user.admGroup eq 'AMG02'}">
							<span>한국산업기술보호협회</span>
						</c:if>
						<c:if test="${user.admGroup eq 'AMG04'}">
							<span>소관과</span>
						</c:if>
						${user.admName}님<br>전문위원회 구성을 위한 기술 분야를 선택해주세요.
						</p>
						<div class="exp_tech_setup">
							<ul class="nct_tech_list">
							<c:forEach items="${haveTechList}" var="haveTech" varStatus="htechhis">
								<li data-gid="${haveTech.techNtcGid}" data-tid="${haveTech.techId}">
									<a href="javascript:void(0);" class="nct_tech_item" >${haveTech.techName}</a>
								</li>
							</c:forEach>
							</ul>
						</div>
						<p class="tech_setup_info_sub">※전문위원회 구성을 위한 분야별 권한은 관리자에게 문의 해주세요.</p>
					</div>
					
				</div>
			</c:if>
			<div class="sub_browser side_004 ">
				<div class="browser_block ">
					<div class="block_title_box">
						<h1 class="block_title">전문위원회 기본 설정</h1>
					</div>
					<div class="section_utile_box type03">
						<div class="meta_form_title">
							<c:if test="${fn:length(haveTechList) == 1 }">
								<c:forEach items="${haveTechList}" var="haveTech" varStatus="htechhis">
									<input type="hidden" id="expTechCode" value="${haveTech.techId}">
									<p><span class="expTechNm">${haveTech.techName}</span>분야 전문위원회 구성</p>
								</c:forEach>
							</c:if>
							<c:if test="${fn:length(haveTechList) != 1 }">
								<input type="hidden" id="expTechCode" value="${haveTech.techId}">
								<p><span class="expTechNm"></span> 분야 전문위원회 구성</p>
							</c:if>
						</div>
					</div>
					<c:if test="${fn:length(haveTechList) != 1 }">
						<div class="section_utile_box type05">
							<a href="javascript:expFormReset()" class="util_chk">기술 분야 변경</a>
						</div>
					</c:if>
					<div class="content_section nct_scroll">
						<div class="nct_bro_item type_03 exp_setup_wrap "><!--in_meeting / in_writing-->
							<!-- <div class="item_label">
								<p>위원회 관리 제목</p>
							</div>
							<div class="item_box">
								<input type="text" id="schCompay" class="company_search_input" value="" placeholder="위원회 관리 제목을 입력하세요." autocomplete="off">
							</div>
							<div class="item_tap type01"></div> -->
							<div class="nct_bro_inner">
								<div>
									<div class="item_label">
										<p>위원회 통합 회차</p>
									</div>
									<div class="item_box"> 
										<input type="text" id="newExpAllNo" class="base_input no_only" value="" autocomplete="off" />
									</div>
								</div>
								<div class="item_row_tap"></div>
								<div>
									<div class="item_label">
										<p>기술 분야별 회차</p>
									</div>
									<div class="item_box"> 
										<input type="text" id="newExpSecNo" class="base_input no_only" value="" autocomplete="off" />
									</div>
								</div>
							</div>
							<div class="item_tap type01"></div>
							<div class="item_label">
								<p>위원회 유형</p>
							</div>
							<div class="item_box"> 
								<input type="hidden" name="expComType" id="expComType" value="">
								<ul id="expcom_type_list" class="expcom_type_list">
									<li><a href="#none" class="expcom_type_item" data-exptype="EXPM">대면</a></li>
									<li><a href="#none" class="expcom_type_item" data-exptype="EXPW">서면</a></li>
								</ul>
							</div>
							<div class="item_tap type01 dateSet01"></div>
							<div class="item_label dateSet01">
								<p class="exp_com_type_tit">참석여부 조사기간</p>
							</div>
							<div class="nct_bro_inner dateSet01">
								<div class="DateLength">
									<div class="item_box DateForm"> 
										<input type="text" id="str_date" name="str_date" class="base_input DateFormI" placeholder="시작일 설정" data-language="en" autocomplete="off">
	                    				<a href="#none" class="DateH">00</a>
	                    				<input type="hidden" id="str_dateH" class="DateHD" name="str_dateH " value="00">
	                    				<div class="HourPick AutoH01" style="display: none;">
	                    					<ul class="HourPickList">
	                    						<li><a href="#none" class="HourPickItem" data-selhour="08">08</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="09">09</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="10">10</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="11">11</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="12">12</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="13">13</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="14">14</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="15">15</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="16">16</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="17">17</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="18">18</a></li>
	                    					</ul>
	                    				</div>
	                    				<div class="DateD">:</div>
	                    				<a href="#none" class="DateM">00</a>
	                    				<input type="hidden" id="str_dateM" class="DateMD" name="str_dateM" value="00">
		                    			<div class="MinPick AutoH01" style="display: none;">
	                    					<ul class="MinPickList">
	                    						<li><a href="#none" class="MinPickItem" data-selmin="00">00</a></li>
	                    						<li><a href="#none" class="MinPickItem" data-selmin="10">10</a></li>
	                    						<li><a href="#none" class="MinPickItem" data-selmin="20">20</a></li>
	                    						<li><a href="#none" class="MinPickItem" data-selmin="30">30</a></li>
	                    						<li><a href="#none" class="MinPickItem" data-selmin="40">40</a></li>
	                    						<li><a href="#none" class="MinPickItem" data-selmin="50">50</a></li>
	                    					</ul>
	                    				</div>
									</div>
								</div>
								<div class="item_row_tap"></div>
								<div class="DateLength ">
									<div class="item_box DateForm"> 
										<input type="text" id="end_date" name="end_date" class="base_input DateFormI" placeholder="종료일 설정" data-language="en" autocomplete="off">
	                    				<input type="hidden" id="end_dateH" class="DateHD" name="end_dateH " value="00">
	                    				<a href="#none" class="DateH">00</a>
	                    				<div class="HourPick AutoH01" style="display: none;">
	                    					<ul class="HourPickList">
	                    						<li><a href="#none" class="HourPickItem" data-selhour="08">08</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="09">09</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="10">10</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="11">11</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="12">12</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="13">13</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="14">14</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="15">15</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="16">16</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="17">17</a></li>
	                    						<li><a href="#none" class="HourPickItem" data-selhour="18">18</a></li>
	                    					</ul>
	                    				</div>
	                    				<div class="DateD">:</div>
	                    				<input type="hidden" id="end_dateM" class="DateMD" name="end_dateM" value="00">
	                    				<a href="#none" class="DateM">00</a>
		                    			<div class="MinPick AutoH01" style="display: none;">
	                    					<ul class="MinPickList">
	                    						<li><a href="#none" class="MinPickItem" data-selmin="00">00</a></li>
	                    						<li><a href="#none" class="MinPickItem" data-selmin="10">10</a></li>
	                    						<li><a href="#none" class="MinPickItem" data-selmin="20">20</a></li>
	                    						<li><a href="#none" class="MinPickItem" data-selmin="30">30</a></li>
	                    						<li><a href="#none" class="MinPickItem" data-selmin="40">40</a></li>
	                    						<li><a href="#none" class="MinPickItem" data-selmin="50">50</a></li>
	                    					</ul>
	                    				</div>
									</div>
								</div>
							</div>
							<div class="item_tap type01 dateSet02"></div>
							<div class="item_label dateSet02">
								<p>개최후보일1</p>
							</div>
							<div class="item_box DateLength dateSet02"> 
								<div class="DateForm DateFormL">
                    				<input type="text" id="DateNom01" name="nomedate01" class="base_input DateFormI" placeholder="후보일1" data-language="en" autocomplete="off">
                    				<a href="#none" class="DateH">00</a>
                    				<input type="hidden" id="can_date1H" class="DateHD" name="nomedateH01 " value="00">
                    				<div class="HourPick AutoH01" style="display: none;">
                    					<ul class="HourPickList">
                    						<li><a href="#none" class="HourPickItem" data-selhour="08">08</a></li>
                    						<li><a href="#none" class="HourPickItem" data-selhour="09">09</a></li>
                    						<li><a href="#none" class="HourPickItem" data-selhour="10">10</a></li>
                    						<li><a href="#none" class="HourPickItem" data-selhour="11">11</a></li>
                    						<li><a href="#none" class="HourPickItem" data-selhour="12">12</a></li>
                    						<li><a href="#none" class="HourPickItem" data-selhour="13">13</a></li>
                    						<li><a href="#none" class="HourPickItem" data-selhour="14">14</a></li>
                    						<li><a href="#none" class="HourPickItem" data-selhour="15">15</a></li>
                    						<li><a href="#none" class="HourPickItem" data-selhour="16">16</a></li>
                    						<li><a href="#none" class="HourPickItem" data-selhour="17">17</a></li>
                    						<li><a href="#none" class="HourPickItem" data-selhour="18">18</a></li>
                    					</ul>
                    				</div>
                    				<div class="DateD">:</div>
                    				<a href="#none" class="DateM">00</a>
                    				<input type="hidden" id="can_date1M" class="DateMD" name="nomedateM01" value="00">
	                    			<div class="MinPick AutoH01" style="display: none;">
                    					<ul class="MinPickList">
                    						<li><a href="#none" class="MinPickItem" data-selmin="00">00</a></li>
                    						<li><a href="#none" class="MinPickItem" data-selmin="10">10</a></li>
                    						<li><a href="#none" class="MinPickItem" data-selmin="20">20</a></li>
                    						<li><a href="#none" class="MinPickItem" data-selmin="30">30</a></li>
                    						<li><a href="#none" class="MinPickItem" data-selmin="40">40</a></li>
                    						<li><a href="#none" class="MinPickItem" data-selmin="50">50</a></li>
                    					</ul>
                    				</div>
                    			</div>
                    			<input type="text" class="base_input DateFormT" id="can_addr1" name="nomedateK01" value="" placeholder="장소를 입력해주세요.">
							</div>
							<div class="item_tap type01 dateSet02"></div>
							<div class="item_label dateSet02">
								<p>개최후보일2</p>
							</div>
							<div class="item_box DateLength dateSet02"> 
								<div class="DateForm DateFormL">
                    				<input type="text" id="DateNom02" name="nomedate02" class="base_input DateFormI" placeholder="후보일2" data-language="en" autocomplete="off">
                    				<a href="#none" class="DateH">00</a>
                    				<input type="hidden" id="can_date2H" class="DateHD" name="nomedateH02 " value="00">
                    				<div class="HourPick AutoH01" style="display: none;">
                    					<ul class="HourPickList">
                    						<li><a href="#none" class="HourPickItem" data-selhour="08">08</a></li>
                    						<li><a href="#none" class="HourPickItem" data-selhour="09">09</a></li>
                    						<li><a href="#none" class="HourPickItem" data-selhour="10">10</a></li>
                    						<li><a href="#none" class="HourPickItem" data-selhour="11">11</a></li>
                    						<li><a href="#none" class="HourPickItem" data-selhour="12">12</a></li>
                    						<li><a href="#none" class="HourPickItem" data-selhour="13">13</a></li>
                    						<li><a href="#none" class="HourPickItem" data-selhour="14">14</a></li>
                    						<li><a href="#none" class="HourPickItem" data-selhour="15">15</a></li>
                    						<li><a href="#none" class="HourPickItem" data-selhour="16">16</a></li>
                    						<li><a href="#none" class="HourPickItem" data-selhour="17">17</a></li>
                    						<li><a href="#none" class="HourPickItem" data-selhour="18">18</a></li>
                    					</ul>
                    				</div>
                    				<div class="DateD">:</div>
                    				<a href="#none" class="DateM">00</a>
                    				<input type="hidden" id="can_date2M" class="DateMD" name="nomedateM02" value="00">
	                    			<div class="MinPick AutoH01" style="display: none;">
                    					<ul class="MinPickList">
                    						<li><a href="#none" class="MinPickItem" data-selmin="00">00</a></li>
                    						<li><a href="#none" class="MinPickItem" data-selmin="10">10</a></li>
                    						<li><a href="#none" class="MinPickItem" data-selmin="20">20</a></li>
                    						<li><a href="#none" class="MinPickItem" data-selmin="30">30</a></li>
                    						<li><a href="#none" class="MinPickItem" data-selmin="40">40</a></li>
                    						<li><a href="#none" class="MinPickItem" data-selmin="50">50</a></li>
                    					</ul>
                    				</div>
                    			</div>
                    			<input type="text" class="base_input DateFormT" id="can_addr2" name="nomedateK02" value="" placeholder="장소를 입력해주세요.">
							</div>
							<div class="item_tap type01 dateSet02"></div>
							<div class="item_label dateSet02">
								<p>개최후보일3</p>
							</div>
							<div class="item_box DateLength dateSet02"> 
								<div class="DateForm DateFormL">
                    				<input type="text" id="DateNom03" name="nomedate03" class="base_input DateFormI" placeholder="후보일3" data-language="en" autocomplete="off">
                    				<a href="#none" class="DateH">00</a>
                    				<input type="hidden" id="can_date3H" class="DateHD" name="nomedateH03 " value="00">
                    				<div class="HourPick AutoH01" style="display: none;">
                    					<ul class="HourPickList">
                    						<li><a href="#none" class="HourPickItem" data-selhour="08">08</a></li>
                    						<li><a href="#none" class="HourPickItem" data-selhour="09">09</a></li>
                    						<li><a href="#none" class="HourPickItem" data-selhour="10">10</a></li>
                    						<li><a href="#none" class="HourPickItem" data-selhour="11">11</a></li>
                    						<li><a href="#none" class="HourPickItem" data-selhour="12">12</a></li>
                    						<li><a href="#none" class="HourPickItem" data-selhour="13">13</a></li>
                    						<li><a href="#none" class="HourPickItem" data-selhour="14">14</a></li>
                    						<li><a href="#none" class="HourPickItem" data-selhour="15">15</a></li>
                    						<li><a href="#none" class="HourPickItem" data-selhour="16">16</a></li>
                    						<li><a href="#none" class="HourPickItem" data-selhour="17">17</a></li>
                    						<li><a href="#none" class="HourPickItem" data-selhour="18">18</a></li>
                    					</ul>
                    				</div>
                    				<div class="DateD">:</div>
                    				<a href="#none" class="DateM">00</a>
                    				<input type="hidden" id="can_date3M" class="DateMD" name="nomedateM03" value="00">
	                    			<div class="MinPick AutoH01" style="display: none;">
                    					<ul class="MinPickList">
                    						<li><a href="#none" class="MinPickItem" data-selmin="00">00</a></li>
                    						<li><a href="#none" class="MinPickItem" data-selmin="10">10</a></li>
                    						<li><a href="#none" class="MinPickItem" data-selmin="20">20</a></li>
                    						<li><a href="#none" class="MinPickItem" data-selmin="30">30</a></li>
                    						<li><a href="#none" class="MinPickItem" data-selmin="40">40</a></li>
                    						<li><a href="#none" class="MinPickItem" data-selmin="50">50</a></li>
                    					</ul>
                    				</div>
                    			</div>
                    			<input type="text" class="base_input DateFormT" id="can_addr3" name="nomedateK03" value="" placeholder="장소를 입력해주세요.">
							</div>
						</div>
					</div>
				</div>
			</div>
		
		
		
			<div class="browser_col_tap tap01"></div>
			
			
			
			<div class="sub_browser side_dual ">
				
				<div class="sub_child">
					<div id="expComAgd" class="browser_block "><!-- add_agd_result -->
						
						<div class="block_title_box type02">
							<h1 class="block_title">전문위원회  안건 설정</h1>
						</div>
						<div class="section_utile_box type03">
							<div class="agd_add_cnt_box">
								<input type="hidden" name="expAgdCnt" id="expAgdCnt" value="0">
								<a href="javascript:void(0);" class="agd_tap_allitem chkOn">
									<span class="cnt_tit">전체 안건</span>
									<span class="cnt all_cnt">0</span>
								</a>
							</div>
							<ul class="agd_add_list_type">
								<li class=""><a href="#none" class="chkOn list_type_item all"></a></li>
								<li><a href="#none" class="list_type_item one"><span></span></a></li>
							</ul>
						</div>
						<div class="add_agd_no_box">
							<div class="content_alert_box type01"> 
								<p>위원회에 포함될 구성원을 등록 해주세요.</p>
							</div>
						</div>
						<div class="content_section add_agd_box nct_scroll">
							<div class="nct_bro_item type_04 ">
								<ul class="com_agd_add_list">
									
								</ul>
							</div>
						</div>
						<div class="browser_con_btn_box">
							<a href="javascript:loadExpAgdPopup();" class="con_btn">안건 등록</a>
						</div>
					</div>
				</div>
				
				
				
			
				<div class="browser_col_tap tap02"></div>
				
				
				
				<div class="sub_child" style="max-width:400px;">
					<div id="ExpComMember" class="browser_block"><!-- add_mem_result -->
						<div class="block_title_box type02">
							<h1 class="block_title">전문위원회  구성원 설정</h1>
						</div>
						<div class="section_utile_box type04">
							<div class="mem_add_cnt_box">
								<input type="hidden" name="addMemCtn" id="addMemCtn" value="0">
								<a href="javascript:void(0);" class="mem_tap_allitem chkOn">
									<span class="cnt_tit">전체</span>
									<span class="cnt all_cnt">0</span>
								</a>
								<ul class="com_mem_tap_list t1">
									<li>
										<a href="javascript:void(0);" class="mem_tap_item chkOn">
											<span class="cnt_tit">소관과</span>
										 	<span class="cnt adm04_cnt">0</span>
										</a>
									</li>
									<li>
										<a href="javascript:void(0);" class="mem_tap_item chkOn">
											<span class="cnt_tit">기밀보호센터</span>
										 	<span class="cnt adm03_cnt">0</span>
										</a>
									</li>
									<li>
										<a href="javascript:void(0);" class="mem_tap_item chkOn">
											<span class="cnt_tit">전문위원</span>
											<span class="cnt adm05_cnt">0</span>
										</a>
									</li>
									<li>
										<a href="javascript:void(0);" class="mem_tap_item chkOn">
											<span class="cnt_tit">기술간사</span>
											<span class="cnt adm06_cnt">0</span>
										</a>
									</li>
								</ul>	
							</div>
						</div>
						<div class="add_mem_no_box">
							<div class="content_alert_box type01"> 
								<p>위원회에 포함될 구성원을 등록 해주세요.</p>
							</div>
						</div>
						<div class="content_section add_mem_box nct_scroll">
							<div class="nct_bro_item type_04 ">
								<ul class="com_agd_mem_list">
									
								</ul>
							</div>
							
						</div>
						<div class="browser_con_btn_box">
							<a href="javascript:loadExpMemPopup();" class="con_btn">구성원 등록</a>
						</div>	
					</div>
				</div>
				
			</div>
		
			
		
			
		</div>
		
	</div>
</div>		
<div class="nct_footer">
	<a href="javascript:void(0);" class="nct_btn to300">취소</a>
	<a href="javascript:goSaveExp();" class="nct_btn to500">위원회 구성 저장</a>
	<!-- <a href="#none" class="nct_btn">전문위 설정 저장</a>
	<a href="#none" class="nct_btn">전문위 수정 저장</a>
	<a href="#none" class="nct_btn">전문위 목록</a>
	<a href="#none" class="nct_btn">전문위 취소</a>
	<a href="#none" class="nct_btn">참석일 선택</a>
	<a href="#none" class="nct_btn">개최일 확정</a>
	<a href="#none" class="nct_btn">자료 열람</a>
	<a href="#none" class="nct_btn">의견 작성</a>
	<a href="#none" class="nct_btn">전문위 개최</a>
	<a href="#none" class="nct_btn">개최 회수</a>
	<a href="#none" class="nct_btn">전문위 종료</a>
	<a href="#none" class="nct_btn">종료 회수</a>
	<a href="#none" class="nct_btn">기술안보과 이관</a> -->
</div>