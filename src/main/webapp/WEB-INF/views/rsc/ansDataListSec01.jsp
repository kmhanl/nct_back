<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="/resources/js/research/rscData.js"></script>

	
		<div class="body_wrapper" style="height:100%;">
			<div class="BodyTopUtile ">
				<a href="#none" class="sch_btn">
						<svg version="1.1" id="Capa_1" x="0px" y="0px" fill="#888" viewBox="0 0 124.524 124.524" xml:space="preserve">
							<path d="M51,102.05c10.5,0,20.2-3.2,28.3-8.6l29.3,29.3c2.301,2.3,6.101,2.3,8.5,0l5.7-5.7c2.3-2.3,2.3-6.1,0-8.5L93.4,79.35		c5.399-8.1,8.6-17.8,8.6-28.3c0-28.1-22.9-51-51-51c-28.1,0-51,22.9-51,51C0,79.149,22.8,102.05,51,102.05z M51,20.05
		c17.1,0,31,13.9,31,31c0,17.1-13.9,31-31,31c-17.1,0-31-13.9-31-31C20,33.95,33.9,20.05,51,20.05z"/>
						</svg>
				</a>
				<ul class="BodyTopUtilTap tap_list" style="">
					<li class=""><a href="/rsc/ansDataList.do" class="tap_item">기관 기본 현황</a></li>
					<li><a href="/rsc/ansDataList01.do" class="tap_item">외국인상세</a></li>
					<li class="on"><a href="/rsc/ansDataListSec01.do" class="tap_item">실태조사1영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec02.do" class="tap_item">설문조사2영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec03.do" class="tap_item">실태조사3영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec04.do" class="tap_item">실태조사4영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec05.do" class="tap_item">실태조사5영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec06.do" class="tap_item">실태조사6영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec07.do" class="tap_item">실태조사7영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec09.do" class="tap_item">기타설문조사</a></li>
				</ul>
				<a href="javascript:void(0);" class="tap_btn excelbtn" data-efilename='DataDownload_01.xls' data-sheetname="실태조사-영역1" >엑셀 다운로드</a>
			</div>
            <div class="body_content_wrapper" style="border:1px solid #d8d8d8">
                <div class="main_body" style="height:calc(100%)">
					<div class="search_wrapper">
						검색영역
					</div>
					<div class="content_wrapper" style="overflow:scroll">
						<div class="ansDataBox" style="position: relative;">
							
							<table class="ansDataTable" style="width:3580px;" id="DownloadData">
								<colgroup>
								<col width="60px">
								<col width="240px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								
								
								</colgroup>
								<thead>
									<tr>
										<th rowspan="3">No.</th>
										<th rowspan="3">대상기관</th>
										<th rowspan="3">문항 1</th>
										<th rowspan="3">문항 2</th>
										<th rowspan="3">문항 3</th>
										<th rowspan="3">문항 4</th>
										<th rowspan="3">문항 5</th>
										<th rowspan="3">문항 6</th>
										<th rowspan="2" colspan="5">문항 7</th>
										<th rowspan="3">문항 8</th>
										<th rowspan="2" colspan="8">문항 9</th>
										<th rowspan="3">문항 10</th>
										<th rowspan="1" colspan="12">문항 11</th>
										<th rowspan="2" colspan="8">문항 12</th>
									</tr>
									<tr>
										<th rowspan="1" colspan="4">내부 인원수</th>
										<th rowspan="1" colspan="4">외부 외주관리</th>
										<th rowspan="1" colspan="4">소계</th>
									</tr>
									<tr>
										<th rowspan="1">7.1</th>
										<th rowspan="1">7.2</th>
										<th rowspan="1">7.3</th>
										<th rowspan="1">7.4</th>
										<th rowspan="1">7.5</th>
										<th rowspan="1">9.1</th>
										<th rowspan="1">9.2</th>
										<th rowspan="1">9.3</th>
										<th rowspan="1">9.4</th>
										<th rowspan="1">9.5</th>
										<th rowspan="1">9.6</th>
										<th rowspan="1">9.7</th>
										<th rowspan="1">9.8</th>
										<th rowspan="1">정보보호[A]</th>
										<th rowspan="1">관리보안[A]</th>
										<th rowspan="1">물리보안[A]</th>
										<th rowspan="1">소계[A+B+C]</th>
										<th rowspan="1">정보보호[A]</th>
										<th rowspan="1">관리보안[A]</th>
										<th rowspan="1">물리보안[A]</th>
										<th rowspan="1">소계[A+B+C]</th>
										<th rowspan="1">정보보호[A]</th>
										<th rowspan="1">관리보안[A]</th>
										<th rowspan="1">물리보안[A]</th>
										<th rowspan="1">소계[A+B+C]</th>
										<th rowspan="1">12.1</th>
										<th rowspan="1">12.2</th>
										<th rowspan="1">12.3</th>
										<th rowspan="1">12.4</th>
										<th rowspan="1">12.5</th>
										<th rowspan="1">12.6</th>
										<th rowspan="1">12.7</th>
										<th rowspan="1">12.8</th>
									</tr>
										
								</thead>
								<tbody>
									<c:set var = "QuesIdx" value = ""/>
									<c:set var = "ComNo" value = "1"/>
									<c:forEach items="${dataComList}" var="queans" varStatus="status">
										<tr>
											<th scope="row" class="table_left2">${status.count}</th>
											<th scope="row" class="table_left2" data-comcode="${queans.rscMemCode}">${queans.rscMemCompany}</th>
											<c:forEach items="${dataqus01List}" var="queans1" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans1.rscMemCode }">
													<td scope="row" class="table_left2" data-idx="${queans1.rscQuesIdx}">${queans1.rscQuesAns}</td>
												</c:if>
											</c:forEach>
											<c:forEach items="${dataqus02List}" var="queans2" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans2.rscMemCode }">
													<td scope="row" class="table_left2" data-idx="${queans2.rscQuesIdx}">${queans2.rscQuesAns}</td>
												</c:if>
											</c:forEach>
											<c:forEach items="${dataqus03List}" var="queans3" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans3.rscMemCode }">
													<td scope="row" class="table_left2" data-idx="${queans3.rscQuesIdx}">${queans3.rscQuesAns}</td>
												</c:if>
											</c:forEach>
											<c:forEach items="${dataqus04List}" var="queans4" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans4.rscMemCode }">
													<td scope="row" class="table_left2" data-idx="${queans4.rscQuesIdx}">${queans4.rscQuesAns}</td>
												</c:if>
											</c:forEach>
											<c:forEach items="${dataqus05List}" var="queans5" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans5.rscMemCode }">
													<td scope="row" class="table_left2" data-idx="${queans5.rscQuesIdx}">${queans5.rscQuesAns}</td>
												</c:if>
											</c:forEach>
											<c:forEach items="${dataqus06List}" var="queans6" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans6.rscMemCode }">
													<td scope="row" class="table_left2" data-idx="${queans6.rscQuesIdx}">${queans6.rscQuesAns}</td>
												</c:if>
												
											</c:forEach>
											<!-- <td colspan="5">
												<div class="sec17">
													<p class="ans01">1</p>
													<p class="ans02">2</p>
													<p class="ans03">3</p>
													<p class="ans04">4</p>
													<p class="ans05">5</p>
												</div>
											</td> -->
											<c:forEach items="${dataqus07List}" var="queans7" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans7.rscMemCode }">
													<c:if test="${queans7.rscQuesAns eq '1'}">
														<c:set var = "Ques71" value = "Y"/>
													</c:if>
													<c:if test="${queans7.rscQuesAns eq '2'}">
														<c:set var = "Ques72" value = "Y"/>
													</c:if>
													<c:if test="${queans7.rscQuesAns eq '3'}">
														<c:set var = "Ques73" value = "Y"/>
													</c:if>
													<c:if test="${queans7.rscQuesAns eq '4'}">
														<c:set var = "Ques74" value = "Y"/>
													</c:if>
													<c:if test="${queans7.rscQuesAns eq '5'}">
														<c:set var = "Ques75" value = "Y"/>
													</c:if>
													<c:set var = "rscQuesIdx" value = "${queans7.rscQuesIdx}"/>
												</c:if>
											</c:forEach>
											<c:if test="${Ques71 eq 'Y'}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques71 eq 'N' or Ques71 eq null}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques72 eq 'Y'}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques72 eq 'N' or Ques72 eq null}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques73 eq 'Y'}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques73 eq 'N' or Ques73 eq null}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques74 eq 'Y'}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques74 eq 'N' or Ques74 eq null}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques75 eq 'Y'}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques75 eq 'N' or Ques75 eq null}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<%-- <td class="test">1:${Ques71} / 2:${Ques72} /3:${Ques73} / 4:${Ques74} / 5:${Ques75}</td> --%>
											
											<c:forEach items="${dataqus08List}" var="queans8" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans8.rscMemCode }">
													
													<c:if test="${queans8.rscQuesAns eq '3'}">
														<c:set var = "Ques08" value = "N"/>
													</c:if>
													<c:if test="${queans8.rscQuesAns ne '3'}">
														<c:set var = "Ques08" value = "Y"/>
													</c:if>
													<td scope="row" class="table_left2" data-idx="${queans8.rscQuesIdx}">${queans8.rscQuesAns}</td>
												</c:if>
											</c:forEach>
											<c:if test="${Ques08 eq 'N'}">
												<td>-</td>
												<td>-</td>
												<td>-</td>
												<td>-</td>
												<td>-</td>
												<td>-</td>
												<td>-</td>
												<td>-</td>
											</c:if>
											<c:if test="${Ques08 eq 'Y'}">
												<c:set var = "Ques91" value = ""/>
												<c:set var = "Ques92" value = ""/>
												<c:set var = "Ques93" value = ""/>
												<c:set var = "Ques94" value = ""/>
												<c:set var = "Ques95" value = ""/>
												<c:set var = "Ques96" value = ""/>
												<c:set var = "Ques97" value = ""/>
												<c:set var = "Ques98" value = ""/>
												<c:forEach items="${dataqus09List}" var="queans9" varStatus="status">
													<c:if test="${queans.rscMemCode eq queans9.rscMemCode }">
														<c:if test="${queans9.rscQuesAns eq '1'}">
															<c:set var = "Ques91" value = "Y"/>
														</c:if>
														<c:if test="${queans9.rscQuesAns eq '2'}">
															<c:set var = "Ques92" value = "Y"/>
														</c:if>
														<c:if test="${queans9.rscQuesAns eq '3'}">
															<c:set var = "Ques93" value = "Y"/>
														</c:if>
														<c:if test="${queans9.rscQuesAns eq '4'}">
															<c:set var = "Ques94" value = "Y"/>
														</c:if>
														<c:if test="${queans9.rscQuesAns eq '5'}">
															<c:set var = "Ques95" value = "Y"/>
														</c:if>
														<c:if test="${queans9.rscQuesAns eq '6'}">
															<c:set var = "Ques96" value = "Y"/>
														</c:if>
														<c:if test="${queans9.rscQuesAns eq '7'}">
															<c:set var = "Ques97" value = "Y"/>
														</c:if>
														<c:if test="${queans9.rscQuesAns eq '8'}">
															<c:set var = "Ques98" value = "Y"/>
														</c:if>
														<c:set var = "rscQuesIdx" value = "${queans9.rscQuesIdx}"/>
													</c:if>
													
												</c:forEach>
												<c:if test="${Ques91 eq 'Y'}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques91 eq 'N' or Ques91 eq ''}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques92 eq 'Y'}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques92 eq 'N' or Ques92 eq ''}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques93 eq 'Y'}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques93 eq 'N' or Ques93 eq ''}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques94 eq 'Y'}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques94 eq 'N' or Ques94 eq ''}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques95 eq 'Y'}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques95 eq 'N' or Ques95 eq ''}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques96 eq 'Y'}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques96 eq 'N' or Ques96 eq ''}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques97 eq 'Y'}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques97 eq 'N' or Ques97 eq ''}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques98 eq 'Y'}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques98 eq 'N' or Ques98 eq ''}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
												</c:if>
											</c:if>
											<%-- <td>1:${Ques91}/2:${Ques92}/3:${Ques93}/4:${Ques94}/5:${Ques95}/6:${Ques96}/7:${Ques97}/8:${Ques98}</td> --%>
											<c:forEach items="${dataqus10List}" var="queans10" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans10.rscMemCode }">
													
													<c:if test="${queans10.rscQuesAns eq '3'}">
														<c:set var = "Ques10" value = "N"/>
													</c:if>
													<c:if test="${queans10.rscQuesAns ne '3'}">
														<c:set var = "Ques10" value = "Y"/>
													</c:if>
													<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}">${queans10.rscQuesAns}<%-- (${Ques10}) --%></td>
												</c:if>
											</c:forEach>
											<c:if test="${Ques10 eq 'N'}">
												<td>-</td>
												<td>-</td>
												<td>-</td>
												<td>-</td>
												<td>-</td>
												<td>-</td>
												<td>-</td>
												<td>-</td>
												<td>-</td>
												<td>-</td>
												<td>-</td>
												<td>-</td>
												<td>-</td>
												<td>-</td>
												<td>-</td>
												<td>-</td>
												<td>-</td>
												<td>-</td>
												<td>-</td>
												<td>-</td>
											</c:if>
											<c:if test="${Ques10 eq 'Y'}">
												<c:set var = "Quesrow1" value = ""/>
												<c:set var = "Quesrow2" value = ""/>
												<c:set var = "Quesrow31" value = ""/>
												<c:set var = "Quesrow32" value = ""/>
												<c:set var = "Quesrow33" value = ""/>
												<c:set var = "Quesrow34" value = ""/>
												
												<c:forEach items="${dataqus11List}" var="queans11" varStatus="status">
													<c:if test="${queans.rscMemCode eq queans11.rscMemCode }">
														<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}">${queans11.rscQuesAnsEtc1}</td>
														<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}">${queans11.rscQuesAnsEtc2}</td>
														<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}">${queans11.rscQuesAnsEtc3}</td>
														<c:set var = "Quesrow1" value = "${queans11.rscQuesAnsEtc1 + queans11.rscQuesAnsEtc2 + queans11.rscQuesAnsEtc3}"/>
														<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}">${Quesrow1}</td>
														<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}">${queans11.rscQuesAnsEtc4}</td>
														<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}">${queans11.rscQuesAnsEtc5}</td>
														<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}">${queans11.rscQuesAnsEtc6}</td>
														<c:set var = "Quesrow2" value = "${queans11.rscQuesAnsEtc1 + queans11.rscQuesAnsEtc5 + queans11.rscQuesAnsEtc6}"/>
														<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}">${Quesrow2}</td>
														<c:set var = "Quesrow31" value = "${queans11.rscQuesAnsEtc1 + queans11.rscQuesAnsEtc4}"/>
														<c:set var = "Quesrow32" value = "${queans11.rscQuesAnsEtc2 + queans11.rscQuesAnsEtc5}"/>
														<c:set var = "Quesrow33" value = "${queans11.rscQuesAnsEtc3 + queans11.rscQuesAnsEtc6}"/>
														<c:set var = "Quesrow34" value = "${Quesrow31 + Quesrow32 + Quesrow33}"/>
														<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}">${Quesrow31}</td>
														<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}">${Quesrow32}</td>
														<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}">${Quesrow33}</td>
														<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}">${Quesrow34}</td>
													</c:if>
												</c:forEach>
												
												
												<c:set var = "Ques121" value = ""/>
												<c:set var = "Ques122" value = ""/>
												<c:set var = "Ques123" value = ""/>
												<c:set var = "Ques124" value = ""/>
												<c:set var = "Ques125" value = ""/>
												<c:set var = "Ques126" value = ""/>
												<c:set var = "Ques127" value = ""/>
												<c:set var = "Ques128" value = ""/>
												<c:forEach items="${dataqus12List}" var="queans12" varStatus="status">
													<c:if test="${queans.rscMemCode eq queans12.rscMemCode }">
														<c:if test="${queans12.rscQuesAns eq '1'}">
															<c:set var = "Ques121" value = "Y"/>
														</c:if>
														<c:if test="${queans12.rscQuesAns eq '2'}">
															<c:set var = "Ques122" value = "Y"/>
														</c:if>
														<c:if test="${queans12.rscQuesAns eq '3'}">
															<c:set var = "Ques123" value = "Y"/>
														</c:if>
														<c:if test="${queans12.rscQuesAns eq '4'}">
															<c:set var = "Ques124" value = "Y"/>
														</c:if>
														<c:if test="${queans12.rscQuesAns eq '5'}">
															<c:set var = "Ques125" value = "Y"/>
														</c:if>
														<c:if test="${queans12.rscQuesAns eq '6'}">
															<c:set var = "Ques126" value = "Y"/>
														</c:if>
														<c:if test="${queans12.rscQuesAns eq '7'}">
															<c:set var = "Ques127" value = "Y"/>
														</c:if>
														<c:if test="${queans12.rscQuesAns eq '8'}">
															<c:set var = "Ques128" value = "Y"/>
														</c:if>
														<c:set var = "rscQuesIdx" value = "${queans12.rscQuesIdx}"/>
													</c:if>
												</c:forEach>
												<c:if test="${Ques121 eq 'Y'}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques121 eq 'N' or Ques121 eq ''}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques122 eq 'Y'}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques122 eq 'N' or Ques122 eq ''}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques123 eq 'Y'}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques123 eq 'N' or Ques123 eq ''}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques124 eq 'Y'}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques124 eq 'N' or Ques124 eq ''}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques125 eq 'Y'}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques125 eq 'N' or Ques125 eq ''}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques126 eq 'Y'}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques126 eq 'N' or Ques126 eq ''}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques127 eq 'Y'}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques127 eq 'N' or Ques127 eq ''}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques128 eq 'Y'}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques128 eq 'N' or Ques128 eq ''}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
												</c:if>
											</c:if>
										</tr>
											
									</c:forEach>
									
								</tbody>
							</table>
							
							
							
						</div>		
						
					</div>

				</div>
                
            </div>
        </div>