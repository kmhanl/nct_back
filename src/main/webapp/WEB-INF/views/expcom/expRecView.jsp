<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 현재 년도 날짜 -->
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="nowDate"><fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" /></c:set>
<input type="hidden" id="recCode" value="${nctRec.nctRecCode}">
<div class="nct_content_wrap">
	<!-- 뷰어타입 바디 시작  -->
	<div class="nct_browser_wrapper">
		<!-- 뷰어타입 : 브라우저  -->
		<div class="nct_browser">
			<div class="browser_alert_box" style="display:none">
				브라우저 알럿
			</div>
			<div class="sub_browser side_001">
				
				<div class="browser_block ">
					<div class="block_title_box type02">
						<h1 class="block_title">신청서 상세 <%-- ${nctRec.nctMetaCode} --%></h1>
					</div>
					<div class="meta_title_box">
						<div class="receipt_t_type">
							<p class="type_tit">
							<c:if test="${nctRec.nctMetaType eq 'T101'}">여부판정</c:if>
							<c:if test="${nctRec.nctMetaType eq 'T201'}">수출신고</c:if>
							<c:if test="${nctRec.nctMetaType eq 'T202'}">수출승인</c:if>
							<c:if test="${nctRec.nctMetaType eq 'T203'}">사전검토</c:if>
							<c:if test="${nctRec.nctMetaType eq 'T301'}">해외인수·합병 <br>신고</c:if>
							<c:if test="${nctRec.nctMetaType eq 'T302'}">해외인수·합병 <br>승인</c:if>
							<c:if test="${nctRec.nctMetaType eq 'T303'}">해외인수·합병 <br>사전검토</c:if>
							<c:if test="${nctRec.nctMetaType eq 'T401'}">국가핵심기술<br>지정</c:if>
							<c:if test="${nctRec.nctMetaType eq 'T402'}">국가핵심기술<br>변경</c:if>
							<c:if test="${nctRec.nctMetaType eq 'T403'}">국가핵심기술<br>해제</c:if>
							<c:if test="${nctRec.nctMetaType eq 'T001'}">기타</c:if>
							</p>
						</div>
						<div class="meta_code">
							<span class="meta_label">접수번호</span>
							<span>${nctRec.nctRecCode}</span>
						</div>
						<div class="meta_com">
							<span class="meta_label">대상기업</span>
							<span><c:out value="${ nctRec.nctMetaComType eq 'C301' ? '대상기업없음' : nctRec.nctMetaComNm }"/></span> 
						</div>
						<div class="expstat_box">
							<p class="stat stat_${nctRec.nctRecStatus} view">
								<c:if test="${nctRec.nctRecStatus eq 'REC100'}">임시저장<br><span class="stat_date">${nctRec.nctRecStatusLastView}</span></c:if>
								<c:if test="${nctRec.nctRecStatus eq 'REC200'}">접수검토<br><span class="stat_date">${nctRec.nctRecStatusLastView}</span></c:if>
								<c:if test="${nctRec.nctRecStatus eq 'REC300'}">접수반려<br><span class="stat_date">${nctRec.nctRecStatusLastView}</span></c:if>
								<c:if test="${nctRec.nctRecStatus eq 'REC400'}">접수철회<br><span class="stat_date">${nctRec.nctRecStatusLastView}</span></c:if>
								<c:if test="${nctRec.nctRecStatus eq 'REC500'}">접수완료<br><span class="stat_date">${nctRec.nctRecStatusLastView}</span></c:if>
								<c:if test="${nctRec.nctRecStatus eq 'REC600'}">검토중<br><span class="stat_date">${nctRec.nctRecStatusLastView}</span></c:if>
								<c:if test="${nctRec.nctRecStatus eq 'REC700'}">검토완료<br><span class="stat_date">${nctRec.nctRecStatusLastView}</span></c:if>
							</p>
						</div>
					</div>
					<div class="content_section agd_view nct_scroll">
						<c:if test="${nctRec.nctMetaComType ne 'C103'}">
							<div class="nct_bro_item type_01">
								<div class="item_label">
									<p>기관명</p>
								</div>
								<div class="item_box"> 
									<p class="ta">${nctRec.nctMetaComNm}</p>
									<p class="ta"><span class="sub_label">대표명 : </span>${nctRec.nctMetaCeo} <span class="sub_label">사업자등록번호 : </span>${nctRec.nctMetaComNo}
									</p>
								</div>
								<div class="item_tap"></div>
								<div class="item_label">
									<p>본사 소재지</p>
								</div>
								<div class="item_box"> 
									<p class="ta">(${nctRec.nctMetaBoZip}) ${nctRec.nctMetaBoAdd1} ${nctRec.nctMetaBoAdd2} </p>
									<p class="ta"><span class="sub_label">전화번호 : </span>${nctRec.nctMetaBoPhone1} - ${nctRec.nctMetaBoPhone2} - ${nctRec.nctMetaBoPhone3}
									</p>
								</div>
								<div class="item_tap"></div>
								<div class="item_label">
									<p>사업장 소재지</p>
								</div>
								<div class="item_box"> 
									<p class="ta">(${nctRec.nctMetaSaZip}) ${nctRec.nctMetaSaAdd1} ${nctRec.nctMetaSaAdd2} </p>
									<p class="ta"><span class="sub_label">전화번호 : </span>${nctRec.nctMetaSaPhone1} - ${nctRec.nctMetaSaPhone2} - ${nctRec.nctMetaSaPhone3}
									</p>
								</div>
								<div class="item_tap"></div>
								<div class="item_label">
									<p>담당자</p>
								</div>
								<div class="item_box"> 
									<p class="ta">${nctRec.nctMetaPmNm} <span class="sub_label">${nctRec.nctMetaPmDept} ${nctRec.nctMetaPmPosition}</span></p>
									<p class="ta"><span class="sub_label">연락처 : </span>${nctRec.nctMetaPmPhone1} - ${nctRec.nctMetaPmPhone2} - ${nctRec.nctMetaPmPhone3} <span class="sub_label"> | </span> ${nctRec.nctMetaPmMobile1} - ${nctRec.nctMetaPmMobile2} - ${nctRec.nctMetaPmMobile3} <span class="sub_label"> | </span> ${nctRec.nctMetaPmEmail}
									</p>
								</div>
							</div>
						</c:if>
						<div class="nct_bro_item type_01">
							<c:if test="${nctRec.nctMetaType eq 'T001'}">
								<div class="item_label">
									<p>제목</p>
								</div>
								<div class="item_box"> 
									<p class="ta">${nctRec.nctMetaTitle}</p>
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
							<c:if test="${nctRec.nctMetaType eq 'T101' or nctRec.nctMetaType eq 'T201' or nctRec.nctMetaType eq 'T202' or nctRec.nctMetaType eq 'T203' or nctRec.nctMetaType eq 'T301' or nctRec.nctMetaType eq 'T302' or nctRec.nctMetaType eq 'T303'}">
								<div class="item_tap"></div>
								<div class="item_label">
									<p>기술 형태</p>
								</div>
								<div class="item_box"> 
									<p class="ta">${nctRec.nctMetaTechForm}</p>
								</div>
							</c:if>
						
							<c:if test="${nctRec.nctMetaType eq 'T101' or nctRec.nctMetaType eq 'T301' or nctRec.nctMetaType eq 'T302' or nctRec.nctMetaType eq 'T303'}">
								<div class="item_tap"></div>
								<div class="item_label">
									<p>기술 특성</p>
								</div>
								<div class="item_box"> 
									<p class="ta">${nctRec.nctMetaTechQua}</p>
								</div>
							</c:if>
							<c:if test="${nctRec.nctMetaType eq 'T101' or nctRec.nctMetaType eq 'T301' or nctRec.nctMetaType eq 'T302' or nctRec.nctMetaType eq 'T303' or nctRec.nctMetaType eq 'T401' or nctRec.nctMetaType eq 'T402' or nctRec.nctMetaType eq 'T403' or nctRec.nctMetaType eq 'T001'}">
								<div class="item_tap"></div>
								<div class="item_label">
									<c:if test="${nctRec.nctMetaType eq 'T101' or nctRec.nctMetaType eq 'T303' or nctRec.nctMetaType eq 'T401' or nctRec.nctMetaType eq 'T402' or nctRec.nctMetaType eq 'T403' or nctRec.nctMetaType eq 'T001'}">
										<p>신청 사유</p>
									</c:if>
									<c:if test="${nctRec.nctMetaType eq 'T301'}">
										<p>신고 사유</p>
									</c:if>
									<c:if test="${nctRec.nctMetaType eq 'T302'}">
										<p>승인 신청 사유</p>
									</c:if>
								</div>
								<div class="item_box"> 
									<p class="ta">${nctRec.nctMetaReason}</p>
									<c:if test="${nctRec.nctMetaType eq 'T301'}">
										<p class="reasonflag ${nctRec.nctMetaLaw01 eq 'Y' ? 'tap_on' : '' }">「산업기술의 유출방지 및 보호에 관한 법률」 제11조의2제2항, 같은 법 시행령 제18조의4제1항</p>
										<p class="reasonflag ${nctRec.nctMetaLaw02 eq 'Y' ? 'tap_on' : '' }">「산업기술의 유출방지 및 보호에 관한 법률」 제11조의2제5항, 같은 법 시행령 제18조의5제1항</p>
										<p class="reasonflag ${nctRec.nctMetaLaw03 eq 'Y' ? 'tap_on' : '' }">「산업기술의 유출방지 및 보호에 관한 법률」 제11조의2제6항, 같은 법 시행령 제18조의5제2항</p>
									</c:if>
								</div>
							</c:if>
							<c:if test="${nctRec.nctMetaType eq 'T201' or nctRec.nctMetaType eq 'T202' or nctRec.nctMetaType eq 'T203'}">
								<div class="item_tap"></div>
								<div class="item_label">
									<p>수출 사유</p>
								</div>
								<div class="item_box"> 
									<c:if test="${nctRec.nctMetaExSale eq 'ER01'}">
										<div class="meta_ex_type">
											<div class="meta_ex_type_id">
												매각
											</div>
											<div class="meta_ex_type_info">
												<p class="meta_ex_type_name">${nctRec.nctMetaExSCom}</p>
											</div>
										</div>
									</c:if>
									<c:if test="${nctRec.nctMetaExSale eq 'ER02'}">
										<div class="meta_ex_type">
											<div class="meta_ex_type_id">
												이전
											</div>
											<div class="meta_ex_type_info">
												<p class="meta_ex_type_name">${nctRec.nctMetaExSCom}</p>
											</div>
										</div>
									</c:if>
									<c:if test="${nctRec.nctMetaExSale eq 'ER03'}">
										<div class="meta_ex_type">
											<div class="meta_ex_type_id">
												기타
											</div>
											<div class="meta_ex_type_info">
												<p class="meta_ex_type_name">${nctRec.nctMetaExSCom}</p>
											</div>
										</div>
									</c:if>
									
								</div>
								<div class="item_tap"></div>
								<div class="item_label">
									<p>수출 예정일</p>
								</div>
								<div class="item_box"> 
									<p>${nctRec.nctMetaExDateView}</p>
									<c:if test="${nctRec.nctMetaExDCom ne null}">
										<p class="tran_day_ment">${nctRec.nctMetaExDCom}</p>
									</c:if>
								</div>
							</c:if>
							<c:if test="${nctRec.nctMetaType eq 'T201' or nctRec.nctMetaType eq 'T202' or nctRec.nctMetaType eq 'T203' or nctRec.nctMetaType eq 'T301' or nctRec.nctMetaType eq 'T302' or nctRec.nctMetaType eq 'T303'}">
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
			
			<div class="browser_col_tap tap01"></div>
			
			<div class="sub_browser side_002">
				<div class="browser_block browser_g">
					<div class="block_title_box type02">
						<h1 class="block_title">검토 의견 및 처리 내역</h1>
					</div>
					<div class="content_section nct_scroll" style="    background: #F7F8FB;    padding: 10px 0 10px 0px;">
						<ul class="agd_his_list">
							<!-- <a href="javascript:void(0);" class="stat_item"> -->
							<c:forEach items="${recHisList}" var="recHis" varStatus="his">
								<li>
									<div class="his_item">
										<p class="his_item_dot"></p>
										<p class="his_item_name">
											<c:if test="${recHis.hisAmgGruop eq 'FRONT'}">
												<span class="" style="font-size:15px;color:#888;"> 
													[기업포털] ${recHis.hisComment} ${recHis.hisRegDtView}
												</span><br>
												<c:if test="${recHis.nctRecStatus eq 'REC100'}">임시저장</c:if>
												<c:if test="${recHis.nctRecStatus eq 'REC200'}">접수 검토</c:if>
												<c:if test="${recHis.nctRecStatus eq 'REC300'}">접수 반려</c:if>
												<c:if test="${recHis.nctRecStatus eq 'REC400'}">접수 철회</c:if>
												<c:if test="${recHis.nctRecStatus eq 'REC500'}">접수 완료</c:if>
												<c:if test="${recHis.nctRecStatus eq 'REC600'}">검토 완료</c:if>
											</c:if>
											<c:if test="${recHis.hisAmgGruop ne 'FRONT'}">
												<c:if test="${recHis.nctRecHisCode eq 'H100'}">
													<span class="" style="font-size:15px;color:#888;"> 
														[기술안보과] ${recHis.hisComment} ${recHis.hisRegDtView}
													</span><br>
													<c:if test="${recHis.nctRecStatus eq 'REC100'}">임시저장</c:if>
													<c:if test="${recHis.nctRecStatus eq 'REC200'}">접수 검토</c:if>
													<c:if test="${recHis.nctRecStatus eq 'REC300'}">접수 반려</c:if>
													<c:if test="${recHis.nctRecStatus eq 'REC400'}">접수 철회</c:if>
													<c:if test="${recHis.nctRecStatus eq 'REC500'}">접수 완료</c:if>
													<c:if test="${recHis.nctRecStatus eq 'REC600'}">검토 완료</c:if>
												</c:if>
												<c:if test="${recHis.nctRecHisCode eq 'H200'}">
													<span class="" style="font-size:15px;color:#888;"> 
														[기술안보과] ${recHis.hisRegId} ${recHis.hisRegDtView}
													</span><br>
													<span class="" style="color:#222;"> 
														${recHis.hisComment}
													</span>
												</c:if>
											</c:if>
										</p>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div class="rec_coment_box ${user.admGroup eq 'AMG03' ? 'top_box' : '' } ${user.admGroup eq 'AMG04' ? 'top_box' : '' } ${mainMenuCode eq 'EXP000' ? 'top_box' : '' }">
						<textarea name="coment" id="coment" class="textareaf" placeholder="검토의견을 작성해주세요."></textarea>
						<div class="btn_box"><a href="javascript:recSaveComent('${nctRec.nctRecCode}');" class="rec_save_coment">의견<br>저장</a></div>
					</div>
					<c:if test="${mainMenuCode eq 'EXP001'}">
						<c:if test="${user.admGroup eq 'AMG00' or user.admGroup eq 'AMG01' or user.admGroup eq 'AMG02'}">
							<div class="rec_compe_box">
								<div class="rec_compe_tit_box">
									<h1 class="rec_compe_title">소관과 의견 첨부 권한 설정</h1>
									<a href="javascript:recSaveCompe('${nctRec.nctRecCode}');" class="rec_save_compe">저장</a>
								</div>
								<div class="nct_tech_list_box">
									<ul class="nct_tech_list">
									<c:set var="techcompctn" value = "0"/>
									<c:forEach items="${nctTechList}" var="nctTech" varStatus="techhis">
										<c:forEach items="${recCompeList}" var="recCompe" varStatus="recCompes">
											<c:if test="${recCompe.nctTechCode eq nctTech.techId}">
												<c:set var="techcompctn" value = "${techcompctn + 1}"/>
											</c:if>
										</c:forEach>
										<li class="${techcompctn eq '1' ? 'compe_on compe_ori' : '' }" data-gid="${nctTech.techNtcGid}" data-tid="${nctTech.techId}">
											<a href="javascript:void(0);" class="nct_tech_item" >${nctTech.techName}</a>
										</li>
										<c:set var="techcompctn" value = "0"/>
									</c:forEach>
									
									</ul>
								</div>
							</div>
						</c:if>
					</c:if>
				</div>
			</div>
		</div>	
	</div>
