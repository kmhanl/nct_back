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
			<div class="browser_alert_box">
				브라우저 알럿
			</div>
			
			
			<div class="sub_browser side_003">
				<div class="browser_block ">
					<div class="block_title_box tit01">
						<h1 class="block_title">안건 2023-01-0003 진행 상태</h1>
					</div>
					<div class="block_body nct_scroll">
						<ul class="agd_stat_list">
							<!-- <a href="javascript:void(0);" class="stat_item"> -->
							<li>
								<div class="stat_item">
									<p class="stat_item_dot"></p>
									<p class="stat_item_name">소관과이관 완료(검토 준비중)</p>
								</div>
								<div class="agd_stat_info">
									<p class="info_tit">소관과이관 완료(검토 준비중)</p>
									<p class="info_ment">
										기술안보과에서 소관과로 이관 하여,<br>
										검토 요청이 완료된 상태로, 소관과의<br>
										위윈회 구성 및 검토가 필요한 단계입니다.
									</p>	
								</div>
							</li>
							<li>
								<div class="stat_item">
									<p class="stat_item_dot"></p>
									<p class="stat_item_name">전문위원회 준비중</p>
								</div>
								<div class="agd_stat_info">
									<p class="info_tit">전문위원회 준비중</p>
									<p class="info_ment">
										소관과의 전문위원회 구성 및 검토 준비중인<br>
										단계입니다.
									</p>	
								</div>
							</li>
							<li class="stat_on">
								<div class="stat_item">
									<p class="stat_item_dot"></p>
									<p class="stat_item_name">전문위원회 예정</p>
								</div>
								<div class="agd_stat_info">
									<p class="info_tit">전문위원회 예정</p>
									<p class="info_ment">
										위원회 구성 완료 후 진행 예정 단계입니다.<br>
										곧 전문위원회가 진행됩니다.
									</p>	
								</div>
							</li>
							<li>
								<div class="stat_item">
									<p class="stat_item_dot"></p>
									<p class="stat_item_name">전문위원회 진행중</p>
								</div>
								<div class="agd_stat_info">
									<p class="info_tit">전문위원회 진행중</p>
									<p class="info_ment">
										전문위원회 검토 진행중 상태로,<br>
										전문위원의 검토 의견서 작성중 상태입니다.
									</p>	
								</div>
							</li>
							<li>
								<div class="stat_item">
									<p class="stat_item_dot"></p>
									<p class="stat_item_name">전문위원회 결과 도출중</p>
								</div>
								<div class="agd_stat_info">
									<p class="info_tit">전문위원회 결과 도출중</p>
									<p class="info_ment">
										전문위원회 종료 후 결과 도출중 상태로,<br>
										소관과의 검토 결과서 작성중인 상태 입니다.
									</p>	
								</div>
							</li>
							<li>
								<div class="stat_item">
									<p class="stat_item_dot"></p>
									<p class="stat_item_name">최종 검토 완료</p>
								</div>
								<div class="agd_stat_info">
									<p class="info_tit">최종 검토 완료</p>
									<p class="info_ment">
										전문위원회 검토가 완료 된 상태로, 결과를 <br>
										확정하여 대상기업에 통보가 필요한 상태 입니다.
									</p>	
								</div>
							</li>
							<li>
								<div class="stat_item">
									<p class="stat_item_dot"></p>
									<p class="stat_item_name">최종 결과 확정</p>
								</div>
								<div class="agd_stat_info">
									<p class="info_tit">최종 결과 확정</p>
									<p class="info_ment">
										최종 검토 결과가 확정 되어 대상기업에<br>
										결과 통보가 완료 상태입니다.
									</p>	
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			
			
			<div class="browser_col_tap tap01"></div>
		
		
		
			<div class="sub_browser side_dual">
				<div class="browser_alert_box" style="display:none">
					브라우저 알럿
				</div>
				<div class="sub_child side_001">
					<div class="browser_block ">
					<div class="block_title_box type02">
						<h1 class="block_title">안건 상세 <%-- ${nctRec.nctMetaCode} --%></h1>
					</div>
					<div class="meta_title_box">
						<div class="receipt_t_type">
							<p class="type_tit">
							<c:if test="${nctAgd.nctMetaType eq 'T101'}">여부판정</c:if>
							<c:if test="${nctAgd.nctMetaType eq 'T201'}">수출신고</c:if>
							<c:if test="${nctAgd.nctMetaType eq 'T202'}">수출승인</c:if>
							<c:if test="${nctAgd.nctMetaType eq 'T203'}">사전검토</c:if>
							<c:if test="${nctAgd.nctMetaType eq 'T301'}">해외인수·합병 <br>신고</c:if>
							<c:if test="${nctAgd.nctMetaType eq 'T302'}">해외인수·합병 <br>승인</c:if>
							<c:if test="${nctAgd.nctMetaType eq 'T303'}">해외인수·합병 <br>사전검토</c:if>
							<c:if test="${nctAgd.nctMetaType eq 'T401'}">국가핵심기술<br>지정</c:if>
							<c:if test="${nctAgd.nctMetaType eq 'T402'}">국가핵심기술<br>변경</c:if>
							<c:if test="${nctAgd.nctMetaType eq 'T403'}">국가핵심기술<br>해제</c:if>
							<c:if test="${nctAgd.nctMetaType eq 'T001'}">기타</c:if>
							</p>
						</div>
						<div class="meta_code">
							<span class="meta_label">안건번호</span>
							<span>${nctAgd.nctAgdCode}</span>
						</div>
						<div class="meta_com">
							<span class="meta_label">대상기업</span>
							<span><c:out value="${ nctAgd.nctMetaComType eq 'C103' ? '대상기업없음' : nctAgd.nctMetaComNm }"/></span> 
						</div>
						<div class="expstat_box">
							<p class="stat stat_${nctAgd.nctAgdStatus} view">
								<c:if test="${nctAgd.nctAgdStatus eq 'AGD100'}">검토준비중<br><span class="stat_date">${nctAgd.nctAgdStatusLastView}</span></c:if>
								<c:if test="${nctAgd.nctAgdStatus eq 'AGD200'}">위원회 예정<br><span class="stat_date">${nctAgd.nctAgdStatusLastView}</span></c:if>
								<c:if test="${nctAgd.nctAgdStatus eq 'AGD300'}">위원회 진행중<br><span class="stat_date">${nctAgd.nctAgdStatusLastView}</span></c:if>
								<c:if test="${nctAgd.nctAgdStatus eq 'AGD400'}">결과 도출중<br><span class="stat_date">${nctAgd.nctAgdStatusLastView}</span></c:if>
								<c:if test="${nctAgd.nctAgdStatus eq 'AGD500'}">최종검토완료<br><span class="stat_date">${nctAgd.nctAgdStatusLastView}</span></c:if>
								<c:if test="${nctAgd.nctAgdStatus eq 'AGD600'}">최종결과확정<br><span class="stat_date">${nctAgd.nctAgdStatusLastView}</span></c:if>
							</p>
						</div>
					</div>
					<div class="content_section agd_view nct_scroll">
						<c:if test="${nctAgd.nctMetaComType ne 'C103'}">
							<div class="nct_bro_item type_01">
								<div class="item_label">
									<p>기관명</p>
								</div>
								<div class="item_box"> 
									<p class="ta">${nctAgd.nctMetaComNm}</p>
									<p class="ta"><span class="sub_label">대표명 : </span>${nctAgd.nctMetaCeo} <span class="sub_label">사업자등록번호 : </span>${nctAgd.nctMetaComNo}
									</p>
								</div>
								<div class="item_tap"></div>
								<div class="item_label">
									<p>본사 소재지</p>
								</div>
								<div class="item_box"> 
									<p class="ta">(${nctAgd.nctMetaBoZip}) ${nctAgd.nctMetaBoAdd1} ${nctAgd.nctMetaBoAdd2} </p>
									<p class="ta"><span class="sub_label">전화번호 : </span>${nctAgd.nctMetaBoPhone1} - ${nctAgd.nctMetaBoPhone2} - ${nctAgd.nctMetaBoPhone3}
									</p>
								</div>
								<div class="item_tap"></div>
								<div class="item_label">
									<p>사업장 소재지</p>
								</div>
								<div class="item_box"> 
									<p class="ta">(${nctAgd.nctMetaSaZip}) ${nctAgd.nctMetaSaAdd1} ${nctAgd.nctMetaSaAdd2} </p>
									<p class="ta"><span class="sub_label">전화번호 : </span>${nctAgd.nctMetaSaPhone1} - ${nctAgd.nctMetaSaPhone2} - ${nctAgd.nctMetaSaPhone3}
									</p>
								</div>
								<div class="item_tap"></div>
								<div class="item_label">
									<p>담당자</p>
								</div>
								<div class="item_box"> 
									<p class="ta">${nctAgd.nctMetaPmNm} <span class="sub_label">${nctAgd.nctMetaPmDept} ${nctAgd.nctMetaPmPosition}</span></p>
									<p class="ta"><span class="sub_label">연락처 : </span>${nctAgd.nctMetaPmPhone1} - ${nctAgd.nctMetaPmPhone2} - ${nctAgd.nctMetaPmPhone3} <span class="sub_label"> | </span> ${nctAgd.nctMetaPmMobile1} - ${nctAgd.nctMetaPmMobile2} - ${nctAgd.nctMetaPmMobile3} <span class="sub_label"> | </span> ${nctAgd.nctMetaPmEmail}
									</p>
								</div>
							</div>
						</c:if>
						<div class="nct_bro_item type_01">
							<c:if test="${nctAgd.nctMetaType eq 'T001'}">
								<div class="item_label">
									<p>제목</p>
								</div>
								<div class="item_box"> 
									<p class="ta">${nctAgd.nctMetaTitle}</p>
								</div>
								<div class="item_tap"></div>
							</c:if>
							<div class="item_label">
								<p>기술명칭</p>
							</div>
							<div class="item_box"> 
								<ul class="meta_tech_list">
								<c:forEach items="${recTechList}" var="techList" varStatus="techlist">
									<li class="meta_tech">
										<div class="meta_tech_id">
											${techList.techName}
										</div>
										<div class="meta_tech_info">
											<p class="meta_tech_area">${techList.techItemName}</p>
											<p class="meta_tech_name">${techList.nctMetaTechNm}</p>
										</div>
									</li>
								</c:forEach>
								</ul>
							</div>
							<c:if test="${nctAgd.nctMetaType eq 'T101' or nctAgd.nctMetaType eq 'T201' or nctAgd.nctMetaType eq 'T202' or nctAgd.nctMetaType eq 'T203' or nctAgd.nctMetaType eq 'T301' or nctAgd.nctMetaType eq 'T302' or nctAgd.nctMetaType eq 'T303'}">
								<div class="item_tap"></div>
								<div class="item_label">
									<p>기술 형태</p>
								</div>
								<div class="item_box"> 
									<p class="ta">${nctAgd.nctMetaTechForm}</p>
								</div>
							</c:if>
						
							<c:if test="${nctAgd.nctMetaType eq 'T101' or nctAgd.nctMetaType eq 'T301' or nctAgd.nctMetaType eq 'T302' or nctAgd.nctMetaType eq 'T303'}">
								<div class="item_tap"></div>
								<div class="item_label">
									<p>기술 특성</p>
								</div>
								<div class="item_box"> 
									<p class="ta">${nctAgd.nctMetaTechQua}</p>
								</div>
							</c:if>
							<c:if test="${nctAgd.nctMetaType eq 'T101' or nctAgd.nctMetaType eq 'T301' or nctAgd.nctMetaType eq 'T302' or nctAgd.nctMetaType eq 'T303' or nctAgd.nctMetaType eq 'T401' or nctAgd.nctMetaType eq 'T402' or nctAgd.nctMetaType eq 'T403' or nctAgd.nctMetaType eq 'T001'}">
								<div class="item_tap"></div>
								<div class="item_label">
									<c:if test="${nctAgd.nctMetaType eq 'T101' or nctAgd.nctMetaType eq 'T303' or nctAgd.nctMetaType eq 'T401' or nctAgd.nctMetaType eq 'T402' or nctAgd.nctMetaType eq 'T403' or nctAgd.nctMetaType eq 'T001'}">
										<p>신청 사유</p>
									</c:if>
									<c:if test="${nctAgd.nctMetaType eq 'T301'}">
										<p>신고 사유</p>
									</c:if>
									<c:if test="${nctAgd.nctMetaType eq 'T302'}">
										<p>승인 신청 사유</p>
									</c:if>
								</div>
								<div class="item_box"> 
									<p class="ta">${nctAgd.nctMetaReason}</p>
									<c:if test="${nctAgd.nctMetaType eq 'T301'}">
										<p class="reasonflag ${nctAgd.nctMetaLaw01 eq 'Y' ? 'tap_on' : '' }">「산업기술의 유출방지 및 보호에 관한 법률」 제11조의2제2항, 같은 법 시행령 제18조의4제1항</p>
										<p class="reasonflag ${nctAgd.nctMetaLaw02 eq 'Y' ? 'tap_on' : '' }">「산업기술의 유출방지 및 보호에 관한 법률」 제11조의2제5항, 같은 법 시행령 제18조의5제1항</p>
										<p class="reasonflag ${nctAgd.nctMetaLaw03 eq 'Y' ? 'tap_on' : '' }">「산업기술의 유출방지 및 보호에 관한 법률」 제11조의2제6항, 같은 법 시행령 제18조의5제2항</p>
									</c:if>
								</div>
							</c:if>
							<c:if test="${nctAgd.nctMetaType eq 'T201' or nctAgd.nctMetaType eq 'T202' or nctAgd.nctMetaType eq 'T203'}">
								<div class="item_tap"></div>
								<div class="item_label">
									<p>수출 사유</p>
								</div>
								<div class="item_box"> 
									<c:if test="${nctAgd.nctMetaExSale eq 'ER01'}">
										<div class="meta_ex_type">
											<div class="meta_ex_type_id">
												매각
											</div>
											<div class="meta_ex_type_info">
												<p class="meta_ex_type_name">${nctAgd.nctMetaExSCom}</p>
											</div>
										</div>
									</c:if>
									<c:if test="${nctAgd.nctMetaExSale eq 'ER02'}">
										<div class="meta_ex_type">
											<div class="meta_ex_type_id">
												이전
											</div>
											<div class="meta_ex_type_info">
												<p class="meta_ex_type_name">${nctAgd.nctMetaExSCom}</p>
											</div>
										</div>
									</c:if>
									<c:if test="${nctAgd.nctMetaExSale eq 'ER03'}">
										<div class="meta_ex_type">
											<div class="meta_ex_type_id">
												기타
											</div>
											<div class="meta_ex_type_info">
												<p class="meta_ex_type_name">${nctAgd.nctMetaExSCom}</p>
											</div>
										</div>
									</c:if>
									
								</div>
								<div class="item_tap"></div>
								<div class="item_label">
									<p>수출 예정일</p>
								</div>
								<div class="item_box"> 
									<p>${nctAgd.nctMetaExDateView}</p>
									<c:if test="${nctAgd.nctMetaExDCom ne null}">
										<p class="tran_day_ment">${nctAgd.nctMetaExDCom}</p>
									</c:if>
								</div>
							</c:if>
							<c:if test="${nctAgd.nctMetaType eq 'T201' or nctAgd.nctMetaType eq 'T202' or nctAgd.nctMetaType eq 'T203' or nctAgd.nctMetaType eq 'T301' or nctAgd.nctMetaType eq 'T302' or nctAgd.nctMetaType eq 'T303'}">
								<div class="item_tap"></div>
								<div class="item_label">
									<p>수출 대상국</p>
								</div>
								<div class="item_box"> 
									<ul class="meta_cty_list">
									<c:forEach items="${recCtyList}" var="ctyList" varStatus="counturylist">
										<li class="meta_cty">
											<div class="meta_cty_flag">
												<img src="/resources/images/icon/flag_b_${fn:toLowerCase(ctyList.nctCtyCode)}.png.png" alt="${ctyList.nctCtyCode}">
											</div>
											<div class="meta_cty_info">
												<p class="meta_cty_buyer">[${ctyList.conName}] ${ctyList.nctCtyBuyer}</p>
											</div>
										</li>
									</c:forEach>
									</ul>
								</div>
							</c:if>
						</div>
						<c:set var="fileFc001" value="0" />
						<c:set var="fileFc002" value="0" />
						<c:set var="fileFc003" value="0" />
						<c:set var="fileFc004" value="0" />
						<c:set var="fileFc005" value="0" />
						<c:forEach items="${recFileList }" var="filechk" varStatus="status">
							<c:if test="${filechk.nctFileType eq 'FC001'}"><c:set var="fileFc001" value="${fileFc001 + 1}" /></c:if>
							<c:if test="${filechk.nctFileType eq 'FC002'}"><c:set var="fileFc002" value="${fileFc002 + 1}" /></c:if>
							<c:if test="${filechk.nctFileType eq 'FC003'}"><c:set var="fileFc003" value="${fileFc003 + 1}" /></c:if>
							<c:if test="${filechk.nctFileType eq 'FC004'}"><c:set var="fileFc004" value="${fileFc004 + 1}" /></c:if>
							<c:if test="${filechk.nctFileType eq 'FC005'}"><c:set var="fileFc005" value="${fileFc005 + 1}" /></c:if>
						</c:forEach>
						<c:forEach items="${recFileList }" var="file" varStatus="status">
							
							<c:if test="${fileFc001 ne '0'}">
								<c:if test="${file.nctFileType eq 'FC001'}">
									<div class="nct_bro_item type_08">
										<div class="item_label">
											<p>접수 신청서</p>
										</div>
										<a href="#none" class="item_file">
											<div class="file_view_info">
												<c:if test="${file.nctFilePath eq 'LOCAL'}">
													<p><span class="color_R">로컬</span>에서 등록 된 <span class="color_B">파일</span>은  <span class="color_B">열람</span>이 <span class="color_R">불가능</span>합니다.</p>
												</c:if>
												<c:if test="${file.nctFilePath ne 'LOCAL'}">
													<p><span class="color_B">클릭</span> 하시면 <span class="color_B">뷰어</span>를 통해 파일을 <span class="color_B">열람</span>하실 수 있습니다.</p>
												</c:if>
											</div>
											<div class="file_icon">
												<img src="/resources/images/icon/icon_file_${file.nctFileExt}.png" alt="${file.nctFileOriginNm}">
											</div>
											<div class="file_body">
												<div class="file_body_top">
													<p>
														${file.nctFileOriginNm} 
													</p>
												</div>
												<div class="file_body_bottom">
													<c:if test="${file.nctFilePath eq 'LOCAL'}">
														<span class="file_path">Local </span>
													</c:if>
													<c:if test="${file.nctFilePath eq '/home/tomcat/dev/upload/file/'}">
														<span class="file_path">Dev </span>
													</c:if> 
													<fmt:formatNumber value="${file.nctFileSize}" pattern="#,###" /> Byte | 등록일 : ${file.nctFileRegDateView}
												</div>
											</div>
										</a>
									</div>
								</c:if>
							</c:if>
							
							<c:if test="${fileFc002 ne '0'}">
								<c:if test="${file.nctFileType eq 'FC002'}">
									<div class="nct_bro_item type_08">
										<div class="item_label">
											<p>공문 파일</p>
										</div>
										<a href="#none" class="item_file">
											<div class="file_view_info">
												<c:if test="${file.nctFilePath eq 'LOCAL'}">
													<p><span class="color_R">로컬</span>에서 등록 된 <span class="color_B">파일</span>은  <span class="color_B">열람</span>이 <span class="color_R">불가능</span>합니다.</p>
												</c:if>
												<c:if test="${file.nctFilePath ne 'LOCAL'}">
													<p><span class="color_B">클릭</span> 하시면 <span class="color_B">뷰어</span>를 통해 파일을 <span class="color_B">열람</span>하실 수 있습니다.</p>
												</c:if>
											</div>
											<div class="file_icon">
												<img src="/resources/images/icon/icon_file_${file.nctFileExt}.png" alt="${file.nctFileOriginNm}">
											</div>
											<div class="file_body">
												<div class="file_body_top">
													<p>
														${file.nctFileOriginNm}
													</p> 
												</div>
												<div class="file_body_bottom">
													<c:if test="${file.nctFilePath eq 'LOCAL'}">
														<span class="file_path">Local </span>
													</c:if>
													<c:if test="${file.nctFilePath eq '/home/tomcat/dev/upload/file/'}">
														<span class="file_path">Dev </span>
													</c:if> 
													<fmt:formatNumber value="${file.nctFileSize}" pattern="#,###" /> Byte | 등록일 : ${file.nctFileRegDateView}
												</div>
											</div>
										</a>
									</div>
								</c:if>
							</c:if>
							
							<c:if test="${fileFc003 ne '0'}">
								<c:if test="${file.nctFileType eq 'FC003'}">
									<div class="nct_bro_item type_08">
										<div class="item_label">
											<p>국가 핵심 기술 설명자료</p>
										</div>
										<a href="#none" class="item_file">
											<div class="file_view_info">
												<c:if test="${file.nctFilePath eq 'LOCAL'}">
													<p><span class="color_R">로컬</span>에서 등록 된 <span class="color_B">파일</span>은  <span class="color_B">열람</span>이 <span class="color_R">불가능</span>합니다.</p>
												</c:if>
												<c:if test="${file.nctFilePath ne 'LOCAL'}">
													<p><span class="color_B">클릭</span> 하시면 <span class="color_B">뷰어</span>를 통해 파일을 <span class="color_B">열람</span>하실 수 있습니다.</p>
												</c:if>
											</div>
											<div class="file_icon">
												<img src="/resources/images/icon/icon_file_${file.nctFileExt}.png" alt="${file.nctFileOriginNm}">
											</div>
											<div class="file_body">
												<div class="file_body_top">
													<p>
														${file.nctFileOriginNm}
													</p>
												</div>
												<div class="file_body_bottom">
													<c:if test="${file.nctFilePath eq 'LOCAL'}">
														<span class="file_path">Local </span>
													</c:if>
													<c:if test="${file.nctFilePath eq '/home/tomcat/dev/upload/file/'}">
														<span class="file_path">Dev </span>
													</c:if> 
													<fmt:formatNumber value="${file.nctFileSize}" pattern="#,###" /> Byte | 등록일 : ${file.nctFileRegDateView}
												</div>
											</div>
										</a>
									</div>
								</c:if>
							</c:if>
							
							<c:if test="${fileFc004 ne '0'}">
								<c:if test="${file.nctFileType eq 'FC004'}">
									<div class="nct_bro_item type_08">
										<div class="item_label">
											<p>변경 국가 핵심 기술 설명자료</p>
										</div>
										<a href="#none" class="item_file">
											<div class="file_view_info">
												<c:if test="${file.nctFilePath eq 'LOCAL'}">
													<p><span class="color_R">로컬</span>에서 등록 된 <span class="color_B">파일</span>은  <span class="color_B">열람</span>이 <span class="color_R">불가능</span>합니다.</p>
												</c:if>
												<c:if test="${file.nctFilePath ne 'LOCAL'}">
													<p><span class="color_B">클릭</span> 하시면 <span class="color_B">뷰어</span>를 통해 파일을 <span class="color_B">열람</span>하실 수 있습니다.</p>
												</c:if>
											</div>
											<div class="file_icon">
												<img src="/resources/images/icon/icon_file_${file.nctFileExt}.png" alt="${file.nctFileOriginNm}">
											</div>
											<div class="file_body">
												<div class="file_body_top">
													<p>
														${file.nctFileOriginNm}
													</p>
												</div>
												<div class="file_body_bottom">
													<c:if test="${file.nctFilePath eq 'LOCAL'}">
														<span class="file_path">Local </span>
													</c:if>
													<c:if test="${file.nctFilePath eq '/home/tomcat/dev/upload/file/'}">
														<span class="file_path">Dev </span>
													</c:if> 
													<fmt:formatNumber value="${file.nctFileSize}" pattern="#,###" /> Byte | 등록일 : ${file.nctFileRegDateView}
												</div>
											</div>
										</a>
									</div>
								</c:if>
							</c:if>
							
						</c:forEach>
						<c:if test="${fileFc005 ne '0'}">
							<div class="nct_bro_item type_08">
								<div class="item_label">
									<p>첨부파일</p>
								</div>
								<c:forEach items="${recFileList }" var="file" varStatus="status">
									<c:if test="${file.nctFileType eq 'FC005'}">
										<a href="#none" class="item_file">
											<div class="file_view_info">
												<c:if test="${file.nctFilePath eq 'LOCAL'}">
													<p><span class="color_R">로컬</span>에서 등록 된 <span class="color_B">파일</span>은  <span class="color_B">열람</span>이 <span class="color_R">불가능</span>합니다.</p>
												</c:if>
												<c:if test="${file.nctFilePath ne 'LOCAL'}">
													<p><span class="color_B">클릭</span> 하시면 <span class="color_B">뷰어</span>를 통해 파일을 <span class="color_B">열람</span>하실 수 있습니다.</p>
												</c:if>
											</div>
											<div class="file_icon">
												<img src="/resources/images/icon/icon_file_${file.nctFileExt}.png" alt="${file.nctFileOriginNm}">
											</div>
											<div class="file_body">
												<div class="file_body_top">
													<p>
														${file.nctFileOriginNm}
													</p>
												</div>
												<div class="file_body_bottom">
													<c:if test="${file.nctFilePath eq 'LOCAL'}">
														<span class="file_path">Local </span>
													</c:if>
													<c:if test="${file.nctFilePath eq '/home/tomcat/dev/upload/file/'}">
														<span class="file_path">Dev </span>
													</c:if> 
													<fmt:formatNumber value="${file.nctFileSize}" pattern="#,###" /> Byte | 등록일 : ${file.nctFileRegDateView}
												</div>
											</div>
										</a>
									</c:if>
								</c:forEach>
							</div>
						</c:if>
						
						
						<div class="nct_bro_item type_01">
							
							<c:forEach items="${recFileList }" var="file" varStatus="status">
								
								<c:if test="${file.nctFileType ne 'FC005'}">
									<div class="item_box"> 
										<c:if test="${file.nctFilePath eq 'LOCAL'}">
										<a 	data-viewer-path="${ viewerPath }"
			                					data-file-path="${ file.nctFilePath }"
			                					data-file-key="${ file.nctFileKey }"
												data-file-name="${ file.nctFileName }"
												data-user-name="${ user.admName }"
												data-user-position="${ user.admPositon }"
												data-user-com="${ user.admCom }"
												data-user-dept="${ user.admDept }"
												data-user-phone1="${ user.admMobile1 }"
												data-user-phone2="${ user.admMobile2 }"
												data-user-phone3="${ user.admMobile3 }"
												data-user-email="${ user.admEmail }" href="javascript:void(0);">${file.nctFileOriginNm }</a>
										</c:if>
										<c:if test="${file.nctFilePath ne 'LOCAL'}">
											<a 	data-viewer-path="${ viewerPath }"
			                					data-file-path="${ file.nctFilePath }"
			                					data-file-key="${ file.nctFileKey }"
												data-file-name="${ file.nctFileName }"
												data-user-name="${ user.admName }"
												data-user-position="${ user.admPositon }"
												data-user-com="${ user.admCom }"
												data-user-dept="${ user.admDept }"
												data-user-phone1="${ user.admMobile1 }"
												data-user-phone2="${ user.admMobile2 }"
												data-user-phone3="${ user.admMobile3 }"
												data-user-email="${ user.admEmail }" href="javascript:void(0);">${file.nctFileOriginNm }</a>
										</c:if>
									</div>
								</c:if>
							</c:forEach>
						</div>
						
						
					</div>
				</div>
				</div>
				
				
				
			
				<div class="browser_col_tap tap02"></div>
				
				
				
				<div class="sub_child side_001">
					<div class="browser_block">
						<div class="section_title_box type02">
							<h1 class="section_title">전문위원회 검토 의견/ 검토 결과</h1>
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
						
					</div>
				</div>
				
			</div>
			
		</div>
		<!-- //뷰어타입 : 브라우저  -->	
	</div>
	<!-- 뷰어타입 바디 시작  -->
