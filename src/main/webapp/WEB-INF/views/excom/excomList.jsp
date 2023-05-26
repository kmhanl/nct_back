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
	<!-- <a href="#none" class="sch_btn">
						<svg version="1.1" id="Capa_1" x="0px" y="0px" fill="#888" viewBox="0 0 124.524 124.524" xml:space="preserve">
							<path d="M51,102.05c10.5,0,20.2-3.2,28.3-8.6l29.3,29.3c2.301,2.3,6.101,2.3,8.5,0l5.7-5.7c2.3-2.3,2.3-6.1,0-8.5L93.4,79.35		c5.399-8.1,8.6-17.8,8.6-28.3c0-28.1-22.9-51-51-51c-28.1,0-51,22.9-51,51C0,79.149,22.8,102.05,51,102.05z M51,20.05
		c17.1,0,31,13.9,31,31c0,17.1-13.9,31-31,31c-17.1,0-31-13.9-31-31C20,33.95,33.9,20.05,51,20.05z"></path>
						</svg>
				</a> -->
	<ul class="nct_top_list">
		<li class="tap_on">
			<a href="javascript:void(0);" class="nct_top_item "  data-status="ALL">
				<p class="nct_tap_tit">전체<p><p class="nct_tap_cnt">2</p>
			</a>
			
		</li>
		<li class="stat_re_01">
			<a href="javascript:void(0);" class="nct_top_item"  data-status="AP">
				<p class="nct_tap_tit">접수검토<p><p class="nct_tap_cnt">2</p>
			</a>
			<div class="tap_tip">
				<p>접수 검토</p>
				<p>대상기업의 접수 신청이 완료된 상태로 접수여부를 검토하여 승인이 필요한 신청건입니다.</p>
			</div>
		</li>
		<li class="stat_re_02">
			<a href="javascript:void(0);" class="nct_top_item"  data-status="RC">
				<p class="nct_tap_tit">접수완료<p><p class="nct_tap_cnt">2</p>
			</a>
		</li>
		<li class="stat_re_03">
			<a href="javascript:void(0);" class="nct_top_item"  data-status="RA">
				<p class="nct_tap_tit">재접수요청<p><p class="nct_tap_cnt">2</p>
			</a>
		</li>
		<li class="stat_re_04">
			<a href="javascript:void(0);" class="nct_top_item"  data-status="RJ">
				<p class="nct_tap_tit">접수반려<p><p class="nct_tap_cnt">2</p>
			</a>
		</li>
		<li class="stat_re_05">
			<a href="javascript:void(0);" class="nct_top_item"  data-status="AC">
				<p class="nct_tap_tit">접수철회<p><p class="nct_tap_cnt">2</p>
			</a>
		</li>
	</ul>
	<a href="javascript:void(0);" class="tap_btn commake01" data-user-group="AMG04" data-user-tech="KTS00701">위원회구성</a>
</div>
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
</div>

<div class="nct_content_tap">
	<ul class="nct_top_list">
		<li class="tap_on">
			<a href="javascript:void(0);" class="nct_top_item"  data-status="ALL">
				<p class="nct_tap_tit">전체<p><p class="nct_tap_cnt">992</p>
			</a>
		</li>
		<li>
			<a href="javascript:void(0);" class="nct_top_item"  data-status="AP">
				<p class="nct_tap_tit">전문위예정<p><p class="nct_tap_cnt">2</p>
			</a>
		</li>
		<li>
			<a href="javascript:void(0);" class="nct_top_item"  data-status="RC">
				<p class="nct_tap_tit">전문위진행중<p><p class="nct_tap_cnt">2</p>
			</a>
		</li>
		<li>
			<a href="javascript:void(0);" class="nct_top_item"  data-status="RA">
				<p class="nct_tap_tit">결과도출중<p><p class="nct_tap_cnt">2</p>
			</a>
		</li>
		<li>
			<a href="javascript:void(0);" class="nct_top_item"  data-status="RJ">
				<p class="nct_tap_tit">최종검토완료<p><p class="nct_tap_cnt">2</p>
			</a>
		</li>
	</ul>
</div>
<div class="nct_list_top_wrap">
	<ul class="nct_list_info">
		<li class="list_num">No.</li>
		<li class="list_idx">접수유형</li>
		<li class="list_idx">접수번호</li>
		<li class="list_body">신청 내용</li>
		<li class="list_stat">진행상태</li>
	</ul>
