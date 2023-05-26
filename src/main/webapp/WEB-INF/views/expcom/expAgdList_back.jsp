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

<div class="nct_content_tap">
	<ul class="nct_top_list">
		<li class="tap_on">
			<a href="javascript:void(0);" class="nct_top_item"  data-status="ALL">
				<p class="nct_tap_tit">전체<p><p class="nct_tap_cnt">2</p>
			</a>
		</li>
		<li class="tap_mar">
			<a href="javascript:void(0);" class="nct_top_item"  data-status="AP">
				<p class="nct_tap_tit">접수완료<p><p class="nct_tap_cnt">2</p>
			</a>
		</li>
		<li>
			<a href="javascript:void(0);" class="nct_top_item"  data-status="RC">
				<p class="nct_tap_tit">소관과이관완료<p><p class="nct_tap_cnt">2</p>
			</a>
		</li>
		<li>
			<a href="javascript:void(0);" class="nct_top_item"  data-status="RA">
				<p class="nct_tap_tit">위원회예정<p><p class="nct_tap_cnt">2</p>
			</a>
		</li>
		<li>
			<a href="javascript:void(0);" class="nct_top_item"  data-status="RJ">
				<p class="nct_tap_tit">위원회진행중<p><p class="nct_tap_cnt">2</p>
			</a>
		</li>
		<li class="tap_mar">
			<a href="javascript:void(0);" class="nct_top_item"  data-status="AC">
				<p class="nct_tap_tit">결과 도출중<p><p class="nct_tap_cnt">2</p>
			</a>
		</li>
		<li>
			<a href="javascript:void(0);" class="nct_top_item"  data-status="RA">
				<p class="nct_tap_tit">최종검토완료<p><p class="nct_tap_cnt">2</p>
			</a>
		</li>
		<li>
			<a href="javascript:void(0);" class="nct_top_item"  data-status="RJ">
				<p class="nct_tap_tit">최종결과확정<p><p class="nct_tap_cnt">2</p>
			</a>
		</li>
		<li>
			<a href="javascript:void(0);" class="nct_top_item"  data-status="AC">
				<p class="nct_tap_tit">재검토확정<p><p class="nct_tap_cnt">2</p>
			</a>
		</li>
	</ul>
	<a href="javascript:void(0);" class="tap_btn commake01">검토 요청</a>
</div>
<div class="nct_list_top_wrap">
	<ul class="nct_list_info">
		<li class="list_num">No.</li>
		<li class="list_type">안건 유형</li>
		<!-- <li class="list_type">소관과</li> -->
		<li class="list_idx">안건 번호(접수 번호)</li>
		<li class="list_body">안건 내용</li>
		<li class="list_stat">진행 상태</li>
	</ul>
