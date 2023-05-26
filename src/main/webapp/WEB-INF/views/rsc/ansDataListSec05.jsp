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
					<li class=""><a href="/rsc/ansDataListSec03.do" class="tap_item">실태조사3영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec04.do" class="tap_item">실태조사4영역</a></li>
					<li class="on"><a href="/rsc/ansDataListSec05.do" class="tap_item">실태조사5영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec06.do" class="tap_item">실태조사6영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec07.do" class="tap_item">실태조사7영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec09.do" class="tap_item">기타설문조사</a></li>
				</ul>
				<a href="javascript:void(0);" class="tap_btn excelbtn" data-efilename='DataDownload_05.xls' data-sheetname="실태조사-영역5" >엑셀 다운로드</a>
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
								</colgroup>
								<thead>
									<tr>
										<th rowspan="3">No.</th>
										<th rowspan="3">대상기관</th>
										<th rowspan="3">문항 1</th>
										<th rowspan="3">문항 2</th>
										<th rowspan="1" colspan="26">문항 3</th>
										<th rowspan="2" colspan="4">문항 4</th>
										<th rowspan="3">문항 5</th>
										<th rowspan="2" colspan="5">문항 6</th>
										<th rowspan="3">문항 7</th>
										<th rowspan="3">문항 8</th>
										<th rowspan="3">문항 9</th>
										<th rowspan="2" colspan="4">문항 10</th>
									</tr>
									<tr>
										<th rowspan="2" colspan="1">해당없음</th>
										<th rowspan="1" colspan="5">계정관리</th>
										<th rowspan="1" colspan="5">접근관리</th>
										<th rowspan="1" colspan="5">패치관리</th>
										<th rowspan="1" colspan="5">로그관리</th>
										<th rowspan="1" colspan="5">취약점 관리</th>
										
										
										
									<tr>
										<th rowspan="1">서버</th>
										<th rowspan="1">네트워크</th>
										<th rowspan="1">DB</th>
										<th rowspan="1">응용</th>
										<th rowspan="1">PC</th>
										<th rowspan="1">서버</th>
										<th rowspan="1">네트워크</th>
										<th rowspan="1">DB</th>
										<th rowspan="1">응용</th>
										<th rowspan="1">PC</th>
										<th rowspan="1">서버</th>
										<th rowspan="1">네트워크</th>
										<th rowspan="1">DB</th>
										<th rowspan="1">응용</th>
										<th rowspan="1">PC</th>
										<th rowspan="1">서버</th>
										<th rowspan="1">네트워크</th>
										<th rowspan="1">DB</th>
										<th rowspan="1">응용</th>
										<th rowspan="1">PC</th>
										<th rowspan="1">서버</th>
										<th rowspan="1">네트워크</th>
										<th rowspan="1">DB</th>
										<th rowspan="1">응용</th>
										<th rowspan="1">PC</th>
										<th rowspan="1" colspan="1">4.1</th>
										<th rowspan="1" colspan="1">4.2</th>
										<th rowspan="1" colspan="1">4.3</th>
										<th rowspan="1" colspan="1">4.4</th>
										<th rowspan="1" colspan="1">6.1</th>
										<th rowspan="1" colspan="1">6.2</th>
										<th rowspan="1" colspan="1">6.3</th>
										<th rowspan="1" colspan="1">6.4</th>
										<th rowspan="1" colspan="1">6.5</th>
										<th rowspan="1" colspan="1">10.1</th>
										<th rowspan="1" colspan="1">10.2</th>
										<th rowspan="1" colspan="1">10.3</th>
										<th rowspan="1" colspan="1">10.4</th>
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
											<c:set var = "Ques310" value = ""/>
											<c:set var = "Ques311" value = ""/>
											<c:set var = "Ques312" value = ""/>
											<c:set var = "Ques313" value = ""/>
											<c:set var = "Ques314" value = ""/>
											<c:set var = "Ques315" value = ""/>
											<c:set var = "Ques320" value = ""/>
											<c:set var = "Ques321" value = ""/>
											<c:set var = "Ques322" value = ""/>
											<c:set var = "Ques323" value = ""/>
											<c:set var = "Ques324" value = ""/>
											<c:set var = "Ques325" value = ""/>
											<c:set var = "Ques330" value = ""/>
											<c:set var = "Ques331" value = ""/>
											<c:set var = "Ques332" value = ""/>
											<c:set var = "Ques333" value = ""/>
											<c:set var = "Ques334" value = ""/>
											<c:set var = "Ques335" value = ""/>
											<c:set var = "Ques340" value = ""/>
											<c:set var = "Ques341" value = ""/>
											<c:set var = "Ques342" value = ""/>
											<c:set var = "Ques343" value = ""/>
											<c:set var = "Ques344" value = ""/>
											<c:set var = "Ques345" value = ""/>
											<c:set var = "Ques350" value = ""/>
											<c:set var = "Ques351" value = ""/>
											<c:set var = "Ques352" value = ""/>
											<c:set var = "Ques353" value = ""/>
											<c:set var = "Ques354" value = ""/>
											<c:set var = "Ques355" value = ""/>
											<c:set var = "Ques3x" value = ""/>
											<c:forEach items="${dataqus03List}" var="queans3" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans3.rscMemCode }">
													<c:if test="${queans3.rscQuesAns eq '1'}">
														<c:set var = "Ques310" value = "${queans3.rscQuesAns}"/>
														<c:set var = "Ques311" value = "${queans3.rscQuesAnsEtc1}"/>
														<c:set var = "Ques312" value = "${queans3.rscQuesAnsEtc2}"/>
														<c:set var = "Ques313" value = "${queans3.rscQuesAnsEtc3}"/>
														<c:set var = "Ques314" value = "${queans3.rscQuesAnsEtc4}"/>
														<c:set var = "Ques315" value = "${queans3.rscQuesAnsEtc5}"/>
													</c:if>
													<c:if test="${queans3.rscQuesAns eq '2'}">
														<c:set var = "Ques320" value = "${queans3.rscQuesAns}"/>
														<c:set var = "Ques321" value = "${queans3.rscQuesAnsEtc1}"/>
														<c:set var = "Ques322" value = "${queans3.rscQuesAnsEtc2}"/>
														<c:set var = "Ques323" value = "${queans3.rscQuesAnsEtc3}"/>
														<c:set var = "Ques324" value = "${queans3.rscQuesAnsEtc4}"/>
														<c:set var = "Ques325" value = "${queans3.rscQuesAnsEtc5}"/>
													</c:if>
													<c:if test="${queans3.rscQuesAns eq '3'}">
														<c:set var = "Ques330" value = "${queans3.rscQuesAns}"/>
														<c:set var = "Ques331" value = "${queans3.rscQuesAnsEtc1}"/>
														<c:set var = "Ques332" value = "${queans3.rscQuesAnsEtc2}"/>
														<c:set var = "Ques333" value = "${queans3.rscQuesAnsEtc3}"/>
														<c:set var = "Ques334" value = "${queans3.rscQuesAnsEtc4}"/>
														<c:set var = "Ques335" value = "${queans3.rscQuesAnsEtc5}"/>
													</c:if>
													<c:if test="${queans3.rscQuesAns eq '4'}">
														<c:set var = "Ques340" value = "${queans3.rscQuesAns}"/>
														<c:set var = "Ques341" value = "${queans3.rscQuesAnsEtc1}"/>
														<c:set var = "Ques342" value = "${queans3.rscQuesAnsEtc2}"/>
														<c:set var = "Ques343" value = "${queans3.rscQuesAnsEtc3}"/>
														<c:set var = "Ques344" value = "${queans3.rscQuesAnsEtc4}"/>
														<c:set var = "Ques345" value = "${queans3.rscQuesAnsEtc5}"/>
													</c:if>
													<c:if test="${queans3.rscQuesAns eq '5'}">
														<c:set var = "Ques350" value = "${queans3.rscQuesAns}"/>
														<c:set var = "Ques351" value = "${queans3.rscQuesAnsEtc1}"/>
														<c:set var = "Ques352" value = "${queans3.rscQuesAnsEtc2}"/>
														<c:set var = "Ques353" value = "${queans3.rscQuesAnsEtc3}"/>
														<c:set var = "Ques354" value = "${queans3.rscQuesAnsEtc4}"/>
														<c:set var = "Ques355" value = "${queans3.rscQuesAnsEtc5}"/>
													</c:if>
													<c:if test="${queans3.rscQuesAns eq '6'}">
														<c:set var = "Ques3x" value = "Y"/>
													</c:if>
													<c:set var = "rscQuesIdx" value = "${queans3.rscQuesIdx}"/>
													<%-- <td scope="row" class="table_left2" data-idx="${queans3.rscQuesIdx}">${queans3.rscQuesAns}</td> --%>
												</c:if>
											</c:forEach>
											
											<c:if test="${Ques3x eq 'Y'}">
												<td data-idx="${rscQuesIdx}">1</td>
												<td data-idx="${rscQuesIdx}">-</td>
												<td data-idx="${rscQuesIdx}">-</td>
												<td data-idx="${rscQuesIdx}">-</td>
												<td data-idx="${rscQuesIdx}">-</td>
												<td data-idx="${rscQuesIdx}">-</td>
												<td data-idx="${rscQuesIdx}">-</td>
												<td data-idx="${rscQuesIdx}">-</td>
												<td data-idx="${rscQuesIdx}">-</td>
												<td data-idx="${rscQuesIdx}">-</td>
												<td data-idx="${rscQuesIdx}">-</td>
												<td data-idx="${rscQuesIdx}">-</td>
												<td data-idx="${rscQuesIdx}">-</td>
												<td data-idx="${rscQuesIdx}">-</td>
												<td data-idx="${rscQuesIdx}">-</td>
												<td data-idx="${rscQuesIdx}">-</td>
												<td data-idx="${rscQuesIdx}">-</td>
												<td data-idx="${rscQuesIdx}">-</td>
												<td data-idx="${rscQuesIdx}">-</td>
												<td data-idx="${rscQuesIdx}">-</td>
												<td data-idx="${rscQuesIdx}">-</td>
												<td data-idx="${rscQuesIdx}">-</td>
												<td data-idx="${rscQuesIdx}">-</td>
												<td data-idx="${rscQuesIdx}">-</td>
												<td data-idx="${rscQuesIdx}">-</td>
												<td data-idx="${rscQuesIdx}">-</td>
												
											</c:if>
											<c:if test="${Ques3x eq ''}">
												<td data-idx="${rscQuesIdx}">0</td>
												<td data-idx="${rscQuesIdx}"><c:if test="${Ques311 eq 'Y'}">1</c:if><c:if test="${Ques311 eq 'N'}">0</c:if></td>
												<td data-idx="${rscQuesIdx}"><c:if test="${Ques312 eq 'Y'}">1</c:if><c:if test="${Ques312 eq 'N'}">0</c:if></td>
												<td data-idx="${rscQuesIdx}"><c:if test="${Ques313 eq 'Y'}">1</c:if><c:if test="${Ques313 eq 'N'}">0</c:if></td>
												<td data-idx="${rscQuesIdx}"><c:if test="${Ques314 eq 'Y'}">1</c:if><c:if test="${Ques314 eq 'N'}">0</c:if></td>
												<td data-idx="${rscQuesIdx}"><c:if test="${Ques315 eq 'Y'}">1</c:if><c:if test="${Ques315 eq 'N'}">0</c:if></td>
												
												<td data-idx="${rscQuesIdx}"><c:if test="${Ques321 eq 'Y'}">1</c:if><c:if test="${Ques321 eq 'N'}">0</c:if></td>
												<td data-idx="${rscQuesIdx}"><c:if test="${Ques322 eq 'Y'}">1</c:if><c:if test="${Ques322 eq 'N'}">0</c:if></td>
												<td data-idx="${rscQuesIdx}"><c:if test="${Ques323 eq 'Y'}">1</c:if><c:if test="${Ques323 eq 'N'}">0</c:if></td>
												<td data-idx="${rscQuesIdx}"><c:if test="${Ques324 eq 'Y'}">1</c:if><c:if test="${Ques324 eq 'N'}">0</c:if></td>
												<td data-idx="${rscQuesIdx}"><c:if test="${Ques325 eq 'Y'}">1</c:if><c:if test="${Ques325 eq 'N'}">0</c:if></td>
												
												<td data-idx="${rscQuesIdx}"><c:if test="${Ques331 eq 'Y'}">1</c:if><c:if test="${Ques331 eq 'N'}">0</c:if></td>
												<td data-idx="${rscQuesIdx}"><c:if test="${Ques332 eq 'Y'}">1</c:if><c:if test="${Ques332 eq 'N'}">0</c:if></td>
												<td data-idx="${rscQuesIdx}"><c:if test="${Ques333 eq 'Y'}">1</c:if><c:if test="${Ques333 eq 'N'}">0</c:if></td>
												<td data-idx="${rscQuesIdx}"><c:if test="${Ques334 eq 'Y'}">1</c:if><c:if test="${Ques334 eq 'N'}">0</c:if></td>
												<td data-idx="${rscQuesIdx}"><c:if test="${Ques335 eq 'Y'}">1</c:if><c:if test="${Ques335 eq 'N'}">0</c:if></td>
												
												<td data-idx="${rscQuesIdx}"><c:if test="${Ques341 eq 'Y'}">1</c:if><c:if test="${Ques341 eq 'N'}">0</c:if></td>
												<td data-idx="${rscQuesIdx}"><c:if test="${Ques342 eq 'Y'}">1</c:if><c:if test="${Ques342 eq 'N'}">0</c:if></td>
												<td data-idx="${rscQuesIdx}"><c:if test="${Ques343 eq 'Y'}">1</c:if><c:if test="${Ques343 eq 'N'}">0</c:if></td>
												<td data-idx="${rscQuesIdx}"><c:if test="${Ques344 eq 'Y'}">1</c:if><c:if test="${Ques344 eq 'N'}">0</c:if></td>
												<td data-idx="${rscQuesIdx}"><c:if test="${Ques345 eq 'Y'}">1</c:if><c:if test="${Ques345 eq 'N'}">0</c:if></td>
												
												<td data-idx="${rscQuesIdx}"><c:if test="${Ques351 eq 'Y'}">1</c:if><c:if test="${Ques351 eq 'N'}">0</c:if></td>
												<td data-idx="${rscQuesIdx}"><c:if test="${Ques352 eq 'Y'}">1</c:if><c:if test="${Ques352 eq 'N'}">0</c:if></td>
												<td data-idx="${rscQuesIdx}"><c:if test="${Ques353 eq 'Y'}">1</c:if><c:if test="${Ques353 eq 'N'}">0</c:if></td>
												<td data-idx="${rscQuesIdx}"><c:if test="${Ques354 eq 'Y'}">1</c:if><c:if test="${Ques354 eq 'N'}">0</c:if></td>
												<td data-idx="${rscQuesIdx}"><c:if test="${Ques355 eq 'Y'}">1</c:if><c:if test="${Ques355 eq 'N'}">0</c:if></td>
											</c:if>
											<c:set var = "Ques41" value = ""/>
											<c:set var = "Ques42" value = ""/>
											<c:set var = "Ques43" value = ""/>
											<c:set var = "Ques44" value = ""/>
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
													<c:set var = "rscQuesIdx" value = "${queans4.rscQuesIdx}"/>			
												</c:if>
											</c:forEach>
											<c:if test="${Ques41 eq 'Y'}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques41 eq 'N' or Ques41 eq ''}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques42 eq 'Y'}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques42 eq 'N' or Ques42 eq ''}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques43 eq 'Y'}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques43 eq 'N' or Ques43 eq ''}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques44 eq 'Y'}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques44 eq 'N' or Ques44 eq ''}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:forEach items="${dataqus05List}" var="queans5" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans5.rscMemCode }">
													<td scope="row" class="table_left2" data-idx="${queans5.rscQuesIdx}">${queans5.rscQuesAns}</td>
												</c:if>
											</c:forEach>
											
											<c:set var = "Ques61" value = ""/>
											<c:set var = "Ques62" value = ""/>
											<c:set var = "Ques63" value = ""/>
											<c:set var = "Ques64" value = ""/>
											<c:set var = "Ques65" value = ""/>
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
													<c:set var = "rscQuesIdx" value = "${queans6.rscQuesIdx}"/>
												</c:if>
											</c:forEach>
											<c:if test="${Ques61 eq 'Y'}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques61 eq 'N' or Ques61 eq ''}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques62 eq 'Y'}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques62 eq 'N' or Ques62 eq ''}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques63 eq 'Y'}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques63 eq 'N' or Ques63 eq ''}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques64 eq 'Y'}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques64 eq 'N' or Ques64 eq ''}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<c:if test="${Ques65 eq 'Y'}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${Ques65 eq 'N' or Ques65 eq ''}">
												<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
											</c:if>
											<%-- <td class="test">1:${Ques71} / 2:${Ques72} /3:${Ques73} / 4:${Ques74} / 5:${Ques75}</td> --%>
											<c:forEach items="${dataqus07List}" var="queans7" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans7.rscMemCode }">
													<td scope="row" class="table_left2" data-idx="${queans7.rscQuesIdx}">${queans7.rscQuesAns}<%-- (${Ques10}) --%></td>
												</c:if>
											</c:forEach>
											<c:forEach items="${dataqus08List}" var="queans8" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans8.rscMemCode }">
													<td scope="row" class="table_left2" data-idx="${queans8.rscQuesIdx}">${queans8.rscQuesAns}<%-- (${Ques10}) --%></td>
												</c:if>
											</c:forEach>
											<c:set var = "Ques09" value = ""/>
											<c:forEach items="${dataqus09List}" var="queans9" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans9.rscMemCode }">
													<c:if test="${queans9.rscQuesAns eq '1'}">
														<c:set var = "Ques09" value = "N"/>
													</c:if>
													<c:if test="${queans9.rscQuesAns ne '2'}">
														<c:set var = "Ques09" value = "Y"/>
													</c:if>
													<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}">${queans9.rscQuesAns}</td>
												</c:if>
											</c:forEach>
											<c:if test="${Ques09 eq 'N' or Ques09 eq ''}">
												<td>-</td>
												<td>-</td>
												<td>-</td>
												<td>-</td>
											</c:if>
											<c:if test="${Ques09 eq 'Y'}">
												<c:set var = "Ques101" value = ""/>
												<c:set var = "Ques102" value = ""/>
												<c:set var = "Ques103" value = ""/>
												<c:set var = "Ques104" value = ""/>
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
														</c:if>
														<c:set var = "rscQuesIdx" value = "${queans10.rscQuesIdx}"/>
													</c:if>
												</c:forEach>
												<c:if test="${Ques101 eq 'Y'}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques101 eq 'N' or Ques101 eq ''}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques102 eq 'Y'}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques102 eq 'N' or Ques102 eq ''}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques103 eq 'Y'}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques103 eq 'N' or Ques103 eq ''}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">0</td>
												</c:if>
												<c:if test="${Ques104 eq 'Y'}">
													<td scope="row" class="table_left2" data-idx="${rscQuesIdx}">1</td>
												</c:if>
												<c:if test="${Ques104 eq 'N' or Ques104 eq ''}">
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