</div>
<div class="nct_content_wrap">
	<div class="nct_content_list_body nct_scroll">
		<ul class="nct_content_list_01">
			
			<li>
				<a href="#none" class="list_item_01">
					<div class="list_num">
						9,999
					</div>
					<div class="receipt_t_type">
						<p class="type_tit">해외인수·합병 <br>사전검토</p>
					</div>
					<div class="list_idx">
						2023-02-0002
					</div>
					<div class="list_body">
						<div class="" style="font-size:14px; color:#888;font-weight:200;">
							[반도체] 기술 분야
						</div>
						<div class="" style="font-size:16px;">
							기술 명칭 기술 명칭 
						</div>
						<div class="" style="font-size:14px; color:#888;font-weight:200;">
							한국산업기술 보호 협회 |접수일 : 2023년 03월 16일 3:46:47
						</div>
					</div>
					<div class="list_stat">
						<p class="stat stat_re_01">접수검토</p>
					</div>
				</a>
			</li>
			<li>
				<a href="#none" class="list_item_01">
					<div class="list_num">
						9,999
					</div>
					<div class="receipt_t_type">
						<p class="type_tit">여부판정</p>
					</div>
					<div class="list_idx">
						2023-02-0002
					</div>
					<div class="list_body">
						<div class="" style="font-size:14px; color:#888;font-weight:200;">
							[반도체] 기술 분야
						</div>
						<div class="" style="font-size:16px;">
							기술 명칭 기술 명칭 
						</div>
						<div class="" style="font-size:14px; color:#888;font-weight:200;">
							한국산업기술 보호 협회 |접수일 : 2023년 03월 16일 3:46:47
						</div>
					</div>
					<div class="list_stat">
						<p class="stat stat_re_02">접수완료</p>
					</div>
				</a>
			</li>
			<li>
				<a href="#none" class="list_item_01">
					<div class="list_num">
						9,999
					</div>
					<div class="receipt_t_type">
						<p class="type_tit">여부판정</p>
					</div>
					<div class="list_idx">
						2023-02-0002
					</div>
					<div class="list_body">
						<div class="" style="font-size:14px; color:#888;font-weight:200;">
							[반도체] 기술 분야
						</div>
						<div class="" style="font-size:16px;">
							기술 명칭 기술 명칭 
						</div>
						<div class="" style="font-size:14px; color:#888;font-weight:200;">
							한국산업기술 보호 협회 |접수일 : 2023년 03월 16일 3:46:47
						</div>
					</div>
					<div class="list_stat">
						<p class="stat stat_re_03">재접수요청</p>
					</div>
				</a>
			</li>
			<li>
				<a href="#none" class="list_item_01">
					<div class="list_num">
						9,999
					</div>
					<div class="receipt_t_type">
						<p class="type_tit">여부판정</p>
					</div>
					<div class="list_idx">
						2023-02-0002
					</div>
					<div class="list_body">
						<div class="" style="font-size:14px; color:#888;font-weight:200;">
							[반도체] 기술 분야
						</div>
						<div class="" style="font-size:16px;">
							기술 명칭 기술 명칭 
						</div>
						<div class="" style="font-size:14px; color:#888;font-weight:200;">
							한국산업기술 보호 협회 |접수일 : 2023년 03월 16일 3:46:47
						</div>
					</div>
					<div class="list_stat">
						<p class="stat stat_re_04">접수반려</p>
					</div>
				</a>
			</li>
			<li>
				<a href="#none" class="list_item_01">
					<div class="list_num">
						9,999
					</div>
					<div class="receipt_t_type">
						<p class="type_tit">여부판정</p>
					</div>
					<div class="list_idx">
						2023-02-0002
					</div>
					<div class="list_body">
						<div class="" style="font-size:14px; color:#888;font-weight:200;">
							[반도체] 기술 분야
						</div>
						<div class="" style="font-size:16px;">
							기술 명칭 기술 명칭 
						</div>
						<div class="" style="font-size:14px; color:#888;font-weight:200;">
							한국산업기술 보호 협회 |접수일 : 2023년 03월 16일 3:46:47
						</div>
					</div>
					<div class="list_stat">
						<p class="stat stat_re_05">접수철회</p>
					</div>
				</a>
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