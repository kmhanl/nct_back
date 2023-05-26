<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 현재 년도 날짜 -->
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="nowDate"><fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" /></c:set>
<c:set var="nowDateChk"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd 00:00:00" /></c:set>


<script type="text/javascript" src="/resources/js/expert/datepickPopup.js"></script>
<script type="text/javascript" src="/resources/js/expert/datepickList.js"></script>		

<div class="nct_content_tap">
	<ul class="nct_top_list">
		<c:set var="statTotal" value="0"></c:set>
		<c:set var="statRec100" value="0"></c:set>
		<c:set var="statRec200" value="0"></c:set>
		<c:set var="statRec300" value="0"></c:set>
		<c:set var="statRec400" value="0"></c:set>
		<c:set var="statRec500" value="0"></c:set>
		<c:set var="statRec600" value="0"></c:set>
		<c:set var="statRec700" value="0"></c:set>
		
		<c:forEach items="${topTap}" var="item">
			<c:set var="statTotal" value = "${statTotal + item.count}"/>
			<c:choose>
				<c:when test="${item.title eq 'REC100'}">
					<c:set var="statRec100" value = "${item.count}"/>
				</c:when>
				<c:when test="${item.title eq 'REC200'}">
					<c:set var="statRec200" value = "${item.count}"/>
				</c:when>
				<c:when test="${item.title eq 'REC300'}">
					<c:set var="statRec300" value = "${item.count}"/>
				</c:when>
				<c:when test="${item.title eq 'REC400'}">
					<c:set var="statRec400" value = "${item.count}"/>
				</c:when>
				<c:when test="${item.title eq 'REC500'}">
					<c:set var="statRec500" value = "${item.count}"/>
				</c:when>
				<c:when test="${item.title eq 'REC600'}">
					<c:set var="statRec600" value = "${item.count}"/>
				</c:when>
				<c:when test="${item.title eq 'REC700'}">
					<c:set var="statRec700" value = "${item.count}"/>
				</c:when>
			</c:choose>
		</c:forEach>
		<li class="${param.status eq null ? 'tap_on' : '' }">
			<a href="/expcom/expRecList.do" class="nct_top_item "  data-status="ALL">
				<p class="nct_tap_tit">전체</p><p class="nct_tap_cnt">${statTotal}</p>
			</a>
		</li>
		<li class="${param.status eq 'REC200' ? 'tap_on' : '' } stat_REC200">
			<a href="/expcom/expRecList.do?status=REC200" class="nct_top_item">
				<p class="nct_tap_tit">접수검토</p>
				<p class="nct_tap_cnt">${statRec200}</p>
			</a>
			<!-- <div class="tap_tip">
				<p>접수 검토</p>
				<p>대상기업의 접수 신청이 완료된 상태로 접수여부를 검토하여 승인이 필요한 신청건입니다.</p>
			</div> -->
		</li>
		<li class="${param.status eq 'REC500' ? 'tap_on' : '' } stat_REC500">
			<a href="/expcom/expRecList.do?status=REC500" class="nct_top_item">
				<p class="nct_tap_tit">접수완료</p><p class="nct_tap_cnt">${statRec500}</p>
			</a>
		</li>
		<li class="${param.status eq 'REC300' ? 'tap_on' : '' } stat_REC300">
			<a href="/expcom/expRecList.do?status=REC300" class="nct_top_item">
				<p class="nct_tap_tit">접수반려</p><p class="nct_tap_cnt">${statRec300}</p>
			</a>
		</li>
		<li class="${param.status eq 'REC400' ? 'tap_on' : '' } stat_REC400">
			<a href="/expcom/expRecList.do?status=REC400" class="nct_top_item">
				<p class="nct_tap_tit">접수철회</p><p class="nct_tap_cnt">${statRec400}</p>
			</a>
		</li>
		<li class="${param.status eq 'REC600' ? 'tap_on' : '' } stat_REC600" style="margin-left:10px;">
			<a href="/expcom/expRecList.do?status=REC600" class="nct_top_item">
				<p class="nct_tap_tit">검토중</p><p class="nct_tap_cnt">${statRec600}</p>
			</a>
		</li>
		<li class="${param.status eq 'REC700' ? 'tap_on' : '' } stat_REC700">
			<a href="/expcom/expRecList.do?status=REC700" class="nct_top_item">
				<p class="nct_tap_tit">검토 완료</p><p class="nct_tap_cnt">${statRec700}</p>
			</a>
		</li>
		
	</ul>
	<c:if test="${ user.admGroup eq 'AMG00' or user.admGroup eq 'AMG01' or user.admGroup eq 'AMG02'}">
		<a href="/expcom/expRecSetup.do" class="tap_btn commake01">신규 접수 등록</a>
	</c:if>
	<!-- <a href="javascript:otpUserSend();" class="tap_btn to500">테스트 OTP</a> -->
