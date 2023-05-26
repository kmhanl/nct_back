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
					<li class=""><a href="/rsc/ansDataListSec02.do" class="tap_item">실태조사2영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec03.do" class="tap_item">실태조사3영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec04.do" class="tap_item">실태조사4영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec05.do" class="tap_item">실태조사5영역</a></li>
					<li class="on"><a href="/rsc/ansDataListSec06.do" class="tap_item">실태조사6영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec07.do" class="tap_item">실태조사7영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec09.do" class="tap_item">기타설문조사</a></li>
				</ul>
				<a href="javascript:void(0);" class="tap_btn excelbtn" data-efilename='DataDownload_06.xls' data-sheetname="실태조사-영역6" >엑셀 다운로드</a>
			</div>
            <div class="body_content_wrapper" style="border:1px solid #d8d8d8">
                <div class="main_body" style="height:calc(100%)">
					<div class="search_wrapper">
						검색영역
					</div>
					<div class="content_wrapper" style="overflow:scroll">
						<div class="ansDataBox" style="">
							<table class="ansDataTable" style="min-width:13780px;" id="DownloadData">
								<colgroup>
								<col width="60px">
								<col width="240px">
								<col width="80px"><col width="80px"><col width="80px"><col width="80px"><col width="80px">
								
								</colgroup>
								<thead>
									<tr>
										<th rowspan="3">No.</th>
										<th rowspan="3">대상기관</th>
										<th rowspan="3">문항 1</th>
										<th rowspan="1" colspan="12">문항 2</th>
										<th rowspan="2" colspan="8">문항 3</th>
										<th rowspan="2" colspan="10">문항 4</th>
										<th rowspan="2" colspan="6">문항 5</th>
										<th rowspan="2" colspan="10">문항 6</th>
										<th rowspan="2" colspan="6">문항 7</th>
										<th rowspan="2" colspan="7">문항 8</th>
										<th rowspan="2" colspan="7">문항 9</th>
										<th rowspan="2" colspan="5">문항 10</th>
										<th rowspan="2" colspan="5">문항 11</th>
										<th rowspan="2" colspan="13">문항 12</th>
										<th rowspan="2" colspan="4">문항 13</th>
										<th rowspan="2" colspan="7">문항 14</th>
										<th rowspan="2" colspan="7">문항 15</th>
										<th rowspan="2" colspan="11">문항 16</th>
										<th rowspan="2" colspan="8">문항 17</th>
										<th rowspan="3" colspan="1">문항 18</th>
										<th rowspan="2" colspan="2">문항 19</th>
										<th rowspan="2" colspan="4">문항 20</th>
										<th rowspan="3" colspan="1">문항 21</th>
										<th rowspan="3" colspan="1">문항 22</th>
										<th rowspan="3" colspan="1">문항 23</th>
										<th rowspan="3" colspan="1">문항 24</th>
										<th rowspan="3" colspan="1">문항 25</th>
										
									</tr>
									<tr>
										<th rowspan="1" colspan="2">2019년 국내</th>
										<th rowspan="1" colspan="2">2019년 국외</th>
										<th rowspan="1" colspan="2">2020년 국내</th>
										<th rowspan="1" colspan="2">2020년 국외</th>
										<th rowspan="1" colspan="2">2021년 국내</th>
										<th rowspan="1" colspan="2">2021년 국외</th>
									<tr>
										<th rowspan="1">건수</th>
										<th rowspan="1">규모</th>
										<th rowspan="1">건수</th>
										<th rowspan="1">규모</th>
										<th rowspan="1">건수</th>
										<th rowspan="1">규모</th>
										<th rowspan="1">건수</th>
										<th rowspan="1">규모</th>
										<th rowspan="1">건수</th>
										<th rowspan="1">규모</th>
										<th rowspan="1">건수</th>
										<th rowspan="1">규모</th>
										<th rowspan="1" colspan="1">3.1</th>
										<th rowspan="1" colspan="1">3.2</th>
										<th rowspan="1" colspan="1">3.3</th>
										<th rowspan="1" colspan="1">3.4</th>
										<th rowspan="1" colspan="1">3.5</th>
										<th rowspan="1" colspan="1">3.6</th>
										<th rowspan="1" colspan="1">3.7</th>
										<th rowspan="1" colspan="1">3.7 기타</th>
										<th rowspan="1" colspan="1">4.1</th>
										<th rowspan="1" colspan="1">4.2</th>
										<th rowspan="1" colspan="1">4.3</th>
										<th rowspan="1" colspan="1">4.4</th>
										<th rowspan="1" colspan="1">4.5</th>
										<th rowspan="1" colspan="1">4.6</th>
										<th rowspan="1" colspan="1">4.7</th>
										<th rowspan="1" colspan="1">4.8</th>
										<th rowspan="1" colspan="1">4.9</th>
										<th rowspan="1" colspan="1">4.9 기타</th>
										<th rowspan="1" colspan="1">5.1</th>
										<th rowspan="1" colspan="1">5.2</th>
										<th rowspan="1" colspan="1">5.3</th>
										<th rowspan="1" colspan="1">5.4</th>
										<th rowspan="1" colspan="1">5.5</th>
										<th rowspan="1" colspan="1">5.5 기타</th>
										<th rowspan="1" colspan="1">6.1</th>
										<th rowspan="1" colspan="1">6.2</th>
										<th rowspan="1" colspan="1">6.3</th>
										<th rowspan="1" colspan="1">6.4</th>
										<th rowspan="1" colspan="1">6.5</th>
										<th rowspan="1" colspan="1">6.6</th>
										<th rowspan="1" colspan="1">6.7</th>
										<th rowspan="1" colspan="1">6.8</th>
										<th rowspan="1" colspan="1">6.9</th>
										<th rowspan="1" colspan="1">6.9 기타</th>
										<th rowspan="1">7.1</th>
										<th rowspan="1">7.2</th>
										<th rowspan="1">7.3</th>
										<th rowspan="1">7.4</th>
										<th rowspan="1">7.5</th>
										<th rowspan="1">7.5 기타</th>
										<th rowspan="1">8.1</th>
										<th rowspan="1">8.2</th>
										<th rowspan="1">8.3</th>
										<th rowspan="1">8.4</th>
										<th rowspan="1">8.5</th>
										<th rowspan="1">8.6</th>
										<th rowspan="1">8.6 기타</th>
										<th rowspan="1">9.1</th>
										<th rowspan="1">9.2</th>
										<th rowspan="1">9.3</th>
										<th rowspan="1">9.4</th>
										<th rowspan="1">9.5</th>
										<th rowspan="1">9.6</th>
										<th rowspan="1">9.6 기타</th>
										<th rowspan="1">10.1</th>
										<th rowspan="1">10.2</th>
										<th rowspan="1">10.3</th>
										<th rowspan="1">10.4</th>
										<th rowspan="1">10.4 그외</th>
										<th rowspan="1">11.1</th>
										<th rowspan="1">11.2</th>
										<th rowspan="1">11.3</th>
										<th rowspan="1">11.4</th>
										<th rowspan="1">11.5</th>
										<th rowspan="1">12.1</th>
										<th rowspan="1">12.2</th>
										<th rowspan="1">12.3</th>
										<th rowspan="1">12.4</th>
										<th rowspan="1">12.5</th>
										<th rowspan="1">12.6</th>
										<th rowspan="1">12.6 조정</th>
										<th rowspan="1">12.7</th>
										<th rowspan="1">12.7 전문</th>
										<th rowspan="1">12.8</th>
										<th rowspan="1">12.9</th>
										<th rowspan="1">12.10</th>
										<th rowspan="1">12.10 기타</th>
										
										<th rowspan="1">13.1</th>
										<th rowspan="1">13.2</th>
										<th rowspan="1">13.3</th>
										<th rowspan="1">13.4</th>
										<th rowspan="1">14.1</th>
										<th rowspan="1">14.2</th>
										<th rowspan="1">14.3</th>
										<th rowspan="1">14.4</th>
										<th rowspan="1">14.5</th>
										<th rowspan="1">14.6</th>
										<th rowspan="1">14.7</th>
										<th rowspan="1">15.1</th>
										<th rowspan="1">15.2</th>
										<th rowspan="1">15.3</th>
										<th rowspan="1">15.4</th>
										<th rowspan="1">15.5</th>
										<th rowspan="1">15.6</th>
										<th rowspan="1">15.7</th>
										<th rowspan="1">16.1</th>
										<th rowspan="1">16.2</th>
										<th rowspan="1">16.3</th>
										<th rowspan="1">16.4</th>
										<th rowspan="1">16.5</th>
										<th rowspan="1">16.6</th>
										<th rowspan="1">16.7</th>
										<th rowspan="1">16.8</th>
										<th rowspan="1">16.9</th>
										<th rowspan="1">16.10</th>
										<th rowspan="1">16.11</th>
										<th rowspan="1">17.1</th>
										<th rowspan="1">17.2</th>
										<th rowspan="1">17.3</th>
										<th rowspan="1">17.4</th>
										<th rowspan="1">17.5</th>
										<th rowspan="1">17.6</th>
										<th rowspan="1">17.7</th>
										<th rowspan="1">17.8</th>
										<th rowspan="1">19.1</th>
										<th rowspan="1">19.2</th>
										<th rowspan="1">20.1</th>
										<th rowspan="1">20.2</th>
										<th rowspan="1">20.3</th>
										<th rowspan="1">20.4</th>
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
													<c:if test="${queans1.rscQuesAns eq '2'}">
														<c:set var = "Ques01" value = "N"/>
													</c:if>
													<c:if test="${queans1.rscQuesAns ne '2'}">
														<c:set var = "Ques01" value = "Y"/>
													</c:if>
													
												</c:if>
											</c:forEach>
											<c:if test="${Ques01 eq 'N'}">
												<td data-idx="2-11">-</td>
												<td data-idx="2-12}">-</td>
												<td data-idx="2-21">-</td>
												<td data-idx="2-22}">-</td>
												<td data-idx="2-31">-</td>
												<td data-idx="2-32}">-</td>
												<td data-idx="2-41">-</td>
												<td data-idx="2-42}">-</td>
												<td data-idx="2-51">-</td>
												<td data-idx="2-52}">-</td>
												<td data-idx="2-61">-</td>
												<td data-idx="2-62}">-</td>
												<td data-idx="3-1">-</td>
												<td data-idx="3-2">-</td>
												<td data-idx="3-3">-</td>
												<td data-idx="3-4">-</td>
												<td data-idx="3-5">-</td>
												<td data-idx="3-6">-</td>
												<td data-idx="3-7">-</td>
												<td data-idx="3-8">-</td>
												<td data-idx="4-1">-</td>
												<td data-idx="4-2">-</td>
												<td data-idx="4-3">-</td>
												<td data-idx="4-4">-</td>
												<td data-idx="4-5">-</td>
												<td data-idx="4-6">-</td>
												<td data-idx="4-7">-</td>
												<td data-idx="4-8">-</td>
												<td data-idx="4-9">-</td>
												<td data-idx="4-10">-</td>
												<td data-idx="5-1">-</td>
												<td data-idx="5-2">-</td>
												<td data-idx="5-3">-</td>
												<td data-idx="5-4">-</td>
												<td data-idx="5-5">-</td>
												<td data-idx="5-6">-</td>
												<td data-idx="6-1">-</td>
												<td data-idx="6-2">-</td>
												<td data-idx="6-3">-</td>
												<td data-idx="6-4">-</td>
												<td data-idx="6-5">-</td>
												<td data-idx="6-6">-</td>
												<td data-idx="6-7">-</td>
												<td data-idx="6-8">-</td>
												<td data-idx="6-9">-</td>
												<td data-idx="6-10">-</td>
												<td data-idx="7-1">-</td>
												<td data-idx="7-2">-</td>
												<td data-idx="7-3">-</td>
												<td data-idx="7-4">-</td>
												<td data-idx="7-5">-</td>
												<td data-idx="7-6">-</td>
												<td data-idx="8-1">-</td>
												<td data-idx="8-2">-</td>
												<td data-idx="8-3">-</td>
												<td data-idx="8-4">-</td>
												<td data-idx="8-5">-</td>
												<td data-idx="8-6">-</td>
												<td data-idx="8-7">-</td>
												<td data-idx="9-1">-</td>
												<td data-idx="9-2">-</td>
												<td data-idx="9-3">-</td>
												<td data-idx="9-4">-</td>
												<td data-idx="9-5">-</td>
												<td data-idx="9-6">-</td>
												<td data-idx="9-7">-</td>
												<td data-idx="10-1">-</td>
												<td data-idx="10-2">-</td>
												<td data-idx="10-3">-</td>
												<td data-idx="10-4">-</td>
												<td data-idx="10-5">-</td>
												<td data-idx="11-1">-</td>
												<td data-idx="11-2">-</td>
												<td data-idx="11-3">-</td>
												<td data-idx="11-4">-</td>
												<td data-idx="11-5">-</td>
												<td data-idx="12-1">-</td>
												<td data-idx="12-2">-</td>
												<td data-idx="12-3">-</td>
												<td data-idx="12-4">-</td>
												<td data-idx="12-5">-</td>
												<td data-idx="12-6">-</td>
												<td data-idx="12-7">-</td>
												<td data-idx="12-8">-</td>
												<td data-idx="12-9">-</td>
												<td data-idx="12-10">-</td>
												<td data-idx="12-11">-</td>
												<td data-idx="12-12">-</td>
												<td data-idx="12-13">-</td>
												<td data-idx="13-1">-</td>
												<td data-idx="13-2">-</td>
												<td data-idx="13-3">-</td>
												<td data-idx="13-4">-</td>
												<td data-idx="14-1">-</td>
												<td data-idx="14-2">-</td>
												<td data-idx="14-3">-</td>
												<td data-idx="14-4">-</td>
												<td data-idx="14-5">-</td>
												<td data-idx="14-6">-</td>
												<td data-idx="14-7">-</td>
												<td data-idx="15-1">-</td>
												<td data-idx="15-2">-</td>
												<td data-idx="15-3">-</td>
												<td data-idx="15-4">-</td>
												<td data-idx="15-5">-</td>
												<td data-idx="15-6">-</td>
												<td data-idx="15-7">-</td>
											</c:if>
											<c:if test="${Ques01 eq 'Y'}">
												<c:set var = "Ques210" value = ""/>
												<c:set var = "Ques211" value = "0"/>
												<c:set var = "Ques220" value = ""/>
												<c:set var = "Ques221" value = "0"/>
												<c:set var = "Ques230" value = ""/>
												<c:set var = "Ques231" value = "0"/>
												<c:set var = "Ques240" value = ""/>
												<c:set var = "Ques241" value = "0"/>
												<c:set var = "Ques250" value = ""/>
												<c:set var = "Ques251" value = "0"/>
												<c:set var = "Ques260" value = ""/>
												<c:set var = "Ques261" value = "0"/>
												<c:forEach items="${dataqus02List}" var="queans2" varStatus="status">
													<c:if test="${queans.rscMemCode eq queans2.rscMemCode }">
														<%-- <td scope="row" class="table_left2 asdss" data-idx="${queans2.rscQuesIdx}">${queans2.rscQuesAnsText}</td> --%>
														<c:if test="${queans2.rscQuesAns eq '1'}">
															<c:set var = "Ques210" value = "${queans2.rscQuesAnsText}"/>
															<c:if test="${queans2.rscQuesAnsEtc1 eq 'Y'}">
																<c:set var = "Ques211" value = "1"/>
															</c:if>
															<c:if test="${queans2.rscQuesAnsEtc2 eq 'Y'}">
																<c:set var = "Ques211" value = "2"/>
															</c:if>
															<c:if test="${queans2.rscQuesAnsEtc3 eq 'Y'}">
																<c:set var = "Ques211" value = "3"/>
															</c:if>
															<c:if test="${queans2.rscQuesAnsEtc4 eq 'Y'}">
																<c:set var = "Ques211" value = "4"/>
															</c:if>
															<c:if test="${queans2.rscQuesAnsEtc5 eq 'Y'}">
																<c:set var = "Ques211" value = "5"/>
															</c:if>
															<c:if test="${queans2.rscQuesAnsEtc6 eq 'Y'}">
																<c:set var = "Ques211" value = "6"/>
															</c:if>
														</c:if>
														<c:if test="${queans2.rscQuesAns eq '2'}">
															<c:set var = "Ques220" value = "${queans2.rscQuesAnsText}"/>
															<c:if test="${queans2.rscQuesAnsEtc1 eq 'Y'}">
																<c:set var = "Ques221" value = "1"/>
															</c:if>
															<c:if test="${queans2.rscQuesAnsEtc2 eq 'Y'}">
																<c:set var = "Ques221" value = "2"/>
															</c:if>
															<c:if test="${queans2.rscQuesAnsEtc3 eq 'Y'}">
																<c:set var = "Ques221" value = "3"/>
															</c:if>
															<c:if test="${queans2.rscQuesAnsEtc4 eq 'Y'}">
																<c:set var = "Ques221" value = "4"/>
															</c:if>
															<c:if test="${queans2.rscQuesAnsEtc5 eq 'Y'}">
																<c:set var = "Ques221" value = "5"/>
															</c:if>
															<c:if test="${queans2.rscQuesAnsEtc6 eq 'Y'}">
																<c:set var = "Ques221" value = "6"/>
															</c:if>
														</c:if>
														<c:if test="${queans2.rscQuesAns eq '3'}">
															<c:set var = "Ques230" value = "${queans2.rscQuesAnsText}"/>
															<c:if test="${queans2.rscQuesAnsEtc1 eq 'Y'}">
																<c:set var = "Ques231" value = "1"/>
															</c:if>
															<c:if test="${queans2.rscQuesAnsEtc2 eq 'Y'}">
																<c:set var = "Ques231" value = "2"/>
															</c:if>
															<c:if test="${queans2.rscQuesAnsEtc3 eq 'Y'}">
																<c:set var = "Ques231" value = "3"/>
															</c:if>
															<c:if test="${queans2.rscQuesAnsEtc4 eq 'Y'}">
																<c:set var = "Ques231" value = "4"/>
															</c:if>
															<c:if test="${queans2.rscQuesAnsEtc5 eq 'Y'}">
																<c:set var = "Ques231" value = "5"/>
															</c:if>
															<c:if test="${queans2.rscQuesAnsEtc6 eq 'Y'}">
																<c:set var = "Ques231" value = "6"/>
															</c:if>
														</c:if>
														<c:if test="${queans2.rscQuesAns eq '4'}">
															<c:set var = "Ques240" value = "${queans2.rscQuesAnsText}"/>
															<c:if test="${queans2.rscQuesAnsEtc1 eq 'Y'}">
																<c:set var = "Ques241" value = "1"/>
															</c:if>
															<c:if test="${queans2.rscQuesAnsEtc2 eq 'Y'}">
																<c:set var = "Ques241" value = "2"/>
															</c:if>
															<c:if test="${queans2.rscQuesAnsEtc3 eq 'Y'}">
																<c:set var = "Ques241" value = "3"/>
															</c:if>
															<c:if test="${queans2.rscQuesAnsEtc4 eq 'Y'}">
																<c:set var = "Ques241" value = "4"/>
															</c:if>
															<c:if test="${queans2.rscQuesAnsEtc5 eq 'Y'}">
																<c:set var = "Ques241" value = "5"/>
															</c:if>
															<c:if test="${queans2.rscQuesAnsEtc6 eq 'Y'}">
																<c:set var = "Ques241" value = "6"/>
															</c:if>
														</c:if>
														<c:if test="${queans2.rscQuesAns eq '5'}">
															<c:set var = "Ques250" value = "${queans2.rscQuesAnsText}"/>
															<c:if test="${queans2.rscQuesAnsEtc1 eq 'Y'}">
																<c:set var = "Ques251" value = "1"/>
															</c:if>
															<c:if test="${queans2.rscQuesAnsEtc2 eq 'Y'}">
																<c:set var = "Ques251" value = "2"/>
															</c:if>
															<c:if test="${queans2.rscQuesAnsEtc3 eq 'Y'}">
																<c:set var = "Ques251" value = "3"/>
															</c:if>
															<c:if test="${queans2.rscQuesAnsEtc4 eq 'Y'}">
																<c:set var = "Ques251" value = "4"/>
															</c:if>
															<c:if test="${queans2.rscQuesAnsEtc5 eq 'Y'}">
																<c:set var = "Ques251" value = "5"/>
															</c:if>
															<c:if test="${queans2.rscQuesAnsEtc6 eq 'Y'}">
																<c:set var = "Ques251" value = "6"/>
															</c:if>
														</c:if>
														<c:if test="${queans2.rscQuesAns eq '6'}">
															<c:set var = "Ques260" value = "${queans2.rscQuesAnsText}"/>
															<c:if test="${queans2.rscQuesAnsEtc1 eq 'Y'}">
																<c:set var = "Ques261" value = "1"/>
															</c:if>
															<c:if test="${queans2.rscQuesAnsEtc2 eq 'Y'}">
																<c:set var = "Ques261" value = "2"/>
															</c:if>
															<c:if test="${queans2.rscQuesAnsEtc3 eq 'Y'}">
																<c:set var = "Ques261" value = "3"/>
															</c:if>
															<c:if test="${queans2.rscQuesAnsEtc4 eq 'Y'}">
																<c:set var = "Ques261" value = "4"/>
															</c:if>
															<c:if test="${queans2.rscQuesAnsEtc5 eq 'Y'}">
																<c:set var = "Ques261" value = "5"/>
															</c:if>
															<c:if test="${queans2.rscQuesAnsEtc6 eq 'Y'}">
																<c:set var = "Ques261" value = "6"/>
															</c:if>
														</c:if>
														<c:set var = "rscQuesIdx" value = "${queans2.rscQuesIdx}"/>
													</c:if>
												</c:forEach>
												<td data-idx="${rscQuesIdx}">${Ques210}</td>
												<td data-idx="${rscQuesIdx}">${Ques211}</td>
												<td data-idx="${rscQuesIdx}">${Ques220}</td>
												<td data-idx="${rscQuesIdx}">${Ques221}</td>
												<td data-idx="${rscQuesIdx}">${Ques230}</td>
												<td data-idx="${rscQuesIdx}">${Ques231}</td>
												<td data-idx="${rscQuesIdx}">${Ques240}</td>
												<td data-idx="${rscQuesIdx}">${Ques241}</td>
												<td data-idx="${rscQuesIdx}">${Ques250}</td>
												<td data-idx="${rscQuesIdx}">${Ques251}</td>
												<td data-idx="${rscQuesIdx}">${Ques260}</td>
												<td data-idx="${rscQuesIdx}">${Ques261}</td>
												
												<c:set var = "Ques31" value = ""/>
												<c:set var = "Ques32" value = ""/>
												<c:set var = "Ques33" value = ""/>
												<c:set var = "Ques34" value = ""/>
												<c:set var = "Ques35" value = ""/>
												<c:set var = "Ques36" value = ""/>
												<c:set var = "Ques37" value = ""/>
												<c:set var = "Ques38" value = ""/>
												<c:forEach items="${dataqus03List}" var="queans3" varStatus="status">
													<c:if test="${queans.rscMemCode eq queans3.rscMemCode }">
														<c:if test="${queans3.rscQuesAns eq '1'}">
															<c:set var = "Ques31" value = "Y"/>
														</c:if>
														<c:if test="${queans3.rscQuesAns eq '2'}">
															<c:set var = "Ques32" value = "Y"/>
														</c:if>
														<c:if test="${queans3.rscQuesAns eq '3'}">
															<c:set var = "Ques33" value = "Y"/>
														</c:if>
														<c:if test="${queans3.rscQuesAns eq '4'}">
															<c:set var = "Ques34" value = "Y"/>
														</c:if>	
														<c:if test="${queans3.rscQuesAns eq '5'}">
															<c:set var = "Ques35" value = "Y"/>
														</c:if>
														<c:if test="${queans3.rscQuesAns eq '6'}">
															<c:set var = "Ques36" value = "Y"/>
														</c:if>
														<c:if test="${queans3.rscQuesAns eq '7'}">
															<c:set var = "Ques37" value = "Y"/>
															<c:set var = "Ques38" value = "${queans3.rscQuesAnsEtc1}"/>
														</c:if>												
														<c:set var = "rscQuesIdx" value = "${queans3.rscQuesIdx}"/>
													</c:if>
												</c:forEach>
												<c:if test="${Ques31 eq 'Y'}">
													<td scope="row" class="table_left2 1" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques31 eq 'N' or Ques31 eq ''}">
													<td scope="row" class="table_left2 1" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques32 eq 'Y'}">
													<td scope="row" class="table_left2 2" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques32 eq 'N' or Ques32 eq ''}">
													<td scope="row" class="table_left2 2" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques33 eq 'Y'}">
													<td scope="row" class="table_left2 3" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques33 eq 'N' or Ques33 eq ''}">
													<td scope="row" class="table_left2 3" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques34 eq 'Y'}">
													<td scope="row" class="table_left2 4" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques34 eq 'N' or Ques34 eq ''}">
													<td scope="row" class="table_left2 4" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques35 eq 'Y'}">
													<td scope="row" class="table_left2 5" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques35 eq 'N' or Ques35 eq ''}">
													<td scope="row" class="table_left2 5" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques36 eq 'Y'}">
													<td scope="row" class="table_left2 6" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques36 eq 'N' or Ques36 eq ''}">
													<td scope="row" class="table_left2 6" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques37 eq 'Y'}">
													<td scope="row" class="table_left2 7" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques37 eq 'N' or Ques37 eq ''}">
													<td scope="row" class="table_left2 7" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques38 ne ''}">
													<td scope="row" class="table_left2 aaa" data-idx="${rscQuesIdx}">${Ques38}</td>
												</c:if>
												<c:if test="${Ques38 eq ''}">
													<td scope="row" class="table_left2 bbb" data-idx="${rscQuesIdx}">-</td>
												</c:if>
												
												<c:set var = "Ques41" value = ""/>
												<c:set var = "Ques42" value = ""/>
												<c:set var = "Ques43" value = ""/>
												<c:set var = "Ques44" value = ""/>
												<c:set var = "Ques45" value = ""/>
												<c:set var = "Ques46" value = ""/>
												<c:set var = "Ques47" value = ""/>
												<c:set var = "Ques48" value = ""/>
												<c:set var = "Ques49" value = ""/>
												<c:set var = "Ques410" value = ""/>
												<c:forEach items="${dataqus04List}" var="queans4" varStatus="status">
													<c:if test="${queans.rscMemCode eq queans4.rscMemCode }">
														<c:if test="${queans4.rscQuesAns eq '1'}">
															<c:set var = "Ques41" value = "Y"/>
														</c:if>
														<c:if test="${queans4.rscQuesAns eq '2'}">
															<c:set var = "Ques42" value = "Y"/>
														</c:if>
														<c:if test="${queans4.rscQuesAns eq '3'}">
															<c:set var = "Ques43" value = "Y"/>
														</c:if>
														<c:if test="${queans4.rscQuesAns eq '4'}">
															<c:set var = "Ques44" value = "Y"/>
														</c:if>	
														<c:if test="${queans4.rscQuesAns eq '5'}">
															<c:set var = "Ques45" value = "Y"/>
														</c:if>
														<c:if test="${queans4.rscQuesAns eq '6'}">
															<c:set var = "Ques46" value = "Y"/>
														</c:if>
														<c:if test="${queans4.rscQuesAns eq '7'}">
															<c:set var = "Ques47" value = "Y"/>
														</c:if>
														<c:if test="${queans4.rscQuesAns eq '8'}">
															<c:set var = "Ques48" value = "Y"/>
														</c:if>
														<c:if test="${queans4.rscQuesAns eq '9'}">
															<c:set var = "Ques49" value = "Y"/>
															<c:set var = "Ques410" value = "${queans4.rscQuesAnsEtc1}"/>
														</c:if>
														<c:set var = "rscQuesIdx" value = "${queans4.rscQuesIdx}"/>											
													</c:if>
												</c:forEach>
												<c:if test="${Ques41 eq 'Y'}">
													<td scope="row" class="table_left2 1" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques41 eq 'N' or Ques41 eq ''}">
													<td scope="row" class="table_left2 1" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques42 eq 'Y'}">
													<td scope="row" class="table_left2 2" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques42 eq 'N' or Ques42 eq ''}">
													<td scope="row" class="table_left2 2" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques43 eq 'Y'}">
													<td scope="row" class="table_left2 3" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques43 eq 'N' or Ques43 eq ''}">
													<td scope="row" class="table_left2 3" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques44 eq 'Y'}">
													<td scope="row" class="table_left2 4" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques44 eq 'N' or Ques44 eq ''}">
													<td scope="row" class="table_left2 4" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques45 eq 'Y'}">
													<td scope="row" class="table_left2 5" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques45 eq 'N' or Ques45 eq ''}">
													<td scope="row" class="table_left2 5" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques46 eq 'Y'}">
													<td scope="row" class="table_left2 6" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques46 eq 'N' or Ques46 eq ''}">
													<td scope="row" class="table_left2 6" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques47 eq 'Y'}">
													<td scope="row" class="table_left2 7" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques47 eq 'N' or Ques47 eq ''}">
													<td scope="row" class="table_left2 7" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques48 eq 'Y'}">
													<td scope="row" class="table_left2 8" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques48 eq 'N' or Ques48 eq ''}">
													<td scope="row" class="table_left2 8" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques49 eq 'Y'}">
													<td scope="row" class="table_left2 9" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques49 eq 'N' or Ques49 eq ''}">
													<td scope="row" class="table_left2 9" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques410 ne ''}">
													<td scope="row" class="table_left2 10" data-idx="${rscQuesIdx}">${Ques410}</td>
												</c:if>
												<c:if test="${Ques410 eq ''}">
													<td scope="row" class="table_left2 10" data-idx="${rscQuesIdx}">-</td>
												</c:if>
												<c:set var = "Ques51" value = ""/>
												<c:set var = "Ques52" value = ""/>
												<c:set var = "Ques53" value = ""/>
												<c:set var = "Ques54" value = ""/>
												<c:set var = "Ques55" value = ""/>
												<c:set var = "Ques56" value = ""/>
												<c:forEach items="${dataqus05List}" var="queans5" varStatus="status">
													<c:if test="${queans.rscMemCode eq queans5.rscMemCode }">
														<c:if test="${queans5.rscQuesAns eq '1'}">
															<c:set var = "Ques51" value = "Y"/>
														</c:if>
														<c:if test="${queans5.rscQuesAns eq '2'}">
															<c:set var = "Ques52" value = "Y"/>
														</c:if>
														<c:if test="${queans5.rscQuesAns eq '3'}">
															<c:set var = "Ques53" value = "Y"/>
														</c:if>
														<c:if test="${queans5.rscQuesAns eq '4'}">
															<c:set var = "Ques54" value = "Y"/>
														</c:if>	
														<c:if test="${queans5.rscQuesAns eq '5'}">
															<c:set var = "Ques55" value = "Y"/>
															<c:set var = "Ques56" value = "${queans5.rscQuesAnsEtc1}"/>
														</c:if>			
														<c:set var = "rscQuesIdx" value = "${queans5.rscQuesIdx}"/>										
													</c:if>
												</c:forEach>
												<c:if test="${Ques51 eq 'Y'}">
													<td scope="row" class="table_left2 1"  data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques51 eq 'N' or Ques51 eq ''}">
													<td scope="row" class="table_left2 1"  data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques52 eq 'Y'}">
													<td scope="row" class="table_left2 2"  data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques52 eq 'N' or Ques52 eq ''}">
													<td scope="row" class="table_left2 2"  data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques53 eq 'Y'}">
													<td scope="row" class="table_left2 3"  data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques53 eq 'N' or Ques53 eq ''}">
													<td scope="row" class="table_left2 3"  data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques54 eq 'Y'}">
													<td scope="row" class="table_left2 4"  data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques54 eq 'N' or Ques54 eq ''}">
													<td scope="row" class="table_left2 4"  data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques55 eq 'Y'}">
													<td scope="row" class="table_left2 5"  data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques55 eq 'N' or Ques55 eq ''}">
													<td scope="row" class="table_left2 5"  data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques56 ne ''}">
													<td scope="row" class="table_left2 6"  data-idx="${rscQuesIdx}">${Ques56}</td>
												</c:if>
												<c:if test="${Ques56 eq ''}">
													<td scope="row" class="table_left2 6"  data-idx="${rscQuesIdx}">-</td>
												</c:if>
												
												<c:set var = "Ques61" value = ""/>
												<c:set var = "Ques62" value = ""/>
												<c:set var = "Ques63" value = ""/>
												<c:set var = "Ques64" value = ""/>
												<c:set var = "Ques65" value = ""/>
												<c:set var = "Ques66" value = ""/>
												<c:set var = "Ques67" value = ""/>
												<c:set var = "Ques68" value = ""/>
												<c:set var = "Ques69" value = ""/>
												<c:set var = "Ques610" value = ""/>
												<c:forEach items="${dataqus06List}" var="queans6" varStatus="status">
													<c:if test="${queans.rscMemCode eq queans6.rscMemCode }">
														<c:if test="${queans6.rscQuesAns eq '1'}">
															<c:set var = "Ques61" value = "Y"/>
														</c:if>
														<c:if test="${queans6.rscQuesAns eq '2'}">
															<c:set var = "Ques62" value = "Y"/>
														</c:if>
														<c:if test="${queans6.rscQuesAns eq '3'}">
															<c:set var = "Ques63" value = "Y"/>
														</c:if>
														<c:if test="${queans6.rscQuesAns eq '4'}">
															<c:set var = "Ques64" value = "Y"/>
														</c:if>	
														<c:if test="${queans6.rscQuesAns eq '5'}">
															<c:set var = "Ques65" value = "Y"/>
														</c:if>
														<c:if test="${queans6.rscQuesAns eq '6'}">
															<c:set var = "Ques66" value = "Y"/>
														</c:if>
														<c:if test="${queans6.rscQuesAns eq '7'}">
															<c:set var = "Ques67" value = "Y"/>
														</c:if>
														<c:if test="${queans6.rscQuesAns eq '8'}">
															<c:set var = "Ques68" value = "Y"/>
														</c:if>
														<c:if test="${queans6.rscQuesAns eq '9'}">
															<c:set var = "Ques69" value = "Y"/>
															<c:set var = "Ques610" value = "${queans6.rscQuesAnsEtc1}"/>
														</c:if>					
														<c:set var = "rscQuesIdx" value = "${queans6.rscQuesIdx}"/>								
													</c:if>
												</c:forEach>
												<c:if test="${Ques61 eq 'Y'}">
													<td scope="row" class="table_left2 1"data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques61 eq 'N' or Ques61 eq ''}">
													<td scope="row" class="table_left2 1"data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques62 eq 'Y'}">
													<td scope="row" class="table_left2 2"data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques62 eq 'N' or Ques62 eq ''}">
													<td scope="row" class="table_left2 2"data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques63 eq 'Y'}">
													<td scope="row" class="table_left2 3"data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques63 eq 'N' or Ques63 eq ''}">
													<td scope="row" class="table_left2 3"data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques64 eq 'Y'}">
													<td scope="row" class="table_left2 6"data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques64 eq 'N' or Ques64 eq ''}">
													<td scope="row" class="table_left2 6"data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques65 eq 'Y'}">
													<td scope="row" class="table_left2 5"data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques65 eq 'N' or Ques65 eq ''}">
													<td scope="row" class="table_left2 5"data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques66 eq 'Y'}">
													<td scope="row" class="table_left2 6"data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques66 eq 'N' or Ques66 eq ''}">
													<td scope="row" class="table_left2 6"data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques67 eq 'Y'}">
													<td scope="row" class="table_left2 7"data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques67 eq 'N' or Ques67 eq ''}">
													<td scope="row" class="table_left2 7"data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques68 eq 'Y'}">
													<td scope="row" class="table_left2 7"data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques68 eq 'N' or Ques68 eq ''}">
													<td scope="row" class="table_left2 7"data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques69 eq 'Y'}">
													<td scope="row" class="table_left2 7"data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques69 eq 'N' or Ques69 eq ''}">
													<td scope="row" class="table_left2 7"data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques610 ne ''}">
													<td scope="row" class="table_left2 aaa"data-idx="${rscQuesIdx}">${Ques610}</td>
												</c:if>
												<c:if test="${Ques610 eq ''}">
													<td scope="row" class="table_left2 bbb"data-idx="${rscQuesIdx}">-</td>
												</c:if>
												
												<c:set var = "Ques71" value = ""/>
												<c:set var = "Ques72" value = ""/>
												<c:set var = "Ques73" value = ""/>
												<c:set var = "Ques74" value = ""/>
												<c:set var = "Ques75" value = ""/>
												<c:set var = "Ques76" value = ""/>
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
															<c:set var = "Ques76" value = "${queans7.rscQuesAnsEtc1}"/>
														</c:if>		
														<c:set var = "rscQuesIdx" value = "${queans7.rscQuesIdx}"/>												
													</c:if>
												</c:forEach>
												<c:if test="${Ques71 eq 'Y'}">
													<td scope="row" class="table_left2 1" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques71 eq 'N' or Ques71 eq ''}">
													<td scope="row" class="table_left2 1" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques72 eq 'Y'}">
													<td scope="row" class="table_left2 2" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques72 eq 'N' or Ques72 eq ''}">
													<td scope="row" class="table_left2 2" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques73 eq 'Y'}">
													<td scope="row" class="table_left2 3" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques73 eq 'N' or Ques73 eq ''}">
													<td scope="row" class="table_left2 3" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques74 eq 'Y'}">
													<td scope="row" class="table_left2 4" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques74 eq 'N' or Ques74 eq ''}">
													<td scope="row" class="table_left2 4" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques75 eq 'Y'}">
													<td scope="row" class="table_left2 5" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques75 eq 'N' or Ques75 eq ''}">
													<td scope="row" class="table_left2 5" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												
												<c:if test="${Ques76 ne ''}">
													<td scope="row" class="table_left2 aaa" data-idx="${rscQuesIdx}">${Ques76}</td>
												</c:if>
												<c:if test="${Ques76 eq ''}">
													<td scope="row" class="table_left2 bbb" data-idx="${rscQuesIdx}">-</td>
												</c:if>
												
												<c:set var = "Ques81" value = ""/>
												<c:set var = "Ques82" value = ""/>
												<c:set var = "Ques83" value = ""/>
												<c:set var = "Ques84" value = ""/>
												<c:set var = "Ques85" value = ""/>
												<c:set var = "Ques86" value = ""/>
												<c:set var = "Ques87" value = ""/>
												<c:forEach items="${dataqus08List}" var="queans8" varStatus="status">
													<c:if test="${queans.rscMemCode eq queans8.rscMemCode }">
														<c:if test="${queans8.rscQuesAns eq '1'}">
															<c:set var = "Ques81" value = "Y"/>
														</c:if>
														<c:if test="${queans8.rscQuesAns eq '2'}">
															<c:set var = "Ques82" value = "Y"/>
														</c:if>
														<c:if test="${queans8.rscQuesAns eq '3'}">
															<c:set var = "Ques83" value = "Y"/>
														</c:if>
														<c:if test="${queans8.rscQuesAns eq '4'}">
															<c:set var = "Ques84" value = "Y"/>
														</c:if>	
														<c:if test="${queans8.rscQuesAns eq '5'}">
															<c:set var = "Ques85" value = "Y"/>
														</c:if>	
														<c:if test="${queans8.rscQuesAns eq '6'}">
															<c:set var = "Ques86" value = "Y"/>
															<c:set var = "Ques87" value = "${queans8.rscQuesAnsEtc1}"/>
														</c:if>		
														<c:set var = "rscQuesIdx" value = "${queans8.rscQuesIdx}"/>												
													</c:if>
												</c:forEach>
												<c:if test="${Ques81 eq 'Y'}">
													<td scope="row" class="table_left2 1" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques81 eq 'N' or Ques81 eq ''}">
													<td scope="row" class="table_left2 1" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques82 eq 'Y'}">
													<td scope="row" class="table_left2 2" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques82 eq 'N' or Ques82 eq ''}">
													<td scope="row" class="table_left2 2" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques83 eq 'Y'}">
													<td scope="row" class="table_left2 3" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques83 eq 'N' or Ques83 eq ''}">
													<td scope="row" class="table_left2 3" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques84 eq 'Y'}">
													<td scope="row" class="table_left2 4" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques84 eq 'N' or Ques84 eq ''}">
													<td scope="row" class="table_left2 4" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques85 eq 'Y'}">
													<td scope="row" class="table_left2 5" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques85 eq 'N' or Ques85 eq ''}">
													<td scope="row" class="table_left2 5" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques86 eq 'Y'}">
													<td scope="row" class="table_left2 6" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques86 eq 'N' or Ques86 eq ''}">
													<td scope="row" class="table_left2 6" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												
												<c:if test="${Ques87 ne ''}">
													<td scope="row" class="table_left2 aaa" data-idx="${rscQuesIdx}">${Ques87}</td>
												</c:if>
												<c:if test="${Ques87 eq ''}">
													<td scope="row" class="table_left2 bbb" data-idx="${rscQuesIdx}">-</td>
												</c:if>
												
												<c:set var = "Ques91" value = ""/>
												<c:set var = "Ques92" value = ""/>
												<c:set var = "Ques93" value = ""/>
												<c:set var = "Ques94" value = ""/>
												<c:set var = "Ques95" value = ""/>
												<c:set var = "Ques96" value = ""/>
												<c:set var = "Ques97" value = ""/>
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
															<c:set var = "Ques97" value = "${queans9.rscQuesAnsEtc1}"/>
														</c:if>		
														<c:set var = "rscQuesIdx" value = "${queans9.rscQuesIdx}"/>												
													</c:if>
												</c:forEach>
												<c:if test="${Ques91 eq 'Y'}">
													<td scope="row" class="table_left2 1" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques91 eq 'N' or Ques91 eq ''}">
													<td scope="row" class="table_left2 1" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques92 eq 'Y'}">
													<td scope="row" class="table_left2 2" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques92 eq 'N' or Ques92 eq ''}">
													<td scope="row" class="table_left2 2" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques93 eq 'Y'}">
													<td scope="row" class="table_left2 3" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques93 eq 'N' or Ques93 eq ''}">
													<td scope="row" class="table_left2 3" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques94 eq 'Y'}">
													<td scope="row" class="table_left2 4" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques94 eq 'N' or Ques94 eq ''}">
													<td scope="row" class="table_left2 4" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques95 eq 'Y'}">
													<td scope="row" class="table_left2 5" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques95 eq 'N' or Ques95 eq ''}">
													<td scope="row" class="table_left2 5" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques96 eq 'Y'}">
													<td scope="row" class="table_left2 6" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques96 eq 'N' or Ques96 eq ''}">
													<td scope="row" class="table_left2 6" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												
												<c:if test="${Ques97 ne ''}">
													<td scope="row" class="table_left2 aaa" data-idx="${rscQuesIdx}">${Ques97}</td>
												</c:if>
												<c:if test="${Ques97 eq ''}">
													<td scope="row" class="table_left2 bbb" data-idx="${rscQuesIdx}">-</td>
												</c:if>
												
												<c:set var = "Ques101" value = ""/>
												<c:set var = "Ques102" value = ""/>
												<c:set var = "Ques103" value = ""/>
												<c:set var = "Ques104" value = ""/>
												<c:set var = "Ques105" value = ""/>
												<c:forEach items="${dataqus10List}" var="queans10" varStatus="status">
													<c:if test="${queans.rscMemCode eq queans10.rscMemCode }">
														<c:if test="${queans10.rscQuesAns eq '1'}">
															<c:set var = "Ques101" value = "Y"/>
														</c:if>
														<c:if test="${queans10.rscQuesAns eq '2'}">
															<c:set var = "Ques102" value = "Y"/>
														</c:if>
														<c:if test="${queans10.rscQuesAns eq '3'}">
															<c:set var = "Ques103" value = "Y"/>
														</c:if>
														<c:if test="${queans10.rscQuesAns eq '4'}">
															<c:set var = "Ques104" value = "Y"/>
															<c:set var = "Ques105" value = "${queans10.rscQuesAnsEtc1}"/>
														</c:if>				
														<c:set var = "rscQuesIdx" value = "${queans10.rscQuesIdx}"/>										
													</c:if>
												</c:forEach>
												<c:if test="${Ques101 eq 'Y'}">
													<td scope="row" class="table_left2 1" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques101 eq 'N' or Ques101 eq ''}">
													<td scope="row" class="table_left2 1" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques102 eq 'Y'}">
													<td scope="row" class="table_left2 2" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques102 eq 'N' or Ques102 eq ''}">
													<td scope="row" class="table_left2 2" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques103 eq 'Y'}">
													<td scope="row" class="table_left2 3" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques103 eq 'N' or Ques103 eq ''}">
													<td scope="row" class="table_left2 3" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques104 eq 'Y'}">
													<td scope="row" class="table_left2 4" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques104 eq 'N' or Ques104 eq ''}">
													<td scope="row" class="table_left2 3" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												
												<c:if test="${Ques105 ne ''}">
													<td scope="row" class="table_left2 aaa" data-idx="${rscQuesIdx}">${Ques105}</td>
												</c:if>
												<c:if test="${Ques105 eq ''}">
													<td scope="row" class="table_left2 bbb" data-idx="${rscQuesIdx}">-</td>
												</c:if>
												
												<c:set var = "Ques111" value = ""/>
												<c:set var = "Ques112" value = ""/>
												<c:set var = "Ques113" value = ""/>
												<c:set var = "Ques114" value = ""/>
												<c:set var = "Ques115" value = ""/>
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
															<c:set var = "Ques115" value = "${queans11.rscQuesAnsEtc1}"/>
														</c:if>					
														<c:set var = "rscQuesIdx" value = "${queans11.rscQuesIdx}"/>								
													</c:if>
												</c:forEach>
												<c:if test="${Ques111 eq 'Y'}">
													<td scope="row" class="table_left2 1" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques111 eq 'N' or Ques111 eq ''}">
													<td scope="row" class="table_left2 1" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques112 eq 'Y'}">
													<td scope="row" class="table_left2 2" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques112 eq 'N' or Ques112 eq ''}">
													<td scope="row" class="table_left2 2" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques113 eq 'Y'}">
													<td scope="row" class="table_left2 3" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques113 eq 'N' or Ques113 eq ''}">
													<td scope="row" class="table_left2 3" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques114 eq 'Y'}">
													<td scope="row" class="table_left2 4" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques114 eq 'N' or Ques114 eq ''}">
													<td scope="row" class="table_left2 4" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												
												<c:if test="${Ques115 ne ''}">
													<td scope="row" class="table_left2 aaa" data-idx="${rscQuesIdx}">${Ques115}</td>
												</c:if>
												<c:if test="${Ques115 eq ''}">
													<td scope="row" class="table_left2 bbb" data-idx="${rscQuesIdx}">-</td>
												</c:if>
												
												
												<c:set var = "Ques121" value = ""/>
												<c:set var = "Ques122" value = ""/>
												<c:set var = "Ques123" value = ""/>
												<c:set var = "Ques124" value = ""/>
												<c:set var = "Ques125" value = ""/>
												<c:set var = "Ques126" value = ""/>
												<c:set var = "Ques1261" value = ""/>
												<c:set var = "Ques127" value = ""/>
												<c:set var = "Ques1271" value = ""/>
												<c:set var = "Ques128" value = ""/>
												<c:set var = "Ques129" value = ""/>
												<c:set var = "Ques1210" value = ""/>
												<c:set var = "Ques1211" value = ""/>
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
															<c:set var = "Ques1261" value = "${queans12.rscQuesAnsEtc1}"/>
														</c:if>
														<c:if test="${queans12.rscQuesAns eq '7'}">
															<c:set var = "Ques127" value = "Y"/>
															<c:set var = "Ques1271" value = "${queans12.rscQuesAnsEtc1}"/>
														</c:if>
														<c:if test="${queans12.rscQuesAns eq '8'}">
															<c:set var = "Ques128" value = "Y"/>
														</c:if>
														<c:if test="${queans12.rscQuesAns eq '9'}">
															<c:set var = "Ques129" value = "Y"/>
														</c:if>
														<c:if test="${queans12.rscQuesAns eq '10'}">
															<c:set var = "Ques1210" value = "Y"/>
															<c:set var = "Ques1211" value = "${queans12.rscQuesAnsEtc1}"/>
														</c:if>									
														<c:set var = "rscQuesIdx" value = "${queans12.rscQuesIdx}"/>					
													</c:if>
												</c:forEach>
												<c:if test="${Ques121 eq 'Y'}">
													<td scope="row" class="table_left2 1" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques121 eq 'N' or Ques121 eq ''}">
													<td scope="row" class="table_left2 1" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques122 eq 'Y'}">
													<td scope="row" class="table_left2 2" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques122 eq 'N' or Ques122 eq ''}">
													<td scope="row" class="table_left2 2" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques123 eq 'Y'}">
													<td scope="row" class="table_left2 3" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques123 eq 'N' or Ques123 eq ''}">
													<td scope="row" class="table_left2 3" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques124 eq 'Y'}">
													<td scope="row" class="table_left2 12" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques124 eq 'N' or Ques124 eq ''}">
													<td scope="row" class="table_left2 12" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques125 eq 'Y'}">
													<td scope="row" class="table_left2 5" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques125 eq 'N' or Ques125 eq ''}">
													<td scope="row" class="table_left2 5" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques126 eq 'Y'}">
													<td scope="row" class="table_left2 12" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques126 eq 'N' or Ques126 eq ''}">
													<td scope="row" class="table_left2 12" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques1261 ne ''}">
													<td scope="row" class="table_left2 aaa" data-idx="${rscQuesIdx}">${Ques1261}</td>
												</c:if>
												<c:if test="${Ques1261 eq ''}">
													<td scope="row" class="table_left2 bbb" data-idx="${rscQuesIdx}">-</td>
												</c:if>
												<c:if test="${Ques127 eq 'Y'}">
													<td scope="row" class="table_left2 7">1</td>
												</c:if>
												<c:if test="${Ques127 eq 'N' or Ques127 eq ''}">
													<td scope="row" class="table_left2 7" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques1271 ne ''}">
													<td scope="row" class="table_left2 aaa" data-idx="${rscQuesIdx}">${Ques1271}</td>
												</c:if>
												<c:if test="${Ques1271 eq ''}">
													<td scope="row" class="table_left2 bbb" data-idx="${rscQuesIdx}">-</td>
												</c:if>
												<c:if test="${Ques128 eq 'Y'}">
													<td scope="row" class="table_left2 7" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques128 eq 'N' or Ques128 eq ''}">
													<td scope="row" class="table_left2 7" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques129 eq 'Y'}">
													<td scope="row" class="table_left2 7" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques129 eq 'N' or Ques129 eq ''}">
													<td scope="row" class="table_left2 7" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques1210 eq 'Y'}">
													<td scope="row" class="table_left2 7" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques1210 eq 'N' or Ques1210 eq ''}">
													<td scope="row" class="table_left2 7" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												
												<c:if test="${Ques1211 ne ''}">
													<td scope="row" class="table_left2 aaa" data-idx="${rscQuesIdx}">${Ques1211}</td>
												</c:if>
												<c:if test="${Ques1211 eq ''}">
													<td scope="row" class="table_left2 bbb" data-idx="${rscQuesIdx}">-</td>
												</c:if>
												
												<c:set var = "Ques131" value = ""/>
												<c:set var = "Ques132" value = ""/>
												<c:set var = "Ques133" value = ""/>
												<c:set var = "Ques134" value = ""/>
												<c:forEach items="${dataqus13List}" var="queans13" varStatus="status">
													<c:if test="${queans.rscMemCode eq queans13.rscMemCode }">
														<c:if test="${queans13.rscQuesAns eq '1'}">
															<c:set var = "Ques131" value = "Y"/>
														</c:if>
														<c:if test="${queans13.rscQuesAns eq '2'}">
															<c:set var = "Ques132" value = "Y"/>
														</c:if>
														<c:if test="${queans13.rscQuesAns eq '3'}">
															<c:set var = "Ques133" value = "Y"/>
														</c:if>
														<c:if test="${queans13.rscQuesAns eq '4'}">
															<c:set var = "Ques134" value = "Y"/>
														</c:if>	
														<c:set var = "rscQuesIdx" value = "${queans13.rscQuesIdx}"/>		
													</c:if>
												</c:forEach>
												<c:if test="${Ques131 eq 'Y'}">
													<td scope="row" class="table_left2 1"  data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques131 eq 'N' or Ques131 eq ''}">
													<td scope="row" class="table_left2 1"  data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques132 eq 'Y'}">
													<td scope="row" class="table_left2 2" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques132 eq 'N' or Ques132 eq ''}">
													<td scope="row" class="table_left2 2" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques133 eq 'Y'}">
													<td scope="row" class="table_left2 3" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques133 eq 'N' or Ques133 eq ''}">
													<td scope="row" class="table_left2 3" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques134 eq 'Y'}">
													<td scope="row" class="table_left2 4" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques134 eq 'N' or Ques134 eq ''}">
													<td scope="row" class="table_left2 4" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												
												<c:set var = "Ques141" value = ""/>
												<c:set var = "Ques142" value = ""/>
												<c:set var = "Ques143" value = ""/>
												<c:set var = "Ques144" value = ""/>
												<c:set var = "Ques145" value = ""/>
												<c:set var = "Ques146" value = ""/>
												<c:set var = "Ques147" value = ""/>
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
														<c:if test="${queans14.rscQuesAns eq '5'}">
															<c:set var = "Ques145" value = "Y"/>
														</c:if>	
														<c:if test="${queans14.rscQuesAns eq '6'}">
															<c:set var = "Ques146" value = "Y"/>
															<c:set var = "Ques147" value = "${queans14.rscQuesAnsEtc1}"/>
														</c:if>									
														<c:set var = "rscQuesIdx" value = "${queans14.rscQuesIdx}"/>					
													</c:if>
												</c:forEach>
												<c:if test="${Ques141 eq 'Y'}">
													<td scope="row" class="table_left2 1" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques141 eq 'N' or Ques141 eq ''}">
													<td scope="row" class="table_left2 1" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques142 eq 'Y'}">
													<td scope="row" class="table_left2 2" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques142 eq 'N' or Ques142 eq ''}">
													<td scope="row" class="table_left2 2" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques143 eq 'Y'}">
													<td scope="row" class="table_left2 3" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques143 eq 'N' or Ques143 eq ''}">
													<td scope="row" class="table_left2 3" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques144 eq 'Y'}">
													<td scope="row" class="table_left2 4" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques144 eq 'N' or Ques144 eq ''}">
													<td scope="row" class="table_left2 4" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques145 eq 'Y'}">
													<td scope="row" class="table_left2 5" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques145 eq 'N' or Ques145 eq ''}">
													<td scope="row" class="table_left2 5" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques146 eq 'Y'}">
													<td scope="row" class="table_left2 6" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques146 eq 'N' or Ques146 eq ''}">
													<td scope="row" class="table_left2 6" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												
												<c:if test="${Ques147 ne ''}">
													<td scope="row" class="table_left2 aaa" data-idx="${rscQuesIdx}">${Ques147}</td>
												</c:if>
												<c:if test="${Ques147 eq ''}">
													<td scope="row" class="table_left2 bbb" data-idx="${rscQuesIdx}">-</td>
												</c:if>
												
												
												<c:set var = "Ques151" value = ""/>
												<c:set var = "Ques152" value = ""/>
												<c:set var = "Ques153" value = ""/>
												<c:set var = "Ques154" value = ""/>
												<c:set var = "Ques155" value = ""/>
												<c:set var = "Ques156" value = ""/>
												<c:set var = "Ques157" value = ""/>
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
														</c:if>
														<c:if test="${queans15.rscQuesAns eq '4'}">
															<c:set var = "Ques154" value = "Y"/>
														</c:if>	
														<c:if test="${queans15.rscQuesAns eq '5'}">
															<c:set var = "Ques155" value = "Y"/>
														</c:if>	
														<c:if test="${queans15.rscQuesAns eq '6'}">
															<c:set var = "Ques156" value = "Y"/>
															<c:set var = "Ques157" value = "${queans15.rscQuesAnsEtc1}"/>
														</c:if>
														<c:set var = "rscQuesIdx" value = "${queans15.rscQuesIdx}"/>														
													</c:if>
												</c:forEach>
												<c:if test="${Ques151 eq 'Y'}">
													<td scope="row" class="table_left2 1" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques151 eq 'N' or Ques151 eq ''}">
													<td scope="row" class="table_left2 1" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques152 eq 'Y'}">
													<td scope="row" class="table_left2 2" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques152 eq 'N' or Ques152 eq ''}">
													<td scope="row" class="table_left2 2" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques153 eq 'Y'}">
													<td scope="row" class="table_left2 3" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques153 eq 'N' or Ques153 eq ''}">
													<td scope="row" class="table_left2 3" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques154 eq 'Y'}">
													<td scope="row" class="table_left2 4" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques154 eq 'N' or Ques154 eq ''}">
													<td scope="row" class="table_left2 4" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques155 eq 'Y'}">
													<td scope="row" class="table_left2 5" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques155 eq 'N' or Ques155 eq ''}">
													<td scope="row" class="table_left2 5" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques156 eq 'Y'}">
													<td scope="row" class="table_left2 6" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques156 eq 'N' or Ques156 eq ''}">
													<td scope="row" class="table_left2 6" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												
												<c:if test="${Ques157 ne ''}">
													<td scope="row" class="table_left2 aaa" data-idx="${rscQuesIdx}">${Ques157}</td>
												</c:if>
												<c:if test="${Ques157 eq ''}">
													<td scope="row" class="table_left2 bbb" data-idx="${rscQuesIdx}">-</td>
												</c:if>
												
											</c:if>	
											
											<c:set var = "Ques161" value = ""/>
											<c:set var = "Ques162" value = ""/>
											<c:set var = "Ques163" value = ""/>
											<c:set var = "Ques164" value = ""/>
											<c:set var = "Ques165" value = ""/>
											<c:set var = "Ques166" value = ""/>
											<c:set var = "Ques167" value = ""/>
											<c:set var = "Ques168" value = ""/>
											<c:set var = "Ques169" value = ""/>
											<c:set var = "Ques1610" value = ""/>
											<c:set var = "Ques1611" value = ""/>
											<c:forEach items="${dataqus16List}" var="queans16" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans16.rscMemCode }">
													<c:if test="${queans16.rscQuesAns eq '1'}">
														<c:set var = "Ques161" value = "Y"/>
													</c:if>
													<c:if test="${queans16.rscQuesAns eq '2'}">
														<c:set var = "Ques162" value = "Y"/>
													</c:if>
													<c:if test="${queans16.rscQuesAns eq '3'}">
														<c:set var = "Ques163" value = "Y"/>
													</c:if>
													<c:if test="${queans16.rscQuesAns eq '4'}">
														<c:set var = "Ques164" value = "Y"/>
													</c:if>	
													<c:if test="${queans16.rscQuesAns eq '5'}">
														<c:set var = "Ques165" value = "Y"/>
													</c:if>
													<c:if test="${queans16.rscQuesAns eq '6'}">
														<c:set var = "Ques166" value = "Y"/>
													</c:if>
													<c:if test="${queans16.rscQuesAns eq '7'}">
														<c:set var = "Ques167" value = "Y"/>
													</c:if>
													<c:if test="${queans16.rscQuesAns eq '8'}">
														<c:set var = "Ques168" value = "Y"/>
													</c:if>
													<c:if test="${queans16.rscQuesAns eq '9'}">
														<c:set var = "Ques169" value = "Y"/>
													</c:if>
													<c:if test="${queans16.rscQuesAns eq '10'}">
														<c:set var = "Ques1610" value = "Y"/>
														<c:set var = "Ques1611" value = "${queans16.rscQuesAnsEtc1}"/>
													</c:if>								
													<c:set var = "rscQuesIdx" value = "${queans16.rscQuesIdx}"/>						
												</c:if>
											</c:forEach>
											<c:if test="${Ques161 eq 'Y'}">
												<td scope="row" class="table_left2 1" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques161 eq 'N' or Ques161 eq ''}">
												<td scope="row" class="table_left2 1" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques162 eq 'Y'}">
												<td scope="row" class="table_left2 2" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques162 eq 'N' or Ques162 eq ''}">
												<td scope="row" class="table_left2 2" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques163 eq 'Y'}">
												<td scope="row" class="table_left2 3" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques163 eq 'N' or Ques163 eq ''}">
												<td scope="row" class="table_left2 3" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques164 eq 'Y'}">
												<td scope="row" class="table_left2 16" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques164 eq 'N' or Ques164 eq ''}">
												<td scope="row" class="table_left2 16" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques165 eq 'Y'}">
												<td scope="row" class="table_left2 5" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques165 eq 'N' or Ques165 eq ''}">
												<td scope="row" class="table_left2 5" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques166 eq 'Y'}">
												<td scope="row" class="table_left2 16" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques166 eq 'N' or Ques166 eq ''}">
												<td scope="row" class="table_left2 16" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques167 eq 'Y'}">
												<td scope="row" class="table_left2 7" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques167 eq 'N' or Ques167 eq ''}">
												<td scope="row" class="table_left2 7" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques168 eq 'Y'}">
												<td scope="row" class="table_left2 7" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques168 eq 'N' or Ques168 eq ''}">
												<td scope="row" class="table_left2 7" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques169 eq 'Y'}">
												<td scope="row" class="table_left2 7" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques169 eq 'N' or Ques169 eq ''}">
												<td scope="row" class="table_left2 7" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques1610 eq 'Y'}">
												<td scope="row" class="table_left2 7" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques1610 eq 'N' or Ques1610 eq ''}">
												<td scope="row" class="table_left2 7" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											
											<c:if test="${Ques1611 ne ''}">
												<td scope="row" class="table_left2 aaa" data-idx="${rscQuesIdx}">${Ques1611}</td>
											</c:if>
											<c:if test="${Ques1611 eq ''}">
												<td scope="row" class="table_left2 bbb" data-idx="${rscQuesIdx}">-</td>
											</c:if>
											
											
											<c:set var = "Ques171" value = ""/>
											<c:set var = "Ques172" value = ""/>
											<c:set var = "Ques173" value = ""/>
											<c:set var = "Ques174" value = ""/>
											<c:set var = "Ques175" value = ""/>
											<c:set var = "Ques176" value = ""/>
											<c:set var = "Ques177" value = ""/>
											<c:set var = "Ques178" value = ""/>
											<c:forEach items="${dataqus17List}" var="queans17" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans17.rscMemCode }">
													<c:if test="${queans17.rscQuesAns eq '1'}">
														<c:set var = "Ques171" value = "Y"/>
													</c:if>
													<c:if test="${queans17.rscQuesAns eq '2'}">
														<c:set var = "Ques172" value = "Y"/>
													</c:if>
													<c:if test="${queans17.rscQuesAns eq '3'}">
														<c:set var = "Ques173" value = "Y"/>
													</c:if>
													<c:if test="${queans17.rscQuesAns eq '4'}">
														<c:set var = "Ques174" value = "Y"/>
													</c:if>	
													<c:if test="${queans17.rscQuesAns eq '5'}">
														<c:set var = "Ques175" value = "Y"/>
													</c:if>
													<c:if test="${queans17.rscQuesAns eq '6'}">
														<c:set var = "Ques176" value = "Y"/>
													</c:if>
													<c:if test="${queans17.rscQuesAns eq '7'}">
														<c:set var = "Ques177" value = "Y"/>
														<c:set var = "Ques178" value = "${queans17.rscQuesAnsEtc1}"/>
													</c:if>							
													<c:set var = "rscQuesIdx" value = "${queans17.rscQuesIdx}"/>							
												</c:if>
											</c:forEach>
											<c:if test="${Ques171 eq 'Y'}">
												<td scope="row" class="table_left2 1" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques171 eq 'N' or Ques171 eq ''}">
												<td scope="row" class="table_left2 1" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques172 eq 'Y'}">
												<td scope="row" class="table_left2 2" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques172 eq 'N' or Ques172 eq ''}">
												<td scope="row" class="table_left2 2" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques173 eq 'Y'}">
												<td scope="row" class="table_left2 3" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques173 eq 'N' or Ques173 eq ''}">
												<td scope="row" class="table_left2 3" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques174 eq 'Y'}">
												<td scope="row" class="table_left2 17" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques174 eq 'N' or Ques174 eq ''}">
												<td scope="row" class="table_left2 17" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques175 eq 'Y'}">
												<td scope="row" class="table_left2 5" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques175 eq 'N' or Ques175 eq ''}">
												<td scope="row" class="table_left2 5" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques176 eq 'Y'}">
												<td scope="row" class="table_left2 17" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques176 eq 'N' or Ques176 eq ''}">
												<td scope="row" class="table_left2 17" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques177 eq 'Y'}">
												<td scope="row" class="table_left2 7" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques177 eq 'N' or Ques177 eq ''}">
												<td scope="row" class="table_left2 7" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques178 ne ''}">
												<td scope="row" class="table_left2 aaa" data-idx="${rscQuesIdx}">${Ques178}</td>
											</c:if>
											<c:if test="${Ques178 eq ''}">
												<td scope="row" class="table_left2 bbb" data-idx="${rscQuesIdx}">-</td>
											</c:if>
											
											<c:forEach items="${dataqus18List}" var="queans18" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans18.rscMemCode }">
													<td scope="row" class="table_left2" data-idx="${queans18.rscQuesIdx}">${queans18.rscQuesAns}</td>
													<c:if test="${queans18.rscQuesAns eq '1'}">
														<c:set var = "Ques18" value = "Y"/>
													</c:if>
													<c:if test="${queans18.rscQuesAns eq '2'}">
														<c:set var = "Ques18" value = "N"/>
													</c:if>
												</c:if>
											</c:forEach>
											<c:if test="${Ques18 eq 'N'}">
												<td data-idx="19">-</td>
												<td data-idx="19">-</td>
											</c:if>
											<c:if test="${Ques18 eq 'Y'}">
												<c:forEach items="${dataqus19List}" var="queans19" varStatus="status">
													<c:if test="${queans.rscMemCode eq queans19.rscMemCode }">
														<td scope="row" class="table_left2 1" data-idx="${queans19.rscQuesIdx}">${queans19.rscQuesAns}</td>
														<c:if test="${queans19.rscQuesAns eq '4'}">
															<td scope="row" class="table_left2 bbb"  data-idx="${queans19.rscQuesIdx}">${queans19.rscQuesAnsEtc1}</td>
														</c:if>
														<c:if test="${queans19.rscQuesAns ne '4'}">
															<td scope="row" class="table_left2 bbb"  data-idx="${queans19.rscQuesIdx}">-</td>
														</c:if>
														
													</c:if>
												</c:forEach>
											</c:if>
											
											<c:set var = "Ques201" value = ""/>
											<c:set var = "Ques202" value = ""/>
											<c:set var = "Ques203" value = ""/>
											<c:set var = "Ques204" value = ""/>
											<c:forEach items="${dataqus20List}" var="queans20" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans20.rscMemCode }">
													<c:if test="${queans20.rscQuesAns eq '1'}">
														<c:set var = "Ques201" value = "Y"/>
													</c:if>
													<c:if test="${queans20.rscQuesAns eq '2'}">
														<c:set var = "Ques202" value = "Y"/>
													</c:if>
													<c:if test="${queans20.rscQuesAns eq '3'}">
														<c:set var = "Ques203" value = "Y"/>
													</c:if>
													<c:if test="${queans20.rscQuesAns eq '4'}">
														<c:set var = "Ques204" value = "Y"/>
													</c:if>	
													<c:set var = "rscQuesIdx" value = "${queans20.rscQuesIdx}"/>		
												</c:if>
											</c:forEach>
											<c:if test="${Ques201 eq 'Y'}">
												<td scope="row" class="table_left2 1" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques201 eq 'N' or Ques201 eq ''}">
												<td scope="row" class="table_left2 1" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques202 eq 'Y'}">
												<td scope="row" class="table_left2 2" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques202 eq 'N' or Ques202 eq ''}">
												<td scope="row" class="table_left2 2" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques203 eq 'Y'}">
												<td scope="row" class="table_left2 3" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques203 eq 'N' or Ques203 eq ''}">
												<td scope="row" class="table_left2 3" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques204 eq 'Y'}">
												<td scope="row" class="table_left2 20" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques204 eq 'N' or Ques204 eq ''}">
												<td scope="row" class="table_left2 20" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											
											<c:forEach items="${dataqus21List}" var="queans21" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans21.rscMemCode }">
													<td scope="row" class="table_left2" data-idx="${queans21.rscQuesIdx}">${queans21.rscQuesAns}</td>
												</c:if>
											</c:forEach>
											
											<c:forEach items="${dataqus22List}" var="queans22" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans22.rscMemCode }">
													<td scope="row" class="table_left2" data-idx="${queans22.rscQuesIdx}">${queans22.rscQuesAns}</td>
												</c:if>
											</c:forEach>
											
											<c:forEach items="${dataqus23List}" var="queans23" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans23.rscMemCode }">
													<td scope="row" class="table_left2" data-idx="${queans23.rscQuesIdx}">${queans23.rscQuesAns}</td>
												</c:if>
											</c:forEach>
											
											<c:forEach items="${dataqus24List}" var="queans24" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans24.rscMemCode }">
													<td scope="row" class="table_left2" data-idx="${queans24.rscQuesIdx}">${queans24.rscQuesAns}</td>
												</c:if>
												<c:if test="${queans24.rscQuesAns eq '3'}">
													<c:set var = "Ques24" value = "N"/>
												</c:if>
												<c:if test="${queans24.rscQuesAns ne '3'}">
													<c:set var = "Ques24" value = "Y"/>
												</c:if>
											</c:forEach>
											
											<c:if test="${Ques24 eq 'N'}">
												<td data-idx="25">-</td>
											</c:if>
											<c:if test="${Ques24 eq 'Y'}">
												<c:forEach items="${dataqus25List}" var="queans25" varStatus="status">
													<c:if test="${queans.rscMemCode eq queans25.rscMemCode }">
														<td scope="row" class="table_left2" data-idx="${queans25.rscQuesIdx}">${queans25.rscQuesAns}</td>
													</c:if>
												</c:forEach>
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