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
					<li class=""><a href="/rsc/ansDataListSec06.do" class="tap_item">실태조사6영역</a></li>
					<li class="on"><a href="/rsc/ansDataListSec07.do" class="tap_item">실태조사7영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec09.do" class="tap_item">기타설문조사</a></li>
				</ul>
				<a href="javascript:void(0);" class="tap_btn excelbtn" data-efilename='DataDownload_07.xls' data-sheetname="실태조사-영역7" >엑셀 다운로드</a>
			</div>
            <div class="body_content_wrapper" style="border:1px solid #d8d8d8">
                <div class="main_body" style="height:calc(100%)">
					<div class="search_wrapper">
						검색영역
					</div>
					<div class="content_wrapper" style="overflow:scroll">
						<div class="ansDataBox" style="">
							<table class="ansDataTable" style="min-width:1260px;" id="DownloadData">
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
								</colgroup>
								<thead>
									<tr>
										<th rowspan="2">No.</th>
										<th rowspan="2">대상기관</th>
										<th rowspan="2">문항 1</th>
										<th rowspan="2">문항 2</th>
										<th rowspan="2">문항 3</th>
										<th rowspan="1" colspan="3">문항 4</th>
										<th rowspan="2">문항 5</th>
										<th rowspan="2">문항 6</th>
										<th rowspan="2">문항 7</th>
										<th rowspan="2">문항 8</th>
										<th rowspan="2">문항 9</th>
										<th rowspan="2">문항 10</th>
										<th rowspan="2">문항 11</th>
										<th rowspan="2">문항 12</th>
									</tr>
									<tr>
										<th rowspan="1">4.1</th>
										<th rowspan="1">4.2</th>
										<th rowspan="1">4.3</th>
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
											<c:set var = "Ques41" value = ""/>
											<c:set var = "Ques42" value = ""/>
											<c:set var = "Ques43" value = ""/>
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
											<c:forEach items="${dataqus09List}" var="queans9" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans9.rscMemCode }">
													<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}">${queans9.rscQuesAns}<%-- (${Ques10}) --%></td>
												</c:if>
											</c:forEach>
											<c:forEach items="${dataqus10List}" var="queans10" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans10.rscMemCode }">
													<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}">${queans10.rscQuesAns}<%-- (${Ques10}) --%></td>
												</c:if>
											</c:forEach>
											<c:forEach items="${dataqus11List}" var="queans11" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans11.rscMemCode }">
													<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}">${queans11.rscQuesAns}<%-- (${Ques10}) --%></td>
												</c:if>
											</c:forEach>
											
											<c:forEach items="${dataqus12List}" var="queans12" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans12.rscMemCode }">
													<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}">${queans12.rscQuesAns}<%-- (${Ques10}) --%></td>
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