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
		<li class="list_body">위원회 내용</li>
		<li class="list_stat">진행 상태</li>
	</ul>
</div>
<div class="nct_content_wrap">
	<div class="nct_content_list_body nct_scroll">
		<ul class="nct_content_list_01">
			<li>
				<div class="list_num">
					9,999
				</div>
				<a href="#none" class="list_item_05">
					
					<div class="list_body02">
						<div class="list_body_tit02">
							<span style="float:left;color:#4d84ff">[대면]</span><span class="list_body_exptit">2023년 5회차<span style="color:#4d84ff"> 반도체 </span>전문위원회 (통합 2023년 5회차 전문위원회)</span>
						</div>
						<div class="list_body_sub">
							등록일 : 2023-03-23 15:34:38 | 참석일 선택 기간 : 2023-03-23 10:00 ~ 2023-03-31 18:00
						</div>
						<div class="list_dpstat">
							자료 열람 기간 : 2023-03-21 00:00 ~ 2023-03-31 23:59
						</div>
					</div>
					
				</a>
				<div class="list_btn_box list_btn_box02" style="width:auto;flex-direction: inherit;width: 423px;margin-right: 15px;">
					<a href="#none" class="list_btn canEx" style="width:100px;margin:2px;">
						전문위 취소
					</a>
					<a href="#none" class="list_btn viewExp" style="width:100px;margin:2px;">
						자료 열람
					</a>
					<a href="#none" class="list_btn goExp" style="width:100px;margin:2px;">
						전문위 개최
					</a>
				</div>
				<div class="list_expstat">
					<p class="expstat stat_exp_01">
						전문위 예정<br>
					</p>
				</div>
			</li>
			<li>
				<div class="list_num">
					9,999
				</div>
				<a href="#none" class="list_item_05">
					
					<div class="list_body02">
						<div class="list_body_tit02">
							<span style="float:left;color:#4d84ff">[대면]</span><span class="list_body_exptit">2023년 5회차<span style="color:#4d84ff"> 반도체 </span>전문위원회 (통합 2023년 5회차 전문위원회)</span>
						</div>
						<div class="list_body_sub">
							등록일 : 2023-03-23 15:34:38 | 참석일 선택 기간 : 2023-03-23 10:00 ~ 2023-03-31 18:00
						</div>
						<div class="list_dpstat">
							자료 열람 기간 : 2023-03-21 00:00 ~ 2023-03-31 23:59
						</div>
					</div>
					
				</a>
				<div class="list_btn_box list_btn_box02" style="width:auto;flex-direction: inherit;width: 423px;margin-right: 15px;">
					<a href="#none" class="list_btn canEx" style="width:100px;margin:2px;">
						전문위 취소
					</a>
					<a href="#none" class="list_btn viewExp" style="width:100px;margin:2px;">
						자료 열람
					</a>
					<a href="#none" class="list_btn goExp" style="width:100px;margin:2px;">
						전문위 개최
					</a>
				</div>
				<div class="list_expstat">
					<p class="expstat stat_exp_01">
						전문위 예정<br>
					</p>
				</div>
			</li>
			<li>
				<div class="list_num">
					9,999
				</div>
				<a href="#none" class="list_item_05">
					
					<div class="list_body02">
						<div class="list_body_tit02">
							<span style="float:left;color:#4d84ff">[대면]</span><span class="list_body_exptit">2023년 5회차<span style="color:#4d84ff"> 반도체 </span>전문위원회 (통합 2023년 5회차 전문위원회)</span>
						</div>
						<div class="list_body_sub">
							등록일 : 2023-03-23 15:34:38 | 참석일 선택 기간 : 2023-03-23 10:00 ~ 2023-03-31 18:00
						</div>
						<div class="list_dpstat">
							의견 작성 기간 : 2023-03-21 00:00 ~ 2023-03-31 23:59
						</div>
					</div>
					
				</a>
				<div class="list_btn_box list_btn_box02" style="width:auto;flex-direction: inherit;width: 423px;margin-right: 15px;">
					<a href="#none" class="list_btn backExp" style="width:100px;margin:2px;">
						개최 회수
					</a>
					<a href="#none" class="list_btn writeExp" style="width:100px;margin:2px;">
						의견 작성
					</a>
					<a href="#none" class="list_btn endExp" style="width:100px;margin:2px;">
						전문위 종료
					</a>
				</div>
				<div class="list_expstat">
					<p class="expstat stat_exp_02">
						전문위 진행중<br>
					</p>
				</div>
			</li>
			<li>
				<div class="list_num">
					9,999
				</div>
				<a href="#none" class="list_item_05">
					
					<div class="list_body02">
						<div class="list_body_tit02">
							<span style="float:left;color:#4d84ff">[대면]</span><span class="list_body_exptit">2023년 5회차<span style="color:#4d84ff"> 반도체 </span>전문위원회 (통합 2023년 5회차 전문위원회)</span>
						</div>
						<div class="list_body_sub">
							등록일 : 2023-03-23 15:34:38 | 참석일 선택 기간 : 2023-03-23 10:00 ~ 2023-03-31 18:00
						</div>
						<div class="list_dpstat">
							자료 열람 기간 : 2023-03-21 00:00 ~ 2023-03-31 23:59
						</div>
					</div>
					
				</a>
				<div class="list_btn_box list_btn_box02" style="width:auto;flex-direction: inherit;width: 423px;margin-right: 15px;">
					<a href="#none" class="list_btn endbackExp" style="width:100px;margin:2px;">
						종료 회수
					</a>
					<a href="#none" class="list_btn viewExp" style="width:100px;margin:2px;">
						자료 열람
					</a>
					<a href="#none" class="list_btn sendExp" style="width:100px;margin:2px;">
						기술안보과 이관
					</a>
				</div>
				<div class="list_expstat">
					<p class="expstat stat_exp_03">
					 	결과 도출중<br>
					</p>
				</div>
			</li>
			<li>
				<div class="list_num">
					9,999
				</div>
				<a href="#none" class="list_item_05" style="width:calc(100% - 538px)">
					
					<div class="list_body02">
						<div class="list_body_tit02">
							<span style="float:left;color:#4d84ff">[대면]</span><span class="list_body_exptit">2023년 5회차<span style="color:#4d84ff"> 반도체 </span>전문위원회 (통합 2023년 5회차 전문위원회)</span>
						</div>
						<div class="list_body_sub">
							등록일 : 2023-03-23 15:34:38 | 참석일 선택 기간 : 2023-03-23 10:00 ~ 2023-03-31 18:00
						</div>
						<div class="list_dpstat">
							자료 열람 기간 : 2023-03-21 00:00 ~ 2023-03-31 23:59
						</div>
					</div>
					
				</a>
				<div class="list_btn_box list_btn_box02" style="width:auto;flex-direction: inherit;width: 282px;margin-right: 15px;">
					<a href="#none" class="list_btn returnExp" style="width:100px;margin:2px;">
						이관 회수
					</a>
					<a href="#none" class="list_btn viewExp" style="width:100px;margin:2px;">
						자료 열람
					</a>
				</div>
				<div class="list_expstat">
					<p class="expstat stat_exp_04">
						최종검토완료<br>
					</p>
				</div>
			</li>
			<li>
				<div class="list_num">
					9,999
				</div>
				<a href="#none" class="list_item_05" style="width:calc(100% - 399px)">
					
					<div class="list_body02">
						<div class="list_body_tit02">
							<span style="float:left;color:#4d84ff">[대면]</span><span class="list_body_exptit">2023년 5회차<span style="color:#4d84ff"> 반도체 </span>전문위원회 (통합 2023년 5회차 전문위원회)</span>
						</div>
						<div class="list_body_sub">
							등록일 : 2023-03-23 15:34:38 | 참석일 선택 기간 : 2023-03-23 10:00 ~ 2023-03-31 18:00
						</div>
						<div class="list_dpstat">
							자료 열람 기간 : 2023-03-21 00:00 ~ 2023-03-31 23:59
						</div>
					</div>
					
				</a>
				<div class="list_btn_box list_btn_box02" style="width:auto;flex-direction: inherit;width: 141px;margin-right: 15px;">
					<a href="#none" class="list_btn viewExp" style="width:100px;margin:2px;">
						자료 열람
					</a>
				</div>
				<div class="list_expstat">
					<p class="expstat stat_exp_04">
						최종검토완료<br>
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