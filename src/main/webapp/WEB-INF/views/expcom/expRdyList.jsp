<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 현재 년도 날짜 -->
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="nowDate"><fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" /></c:set>

<div class="nct_content_tap">
	<ul class="nct_top_list">
		<c:set var="statTotal" value="0"></c:set>
		
		<c:forEach items="${agdlistTap}" var="item">
			
			<c:set var="statTotal" value = "${statTotal + item.count}"/>
		</c:forEach>
		<li class="${param.status eq null ? 'tap_on' : '' }">
			<a href="/expcom/expRdyList.do" class="nct_top_item "  data-status="ALL">
				<p class="nct_tap_tit">전체</p><p class="nct_tap_cnt">${statTotal}</p>
			</a>
		</li>
	</ul>	
	<c:if test="${ user.admGroup eq 'AMG00' or user.admGroup eq 'AMG04' or user.admGroup eq 'AMG02'}">
		<a href="/expcom/expComSetup.do" class="tap_btn commake01">위원회 구성</a>
	</c:if>
</div>
<div class="nct_list_top_wrap">
	<ul class="nct_list_info">
		<li class="list_num">No.</li> 
		<li class="list_agd_type">소관과</li>
		<li class="list_type">안건 유형</li>
		<!-- <li class="list_type">소관과</li> -->
		<li class="list_idx">안건 번호(접수 번호)</li>
		<li class="list_body">안건 내용</li>
		<li class="list_stat">진행 상태</li>
	</ul>
