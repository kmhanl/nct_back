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
		<c:set var="statRec500" value="0"></c:set>
		<c:set var="statAgd100" value="0"></c:set>
		<c:set var="statAgd200" value="0"></c:set>
		<c:set var="statAgd300" value="0"></c:set>
		<c:set var="statAgd400" value="0"></c:set>
		<c:set var="statAgd500" value="0"></c:set>
		<c:set var="statAgd600" value="0"></c:set>
		
		<c:forEach items="${agdlistTap}" var="item">
			
			<c:set var="statTotal" value = "${statTotal + item.count}"/>
			<c:choose>
				<c:when test="${item.title eq 'REC500'}">
					<c:set var="statRec500" value = "${item.count}"/>
				</c:when>
				<c:when test="${item.title eq 'AGD100'}">
					<c:set var="statAgd100" value = "${item.count}"/>
				</c:when>
				<c:when test="${item.title eq 'AGD200'}">
					<c:set var="statAgd200" value = "${item.count}"/>
				</c:when>
				<c:when test="${item.title eq 'AGD300'}">
					<c:set var="statAgd300" value = "${item.count}"/>
				</c:when>
				<c:when test="${item.title eq 'AGD400'}">
					<c:set var="statAgd400" value = "${item.count}"/>
				</c:when>
				<c:when test="${item.title eq 'AGD500'}">
					<c:set var="statAgd500" value = "${item.count}"/>
				</c:when>
				<c:when test="${item.title eq 'AGD600'}">
					<c:set var="statAgd600" value = "${item.count}"/>
				</c:when>
			</c:choose>
		</c:forEach>
		<li class="${param.status eq null ? 'tap_on' : '' }">
			<a href="/expcom/expAgdList.do" class="nct_top_item "  data-status="ALL">
				<p class="nct_tap_tit">전체</p><p class="nct_tap_cnt">${statTotal}</p>
			</a>
		</li>
		<li class="${param.status eq 'REC500' ? 'tap_on' : '' } stat_REC500 tap_mar">
			<a href="/expcom/expAgdList.do?status=REC500" class="nct_top_item" >
				<p class="nct_tap_tit">접수완료<p><p class="nct_tap_cnt">${statRec500}</p>
			</a>
		</li>
		<li class="${param.status eq 'AGD100' ? 'tap_on' : '' } stat_AGD100">
			<a href="/expcom/expAgdList.do?status=AGD100" class="nct_top_item">
				<p class="nct_tap_tit">소관과이관완료<p><p class="nct_tap_cnt">${statAgd100}</p>
			</a>
		</li>
		<li class="${param.status eq 'AGD200' ? 'tap_on' : '' } stat_AGD200">
			<a href="/expcom/expAgdList.do?status=AGD200" class="nct_top_item">
				<p class="nct_tap_tit">위원회예정<p><p class="nct_tap_cnt">${statAgd200}</p>
			</a>
		</li>
		<li class="${param.status eq 'AGD300' ? 'tap_on' : '' } stat_AGD300">
			<a href="/expcom/expAgdList.do?status=AGD300" class="nct_top_item">
				<p class="nct_tap_tit">위원회진행중<p><p class="nct_tap_cnt">${statAgd300}</p>
			</a>
		</li>
		<li class="${param.status eq 'AGD400' ? 'tap_on' : '' } stat_AGD400 tap_mar">
			<a href="/expcom/expAgdList.do?status=AGD400" class="nct_top_item">
				<p class="nct_tap_tit">결과 도출중<p><p class="nct_tap_cnt">${statAgd400}</p>
			</a>
		</li>
		<li class="${param.status eq 'AGD500' ? 'tap_on' : '' } stat_AGD500">
			<a href="/expcom/expAgdList.do?status=AGD500" class="nct_top_item">
				<p class="nct_tap_tit">최종검토완료<p><p class="nct_tap_cnt">${statAgd500}</p>
			</a>
		</li>
		<li class="${param.status eq 'AGD600' ? 'tap_on' : '' } stat_AGD600">
			<a href="/expcom/expAgdList.do?status=AGD600" class="nct_top_item">
				<p class="nct_tap_tit">최종결과확정<p><p class="nct_tap_cnt">${statAgd600}</p>
			</a>
		</li>
		<%-- <li class="${param.status eq 'AGD100' ? 'tap_on' : '' } stat_AGD100">
			<a href="/expcom/expAgdList.do?status=" class="nct_top_item"  data-status="AC">
				<p class="nct_tap_tit">재검토확정<p><p class="nct_tap_cnt">2</p>
			</a>
		</li> --%>
	</ul>
	<c:if test="${ user.admGroup eq 'AMG00' or user.admGroup eq 'AMG01' or user.admGroup eq 'AMG02'}">
		<input type=hidden id="sendCallRec" value="${statRec500}">
		<c:if test="${param.status eq 'REC500' or param.status eq null}">
			<a href="javascript:sendRec();" id="sendAgdbtn" class="tap_btn disabledBtn">
				검토 요청
				<span class="agdSelCnt">0</span>
				<c:if test="${statRec500 eq '0'}">
					<div class="sendAdgInfo type01">
						<span>소관과 이관</span>가능한 <span>접수 완료</span>건이 업습니다.
					</div>
				</c:if>
				<c:if test="${statRec500 ne '0'}">
					<div class="sendAdgInfo type02">
						<span>소관과 이관</span>할 <span>접수 완료</span>건을 <span>선택(체크박스)</span> 후 <span>검토 요청</span>을 진행 할 수 있습니다.
					</div>
				</c:if>
			</a>
		</c:if>
	</c:if> 
	<div id="sendAgdLayer" class="send_Agd_layer_content">
		<div class="top_information">
           	<ul class="top_info_list">
				<li>* 관할 소관과를 선택 후 공문파일을 첨부해주세요.</li>
				<li>* 다수의 소관과를 선택 한 경우 해당 접수건은 각 소관과의 안건으로 등록 됩니다.</li>
			</ul>
		</div>
		<div class="nct_bro_item type_09">
			<div class="item_send_agd">
				<p>선택된 접수 완료 건수 : <span id="sendAgd">0</span></p>
			</div>
		</div>	
		<div class="nct_bro_item type_05">
			<div class="item_label">
				<p>소관과 설정</p>
			</div>
			<div class="item_box">
				<div class="nct_tech_list_box popup">
					<ul class="nct_tech_list ">
						<c:forEach items="${nctTechList}" var="tech" varStatus="status"><!-- compe_on -->
							<li class="" data-gid="${tech.techNtcGid}" data-tid="${tech.techId}">
								<a href="javascript:void(0);" class="nct_tech_item">${tech.techName}</a>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<div class="nct_bro_item type_03">
			<div class="item_label formItem">
				<p class="item_label_l">검토 요청 공문 파일
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
		<div class="send_Agd_layer_btn">
			<a href="javascript:void(0);" class="btn">취소</a>
			<a href="javascript:saveSendRec();" class="btn">소관과 이관</a>
		</div>
	</div>
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
			<c:forEach items="${agdList}" var="expAgd" varStatus="status">
				<li class="${expAgd.sortType eq '0' ? 'noAgd' : '' }">
					<div class="list_num">
						<p>${paging.totalRows - (paging.pageNo - 1) * paging.pageRows - status.index}</p>
						<c:if test="${expAgd.sortType eq '0'}">
							<input type="checkbox" name="agdCheck" class="" value="${expAgd.nctMetaCode}" style="display:none;">
							<a href="javascript:void(0);" class="AgendaSendChk " data-reccode="${expAgd.nctRecCode}" data-mecode="${expAgd.nctMetaCode}" ></a>
						</c:if>
					</div>
					<c:if test="${expAgd.sortType eq '0'}">
						<a href="/expcom/expAgdRView.do?code=${expAgd.nctRecCode}<c:if test="${param.status ne null}">&status=${param.status}</c:if>&pageNo=${paging.pageNo}" class="list_item_01">
					</c:if>
					<c:if test="${expAgd.sortType eq '1'}">
						<a href="/expcom/expAgdView.do?code=${expAgd.nctAgdCode}<c:if test="${param.status ne null}">&status=${param.status}</c:if>&pageNo=${paging.pageNo}" class="list_item_01">
					</c:if>
					
						<div class="agd_agm_type ${expAgd.sortType eq '0' ? 'no_agm' : '' }">
							<p class="type_tit">
							<c:if test="${expAgd.sortType eq '0'}">
								미정
							</c:if>
							<c:if test="${expAgd.sortType eq '1'}">
								${expAgd.nctAgdTechNm}
							</c:if>
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
							<c:if test="${expAgd.sortType eq '0'}">
								(${expAgd.nctRecCode})
							</c:if>
							<c:if test="${expAgd.sortType eq '1'}">
								${expAgd.nctAgdCode}<br>
								(${expAgd.nctRecCode})
							</c:if>
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
									<c:forEach items="${listTechList}" var="techList" varStatus="techlist">
										<c:if test="${expAgd.nctRecCode eq techList.nctRecCode}">
											<div class="list_body_tech">
												<p>${techList.techName}</p>
											</div>
											<span class="list_body_technm">${techList.techItemName}</span>
										</c:if>
									</c:forEach>
								</c:if>
							</div>
							<div class="list_body_tit">
								${expAgd.nctMetaTechNm} <%-- (${expAgd.techCount}) - ${expAgd.nctMetaCode} --%>
								
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
					<c:if test="${ user.admGroup eq 'AMG00' or user.admGroup eq 'AMG01' or user.admGroup eq 'AMG02'}">
						<c:if test="${expAgd.nctAgdStatus eq 'AGD100'}">
							<div class="list_btn_box">
								<a href="#none" class="list_btn backAgd">
									검토 요청 회수
								</a>
							</div>
						</c:if>
					</c:if>
					<div class="expstat_box">
						<c:if test="${expAgd.sortType eq '0'}">
							<p class="stat stat_${expAgd.nctRecStatus}">
								<c:if test="${expAgd.nctRecStatus eq 'REC100'}">임시저장</c:if>
								<c:if test="${expAgd.nctRecStatus eq 'REC200'}">접수검토</c:if>
								<c:if test="${expAgd.nctRecStatus eq 'REC300'}">접수반려</c:if>
								<c:if test="${expAgd.nctRecStatus eq 'REC400'}">접수철회</c:if>
								<c:if test="${expAgd.nctRecStatus eq 'REC500'}">접수완료</c:if>
								<c:if test="${expAgd.nctRecStatus eq 'REC600'}">검토완료</c:if>
								<br><span class="stat_date">${expAgd.nctRecStatusLastView}</span>
							</p>
						</c:if>
						<c:if test="${expAgd.sortType eq '1'}">
							<p class="stat stat_${expAgd.nctAgdStatus}">
								<c:if test="${expAgd.nctAgdStatus eq 'AGD100'}">소관과 이관완료</c:if>
								<c:if test="${expAgd.nctAgdStatus eq 'AGD200'}">위원회 예정</c:if>
								<c:if test="${expAgd.nctAgdStatus eq 'AGD300'}">위원회 진행중</c:if>
								<c:if test="${expAgd.nctAgdStatus eq 'AGD400'}">결과 도출중</c:if>
								<c:if test="${expAgd.nctAgdStatus eq 'AGD500'}">최종검토완료</c:if>
								<c:if test="${expAgd.nctAgdStatus eq 'AGD600'}">최종결과확정</c:if>
								<br><span class="stat_date">${expAgd.nctAgdStatusLastView}</span>
							</p>
						</c:if>
					</div>
				</li>
			</c:forEach>
			</ul>
		</c:if>
	</div>
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
	<c:if test="${fn:length(agdList) ne 0 }">
		<ul class="pagination">
            <li class="prev">
            	<a href="/expcom/expAgdList.do?pageNo=1<c:if test="${param.status ne null}">&status=${param.status}</c:if>">«</a>
            </li>
			<c:forEach var="i" begin="1" end="${paging.totalPage}">
            	<li class="item ${i eq paging.pageNo ? 'current' : '' }"><a href="/expcom/expAgdList.do?pageNo=${i}<c:if test="${param.status ne null}">&status=${param.status}</c:if>"><c:out value="${i}"/></a></li>
			</c:forEach>
            <li class="next">
            	<a href="/expcom/expAgdList.do?pageNo=${paging.totalPage}<c:if test="${param.status ne null}">&status=${param.status}</c:if>">»</a>
            </li>
		</ul>
	</c:if>
</div>