</div>
<div class="nct_list_top_wrap">
	<ul class="nct_list_info">
		<li class="list_num">No.</li>
		<li class="list_type">접수 유형</li>
		<li class="list_idx">접수 번호</li>
		<li class="list_body">신청 내용</li>
		<li class="list_stat">진행 상태</li>
	</ul>
</div>
<div class="nct_content_wrap">
	<div class="nct_content_list_body nct_scroll">
		<!--검색결과가 없는 경우 : 시작-->
		<c:if test="${fn:length(recList) == 0 }">
			<div class="no_list">
				조회된 검색 결과가 없습니다.
			</div>
		</c:if>
		<!--검색결과가 없는 경우 : 끝-->
		<!--검색결과가 있는 경우 : 시작-->
		<c:if test="${fn:length(recList) != 0 }">
			<ul class="nct_content_list_01">
				<c:forEach items="${recList}" var="expRec" varStatus="status">
					<li>
						<c:if test="${expRec.nctMetaRegi ge nowDateChk}">
						 	<div class="new_flag">NEW</div>
						</c:if>
						<div class="list_num">
							${paging.totalRows - (paging.pageNo - 1) * paging.pageRows - status.index} 
						</div>
						<a href="/expcom/expRecView.do?code=${expRec.nctRecCode}<c:if test="${param.status ne null}">&status=${param.status}</c:if>&pageNo=${paging.pageNo}" class="list_item_01">
							<div class="receipt_t_type">
								<p class="type_tit">
								<c:if test="${expRec.nctMetaType eq 'T101'}">여부판정</c:if>
								<c:if test="${expRec.nctMetaType eq 'T201'}">수출신고</c:if>
								<c:if test="${expRec.nctMetaType eq 'T202'}">수출승인</c:if>
								<c:if test="${expRec.nctMetaType eq 'T203'}">사전검토</c:if>
								<c:if test="${expRec.nctMetaType eq 'T301'}">해외인수·합병 <br>신고</c:if>
								<c:if test="${expRec.nctMetaType eq 'T302'}">해외인수·합병 <br>승인</c:if>
								<c:if test="${expRec.nctMetaType eq 'T303'}">해외인수·합병 <br>사전검토</c:if>
								<c:if test="${expRec.nctMetaType eq 'T401'}">국가핵심기술<br>지정</c:if>
								<c:if test="${expRec.nctMetaType eq 'T402'}">국가핵심기술<br>변경</c:if>
								<c:if test="${expRec.nctMetaType eq 'T403'}">국가핵심기술<br>해제</c:if>
								<c:if test="${expRec.nctMetaType eq 'T001'}">기타</c:if>
								</p>
							</div>
							<div class="list_idx">
								<p>${expRec.nctRecCode}</p>
								<c:if test="${expRec.nctRecReYn eq 'Y'}">
									<p class="rebone_flag">재검토${expRec.nctRecReCode}</p>
								</c:if>
								<%-- <br>${expRec.nctMetaCode} --%>
							</div>
							<div class="list_body">
								<div class="list_tech_box">
									<c:if test="${expRec.techCount ne '1'}">
										<c:set var="techIdctn" value="0"></c:set>
										<c:forEach items="${listTechCnt}" var="techCount" varStatus="techcnt">
											<c:if test="${expRec.nctRecCode eq techCount.nctRecCode}">
												<c:set var="techIdctn" value = "${techIdctn + 1}"/>
												<c:if test="${techIdctn <= techCount.techIdCnt}">
													<div class="list_body_tech">
														<p>${techCount.techName} <%-- ${techcnt.count} /${techIdctn} --%></p>
														<span class="tech_cnt_num">${techCount.techIdCnt}</span>
														<div class="rec_tech_list_box">
															<ul class="rec_tech_list">
																<c:forEach items="${listTechList}" var="techList" varStatus="techlist">
																	<c:if test="${expRec.nctRecCode eq techList.nctRecCode}">
																		<c:if test="${techCount.techNctCode eq techList.techId}">
																			<li>${techList.techItemName}<br><span class="list_body_tit">${techList.nctMetaTechNm}</span></li>
																		</c:if>
																	</c:if>
																</c:forEach>
															</ul>
														</div>
													</div>
												</c:if>
											</c:if>
										</c:forEach>
										<c:if test="${techIdctn eq '1'}">
											<span class="list_body_technm">${expRec.techItemName}</span>
										</c:if>
									</c:if>
									<c:if test="${expRec.techCount eq '1'}">
										<c:forEach items="${listTechCnt}" var="techCount" varStatus="techcnt">
											<c:if test="${expRec.nctRecCode eq techCount.nctRecCode}">
												<div class="list_body_tech">
													<p>${techCount.techName}</p>
												</div>
												<c:forEach items="${listTechList}" var="techList" varStatus="techlist">
													<c:if test="${expRec.nctRecCode eq techList.nctRecCode}">
														<span class="list_body_technm">${techList.techItemName}</span>
													</c:if>
												</c:forEach>
											</c:if>
										</c:forEach>
									</c:if>
								</div>
								<div class="list_body_tit">
									${expRec.nctMetaTechNm}
								</div>
								<div class="list_body_sub">
									<c:if test="${expRec.nctMetaComType eq 'C103'}">
										대상기업없음
									</c:if>
									<c:if test="${expRec.nctMetaComType ne 'C103'}">
										${expRec.nctMetaComNm} | 대표명 : ${expRec.nctMetaCeo} | 담당자 : ${expRec.nctMetaPmNm}  
									</c:if>
									| 접수일 : ${expRec.nctMetaRegiView} 
								</div>
							</div>
							
						</a>
						<div class="expstat_box">
							<p class="stat stat_${expRec.nctRecStatus}">
								<c:if test="${expRec.nctRecStatus eq 'REC100'}">임시저장</c:if>
								<c:if test="${expRec.nctRecStatus eq 'REC200'}">접수검토</c:if>
								<c:if test="${expRec.nctRecStatus eq 'REC300'}">접수반려</c:if>
								<c:if test="${expRec.nctRecStatus eq 'REC400'}">접수철회</c:if>
								<c:if test="${expRec.nctRecStatus eq 'REC500'}">접수완료</c:if>
								<c:if test="${expRec.nctRecStatus eq 'REC600'}">검토중</c:if>
								<c:if test="${expRec.nctRecStatus eq 'REC700'}">검토완료</c:if>
								<br><span class="stat_date">${expRec.nctRecStatusLastView}</span>
							</p>
						</div>
					</li>		
					<c:set var="techIdctn" value="0"></c:set>			
				</c:forEach>
			</ul>
		</c:if>
		<!-- <ul class="nct_content_list_01">
			<li>
				<div class="list_num">
					9,999
				</div>
				<a href="#none" class="list_item_01">
					<div class="receipt_t_type">
						<p class="type_tit">해외인수·합병 <br>사전검토</p>
					</div>
					<div class="list_idx">
						<p>2023-02-0002</p>
						<p class="rebone_flag">재검토</p>
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
							한국산업기술 보호 협회 |접수일 : 2023년 03월 16일 3:46:47
						</div>
					</div>
					
				</a>
				<div class="list_stat">
					<p class="stat stat_REC200">
						
						접수검토
						<br><span class="stat_date">2023.03.16 03:46:47</span>
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
							한국산업기술 보호 협회 |접수일 : 2023년 03월 16일 3:46:47
						</div>
					</div>
					
				</a>
				<div class="list_stat">
					<p class="stat stat_REC300">
						접수완료<br>
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
							한국산업기술 보호 협회 |접수일 : 2023년 03월 16일 3:46:47
						</div>
					</div>
					
				</a>
				<div class="list_stat">
					<p class="stat stat_re_03">
						재접수요청??<br>
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
							한국산업기술 보호 협회 |접수일 : 2023년 03월 16일 3:46:47
						</div>
					</div>
					
				</a>
				<div class="list_stat">
					<p class="stat stat_REC400">
						접수반려<br>
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
							한국산업기술 보호 협회 |접수일 : 2023년 03월 16일 3:46:47
						</div>
					</div>
					
				</a>
				<div class="list_stat">
					<p class="stat stat_REC500">
						접수철회<br>
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
							한국산업기술 보호 협회 |접수일 : 2023년 03월 16일 3:46:47
						</div>
					</div>
					
				</a>
				<div class="list_stat">
					<p class="stat stat_REC600">
						검토완료<br>
						<span class="stat_date">2023.03.16 03:46:47</span>
					</p>
				</div>
			</li>
			
		</ul> -->
	</div>
</div>		
<div class="nct_footer">
	<%-- ${statTotal} / ${Math.ceil(statTotal/paging.pageRows)}  ${Math.ceil(statTotal/paging.pageRows)} --%>
	<c:if test="${fn:length(recList) ne 0 }">
		<ul class="pagination">
            <li class="prev">
            	<a href="/expcom/expRecList.do?pageNo=1<c:if test="${param.status ne null}">&status=${param.status}</c:if>">«</a>
            </li>
			<c:forEach var="i" begin="1" end="${paging.totalPage}">
            	<li class="item ${i eq paging.pageNo ? 'current' : '' }"><a href="/expcom/expRecList.do?pageNo=${i}<c:if test="${param.status ne null}">&status=${param.status}</c:if>"><c:out value="${i}"/></a></li>
			</c:forEach>
            <li class="next">
            	<a href="/expcom/expRecList.do?pageNo=${paging.totalPage}<c:if test="${param.status ne null}">&status=${param.status}</c:if>">»</a>
            </li>
		</ul>
	</c:if>
</div>