</div>		
<div class="nct_footer">
	<c:if test="${mainMenuCode eq 'EXP002'}">
		<c:if test="${ user.admGroup eq 'AMG00' or user.admGroup eq 'AMG01' or user.admGroup eq 'AMG02'}">
			<c:if test="${nctAgd.nctAgdStatus eq 'AGD100'}">
		 		<a href="#none" class="nct_btn">검토 요청 회수</a>
			</c:if>
		</c:if>
		<a href="/expcom/expAgdList.do?pageNo=${param.pageNo}<c:if test="${param.status ne null}">&status=${param.status}</c:if>" class="nct_btn tolist">목록</a>
	</c:if>
	<c:if test="${mainMenuCode eq 'EXP003'}">
		<c:if test="${ user.admGroup eq 'AMG00' or user.admGroup eq 'AMG01' or user.admGroup eq 'AMG02'}">
			<c:if test="${nctAgd.nctAgdStatus eq 'AGD100'}">
		 		<a href="#none" class="nct_btn">검토 요청 회수</a>
			</c:if>
		</c:if>
		<a href="/expcom/expRdyList.do?pageNo=${param.pageNo}<c:if test="${param.status ne null}">&status=${param.status}</c:if>" class="nct_btn tolist">목록</a>
	</c:if>
	
	<a href="#none" class="nct_btn">검토 결과 확정</a>
	<a href="#none" class="nct_btn">결과 확정 회수</a>
</div>