</div>
<div class="nct_content_wrap">
	<div class="nct_content_list_body nct_scroll">
		<!--검색결과가 없는 경우 : 시작-->
		<c:if test="${fn:length(agdList) == 0 }">
			<div class="no_list">
				조회된 검색 결과가 없습니다.
			</div>
		</c:if>
		<!--검색결과가 없는 경우 : 끝-->
		<!--검색결과가 있는 경우 : 시작-->
		<c:if test="${fn:length(agdList) != 0 }">
			<ul class="nct_content_list_01">
			<c:forEach items="${agdList}" var="expAgd"  varStatus="status">
				<li class="${expAgd.sortType eq '0' ? 'noAgd' : '' }">
					<div class="list_num">
						<p>${paging.totalRows - (paging.pageNo - 1) * paging.pageRows - status.index}</p>
					</div>
					<a href="/expcom/expRdyView.do?code=${expAgd.nctAgdCode}<c:if test="${param.status ne null}">&status=${param.status}</c:if>&pageNo=${paging.pageNo}" class="list_item_01">
						<div class="agd_agm_type ${expAgd.sortType eq '0' ? 'no_agm' : '' }">
							<p class="type_tit">
								${expAgd.nctAgdTechNm}
							</p>
						</div>
						<div class="receipt_t_type"  style="margin-left:10px;">
							<p class="type_tit">
							<c:if test="${expAgd.nctMetaType eq 'T101'}">여부판정</c:if>
							<c:if test="${expAgd.nctMetaType eq 'T201'}">수출신고</c:if>
							<c:if test="${expAgd.nctMetaType eq 'T202'}">수출승인</c:if>
							<c:if test="${expAgd.nctMetaType eq 'T203'}">사전검토</c:if>
							<c:if test="${expAgd.nctMetaType eq 'T301'}">해외인수·합병 <br>신고</c:if>
							<c:if test="${expAgd.nctMetaType eq 'T302'}">해외인수·합병 <br>승인</c:if>
							<c:if test="${expAgd.nctMetaType eq 'T303'}">해외인수·합병 <br>사전검토</c:if>
							<c:if test="${expAgd.nctMetaType eq 'T401'}">국가핵심기술<br>지정</c:if>
							<c:if test="${expAgd.nctMetaType eq 'T402'}">국가핵심기술<br>변경</c:if>
							<c:if test="${expAgd.nctMetaType eq 'T403'}">국가핵심기술<br>해제</c:if>
							<c:if test="${expAgd.nctMetaType eq 'T001'}">기타</c:if>
							</p>
						</div>
						
						<div class="list_idx">
							${expAgd.nctAgdCode}<br>
							(${expAgd.nctRecCode})
						</div>
						<div class="list_body type_agd">
							<div class="list_tech_box">
								<c:if test="${expAgd.techCount ne '1'}">
									<c:set var="techIdctn" value="0"></c:set>
									<c:forEach items="${listTechCnt}" var="techCount" varStatus="techcnt">
										<c:if test="${expAgd.nctRecCode eq techCount.nctRecCode}">
											<c:set var="techIdctn" value = "${techIdctn + techCount.techIdCnt}"/>
											<c:if test="${techIdctn <= expAgd.techCount}">
												<div class="list_body_tech">
													<p>${techCount.techName}</p>
													<span class="tech_cnt_num">${techCount.techIdCnt}</span>
													<div class="rec_tech_list_box">
														<ul class="rec_tech_list">
															<c:set var="techIdrowctn" value="0"></c:set>
															<c:forEach items="${listTechList}" var="techList" varStatus="techlist">
																<c:if test="${expAgd.nctRecCode eq techList.nctRecCode}">
																	<c:set var="techIdrowctn" value = "${techIdrowctn + 1}"/>
																	<c:if test="${techIdrowctn <= expAgd.techCount}">
																		<c:if test="${techCount.techNctCode eq techList.techId}">
																			<li>${techList.techItemName}<br><span class="list_body_tit">${techList.nctMetaTechNm}</span></li>
																		</c:if>
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
										<span class="list_body_technm">${expAgd.techItemName}</span>
									</c:if>
								</c:if>
								<c:if test="${expAgd.techCount eq '1'}">
									<c:forEach items="${listTechCnt}" var="techCount" varStatus="techcnt">
										<c:if test="${expAgd.nctRecCode eq techCount.nctRecCode}">
											<div class="list_body_tech">
												<p>${techCount.techName}</p>
											</div>
											<c:forEach items="${listTechList}" var="techList" varStatus="techlist">
												<c:if test="${expAgd.nctRecCode eq techList.nctRecCode}">
													<span class="list_body_technm">${techList.techItemName}</span>
												</c:if>
											</c:forEach>
										</c:if>
									</c:forEach>
								</c:if>
							</div>
							<div class="list_body_tit">
								${expAgd.nctMetaTechNm}
							</div>
							<div class="list_body_sub">
								<c:if test="${expAgd.nctMetaComType eq 'C103'}">
									대상기업없음
								</c:if>
								<c:if test="${expAgd.nctMetaComType ne 'C103'}">
									${expAgd.nctMetaComNm} | 대표명 : ${expAgd.nctMetaCeo} | 담당자 : ${expAgd.nctMetaPmNm}  
								</c:if>
								| 접수일 : ${expAgd.nctMetaRegiView} 
							</div>
						</div>
						
					</a>
					<div class="expstat_box">
						<p class="stat stat_${expAgd.nctAgdStatus}">
							<c:if test="${expAgd.nctAgdStatus eq 'AGD100'}">소관과 이관완료</c:if>
							<c:if test="${expAgd.nctAgdStatus eq 'REC200'}">접수검토</c:if>
							<c:if test="${expAgd.nctAgdStatus eq 'REC300'}">접수반려</c:if>
							<c:if test="${expAgd.nctAgdStatus eq 'REC400'}">접수철회</c:if>
							<c:if test="${expAgd.nctAgdStatus eq 'REC500'}">접수완료</c:if>
							<c:if test="${expAgd.nctAgdStatus eq 'REC600'}">검토완료</c:if>
							<br><span class="stat_date">${expAgd.nctAgdStatusLastView}</span>
						</p>
					</div>
				</li>
			</c:forEach>
			</ul>
		</c:if>
	</div>
</div>		
<div class="nct_footer">
	<c:if test="${fn:length(agdList) ne 0 }">
		<ul class="pagination">
            <li class="prev">
            	<a href="/expcom/expRdyList.do?pageNo=1<c:if test="${param.status ne null}">&status=${param.status}</c:if>">«</a>
            </li>
			<c:forEach var="i" begin="1" end="${paging.totalPage}">
            	<li class="item ${i eq paging.pageNo ? 'current' : '' }"><a href="/expcom/expRdyList.do?pageNo=${i}<c:if test="${param.status ne null}">&status=${param.status}</c:if>"><c:out value="${i}"/></a></li>
			</c:forEach>
            <li class="next">
            	<a href="/expcom/expRdyList.do?pageNo=${paging.totalPage}<c:if test="${param.status ne null}">&status=${param.status}</c:if>">»</a>
            </li>
		</ul>
	</c:if>
</div>