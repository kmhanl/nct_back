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
					<li><a href="/rsc/ansDataListSec07.do" class="tap_item">실태조사7영역</a></li>
					<li class="on"><a href="/rsc/ansDataListSec09.do" class="tap_item">기타설문조사</a></li>
				</ul>
				<a href="javascript:void(0);" class="tap_btn excelbtn" data-efilename='DataDownload_08.xls' data-sheetname="실태조사-영역8" >엑셀 다운로드</a>
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
										<th rowspan="1" colspan="5">문항 2</th>
										<th rowspan="1" colspan="3">문항 3</th>
										<th rowspan="2">문항 4</th>
										<th rowspan="2">문항 5</th>
										<th rowspan="2">문항 6</th>
										<th rowspan="1" colspan="2">문항 7</th>
										<th rowspan="1" colspan="2">문항 8</th>
										<th rowspan="1" colspan="6">문항 9</th>
										<th rowspan="1" colspan="4">문항 10</th>
										<th rowspan="1" colspan="8">문항 11</th>
										<th rowspan="1" colspan="8">문항 12</th>
										<th rowspan="1" colspan="11">문항 13</th>
										<th rowspan="1" colspan="7">문항 14</th>
										<th rowspan="2">문항 15</th>
										<th rowspan="2">문항 16</th>
										<th rowspan="2">문항 17</th>
										<th rowspan="2">문항 18</th>
										<th rowspan="1" colspan="5">문항 19</th>
										<th rowspan="2">문항 20</th>
										<th rowspan="1" colspan="6">문항 21</th>
										<th rowspan="2">문항 22</th>
										<th rowspan="1" colspan="7">문항 23</th>
										<th rowspan="2">문항 24</th>
										<th rowspan="1" colspan="7">문항 25</th>
										<th rowspan="2">문항 26</th>
										<th rowspan="1" colspan="3">문항 27</th>
										<th rowspan="1" colspan="5">문항 28</th>
										<th rowspan="1" colspan="6">문항 29</th>
										<th rowspan="2">문항 30</th>
										<th rowspan="2">문항 31</th>
									</tr>
									<tr>
										<th rowspan="1">2.1</th>
										<th rowspan="1">2.2</th>
										<th rowspan="1">2.3</th>
										<th rowspan="1">2.4</th>
										<th rowspan="1">2.5</th>
										<th rowspan="1">3.1</th>
										<th rowspan="1">2.2</th>
										<th rowspan="1">3.3</th>
										<th rowspan="1">7.1</th>
										<th rowspan="1">7.2</th>
										<th rowspan="1">8.1</th>
										<th rowspan="1">8.2</th>
										<th rowspan="1">9.1</th>
										<th rowspan="1">9.2</th>
										<th rowspan="1">9.3</th>
										<th rowspan="1">9.4</th>
										<th rowspan="1">9.5</th>
										<th rowspan="1">9.6</th>
										<th rowspan="1">10.1</th>
										<th rowspan="1">10.2</th>
										<th rowspan="1">10.3</th>
										<th rowspan="1">10.4</th>
										<th rowspan="1">11.1</th>
										<th rowspan="1">11.2</th>
										<th rowspan="1">11.3</th>
										<th rowspan="1">11.4</th>
										<th rowspan="1">11.5</th>
										<th rowspan="1">11.6</th>
										<th rowspan="1">11.7</th>
										<th rowspan="1">11.8</th>
										<th rowspan="1">12.1</th>
										<th rowspan="1">12.2</th>
										<th rowspan="1">12.3</th>
										<th rowspan="1">12.4</th>
										<th rowspan="1">12.5</th>
										<th rowspan="1">12.6</th>
										<th rowspan="1">12.7</th>
										<th rowspan="1">12.8</th>
										<th rowspan="1">13.1</th>
										<th rowspan="1">13.2</th>
										<th rowspan="1">13.3</th>
										<th rowspan="1">13.4</th>
										<th rowspan="1">13.5</th>
										<th rowspan="1">13.6</th>
										<th rowspan="1">13.7</th>
										<th rowspan="1">13.8</th>
										<th rowspan="1">13.9</th>
										<th rowspan="1">13.10</th>
										<th rowspan="1">13.11</th>
										<th rowspan="1">14.1</th>
										<th rowspan="1">14.2</th>
										<th rowspan="1">14.3</th>
										<th rowspan="1">14.4</th>
										<th rowspan="1">14.5</th>
										<th rowspan="1">14.6</th>
										<th rowspan="1">14.7</th>
										<th rowspan="1">19.1</th>
										<th rowspan="1">19.2</th>
										<th rowspan="1">19.3</th>
										<th rowspan="1">19.4</th>
										<th rowspan="1">19.5</th>
										<th rowspan="1">21.1</th>
										<th rowspan="1">21.2</th>
										<th rowspan="1">21.3</th>
										<th rowspan="1">21.4</th>
										<th rowspan="1">21.5</th>
										<th rowspan="1">21.6</th>
										<th rowspan="1">23.1</th>
										<th rowspan="1">23.2</th>
										<th rowspan="1">23.3</th>
										<th rowspan="1">23.4</th>
										<th rowspan="1">23.5</th>
										<th rowspan="1">23.6</th>
										<th rowspan="1">23.7</th>
										<th rowspan="1">25.1</th>
										<th rowspan="1">25.2</th>
										<th rowspan="1">25.3</th>
										<th rowspan="1">25.4</th>
										<th rowspan="1">25.5</th>
										<th rowspan="1">25.6</th>
										<th rowspan="1">25.7</th>
										<th rowspan="1">27.1</th>
										<th rowspan="1">27.2</th>
										<th rowspan="1">27.3</th>
										<th rowspan="1">28.1</th>
										<th rowspan="1">28.2</th>
										<th rowspan="1">28.3</th>
										<th rowspan="1">28.4</th>
										<th rowspan="1">28.5</th>
										<th rowspan="1">29.1</th>
										<th rowspan="1">29.2</th>
										<th rowspan="1">29.3</th>
										<th rowspan="1">29.4</th>
										<th rowspan="1">29.5</th>
										<th rowspan="1">29.6</th>
									</tr>
								</thead>
								<tbody>
									<%-- ${fn:length(dataComList)} --%>
									<c:set var = "QuesIdx" value = ""/>
									<c:set var = "ComNo" value = "1"/>
									<c:set var = "etcChk" value = "N"/>
									<c:set var = "rscMemCodeChk" value = ""/>
									<c:set var = "ques021" value = "N"/>
									<c:set var = "ques022" value = "N"/>
									<c:set var = "ques023" value = "N"/>
									
									
									<c:forEach items="${dataComList}" var="queans" varStatus="status">
										<c:if test="${queans.rscMemCode ne rscMemCodeChk}">
											<tr>
											<th scope="row" class="table_left2">${ComNo}</th>
											<th scope="row" class="table_left2" data-comcode="${queans.rscMemCode}">${queans.rscMemCompany}</th>
											<c:set var = "rscMemCodeChk" value = "${queans.rscMemCode}"/>
											<c:set var = "ComNo" value = "${ComNo + 1}"/>	
											<c:set var = "ques13" value = "Y"/>	
											<c:set var = "ques131" value = "N"/>
											<c:set var = "ques132" value = "N"/>
											<c:set var = "ques133" value = "N"/>
											<c:set var = "ques134" value = "N"/>
											<c:set var = "ques135" value = "N"/>
											<c:set var = "ques136" value = "N"/>
											<c:set var = "ques137" value = "N"/>
											<c:set var = "ques138" value = "N"/>
											<c:set var = "ques139" value = "N"/>
											<c:set var = "ques1310" value = "N"/>
											<c:set var = "ques1311" value = ""/>
											<c:set var = "ques191" value = "N"/>
											<c:set var = "ques192" value = "N"/>
											<c:set var = "ques193" value = "N"/>
											<c:set var = "ques194" value = "N"/>
											<c:set var = "ques195" value = "N"/>
											<c:set var = "ques211" value = "N"/>
											<c:set var = "ques212" value = "N"/>
											<c:set var = "ques213" value = "N"/>
											<c:set var = "ques214" value = "N"/>
											<c:set var = "ques215" value = "N"/>
											<c:set var = "ques216" value = ""/>
											<c:set var = "ques231" value = "N"/>
											<c:set var = "ques232" value = "N"/>
											<c:set var = "ques233" value = "N"/>
											<c:set var = "ques234" value = "N"/>
											<c:set var = "ques235" value = "N"/>
											<c:set var = "ques236" value = "N"/>
											<c:set var = "ques237" value = ""/>
											<c:set var = "ques251" value = "N"/>
											<c:set var = "ques252" value = "N"/>
											<c:set var = "ques253" value = "N"/>
											<c:set var = "ques254" value = "N"/>
											<c:set var = "ques255" value = "N"/>
											<c:set var = "ques256" value = "N"/>
											<c:set var = "ques257" value = ""/>
											<c:set var = "ques27" value = "Y"/>	
											<c:set var = "ques271" value = "N"/>
											<c:set var = "ques272" value = "N"/>
											<c:set var = "ques273" value = "N"/>
											<c:set var = "ques28" value = "Y"/>
											<c:set var = "ques281" value = "N"/>
											<c:set var = "ques282" value = "N"/>
											<c:set var = "ques283" value = "N"/>
											<c:set var = "ques284" value = ""/>
										</c:if>
										
										<c:if test="${queans.rscQuesIdx eq 'RSC-2022-0000-01-097'}">
											<c:set var = "etcChk" value = "Y"/>
											<td scope="row" class="table_left2 cas" data-idx="${queans.rscQuesIdx}">${queans.rscQuesAns}</td>
										</c:if>
										
										<c:if test="${queans.rscQuesIdx eq 'RSC-2022-0000-01-098'}">
											<c:set var = "etcChk" value = "Y"/>
											<td data-idx="${queans.rscQuesIdx}">${queans.rscQuesAnsEtc1}</td>
											<td data-idx="${queans.rscQuesIdx}">${queans.rscQuesAnsEtc2}</td>
											<td data-idx="${queans.rscQuesIdx}">${queans.rscQuesAnsEtc3}</td>
											<td data-idx="${queans.rscQuesIdx}">${queans.rscQuesAnsEtc4}</td>
											<td data-idx="${queans.rscQuesIdx}">${queans.rscQuesAnsEtc5}</td>
										</c:if>
										<c:set var = "ques02" value = "${queans.rscQuesIdx}"/>
										
										<c:if test="${queans.rscQuesIdx eq 'RSC-2022-0000-01-099'}">
											<c:set var = "etcChk" value = "Y"/>
											<c:if test="${queans.rscQuesAns eq '1'}">
												<c:set var = "ques021" value = "Y"/>
											</c:if>
											<c:if test="${queans.rscQuesAns eq '2'}">
												<c:set var = "ques022" value = "Y"/>
											</c:if>
											<c:if test="${queans.rscQuesAns eq '3'}">
												<c:set var = "ques023" value = "Y"/>
											</c:if>
										</c:if>
										<c:if test="${queans.rscQuesIdx eq 'RSC-2022-0000-01-100'}">
											<c:if test="${ques021 eq 'Y'}">
												<td data-idx="RSC-2022-0000-01-099">1</td>
											</c:if>
											<c:if test="${ques021 ne 'Y'}">
												<td data-idx="RSC-2022-0000-01-099">0</td>
											</c:if>
											<c:if test="${ques022 eq 'Y'}">
												<td data-idx="RSC-2022-0000-01-099">1</td>
											</c:if>
											<c:if test="${ques022 ne 'Y'}">
												<td data-idx="RSC-2022-0000-01-099">0</td>
											</c:if>
											<c:if test="${ques023 eq 'Y'}">
												<td data-idx="RSC-2022-0000-01-099">1</td>
											</c:if>
											<c:if test="${ques023 ne 'Y'}">
												<td data-idx="RSC-2022-0000-01-099">0</td>
											</c:if>
											<%-- <td>[${ques021}][${ques022}][${ques023}]</td> --%>
											<c:set var = "ques021" value = "N"/>
											<c:set var = "ques022" value = "N"/>
											<c:set var = "ques023" value = "N"/>
										
										</c:if>
										<c:if test="${queans.rscQuesIdx eq 'RSC-2022-0000-01-103'  }">	
											<c:set var = "etcChk" value = "Y"/>
											<c:if test="${queans.rscQuesAnsEtc1 eq 'Y'}">
												<td data-idx="${queans.rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${queans.rscQuesAnsEtc2 eq 'Y'}">
												<td data-idx="${queans.rscQuesIdx}">2</td>
											</c:if>
											<c:if test="${queans.rscQuesAnsEtc3 eq 'Y'}">
												<td data-idx="${queans.rscQuesIdx}">3</td>
											</c:if>
											<c:if test="${queans.rscQuesAnsEtc4 eq 'Y'}">
												<td data-idx="${queans.rscQuesIdx}">4</td>
											</c:if>
											<c:if test="${queans.rscQuesAnsEtc5 eq 'Y'}">
												<td data-idx="${queans.rscQuesIdx}">5</td>
											</c:if>
										</c:if>
										<c:if test="${queans.rscQuesIdx eq 'RSC-2022-0000-01-104'  }">	
											<c:set var = "etcChk" value = "Y"/>
											<c:if test="${queans.rscQuesAnsEtc1 eq 'Y'}">
												<td data-idx="${queans.rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${queans.rscQuesAnsEtc2 eq 'Y'}">
												<td data-idx="${queans.rscQuesIdx}">2</td>
											</c:if>
											<c:if test="${queans.rscQuesAnsEtc3 eq 'Y'}">
												<td data-idx="${queans.rscQuesIdx}">3</td>
											</c:if>
											<c:if test="${queans.rscQuesAnsEtc4 eq 'Y'}">
												<td data-idx="${queans.rscQuesIdx}">4</td>
											</c:if>
											<c:if test="${queans.rscQuesAnsEtc5 eq 'Y'}">
												<td data-idx="${queans.rscQuesIdx}">5</td>
											</c:if>
										</c:if>
										<c:if test="${queans.rscQuesIdx eq 'RSC-2022-0000-01-105'  }">	
											<c:set var = "etcChk" value = "Y"/>
											<c:if test="${queans.rscQuesAnsEtc1 eq 'Y'}">
												<td data-idx="${queans.rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${queans.rscQuesAnsEtc2 eq 'Y'}">
												<td data-idx="${queans.rscQuesIdx}">2</td>
											</c:if>
											<c:if test="${queans.rscQuesAnsEtc3 eq 'Y'}">
												<td data-idx="${queans.rscQuesIdx}">3</td>
											</c:if>
											<c:if test="${queans.rscQuesAnsEtc4 eq 'Y'}">
												<td data-idx="${queans.rscQuesIdx}">4</td>
											</c:if>
											<c:if test="${queans.rscQuesAnsEtc5 eq 'Y'}">
												<td data-idx="${queans.rscQuesIdx}">5</td>
											</c:if>
										</c:if>
										<c:if test="${queans.rscQuesIdx eq 'RSC-2022-0000-01-106'  }">	
											<c:set var = "etcChk" value = "Y"/>
											<c:if test="${queans.rscQuesAnsEtc1 eq 'Y'}">
												<td data-idx="${queans.rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${queans.rscQuesAnsEtc2 eq 'Y'}">
												<td data-idx="${queans.rscQuesIdx}">2</td>
											</c:if>
											<c:if test="${queans.rscQuesAnsEtc3 eq 'Y'}">
												<td data-idx="${queans.rscQuesIdx}">3</td>
											</c:if>
											<c:if test="${queans.rscQuesAnsEtc4 eq 'Y'}">
												<td data-idx="${queans.rscQuesIdx}">4</td>
											</c:if>
											<c:if test="${queans.rscQuesAnsEtc5 eq 'Y'}">
												<td data-idx="${queans.rscQuesIdx}">5</td>
											</c:if>
										</c:if>
										<c:if test="${queans.rscQuesIdx eq 'RSC-2022-0000-01-107'  }">	
											<c:set var = "etcChk" value = "Y"/>
											<c:if test="${queans.rscQuesAnsEtc1 eq 'Y'}">
												<td data-idx="${queans.rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${queans.rscQuesAnsEtc2 eq 'Y'}">
												<td data-idx="${queans.rscQuesIdx}">2</td>
											</c:if>
											<c:if test="${queans.rscQuesAnsEtc3 eq 'Y'}">
												<td data-idx="${queans.rscQuesIdx}">3</td>
											</c:if>
											<c:if test="${queans.rscQuesAnsEtc4 eq 'Y'}">
												<td data-idx="${queans.rscQuesIdx}">4</td>
											</c:if>
											<c:if test="${queans.rscQuesAnsEtc5 eq 'Y'}">
												<td data-idx="${queans.rscQuesIdx}">5</td>
											</c:if>
										</c:if>
										<c:if test="${queans.rscQuesIdx eq 'RSC-2022-0000-01-108'  }">	
											<c:set var = "etcChk" value = "Y"/>
											<c:if test="${queans.rscQuesAnsEtc1 eq 'Y'}">
												<td data-idx="${queans.rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${queans.rscQuesAnsEtc2 eq 'Y'}">
												<td data-idx="${queans.rscQuesIdx}">2</td>
											</c:if>
											<c:if test="${queans.rscQuesAnsEtc3 eq 'Y'}">
												<td data-idx="${queans.rscQuesIdx}">3</td>
											</c:if>
											<c:if test="${queans.rscQuesAnsEtc4 eq 'Y'}">
												<td data-idx="${queans.rscQuesIdx}">4</td>
											</c:if>
											<c:if test="${queans.rscQuesAnsEtc5 eq 'Y'}">
												<td data-idx="${queans.rscQuesIdx}">5</td>
											</c:if>
										</c:if>
										
										<c:if test="${queans.rscQuesIdx eq 'RSC-2022-0000-01-109'  }">	
											<c:set var = "etcChk" value = "Y"/>
											<c:if test="${queans.rscQuesAns eq '1'}">
												<c:set var = "ques131" value = "Y"/>
											</c:if>
											<c:if test="${queans.rscQuesAns eq '2'}">
												<c:set var = "ques132" value = "Y"/>
											</c:if>
											<c:if test="${queans.rscQuesAns eq '3'}">
												<c:set var = "ques133" value = "Y"/>
											</c:if>
											<c:if test="${queans.rscQuesAns eq '4'}">
												<c:set var = "ques134" value = "Y"/>
											</c:if>
											<c:if test="${queans.rscQuesAns eq '5'}">
												<c:set var = "ques135" value = "Y"/>
											</c:if>
											<c:if test="${queans.rscQuesAns eq '6'}">
												<c:set var = "ques136" value = "Y"/>
											</c:if>
											<c:if test="${queans.rscQuesAns eq '7'}">
												<c:set var = "ques137" value = "Y"/>
											</c:if>
											<c:if test="${queans.rscQuesAns eq '8'}">
												<c:set var = "ques138" value = "Y"/>
											</c:if>
											<c:if test="${queans.rscQuesAns eq '9'}">
												<c:set var = "ques139" value = "Y"/>
											</c:if>
											<c:if test="${queans.rscQuesAns eq '10'}">
												<c:set var = "ques1310" value = "Y"/>
												<c:set var = "ques1311" value = "${queans.rscQuesAnsEtc1}"/>
											</c:if>
										</c:if>
										
										<c:if test="${queans.rscQuesIdx eq 'RSC-2022-0000-01-110'}">
											
											<c:set var = "etcChk" value = "Y"/>
											<c:if test="${ques13 eq 'Y'}">
												<c:if test="${ques131 eq 'Y'}">
													<td data-idx="RSC-2022-0000-01-109">1</td>
												</c:if>
												<c:if test="${ques131 ne 'Y'}">
													<td data-idx="RSC-2022-0000-01-109">0</td>
												</c:if>
												<c:if test="${ques132 eq 'Y'}">
													<td data-idx="RSC-2022-0000-01-109">1</td>
												</c:if>
												<c:if test="${ques132 ne 'Y'}">
													<td data-idx="RSC-2022-0000-01-109">0</td>
												</c:if>
												<c:if test="${ques133 eq 'Y'}">
													<td data-idx="RSC-2022-0000-01-109">1</td>
												</c:if>
												<c:if test="${ques133 ne 'Y'}">
													<td data-idx="RSC-2022-0000-01-109">0</td>
												</c:if>
												<c:if test="${ques134 eq 'Y'}">
													<td data-idx="RSC-2022-0000-01-109">1</td>
												</c:if>
												<c:if test="${ques134 ne 'Y'}">
													<td data-idx="RSC-2022-0000-01-109">0</td>
												</c:if>
												<c:if test="${ques135 eq 'Y'}">
													<td data-idx="RSC-2022-0000-01-109">1</td>
												</c:if>
												<c:if test="${ques135 ne 'Y'}">
													<td data-idx="RSC-2022-0000-01-109">0</td>
												</c:if>
												<c:if test="${ques136 eq 'Y'}">
													<td data-idx="RSC-2022-0000-01-109">1</td>
												</c:if>
												<c:if test="${ques136 ne 'Y'}">
													<td data-idx="RSC-2022-0000-01-109">0</td>
												</c:if>
												<c:if test="${ques137 eq 'Y'}">
													<td data-idx="RSC-2022-0000-01-109">1</td>
												</c:if>
												<c:if test="${ques137 ne 'Y'}">
													<td data-idx="RSC-2022-0000-01-109">0</td>
												</c:if>
												<c:if test="${ques138 eq 'Y'}">
													<td data-idx="RSC-2022-0000-01-109">1</td>
												</c:if>
												<c:if test="${ques138 ne 'Y'}">
													<td data-idx="RSC-2022-0000-01-109">0</td>
												</c:if>
												<c:if test="${ques139 eq 'Y'}">
													<td data-idx="RSC-2022-0000-01-109">1</td>
												</c:if>
												<c:if test="${ques139 ne 'Y'}">
													<td data-idx="RSC-2022-0000-01-109">0</td>
												</c:if>
												
												<c:if test="${ques1310 eq 'Y'}">
													<td data-idx="RSC-2022-0000-01-109">1</td>
													<td data-idx="RSC-2022-0000-01-109">${ques1311}</td>
												</c:if>
												<c:if test="${ques1310 ne 'Y'}">
													<td data-idx="RSC-2022-0000-01-109">0</td>
													<td data-idx="RSC-2022-0000-01-109">-</td>
												</c:if>
												
												<c:set var = "ques131" value = "N"/>
												<c:set var = "ques132" value = "N"/>
												<c:set var = "ques133" value = "N"/>
												<c:set var = "ques134" value = "N"/>
												<c:set var = "ques135" value = "N"/>
												<c:set var = "ques136" value = "N"/>
												<c:set var = "ques137" value = "N"/>
												<c:set var = "ques138" value = "N"/>
												<c:set var = "ques139" value = "N"/>
												<c:set var = "ques1310" value = "N"/>
												<c:set var = "ques1311" value = ""/>
												
												<c:set var = "ques13" value = "N"/>
											</c:if>
											
											
											<c:if test="${queans.rscQuesAnsEtc1 eq 'Y'}">
												<td data-idx="${queans.rscQuesIdx}">1</td>
											</c:if>
											<c:if test="${queans.rscQuesAnsEtc2 eq 'Y'}">
												<td data-idx="${queans.rscQuesIdx}">2</td>
											</c:if>
											<c:if test="${queans.rscQuesAnsEtc3 eq 'Y'}">
												<td data-idx="${queans.rscQuesIdx}">3</td>
											</c:if>
											<c:if test="${queans.rscQuesAnsEtc4 eq 'Y'}">
												<td data-idx="${queans.rscQuesIdx}">4</td>
											</c:if>
											<c:if test="${queans.rscQuesAnsEtc5 eq 'Y'}">
												<td data-idx="${queans.rscQuesIdx}">5</td>
											</c:if>
										</c:if>
										
										<c:if test="${queans.rscQuesIdx eq 'RSC-2022-0000-01-115'}">
											<c:set var = "etcChk" value = "Y"/>
											<c:if test="${queans.rscQuesAns eq '1'}">
												<c:set var = "ques191" value = "Y"/>
											</c:if>
											<c:if test="${queans.rscQuesAns eq '2'}">
												<c:set var = "ques192" value = "Y"/>
											</c:if>
											<c:if test="${queans.rscQuesAns eq '3'}">
												<c:set var = "ques193" value = "Y"/>
											</c:if>
											<c:if test="${queans.rscQuesAns eq '4'}">
												<c:set var = "ques194" value = "Y"/>
											</c:if>
											<c:if test="${queans.rscQuesAns eq '5'}">
												<c:set var = "ques195" value = "Y"/>
											</c:if>
										</c:if>
										<c:if test="${queans.rscQuesIdx eq 'RSC-2022-0000-01-116'}">
											<c:set var = "etcChk" value = "Y"/>
											<c:if test="${ques191 eq 'Y'}">
												<td data-idx="RSC-2022-0000-01-115">1</td>
											</c:if>
											<c:if test="${ques191 ne 'Y'}">
												<td data-idx="RSC-2022-0000-01-115">0</td>
											</c:if>
											<c:if test="${ques192 eq 'Y'}">
												<td data-idx="RSC-2022-0000-01-115">1</td>
											</c:if>
											<c:if test="${ques192 ne 'Y'}">
												<td data-idx="RSC-2022-0000-01-115">0</td>
											</c:if>
											<c:if test="${ques193 eq 'Y'}">
												<td data-idx="RSC-2022-0000-01-115">1</td>
											</c:if>
											<c:if test="${ques193 ne 'Y'}">
												<td data-idx="RSC-2022-0000-01-115">0</td>
											</c:if>
											<c:if test="${ques194 eq 'Y'}">
												<td data-idx="RSC-2022-0000-01-115">1</td>
											</c:if>
											<c:if test="${ques194 ne 'Y'}">
												<td data-idx="RSC-2022-0000-01-115">0</td>
											</c:if>
											<c:if test="${ques195 eq 'Y'}">
												<td data-idx="RSC-2022-0000-01-115">1</td>
											</c:if>
											<c:if test="${ques195 ne 'Y'}">
												<td data-idx="RSC-2022-0000-01-115">0</td>
											</c:if>
											
											<td scope="row" class="table_left2 cassss2" data-idx="${queans.rscQuesIdx}">${queans.rscQuesAns}</td>
										</c:if>
										<c:if test="${queans.rscQuesIdx eq 'RSC-2022-0000-01-117'}">
											<c:set var = "etcChk" value = "Y"/>
											<c:if test="${queans.rscQuesAns eq '1'}">
												<c:set var = "ques211" value = "Y"/>
											</c:if>
											<c:if test="${queans.rscQuesAns eq '2'}">
												<c:set var = "ques212" value = "Y"/>
											</c:if>
											<c:if test="${queans.rscQuesAns eq '3'}">
												<c:set var = "ques213" value = "Y"/>
											</c:if>
											<c:if test="${queans.rscQuesAns eq '4'}">
												<c:set var = "ques214" value = "Y"/>
											</c:if>
											<c:if test="${queans.rscQuesAns eq '5'}">
												<c:set var = "ques215" value = "Y"/>
												<c:set var = "ques216" value = "${queans.rscQuesAnsEtc1}"/>
											</c:if>
										</c:if>
										<c:if test="${queans.rscQuesIdx eq 'RSC-2022-0000-01-118'}">
											<c:set var = "etcChk" value = "Y"/>
											<c:if test="${ques211 eq 'Y'}">
												<td data-idx="RSC-2022-0000-01-117">1</td>
											</c:if>
											<c:if test="${ques211 ne 'Y'}">
												<td data-idx="RSC-2022-0000-01-117">0</td>
											</c:if>
											<c:if test="${ques212 eq 'Y'}">
												<td data-idx="RSC-2022-0000-01-117">1</td>
											</c:if>
											<c:if test="${ques212 ne 'Y'}">
												<td data-idx="RSC-2022-0000-01-117">0</td>
											</c:if>
											<c:if test="${ques213 eq 'Y'}">
												<td data-idx="RSC-2022-0000-01-117">1</td>
											</c:if>
											<c:if test="${ques213 ne 'Y'}">
												<td data-idx="RSC-2022-0000-01-117">0</td>
											</c:if>
											<c:if test="${ques214 eq 'Y'}">
												<td data-idx="RSC-2022-0000-01-117">1</td>
											</c:if>
											<c:if test="${ques214 ne 'Y'}">
												<td data-idx="RSC-2022-0000-01-117">0</td>
											</c:if>
											<c:if test="${ques215 eq 'Y'}">
												<td data-idx="RSC-2022-0000-01-117">1</td>
												<td data-idx="RSC-2022-0000-01-117">${ques216}</td>
											</c:if>
											<c:if test="${ques215 ne 'Y'}">
												<td data-idx="RSC-2022-0000-01-117">0</td>
												<td data-idx="RSC-2022-0000-01-117">-</td>
											</c:if>
											
											<td scope="row" class="table_left2 cassss2" data-idx="${queans.rscQuesIdx}">${queans.rscQuesAns}</td>
										</c:if>
										<c:if test="${queans.rscQuesIdx eq 'RSC-2022-0000-01-119'}">
											<c:set var = "etcChk" value = "Y"/>
											<c:if test="${queans.rscQuesAns eq '1'}">
												<c:set var = "ques231" value = "Y"/>
											</c:if>
											<c:if test="${queans.rscQuesAns eq '2'}">
												<c:set var = "ques232" value = "Y"/>
											</c:if>
											<c:if test="${queans.rscQuesAns eq '3'}">
												<c:set var = "ques233" value = "Y"/>
											</c:if>
											<c:if test="${queans.rscQuesAns eq '4'}">
												<c:set var = "ques234" value = "Y"/>
											</c:if>
											<c:if test="${queans.rscQuesAns eq '5'}">
												<c:set var = "ques235" value = "Y"/>
											</c:if>
											<c:if test="${queans.rscQuesAns eq '6'}">
												<c:set var = "ques216" value = "Y"/>
												<c:set var = "ques217" value = "${queans.rscQuesAnsEtc1}"/>
											</c:if>
										</c:if>
										<c:if test="${queans.rscQuesIdx eq 'RSC-2022-0000-01-120'}">
											<c:set var = "etcChk" value = "Y"/>
											<c:if test="${ques231 eq 'Y'}">
												<td data-idx="RSC-2022-0000-01-119">1</td>
											</c:if>
											<c:if test="${ques231 ne 'Y'}">
												<td data-idx="RSC-2022-0000-01-119">0</td>
											</c:if>
											<c:if test="${ques232 eq 'Y'}">
												<td data-idx="RSC-2022-0000-01-119">1</td>
											</c:if>
											<c:if test="${ques232 ne 'Y'}">
												<td data-idx="RSC-2022-0000-01-119">0</td>
											</c:if>
											<c:if test="${ques233 eq 'Y'}">
												<td data-idx="RSC-2022-0000-01-119">1</td>
											</c:if>
											<c:if test="${ques233 ne 'Y'}">
												<td data-idx="RSC-2022-0000-01-119">0</td>
											</c:if>
											<c:if test="${ques234 eq 'Y'}">
												<td data-idx="RSC-2022-0000-01-119">1</td>
											</c:if>
											<c:if test="${ques234 ne 'Y'}">
												<td data-idx="RSC-2022-0000-01-119">0</td>
											</c:if>
											<c:if test="${ques235 eq 'Y'}">
												<td data-idx="RSC-2022-0000-01-119">1</td>
											</c:if>
											<c:if test="${ques235 ne 'Y'}">
												<td data-idx="RSC-2022-0000-01-119">0</td>
											</c:if>
											<c:if test="${ques236 eq 'Y'}">
												<td data-idx="RSC-2022-0000-01-119">1</td>
												<td data-idx="RSC-2022-0000-01-119">${ques237}</td>
											</c:if>
											<c:if test="${ques236 ne 'Y'}">
												<td data-idx="RSC-2022-0000-01-119">0</td>
												<td data-idx="RSC-2022-0000-01-119">-</td>
											</c:if>
											
											<td scope="row" class="table_left2 cassss2" data-idx="${queans.rscQuesIdx}">${queans.rscQuesAns}</td>
										</c:if>
										
										<c:if test="${queans.rscQuesIdx eq 'RSC-2022-0000-01-121'}">
											<c:set var = "etcChk" value = "Y"/>
											<c:if test="${queans.rscQuesAns eq '1'}">
												<c:set var = "ques251" value = "Y"/>
											</c:if>
											<c:if test="${queans.rscQuesAns eq '2'}">
												<c:set var = "ques252" value = "Y"/>
											</c:if>
											<c:if test="${queans.rscQuesAns eq '3'}">
												<c:set var = "ques253" value = "Y"/>
											</c:if>
											<c:if test="${queans.rscQuesAns eq '4'}">
												<c:set var = "ques254" value = "Y"/>
											</c:if>
											<c:if test="${queans.rscQuesAns eq '5'}">
												<c:set var = "ques255" value = "Y"/>
											</c:if>
											<c:if test="${queans.rscQuesAns eq '6'}">
												<c:set var = "ques256" value = "Y"/>
												<c:set var = "ques257" value = "${queans.rscQuesAnsEtc1}"/>
											</c:if>
										</c:if>
										
										<c:if test="${queans.rscQuesIdx eq 'RSC-2022-0000-01-122'}">
											<c:set var = "etcChk" value = "Y"/>
											<c:if test="${ques251 eq 'Y'}">
												<td data-idx="RSC-2022-0000-01-121">1</td>
											</c:if>
											<c:if test="${ques251 ne 'Y'}">
												<td data-idx="RSC-2022-0000-01-121">0</td>
											</c:if>
											<c:if test="${ques252 eq 'Y'}">
												<td data-idx="RSC-2022-0000-01-121">1</td>
											</c:if>
											<c:if test="${ques252 ne 'Y'}">
												<td data-idx="RSC-2022-0000-01-121">0</td>
											</c:if>
											<c:if test="${ques253 eq 'Y'}">
												<td data-idx="RSC-2022-0000-01-121">1</td>
											</c:if>
											<c:if test="${ques253 ne 'Y'}">
												<td data-idx="RSC-2022-0000-01-121">0</td>
											</c:if>
											<c:if test="${ques254 eq 'Y'}">
												<td data-idx="RSC-2022-0000-01-121">1</td>
											</c:if>
											<c:if test="${ques254 ne 'Y'}">
												<td data-idx="RSC-2022-0000-01-121">0</td>
											</c:if>
											<c:if test="${ques255 eq 'Y'}">
												<td data-idx="RSC-2022-0000-01-121">1</td>
											</c:if>
											<c:if test="${ques255 ne 'Y'}">
												<td data-idx="RSC-2022-0000-01-121">0</td>
											</c:if>
											<c:if test="${ques256 eq 'Y'}">
												<td data-idx="RSC-2022-0000-01-121">1</td>
												<td data-idx="RSC-2022-0000-01-121">${ques257}</td>
											</c:if>
											<c:if test="${ques256 ne 'Y'}">
												<td data-idx="RSC-2022-0000-01-121">0</td>
												<td data-idx="RSC-2022-0000-01-121">-</td>
											</c:if>
											
											<td scope="row" class="table_left2 cassss2" data-idx="${queans.rscQuesIdx}">${queans.rscQuesAns}</td>
										</c:if>
										
										<c:if test="${queans.rscQuesIdx eq 'RSC-2022-0000-01-123'}">
											<c:set var = "etcChk" value = "Y"/>
											<c:if test="${queans.rscQuesAns eq '1'}">
												<c:set var = "ques271" value = "Y"/>
												<c:set var = "ques273" value = "${queans.rscQuesAnsText}"/>
											</c:if>
											<c:if test="${queans.rscQuesAns eq '2'}">
												<c:set var = "ques272" value = "Y"/>
											</c:if>
										</c:if>
										<c:if test="${queans.rscQuesIdx eq 'RSC-2022-0000-01-124'}">
											<c:if test="${ques27 eq 'Y'}">
												<c:if test="${ques271 eq 'Y'}">
													<td data-idx="RSC-2022-0000-01-123">1</td>
													<td data-idx="RSC-2022-0000-01-123">${ques273}</td>
												</c:if>
												<c:if test="${ques271 ne 'Y'}">
													<td data-idx="RSC-2022-0000-01-123">0</td>
													<td data-idx="RSC-2022-0000-01-123">-</td>
												</c:if>
												<c:if test="${ques272 eq 'Y'}">
													<td data-idx="RSC-2022-0000-01-123">1</td>
												</c:if>
												<c:if test="${ques272 ne 'Y'}">
													<td data-idx="RSC-2022-0000-01-123">0</td>
												</c:if>
												<c:set var = "ques27" value = "N"/>
											</c:if>
											
											<c:set var = "etcChk" value = "Y"/>
											<c:if test="${queans.rscQuesAns eq '1'}">
												<c:set var = "ques281" value = "Y"/>
											</c:if>
											<c:if test="${queans.rscQuesAns eq '2'}">
												<c:set var = "ques282" value = "Y"/>
											</c:if>
											<c:if test="${queans.rscQuesAns eq '3'}">
												<c:set var = "ques283" value = "Y"/>
											</c:if>
											<c:if test="${queans.rscQuesAns eq '4'}">
												<c:set var = "ques284" value = "Y"/>
												<c:set var = "ques285" value = "${queans.rscQuesAnsEtc1}"/>
											</c:if>
											
											
										</c:if>
										<c:if test="${queans.rscQuesIdx eq 'RSC-2022-0000-01-125'}">
											<c:if test="${ques28 eq 'Y'}">
											
												<c:if test="${ques281 eq 'Y'}">
													<td data-idx="RSC-2022-0000-01-124">1</td>
												</c:if>
												<c:if test="${ques281 ne 'Y'}">
													<td data-idx="RSC-2022-0000-01-124">0</td>
												</c:if>
												<c:if test="${ques282 eq 'Y'}">
													<td data-idx="RSC-2022-0000-01-124">1</td>
												</c:if>
												<c:if test="${ques282 ne 'Y'}">
													<td data-idx="RSC-2022-0000-01-124">0</td>
												</c:if>
												<c:if test="${ques283 eq 'Y'}">
													<td data-idx="RSC-2022-0000-01-124">1</td>
												</c:if>
												<c:if test="${ques283 ne 'Y'}">
													<td data-idx="RSC-2022-0000-01-124">0</td>
												</c:if>
												<c:if test="${ques284 eq 'Y'}">
													<td data-idx="RSC-2022-0000-01-124">1</td>
													<td data-idx="RSC-2022-0000-01-124">${ques285}</td>
												</c:if>
												<c:if test="${ques284 ne 'Y'}">
													<td data-idx="RSC-2022-0000-01-124">0</td>
													<td data-idx="RSC-2022-0000-01-124">-</td>
												</c:if>
												<c:set var = "ques28" value = "N"/>
											</c:if>
											
											<c:set var = "etcChk" value = "Y"/>
											<td scope="row" class="table_left2 rank" data-idx="${queans.rscQuesIdx}">${queans.rscQuesAnsEtc1}</td>
											<td scope="row" class="table_left2 rank" data-idx="${queans.rscQuesIdx}">${queans.rscQuesAnsEtc2}</td>
											<td scope="row" class="table_left2 rank" data-idx="${queans.rscQuesIdx}">${queans.rscQuesAnsEtc3}</td>
											<td scope="row" class="table_left2 rank" data-idx="${queans.rscQuesIdx}">${queans.rscQuesAnsEtc4}</td>
											<td scope="row" class="table_left2 rank" data-idx="${queans.rscQuesIdx}">${queans.rscQuesAnsEtc5}</td>
											<c:if test="${queans.rscQuesAnsText ne ''}">
												<td scope="row" class="table_left2 rank" data-idx="${queans.rscQuesIdx}">${queans.rscQuesAnsText}</td>
											</c:if>
											<c:if test="${queans.rscQuesAnsText eq ''}">
												<td scope="row" class="table_left2 rank" data-idx="${queans.rscQuesIdx}">-</td>
											</c:if>
											
											
											
											
										</c:if>
										<c:if test="${queans.rscQuesIdx eq 'RSC-2022-0000-01-126'}">
											<c:set var = "etcChk" value = "Y"/>
											<td scope="row" class="table_left2 rank" data-idx="${queans.rscQuesIdx}">${queans.rscQuesAnsText}</td>
										</c:if>
										<c:if test="${queans.rscQuesIdx eq 'RSC-2022-0000-01-127'}">
											<c:set var = "etcChk" value = "Y"/>
											<td scope="row" class="table_left2 rank" data-idx="${queans.rscQuesIdx}">${queans.rscQuesAnsText}</td>
										</c:if>
										<%-- 기본 객관식 출력 --%>
										<c:if test="${etcChk ne 'Y'}">
											<td scope="row" class="table_left2 cassss2" data-idx="${queans.rscQuesIdx}">${queans.rscQuesAns}</td>
										</c:if>
										<c:set var = "etcChk" value = "N"/>	
										
										<c:if test="${queans.rscMemCode ne rscMemCodeChk}">
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>		
					</div>

				</div>
                
            </div>
        </div>