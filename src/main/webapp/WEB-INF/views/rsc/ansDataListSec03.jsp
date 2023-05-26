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
					<li class=""><a href="/rsc/ansDataListSec01.do" class="tap_item">실태조사1영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec02.do" class="tap_item">설문조사2영역</a></li>
					<li class="on"><a href="/rsc/ansDataListSec03.do" class="tap_item">실태조사3영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec04.do" class="tap_item">실태조사4영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec05.do" class="tap_item">실태조사5영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec06.do" class="tap_item">실태조사6영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec07.do" class="tap_item">실태조사7영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec09.do" class="tap_item">기타설문조사</a></li>
				</ul>
				<a href="javascript:void(0);" class="tap_btn excelbtn" data-efilename='DataDownload_03.xls' data-sheetname="실태조사-영역3" >엑셀 다운로드</a>
			</div>
            <div class="body_content_wrapper" style="border:1px solid #d8d8d8">
                <div class="main_body" style="height:calc(100%)">
					<div class="search_wrapper">
						검색영역
					</div>
					<div class="content_wrapper" style="overflow:scroll">
						<div class="ansDataBox" style="">
							<table class="ansDataTable" style="min-width:3900px;" id="DownloadData">
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
										<th rowspan="2" colspan="5">문항 6</th>
										<th rowspan="3">문항 7</th>
										<th rowspan="3">문항 8</th>
										<th rowspan="3">문항 9</th>
										<th rowspan="3">문항 10</th>
										<th rowspan="2" colspan="4">문항 11</th>
										<th rowspan="3">문항 12</th>
										<th rowspan="1" colspan="27">문항 13</th>
										<th rowspan="2" colspan="4">문항 14</th>
										<th rowspan="2" colspan="7">문항 15</th>
										<th rowspan="3">문항 16</th>
										<th rowspan="3">문항 17</th>
										<th rowspan="3">문항 18</th>
									</tr>
									<tr>
										<th rowspan="1" colspan="9">연구개발인력</th>
										<th rowspan="1" colspan="9">엔지니어</th>
										<th rowspan="1" colspan="9">소계</th>
									</tr>
									<tr>
										<th rowspan="1">6.1</th>
										<th rowspan="1">6.1 주관</th>
										<th rowspan="1">6.1 사업</th>
										<th rowspan="1">6.2</th>
										<th rowspan="1">6.3</th>
										<th rowspan="1">11.1</th>
										<th rowspan="1">11.2</th>
										<th rowspan="1">11.3</th>
										<th rowspan="1">11.4</th>
										<th rowspan="1">개발-내국</th>
										<th rowspan="1">개발-외국</th>
										<th rowspan="1">생산-내국</th>
										<th rowspan="1">생산-외국</th>
										<th rowspan="1">기타-내국</th>
										<th rowspan="1">기타-외국</th>
										<th rowspan="1">소계-내국</th>
										<th rowspan="1">소계-외국</th>
										<th rowspan="1">합계</th>
										<th rowspan="1">개발-내국</th>
										<th rowspan="1">개발-외국</th>
										<th rowspan="1">생산-내국</th>
										<th rowspan="1">생산-외국</th>
										<th rowspan="1">기타-내국</th>
										<th rowspan="1">기타-외국</th>
										<th rowspan="1">소계내국</th>
										<th rowspan="1">소계외국</th>
										<th rowspan="1">합계</th>
										<th rowspan="1">개발-내국</th>
										<th rowspan="1">개발-외국</th>
										<th rowspan="1">생산-내국</th>
										<th rowspan="1">생산-외국</th>
										<th rowspan="1">기타-내국</th>
										<th rowspan="1">기타-외국</th>
										<th rowspan="1">소계-내국</th>
										<th rowspan="1">소계-외국</th>
										<th rowspan="1">합계</th>
										<th rowspan="1">14.1</th>
										<th rowspan="1">14.2</th>
										<th rowspan="1">14.3</th>
										<th rowspan="1">14.4</th>
										<th rowspan="1">15.1</th>
										<th rowspan="1">15.2</th>
										<th rowspan="1">15.3</th>
										<th rowspan="1">15.3</th>
										<th rowspan="1">15.4</th>
										<th rowspan="1">15.5</th>
										<th rowspan="1">15.6</th>
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
											
											<c:set var = "Ques611" value = ""/>
											<c:set var = "Ques612" value = ""/>
											<c:set var = "Ques613" value = ""/>
											<c:set var = "Ques641" value = ""/>
											<c:set var = "Ques651" value = ""/>
											<c:forEach items="${dataqus06List}" var="queans6" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans6.rscMemCode }">
													<c:if test="${queans6.rscQuesAns eq '1'}">
														<c:set var = "Ques611" value = "Y"/>
														<c:set var = "Ques612" value = "${queans6.rscQuesAnsEtc1}"/>
														<c:set var = "Ques613" value = "${queans6.rscQuesAnsEtc2}"/>
													</c:if>
													<c:if test="${queans6.rscQuesAns eq '2'}">
														
														<c:set var = "Ques641" value = "Y"/>
													</c:if>
													<c:if test="${queans6.rscQuesAns eq '3'}">
														<c:set var = "Ques651" value = "Y"/>
													</c:if>
													<c:set var = "rscQuesIdx" value = "${queans6.rscQuesIdx}"/>
												</c:if>
											</c:forEach>
											<c:if test="${Ques611 eq 'Y'}">
												<td scope="row" class="table_left2 1" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques611 eq 'N' or Ques611 eq ''}">
												<td scope="row" class="table_left2 1" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques612 ne ''}">
												<td scope="row" class="table_left2 aaa" data-idx="${rscQuesIdx}">${Ques612}</td>
											</c:if>
											<c:if test="${Ques612 eq '' or Ques612 eq null}">
												<td scope="row" class="table_left2 bbb" data-idx="${rscQuesIdx}" >-</td>
											</c:if>
											<c:if test="${Ques613 ne ''}">
												<td scope="row" class="table_left2 aaa" data-idx="${rscQuesIdx}">${Ques613}</td>
											</c:if>
											<c:if test="${Ques613 eq ''}">
												<td scope="row" class="table_left2 bbb" data-idx="${rscQuesIdx}">-</td>
											</c:if>
											<c:if test="${Ques641 eq 'Y'}">
												<td scope="row" class="table_left2 4" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques641 eq 'N' or Ques641 eq ''}">
												<td scope="row" class="table_left2 4" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques651 eq 'Y'}">
												<td scope="row" class="table_left2 5" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques651 eq 'N' or Ques651 eq ''}">
												<td scope="row" class="table_left2 5" data-idx="${rscQuesIdx}">0</td>
											</c:if>
																						
											<c:forEach items="${dataqus07List}" var="queans7" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans7.rscMemCode }">
													<td scope="row" class="table_left2" data-idx="${queans7.rscQuesIdx}">${queans7.rscQuesAns}</td>
												</c:if>
											</c:forEach>
											
											<c:forEach items="${dataqus08List}" var="queans8" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans8.rscMemCode }">
													<td scope="row" class="table_left2" data-idx="${queans8.rscQuesIdx}">${queans8.rscQuesAns}</td>
												</c:if>
											</c:forEach>
											
											<c:forEach items="${dataqus09List}" var="queans9" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans9.rscMemCode }">
													<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}">${queans9.rscQuesAns}</td>
												</c:if>
											</c:forEach>
											
											<c:forEach items="${dataqus10List}" var="queans10" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans10.rscMemCode }">
													<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}">${queans10.rscQuesAns}</td>
												</c:if>
											</c:forEach>
											
											<c:set var = "Ques111" value = ""/>
											<c:set var = "Ques112" value = ""/>
											<c:set var = "Ques113" value = ""/>
											<c:set var = "Ques114" value = ""/>
											<c:forEach items="${dataqus11List}" var="queans11" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans11.rscMemCode }">
													<c:if test="${queans11.rscQuesAns eq '1'}">
														<c:set var = "Ques111" value = "Y"/>
													</c:if>
													<c:if test="${queans11.rscQuesAns eq '2'}">
														<c:set var = "Ques112" value = "Y"/>
													</c:if>
													<c:if test="${queans11.rscQuesAns eq '3'}">
														<c:set var = "Ques113" value = "Y"/>
													</c:if>
													<c:if test="${queans11.rscQuesAns eq '4'}">
														<c:set var = "Ques114" value = "Y"/>
													</c:if>										
													<c:set var = "rscQuesIdx" value = "${queans11.rscQuesIdx}"/>		
												</c:if>
											</c:forEach>
											<c:if test="${Ques111 eq 'Y'}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques111 eq 'N' or Ques111 eq ''}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques112 eq 'Y'}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques112 eq 'N' or Ques112 eq ''}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques113 eq 'Y'}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques113 eq 'N' or Ques113 eq ''}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques114 eq 'Y'}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques114 eq 'N' or Ques114 eq ''}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											
											
											<c:forEach items="${dataqus12List}" var="queans12" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans12.rscMemCode }">
													<c:if test="${queans1.rscQuesAns eq '2'}">
														<c:set var = "Ques12" value = "N"/>
													</c:if>
													<c:if test="${queans1.rscQuesAns ne '2'}">
														<c:set var = "Ques12" value = "Y"/>
													</c:if>
													<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}">${queans12.rscQuesAns}</td>
												</c:if>
											</c:forEach>
											<c:if test="${Ques12 eq 'N'}">
												<td scope="row" class="table_left2 " data-idx="${queans13.rscQuesIdx}">0</td>
												<td scope="row" class="table_left2 " data-idx="${queans13.rscQuesIdx}">0</td>
												<td scope="row" class="table_left2 " data-idx="${queans13.rscQuesIdx}">0</td>
												<td scope="row" class="table_left2 " data-idx="${queans13.rscQuesIdx}">0</td>
												<td scope="row" class="table_left2 " data-idx="${queans13.rscQuesIdx}">0</td>
												<td scope="row" class="table_left2 " data-idx="${queans13.rscQuesIdx}">0</td>
												<td scope="row" class="table_left2 " data-idx="${queans13.rscQuesIdx}">0</td>
												<td scope="row" class="table_left2 " data-idx="${queans13.rscQuesIdx}">0</td>
												<td scope="row" class="table_left2 " data-idx="${queans13.rscQuesIdx}">0</td>
												<td scope="row" class="table_left2 " data-idx="${queans13.rscQuesIdx}">0</td>
												<td scope="row" class="table_left2 " data-idx="${queans13.rscQuesIdx}">0</td>
												<td scope="row" class="table_left2 " data-idx="${queans13.rscQuesIdx}">0</td>
												<td scope="row" class="table_left2 " data-idx="${queans13.rscQuesIdx}">0</td>
												<td scope="row" class="table_left2 " data-idx="${queans13.rscQuesIdx}">0</td>
												<td scope="row" class="table_left2 " data-idx="${queans13.rscQuesIdx}">0</td>
												<td scope="row" class="table_left2 " data-idx="${queans13.rscQuesIdx}">0</td>
												<td scope="row" class="table_left2 " data-idx="${queans13.rscQuesIdx}">0</td>
												<td scope="row" class="table_left2 " data-idx="${queans13.rscQuesIdx}">0</td>
												<td scope="row" class="table_left2 " data-idx="${queans13.rscQuesIdx}">0</td>
												<td scope="row" class="table_left2 " data-idx="${queans13.rscQuesIdx}">0</td>
												<td scope="row" class="table_left2 " data-idx="${queans13.rscQuesIdx}">0</td>
												<td scope="row" class="table_left2 " data-idx="${queans13.rscQuesIdx}">0</td>
												<td scope="row" class="table_left2 " data-idx="${queans13.rscQuesIdx}">0</td>
												<td scope="row" class="table_left2 " data-idx="${queans13.rscQuesIdx}">0</td>
												<td scope="row" class="table_left2 " data-idx="${queans13.rscQuesIdx}">0</td>
												<td scope="row" class="table_left2 " data-idx="${queans13.rscQuesIdx}">0</td>
												<td scope="row" class="table_left2 " data-idx="${queans13.rscQuesIdx}">0</td>
											</c:if>
											<c:set var = "Ques131" value = "0"/>
											<c:set var = "Ques132" value = "0"/>
											<c:set var = "Ques133" value = "0"/>
											<c:set var = "Ques134" value = "0"/>
											<c:set var = "Ques135" value = "0"/>
											<c:set var = "Ques136" value = "0"/>
											<c:set var = "Ques137" value = "0"/>
											<c:set var = "Ques138" value = "0"/>
											<c:set var = "Ques139" value = "0"/>
											<c:set var = "Ques1310" value = "0"/>
											<c:set var = "Ques1311" value = "0"/>
											<c:set var = "Ques1312" value = "0"/>
											<c:if test="${Ques12 eq 'Y'}">
												<c:forEach items="${dataqus13List}" var="queans13" varStatus="status">
													<c:if test="${queans.rscMemCode eq queans13.rscMemCode }">
														<c:if test="${queans13.rscQuesAns eq '1'}">
															<c:set var = "Ques131" value = "${queans13.rscQuesAnsEtc1}"/>
															<c:set var = "Ques132" value = "${queans13.rscQuesAnsEtc2}"/>
															<c:set var = "Ques133" value = "${queans13.rscQuesAnsEtc3}"/>
															<c:set var = "Ques134" value = "${queans13.rscQuesAnsEtc4}"/>
															<c:set var = "Ques135" value = "${queans13.rscQuesAnsEtc5}"/>
															<c:set var = "Ques136" value = "${queans13.rscQuesAnsEtc6}"/>
														</c:if>
														<c:if test="${queans13.rscQuesAns eq '2'}">
															<c:set var = "Ques137" value = "${queans13.rscQuesAnsEtc1}"/>
															<c:set var = "Ques138" value = "${queans13.rscQuesAnsEtc2}"/>
															<c:set var = "Ques139" value = "${queans13.rscQuesAnsEtc3}"/>
															<c:set var = "Ques1310" value = "${queans13.rscQuesAnsEtc4}"/>
															<c:set var = "Ques1311" value = "${queans13.rscQuesAnsEtc5}"/>
															<c:set var = "Ques1312" value = "${queans13.rscQuesAnsEtc6}"/>
														</c:if>
														<c:set var = "rscQuesIdx" value = "${queans13.rscQuesIdx}"/>		
													</c:if>
												</c:forEach>
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">${Ques131}</td>
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">${Ques132}</td>
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">${Ques133}</td>
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">${Ques134}</td>
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">${Ques135}</td>
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">${Ques136}</td>
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">${Ques131 + Ques133 + Ques135}</td>
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">${Ques132 + Ques134 + Ques136}</td>
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">${Ques131 + Ques133 + Ques135 + Ques132 + Ques134 + Ques136}</td>
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">${Ques137}</td>
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">${Ques138}</td>
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">${Ques139}</td>
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">${Ques1310}</td>
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">${Ques1311}</td>
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">${Ques1312}</td>
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">${Ques137 + Ques139 + Ques1311}</td>
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">${Ques138 + Ques1310 + Ques1312}</td>
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">${Ques137 + Ques139 + Ques1311 + Ques138 + Ques1310 + Ques1312}</td>		
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">${Ques131 + Ques137}</td>
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">${Ques132 + Ques138}</td>
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">${Ques133 + Ques139}</td>
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">${Ques134 + Ques1310}</td>
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">${Ques135 + Ques1311}</td>
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">${Ques136 + Ques1312}</td>
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">${Ques131 + Ques133 + Ques135 + Ques137 + Ques139 + Ques1311}</td>
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">${Ques132 + Ques134 + Ques136 + Ques138 + Ques1310 + Ques1312}</td>
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">${Ques131 + Ques133 + Ques135 + Ques137 + Ques139 + Ques1311 + Ques132 + Ques134 + Ques136 + Ques138 + Ques1310 + Ques1312}</td>		
												
											</c:if>
											
											<c:set var = "Ques141" value = ""/>
											<c:set var = "Ques142" value = ""/>
											<c:set var = "Ques143" value = ""/>
											<c:set var = "Ques144" value = ""/>
											<c:forEach items="${dataqus14List}" var="queans14" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans14.rscMemCode }">
													<c:if test="${queans14.rscQuesAns eq '1'}">
														<c:set var = "Ques141" value = "Y"/>
													</c:if>
													<c:if test="${queans14.rscQuesAns eq '2'}">
														<c:set var = "Ques142" value = "Y"/>
													</c:if>
													<c:if test="${queans14.rscQuesAns eq '3'}">
														<c:set var = "Ques143" value = "Y"/>
													</c:if>
													<c:if test="${queans14.rscQuesAns eq '4'}">
														<c:set var = "Ques144" value = "Y"/>
													</c:if>
													<c:set var = "rscQuesIdx" value = "${queans14.rscQuesIdx}"/>												
												</c:if>
											</c:forEach>
											<c:if test="${Ques141 eq 'Y'}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques141 eq 'N' or Ques141 eq ''}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques142 eq 'Y'}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques142 eq 'N' or Ques142 eq ''}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques143 eq 'Y'}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques143 eq 'N' or Ques143 eq ''}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques144 eq 'Y'}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques144 eq 'N' or Ques144 eq ''}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											
											<c:set var = "Ques151" value = ""/>
											<c:set var = "Ques152" value = ""/>
											<c:set var = "Ques153" value = ""/>
											<c:set var = "Ques1531" value = ""/>
											<c:set var = "Ques154" value = ""/>
											<c:set var = "Ques155" value = ""/>
											<c:set var = "Ques156" value = ""/>
											<c:forEach items="${dataqus15List}" var="queans15" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans15.rscMemCode }">
													<c:if test="${queans15.rscQuesAns eq '1'}">
														<c:set var = "Ques151" value = "Y"/>
													</c:if>
													<c:if test="${queans15.rscQuesAns eq '2'}">
														<c:set var = "Ques152" value = "Y"/>
													</c:if>
													<c:if test="${queans15.rscQuesAns eq '3'}">
														<c:set var = "Ques153" value = "Y"/>
														<c:set var = "Ques1531" value = "${queans15.rscQuesAnsEtc1 + 1}"/>
													</c:if>
													<c:if test="${queans15.rscQuesAns eq '4'}">
														<c:set var = "Ques154" value = "Y"/>
													</c:if>
													<c:if test="${queans15.rscQuesAns eq '5'}">
														<c:set var = "Ques155" value = "Y"/>
													</c:if>
													<c:if test="${queans15.rscQuesAns eq '5'}">
														<c:set var = "Ques156" value = "Y"/>
													</c:if>
													<c:set var = "rscQuesIdx" value = "${queans15.rscQuesIdx}"/>															
												</c:if>
											</c:forEach>
											<c:if test="${Ques151 eq 'Y'}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques151 eq 'N' or Ques151 eq ''}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques152 eq 'Y'}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques152 eq 'N' or Ques152 eq ''}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques153 eq 'Y'}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques153 eq 'N' or Ques153 eq ''}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											
											<c:if test="${Ques1531 ne ''}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}"">${Ques1531}</td>
											</c:if>
											<c:if test="${Ques1531 eq ''}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">-</td>
											</c:if>
											
											<c:if test="${Ques154 eq 'Y'}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques154 eq 'N' or Ques154 eq ''}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques155 eq 'Y'}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques155 eq 'N' or Ques155 eq ''}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques156 eq 'Y'}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques156 eq 'N' or Ques156 eq ''}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											
											
											<c:forEach items="${dataqus16List}" var="queans16" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans16.rscMemCode }">
													<td scope="row" class="table_left2" data-idx="${queans16.rscQuesIdx}">${queans16.rscQuesAns}</td>
												</c:if>
											</c:forEach>
											
											<c:forEach items="${dataqus17List}" var="queans17" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans17.rscMemCode }">
													<td scope="row" class="table_left2" data-idx="${queans17.rscQuesIdx}">${queans17.rscQuesAns}</td>
												</c:if>
											</c:forEach>
											
											<c:forEach items="${dataqus18List}" var="queans18" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans18.rscMemCode }">
													<td scope="row" class="table_left2" data-idx="${queans18.rscQuesIdx}">${queans18.rscQuesAns}</td>
												</c:if>
											</c:forEach>
											
											
										</tr>
											
									</c:forEach>
									
								</tbody>
							</table>
							
							
							
						</div>		
						
					</div>

				</div>
                
            </div>
        </div>