</div>
<div class="nct_content_wrap">
	<div class="nct_content_list_body nct_scroll">
		<ul class="nct_content_list_01">
			<li class="noAgd">
				<div class="list_num">
					<p>9,999</p>
					<input type="checkbox" name="agdCheck" class="" value="2023-00000012" style="display:none;">
					<a href="javascript:void(0);" class="AgendaSendChk"></a>
				</div>
				<a href="#none" class="list_item_01">
					<div class="receipt_t_type">
						<p class="type_tit">해외인수·합병 <br>사전검토</p>
					</div>
					<!-- <div class="receipt_t_type" style="margin-left:10px;">
						<p class="type_tit">미정</p>
					</div> -->
					<div class="list_idx">
						2023-02-0002
					</div>
					<div class="list_body">
						<div class="list_tech_box">
							<span class="list_body_tech">자동차ㆍ철도</span> 
							<span class="list_body_technm">하이브리드 및 전력기반 자동차(xEV) 시스템 설계 및 제조기술(제어시스템, 배터리관리시스템, 회생제동시스템, 전기구동시스템(모터, 인버터) 및 공조시스템에 한함)  시스템 설계 및 제조기술(제어시스템, 배터리관리시스템, 회생제동시스템, 전기구동시스템(모터, 인버터) 및 공조시스템에 한함)</span>
						</div>
						<div class="list_body_tit">
							기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 
						</div>
						<div class="list_body_sub">
							한국산업기술 보호 협회 | 접수일 : 2023.03.16 03:46:47
						</div>
					</div>
					
				</a>
				<div class="list_stat">
					<p class="stat stat_agd_01">
						접수완료<br>
						<span class="stat_date">2023.03.16 03:46:47</span>
					</p>
				</div>
			</li>
			<li class="noAgd">
				<div class="list_num">
					<p>9,999</p>
					<input type="checkbox" name="agdCheck" class="" value="2023-00000012" style="display:none;">
					<a href="javascript:void(0);" class="AgendaSendChk"></a>
				</div>
				<a href="#none" class="list_item_01">
					<div class="receipt_t_type">
						<p class="type_tit">해외인수·합병 <br>사전검토</p>
					</div>
					<div class="list_idx">
						<p>(2023-02-0002)</p>
						<p class="rebone_flag">재접수</p>
					</div>
					<div class="list_body">
						<div class="list_tech_box">
							<span class="list_body_tech">자동차ㆍ철도</span> 
							<span class="list_body_technm">하이브리드 및 전력기반 자동차(xEV) 시스템 설계 및 제조기술(제어시스템, 배터리관리시스템, 회생제동시스템, 전기구동시스템(모터, 인버터) 및 공조시스템에 한함)  시스템 설계 및 제조기술(제어시스템, 배터리관리시스템, 회생제동시스템, 전기구동시스템(모터, 인버터) 및 공조시스템에 한함)</span>
						</div>
						<div class="list_body_tit">
							기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 
						</div>
						<div class="list_body_sub">
							한국산업기술 보호 협회 | 접수일 : 2023.03.16 03:46:47
						</div>
					</div>
					
				</a>
				<div class="list_stat">
					<p class="stat stat_agd_01">
						접수완료<br>
						<span class="stat_date">2023.03.16 03:46:47</span>
					</p>
				</div>
			</li>
			<li>
				<div class="list_num">
					9,999
				</div>
				<a href="#none" class="list_item_02">
					
					<div class="receipt_t_type">
						<p class="type_tit">해외인수·합병 <br>사전검토</p>
					</div>
					<div class="list_idx">
						<p>E-2023-02-0002</p>
						<p>(2023-02-0002)</p>
						<p class="rebone_flag">재접수</p>
					</div>
					<div class="list_body">
						<div class="list_tech_box">
							<span class="list_body_tech">자동차ㆍ철도</span> 
							<span class="list_body_technm">하이브리드 및 전력기반 자동차(xEV) 시스템 설계 및 제조기술(제어시스템, 배터리관리시스템, 회생제동시스템, 전기구동시스템(모터, 인버터) 및 공조시스템에 한함)  시스템 설계 및 제조기술(제어시스템, 배터리관리시스템, 회생제동시스템, 전기구동시스템(모터, 인버터) 및 공조시스템에 한함)</span>
						</div>
						<div class="list_body_tit">
							기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 
						</div>
						<div class="list_body_sub">
							한국산업기술 보호 협회 | 접수일 : 2023.03.16 03:46:47
						</div>
					</div>
					
				</a>
				<div class="list_btn_box">
					<a href="#none" class="list_btn backAgd">
						검토 요청 회수
					</a>
				</div>
				<div class="list_stat">
					<p class="stat stat_agd_02">
						소관과 이관 완료<br>
						<span class="stat_date">2023.03.16 03:46:47</span>
					</p>
				</div>
			</li>
			<li>
				<div class="list_num">
					9,999
				</div>
				<a href="#none" class="list_item_01">
					
					<div class="receipt_t_type">
						<p class="type_tit">해외인수·합병 <br>사전검토</p>
					</div>
					<div class="list_idx">
						<p>E-2023-02-0002</p>
						<p>(2023-02-0002)</p>
					</div>
					<div class="list_body">
						<div class="list_tech_box">
							<span class="list_body_tech">자동차ㆍ철도</span> 
							<span class="list_body_technm">하이브리드 및 전력기반 자동차(xEV) 시스템 설계 및 제조기술(제어시스템, 배터리관리시스템, 회생제동시스템, 전기구동시스템(모터, 인버터) 및 공조시스템에 한함)  시스템 설계 및 제조기술(제어시스템, 배터리관리시스템, 회생제동시스템, 전기구동시스템(모터, 인버터) 및 공조시스템에 한함)</span>
						</div>
						<div class="list_body_tit">
							기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 
						</div>
						<div class="list_body_sub">
							한국산업기술 보호 협회 | 접수일 : 2023.03.16 03:46:47
						</div>
					</div>
					
				</a>
				<div class="list_stat">
					<p class="stat stat_agd_03">
						위원회 예정<br>
						<span class="stat_date">2023.03.16 03:46:47</span>
					</p>
				</div>
				
			</li>
			<li>
				<div class="list_num">
					9,999
				</div>
				<a href="#none" class="list_item_01">
					
					<div class="receipt_t_type">
						<p class="type_tit">해외인수·합병 <br>사전검토</p>
					</div>
					<div class="list_idx">
						<p>E-2023-02-0002</p>
						<p>(2023-02-0002)</p>
					</div>
					<div class="list_body">
						<div class="list_tech_box">
							<span class="list_body_tech">자동차ㆍ철도</span> 
							<span class="list_body_technm">하이브리드 및 전력기반 자동차(xEV) 시스템 설계 및 제조기술(제어시스템, 배터리관리시스템, 회생제동시스템, 전기구동시스템(모터, 인버터) 및 공조시스템에 한함)  시스템 설계 및 제조기술(제어시스템, 배터리관리시스템, 회생제동시스템, 전기구동시스템(모터, 인버터) 및 공조시스템에 한함)</span>
						</div>
						<div class="list_body_tit">
							기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 
						</div>
						<div class="list_body_sub">
							한국산업기술 보호 협회 | 접수일 : 2023.03.16 03:46:47
						</div>
					</div>
					
				</a>
				<div class="list_stat">
					<p class="stat stat_agd_04">
						위원회 진행중<br>
						<span class="stat_date">2023.03.16 03:46:47</span>
					</p>
				</div>
			</li>
			<li>
				<div class="list_num">
					9,999
				</div>
				<a href="#none" class="list_item_01">
					
					<div class="receipt_t_type">
						<p class="type_tit">해외인수·합병 <br>사전검토</p>
					</div>
					<div class="list_idx">
						<p>E-2023-02-0002</p>
						<p>(2023-02-0002)</p>
					</div>
					<div class="list_body">
						<div class="list_tech_box">
							<span class="list_body_tech">자동차ㆍ철도</span> 
							<span class="list_body_technm">하이브리드 및 전력기반 자동차(xEV) 시스템 설계 및 제조기술(제어시스템, 배터리관리시스템, 회생제동시스템, 전기구동시스템(모터, 인버터) 및 공조시스템에 한함)  시스템 설계 및 제조기술(제어시스템, 배터리관리시스템, 회생제동시스템, 전기구동시스템(모터, 인버터) 및 공조시스템에 한함)</span>
						</div>
						<div class="list_body_tit">
							기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 
						</div>
						<div class="list_body_sub">
							한국산업기술 보호 협회 | 접수일 : 2023.03.16 03:46:47
						</div>
					</div>
					
				</a>
				<div class="list_stat">
					<p class="stat stat_agd_05">
						결과 도출중<br>
						<span class="stat_date">2023.03.16 03:46:47</span>
					</p>
				</div>
			</li>
			<li>
				<div class="list_num">
					9,999
				</div>
				<a href="#none" class="list_item_02">
					<div class="receipt_t_type">
						<p class="type_tit">해외인수·합병 <br>사전검토</p>
					</div>
					<div class="list_idx">
						<p>E-2023-02-0002</p>
						<p>(2023-02-0002)</p>
					</div>
					<div class="list_body">
						<div class="list_tech_box">
							<span class="list_body_tech">자동차ㆍ철도</span> 
							<span class="list_body_technm">하이브리드 및 전력기반 자동차(xEV) 시스템 설계 및 제조기술(제어시스템, 배터리관리시스템, 회생제동시스템, 전기구동시스템(모터, 인버터) 및 공조시스템에 한함)  시스템 설계 및 제조기술(제어시스템, 배터리관리시스템, 회생제동시스템, 전기구동시스템(모터, 인버터) 및 공조시스템에 한함)</span>
						</div>
						<div class="list_body_tit">
							기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 
						</div>
						<div class="list_body_sub">
							한국산업기술 보호 협회 | 접수일 : 2023.03.16 03:46:47
						</div>
					</div>
					
				</a>
				<div class="list_btn_box">
					<a href="#none" class="list_btn agdCom">
						검토 결과  확정
					</a>
				</div>
				<div class="list_stat">
					<p class="stat stat_agd_06">
						최종검토완료<br>
						<span class="stat_date">2023.03.16 03:46:47</span>
					</p>
				</div>
			</li>
			<li>
				<div class="list_num">
					9,999
				</div>
				<a href="#none" class="list_item_02">
					
					<div class="receipt_t_type">
						<p class="type_tit">해외인수·합병 <br>사전검토</p>
					</div>
					<div class="list_idx">
						<p>E-2023-02-0002</p>
						<p>(2023-02-0002)</p>
					</div>
					<div class="list_body">
						<div class="list_tech_box">
							<span class="list_body_tech">자동차ㆍ철도</span> 
							<span class="list_body_technm">하이브리드 및 전력기반 자동차(xEV) 시스템 설계 및 제조기술(제어시스템, 배터리관리시스템, 회생제동시스템, 전기구동시스템(모터, 인버터) 및 공조시스템에 한함)  시스템 설계 및 제조기술(제어시스템, 배터리관리시스템, 회생제동시스템, 전기구동시스템(모터, 인버터) 및 공조시스템에 한함)</span>
						</div>
						<div class="list_body_tit">
							기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 
						</div>
						<div class="list_body_sub">
							한국산업기술 보호 협회 | 접수일 : 2023.03.16 03:46:47
						</div>
					</div>
					
				</a>
				<div class="list_btn_box">
					<a href="#none" class="list_btn backCom">
						결과 확정 회수
					</a>
				</div>
				<div class="list_stat">
					<p class="stat stat_agd_07">
						최종결과확정<br>
						<span class="stat_date">2023.03.16 03:46:47</span>
					</p>
				</div>
			</li>
			<li>
				<div class="list_num">
					9,999
				</div>
				<a href="#none" class="list_item_01">
					
					<div class="receipt_t_type">
						<p class="type_tit">해외인수·합병 <br>사전검토</p>
					</div>
					<div class="list_idx">
						<p>E-2023-02-0002</p>
						<p>(2023-02-0002)</p>
					</div>
					<div class="list_body">
						<div class="list_tech_box">
							<span class="list_body_tech">자동차ㆍ철도</span> 
							<span class="list_body_technm">하이브리드 및 전력기반 자동차(xEV) 시스템 설계 및 제조기술(제어시스템, 배터리관리시스템, 회생제동시스템, 전기구동시스템(모터, 인버터) 및 공조시스템에 한함)  시스템 설계 및 제조기술(제어시스템, 배터리관리시스템, 회생제동시스템, 전기구동시스템(모터, 인버터) 및 공조시스템에 한함)</span>
						</div>
						<div class="list_body_tit">
							기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 기술 명칭 
						</div>
						<div class="list_body_sub">
							한국산업기술 보호 협회 | 접수일 : 2023.03.16 03:46:47
						</div>
					</div>
					
				</a>
				<div class="list_stat">
					<p class="stat stat_agd_08">
						재검토확정<br>
						<span class="stat_date">2023.03.16 03:46:47</span>
					</p>
				</div>
			</li>
			
		</ul>
		
		<!-- <div class="nct_testdiv">
		바디
		</div> -->
	</div>
</div>		
<div class="nct_footer">
	---
</div>