</div>		
<div class="nct_footer">
	<c:if test="${mainMenuCode eq 'EXP001'}">
		<c:if test="${nctRec.nctRecStatus eq 'REC200'}">
		 	<a href="javascript:recReCon('${nctRec.nctRecCode}')" class="nct_btn to300">반려</a>
		 	<a href="/expcom/expRecList.do?pageNo=${param.pageNo}<c:if test="${param.status ne null}">&status=${param.status}</c:if>" class="nct_btn tolist">목록</a>
		 	<a href="javascript:recConfirm('${nctRec.nctRecCode}')" class="nct_btn to500">승인</a>
		</c:if>
		<c:if test="${nctRec.nctRecStatus eq 'REC300'}">
		 	<a href="javascript:recBaRe('${nctRec.nctRecCode}')" class="nct_btn re3200">반려 회수</a>
		 	<a href="/expcom/expRecList.do?pageNo=${param.pageNo}<c:if test="${param.status ne null}">&status=${param.status}</c:if>" class="nct_btn tolist">목록</a>
		</c:if>
		<c:if test="${nctRec.nctRecStatus eq 'REC400'}">
		 	<a href="/expcom/expRecList.do?pageNo=${param.pageNo}<c:if test="${param.status ne null}">&status=${param.status}</c:if>" class="nct_btn tolist">목록</a>
		</c:if>
		<c:if test="${nctRec.nctRecStatus eq 'REC500'}">
		 	<a href="javascript:recBaCon('${nctRec.nctRecCode}')" class="nct_btn re5200">승인 회수</a>
		 	<a href="/expcom/expRecList.do?pageNo=${param.pageNo}<c:if test="${param.status ne null}">&status=${param.status}</c:if>" class="nct_btn tolist">목록</a>
		 	<!-- <a href="#none" class="nct_btn sendagd">검토 요청</a> -->
		</c:if>
		<c:if test="${nctRec.nctRecStatus eq 'REC600'}">
		 	<a href="/expcom/expRecList.do?pageNo=${param.pageNo}<c:if test="${param.status ne null}">&status=${param.status}</c:if>" class="nct_btn tolist">목록</a>
		</c:if>
		<c:if test="${nctRec.nctRecStatus eq 'REC700'}">
		 	<a href="/expcom/expRecList.do?pageNo=${param.pageNo}<c:if test="${param.status ne null}">&status=${param.status}</c:if>" class="nct_btn tolist">목록</a>
		</c:if>
	</c:if>
	<c:if test="${mainMenuCode eq 'EXP002'}">
		<a href="/expcom/expAgdList.do?pageNo=${param.pageNo}<c:if test="${param.status ne null}">&status=${param.status}</c:if>" class="nct_btn tolist">목록</a>
	</c:if>
	
	<!-- <a href="#none" class="nct_btn">임시 저장</a>
	<a href="#none" class="nct_btn">수정</a>
	<a href="#none" class="nct_btn tocancle">취소</a>
	<a href="#none" class="nct_btn tosave">저장</a> -->
	
</div>