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
					<li class=""><a href="/rsc/ansDataListSec01.do" class="tap_item">실태조사1영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec02.do" class="tap_item">실태조사2영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec03.do" class="tap_item">실태조사3영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec04.do" class="tap_item">실태조사4영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec05.do" class="tap_item">실태조사5영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec06.do" class="tap_item">실태조사6영역</a></li>
					<li><a href="/rsc/ansDataListSec07.do" class="tap_item">실태조사7영역</a></li>
					<li class="on"><a href="/rsc/ansDataListSec08.do" class="tap_item">기타설문조사</a></li>
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
										<th rowspan="2">문항 3</th>
										<th rowspan="2">문항 4</th>
										<th rowspan="2">문항 5</th>
										<th rowspan="2">문항 6</th>
										<th rowspan="1" colspan="10">문항 7</th>
										<th rowspan="1" colspan="10">문항 8</th>
										<th rowspan="1" colspan="30">문항 9</th>
										<th rowspan="1" colspan="20">문항 10</th>
										<th rowspan="1" colspan="40">문항 11</th>
										<th rowspan="1" colspan="40">문항 12</th>
										<th rowspan="2">문항 13</th>
										<th rowspan="2">문항 14</th>
									</tr>
									<tr>
										<th rowspan="1">2.1</th>
										<th rowspan="1">2.2</th>
										<th rowspan="1">2.3</th>
										<th rowspan="1">2.4</th>
										<th rowspan="1">2.5</th>
										<th rowspan="1">7.1</th>
										<th rowspan="1">7.2</th>
										<th rowspan="1">7.3</th>
										<th rowspan="1">7.4</th>
										<th rowspan="1">7.5</th>
										<th rowspan="1">7.6</th>
										<th rowspan="1">7.7</th>
										<th rowspan="1">7.8</th>
										<th rowspan="1">7.9</th>
										<th rowspan="1">7.10</th>
										<th rowspan="1">8.1</th>
										<th rowspan="1">8.2</th>
										<th rowspan="1">8.3</th>
										<th rowspan="1">8.4</th>
										<th rowspan="1">8.5</th>
										<th rowspan="1">8.6</th>
										<th rowspan="1">8.7</th>
										<th rowspan="1">8.8</th>
										<th rowspan="1">8.9</th>
										<th rowspan="1">8.10</th>
										<th rowspan="1">9.1</th>
										<th rowspan="1">9.2</th>
										<th rowspan="1">9.3</th>
										<th rowspan="1">9.4</th>
										<th rowspan="1">9.5</th>
										<th rowspan="1">9.6</th>
										<th rowspan="1">9.7</th>
										<th rowspan="1">9.8</th>
										<th rowspan="1">9.9</th>
										<th rowspan="1">9.10</th>
										<th rowspan="1">9.11</th>
										<th rowspan="1">9.12</th>
										<th rowspan="1">9.13</th>
										<th rowspan="1">9.14</th>
										<th rowspan="1">9.15</th>
										<th rowspan="1">9.16</th>
										<th rowspan="1">9.17</th>
										<th rowspan="1">9.18</th>
										<th rowspan="1">9.19</th>
										<th rowspan="1">9.20</th>
										<th rowspan="1">9.21</th>
										<th rowspan="1">9.22</th>
										<th rowspan="1">9.23</th>
										<th rowspan="1">9.24</th>
										<th rowspan="1">9.25</th>
										<th rowspan="1">9.26</th>
										<th rowspan="1">9.27</th>
										<th rowspan="1">9.28</th>
										<th rowspan="1">9.29</th>
										<th rowspan="1">9.30</th>
										<th rowspan="1">10.1</th>
										<th rowspan="1">10.2</th>
										<th rowspan="1">10.3</th>
										<th rowspan="1">10.4</th>
										<th rowspan="1">10.5</th>
										<th rowspan="1">10.6</th>
										<th rowspan="1">10.7</th>
										<th rowspan="1">10.8</th>
										<th rowspan="1">10.9</th>
										<th rowspan="1">10.10</th>
										<th rowspan="1">10.11</th>
										<th rowspan="1">10.12</th>
										<th rowspan="1">10.13</th>
										<th rowspan="1">10.14</th>
										<th rowspan="1">10.15</th>
										<th rowspan="1">10.16</th>
										<th rowspan="1">10.17</th>
										<th rowspan="1">10.18</th>
										<th rowspan="1">10.19</th>
										<th rowspan="1">10.20</th>
										<th rowspan="1">11.1</th>
										<th rowspan="1">11.2</th>
										<th rowspan="1">11.3</th>
										<th rowspan="1">11.4</th>
										<th rowspan="1">11.5</th>
										<th rowspan="1">11.6</th>
										<th rowspan="1">11.7</th>
										<th rowspan="1">11.8</th>
										<th rowspan="1">11.9</th>
										<th rowspan="1">11.10</th>
										<th rowspan="1">11.11</th>
										<th rowspan="1">11.12</th>
										<th rowspan="1">11.13</th>
										<th rowspan="1">11.14</th>
										<th rowspan="1">11.15</th>
										<th rowspan="1">11.16</th>
										<th rowspan="1">11.17</th>
										<th rowspan="1">11.18</th>
										<th rowspan="1">11.19</th>
										<th rowspan="1">11.20</th>
										<th rowspan="1">11.21</th>
										<th rowspan="1">11.22</th>
										<th rowspan="1">11.23</th>
										<th rowspan="1">11.24</th>
										<th rowspan="1">11.25</th>
										<th rowspan="1">11.26</th>
										<th rowspan="1">11.27</th>
										<th rowspan="1">11.28</th>
										<th rowspan="1">11.29</th>
										<th rowspan="1">11.30</th>
										<th rowspan="1">11.31</th>
										<th rowspan="1">11.32</th>
										<th rowspan="1">11.33</th>
										<th rowspan="1">11.34</th>
										<th rowspan="1">11.35</th>
										<th rowspan="1">11.36</th>
										<th rowspan="1">11.37</th>
										<th rowspan="1">11.38</th>
										<th rowspan="1">11.39</th>
										<th rowspan="1">11.40</th>
										<th rowspan="1">12.1</th>
										<th rowspan="1">12.2</th>
										<th rowspan="1">12.3</th>
										<th rowspan="1">12.4</th>
										<th rowspan="1">12.5</th>
										<th rowspan="1">12.6</th>
										<th rowspan="1">12.7</th>
										<th rowspan="1">12.8</th>
										<th rowspan="1">12.9</th>
										<th rowspan="1">12.10</th>
										<th rowspan="1">12.11</th>
										<th rowspan="1">12.12</th>
										<th rowspan="1">12.13</th>
										<th rowspan="1">12.14</th>
										<th rowspan="1">12.15</th>
										<th rowspan="1">12.16</th>
										<th rowspan="1">12.17</th>
										<th rowspan="1">12.18</th>
										<th rowspan="1">12.19</th>
										<th rowspan="1">12.20</th>
										<th rowspan="1">12.21</th>
										<th rowspan="1">12.22</th>
										<th rowspan="1">12.23</th>
										<th rowspan="1">12.24</th>
										<th rowspan="1">12.25</th>
										<th rowspan="1">12.26</th>
										<th rowspan="1">12.27</th>
										<th rowspan="1">12.28</th>
										<th rowspan="1">12.29</th>
										<th rowspan="1">12.30</th>
										<th rowspan="1">12.31</th>
										<th rowspan="1">12.32</th>
										<th rowspan="1">12.33</th>
										<th rowspan="1">12.34</th>
										<th rowspan="1">12.35</th>
										<th rowspan="1">12.36</th>
										<th rowspan="1">12.37</th>
										<th rowspan="1">12.38</th>
										<th rowspan="1">12.39</th>
										<th rowspan="1">12.40</th>
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
													<td scope="row" class="table_left2" data-idx="${queans2.rscQuesIdx}">${queans2.rscQuesAnsEtc1}</td>
													<td scope="row" class="table_left2" data-idx="${queans2.rscQuesIdx}">${queans2.rscQuesAnsEtc2}</td>
													<td scope="row" class="table_left2" data-idx="${queans2.rscQuesIdx}">${queans2.rscQuesAnsEtc3}</td>
													<td scope="row" class="table_left2" data-idx="${queans2.rscQuesIdx}">${queans2.rscQuesAnsEtc5}</td>
													<td scope="row" class="table_left2" data-idx="${queans2.rscQuesIdx}">${queans2.rscQuesAnsEtc4}</td>
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
											
											<c:forEach items="${dataqus07List}" var="queans7" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans7.rscMemCode }">
													
													<c:if test="${queans7.rscQuesAns eq '1'}">
														<c:if test="${queans7.rscQuesAnsEtc1 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans7.rscQuesIdx}"><%-- (${Ques10}) --%>${queans7.rscQuesAnsEtc1}</td>
														</c:if>
														<c:if test="${queans7.rscQuesAnsEtc1 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans7.rscQuesIdx}"><%-- (${Ques10}) --%>${queans7.rscQuesAnsEtc1}</td>
														</c:if>
														
														<c:if test="${queans7.rscQuesAnsEtc2 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans7.rscQuesIdx}"><%-- (${Ques10}) --%>${queans7.rscQuesAnsEtc2}</td>
														</c:if>
														<c:if test="${queans7.rscQuesAnsEtc2 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans7.rscQuesIdx}"><%-- (${Ques10}) --%>${queans7.rscQuesAnsEtc2}</td>
														</c:if>
														
														<c:if test="${queans7.rscQuesAnsEtc3 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans7.rscQuesIdx}"><%-- (${Ques10}) --%>${queans7.rscQuesAnsEtc3}</td>
														</c:if>
														<c:if test="${queans7.rscQuesAnsEtc3 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans7.rscQuesIdx}"><%-- (${Ques10}) --%>${queans7.rscQuesAnsEtc3}</td>
														</c:if>
														
														<c:if test="${queans7.rscQuesAnsEtc4 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans7.rscQuesIdx}"><%-- (${Ques10}) --%>${queans7.rscQuesAnsEtc4}</td>
														</c:if>
														<c:if test="${queans7.rscQuesAnsEtc4 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans7.rscQuesIdx}"><%-- (${Ques10}) --%>${queans7.rscQuesAnsEtc4}</td>
														</c:if>
														
														<c:if test="${queans7.rscQuesAnsEtc5 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans7.rscQuesIdx}"><%-- (${Ques10}) --%>${queans7.rscQuesAnsEtc5}</td>
														</c:if>
														<c:if test="${queans7.rscQuesAnsEtc5 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans7.rscQuesIdx}"><%-- (${Ques10}) --%>${queans7.rscQuesAnsEtc5}</td>
														</c:if>
													</c:if>
													<c:if test="${queans7.rscQuesAns eq '2'}">
														<c:if test="${queans7.rscQuesAnsEtc1 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans7.rscQuesIdx}"><%-- (${Ques10}) --%>${queans7.rscQuesAnsEtc1}</td>
														</c:if>
														<c:if test="${queans7.rscQuesAnsEtc1 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans7.rscQuesIdx}"><%-- (${Ques10}) --%>${queans7.rscQuesAnsEtc1}</td>
														</c:if>
														
														<c:if test="${queans7.rscQuesAnsEtc2 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans7.rscQuesIdx}"><%-- (${Ques10}) --%>${queans7.rscQuesAnsEtc2}</td>
														</c:if>
														<c:if test="${queans7.rscQuesAnsEtc2 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans7.rscQuesIdx}"><%-- (${Ques10}) --%>${queans7.rscQuesAnsEtc2}</td>
														</c:if>
														
														<c:if test="${queans7.rscQuesAnsEtc3 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans7.rscQuesIdx}"><%-- (${Ques10}) --%>${queans7.rscQuesAnsEtc3}</td>
														</c:if>
														<c:if test="${queans7.rscQuesAnsEtc3 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans7.rscQuesIdx}"><%-- (${Ques10}) --%>${queans7.rscQuesAnsEtc3}</td>
														</c:if>
														
														<c:if test="${queans7.rscQuesAnsEtc4 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans7.rscQuesIdx}"><%-- (${Ques10}) --%>${queans7.rscQuesAnsEtc4}</td>
														</c:if>
														<c:if test="${queans7.rscQuesAnsEtc4 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans7.rscQuesIdx}"><%-- (${Ques10}) --%>${queans7.rscQuesAnsEtc4}</td>
														</c:if>
														
														<c:if test="${queans7.rscQuesAnsEtc5 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans7.rscQuesIdx}"><%-- (${Ques10}) --%>${queans7.rscQuesAnsEtc5}</td>
														</c:if>
														<c:if test="${queans7.rscQuesAnsEtc5 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans7.rscQuesIdx}"><%-- (${Ques10}) --%>${queans7.rscQuesAnsEtc5}</td>
														</c:if>
													</c:if>
												</c:if>
											</c:forEach>
											
											<c:forEach items="${dataqus08List}" var="queans8" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans8.rscMemCode }">
													
													<c:if test="${queans8.rscQuesAns eq '1'}">
														<c:if test="${queans8.rscQuesAnsEtc1 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans8.rscQuesIdx}"><%-- (${Ques10}) --%>${queans8.rscQuesAnsEtc1}</td>
														</c:if>
														<c:if test="${queans8.rscQuesAnsEtc1 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans8.rscQuesIdx}"><%-- (${Ques10}) --%>${queans8.rscQuesAnsEtc1}</td>
														</c:if>
														
														<c:if test="${queans8.rscQuesAnsEtc2 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans8.rscQuesIdx}"><%-- (${Ques10}) --%>${queans8.rscQuesAnsEtc2}</td>
														</c:if>
														<c:if test="${queans8.rscQuesAnsEtc2 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans8.rscQuesIdx}"><%-- (${Ques10}) --%>${queans8.rscQuesAnsEtc2}</td>
														</c:if>
														
														<c:if test="${queans8.rscQuesAnsEtc3 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans8.rscQuesIdx}"><%-- (${Ques10}) --%>${queans8.rscQuesAnsEtc3}</td>
														</c:if>
														<c:if test="${queans8.rscQuesAnsEtc3 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans8.rscQuesIdx}"><%-- (${Ques10}) --%>${queans8.rscQuesAnsEtc3}</td>
														</c:if>
														
														<c:if test="${queans8.rscQuesAnsEtc4 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans8.rscQuesIdx}"><%-- (${Ques10}) --%>${queans8.rscQuesAnsEtc4}</td>
														</c:if>
														<c:if test="${queans8.rscQuesAnsEtc4 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans8.rscQuesIdx}"><%-- (${Ques10}) --%>${queans8.rscQuesAnsEtc4}</td>
														</c:if>
														
														<c:if test="${queans8.rscQuesAnsEtc5 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans8.rscQuesIdx}"><%-- (${Ques10}) --%>${queans8.rscQuesAnsEtc5}</td>
														</c:if>
														<c:if test="${queans8.rscQuesAnsEtc5 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans8.rscQuesIdx}"><%-- (${Ques10}) --%>${queans8.rscQuesAnsEtc5}</td>
														</c:if>
													</c:if>
													<c:if test="${queans8.rscQuesAns eq '2'}">
														<c:if test="${queans8.rscQuesAnsEtc1 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans8.rscQuesIdx}"><%-- (${Ques10}) --%>${queans8.rscQuesAnsEtc1}</td>
														</c:if>
														<c:if test="${queans8.rscQuesAnsEtc1 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans8.rscQuesIdx}"><%-- (${Ques10}) --%>${queans8.rscQuesAnsEtc1}</td>
														</c:if>
														
														<c:if test="${queans8.rscQuesAnsEtc2 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans8.rscQuesIdx}"><%-- (${Ques10}) --%>${queans8.rscQuesAnsEtc2}</td>
														</c:if>
														<c:if test="${queans8.rscQuesAnsEtc2 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans8.rscQuesIdx}"><%-- (${Ques10}) --%>${queans8.rscQuesAnsEtc2}</td>
														</c:if>
														
														<c:if test="${queans8.rscQuesAnsEtc3 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans8.rscQuesIdx}"><%-- (${Ques10}) --%>${queans8.rscQuesAnsEtc3}</td>
														</c:if>
														<c:if test="${queans8.rscQuesAnsEtc3 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans8.rscQuesIdx}"><%-- (${Ques10}) --%>${queans8.rscQuesAnsEtc3}</td>
														</c:if>
														
														<c:if test="${queans8.rscQuesAnsEtc4 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans8.rscQuesIdx}"><%-- (${Ques10}) --%>${queans8.rscQuesAnsEtc4}</td>
														</c:if>
														<c:if test="${queans8.rscQuesAnsEtc4 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans8.rscQuesIdx}"><%-- (${Ques10}) --%>${queans8.rscQuesAnsEtc4}</td>
														</c:if>
														
														<c:if test="${queans8.rscQuesAnsEtc5 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans8.rscQuesIdx}"><%-- (${Ques10}) --%>${queans8.rscQuesAnsEtc5}</td>
														</c:if>
														<c:if test="${queans8.rscQuesAnsEtc5 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans8.rscQuesIdx}"><%-- (${Ques10}) --%>${queans8.rscQuesAnsEtc5}</td>
														</c:if>
													</c:if>
												</c:if>
											</c:forEach>
											
											<c:forEach items="${dataqus09List}" var="queans9" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans9.rscMemCode }">
													
													<c:if test="${queans9.rscQuesAns eq '1'}">
														<c:if test="${queans9.rscQuesAnsEtc1 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc1}</td>
														</c:if>
														<c:if test="${queans9.rscQuesAnsEtc1 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc1}</td>
														</c:if>
														
														<c:if test="${queans9.rscQuesAnsEtc2 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc2}</td>
														</c:if>
														<c:if test="${queans9.rscQuesAnsEtc2 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc2}</td>
														</c:if>
														
														<c:if test="${queans9.rscQuesAnsEtc3 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc3}</td>
														</c:if>
														<c:if test="${queans9.rscQuesAnsEtc3 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc3}</td>
														</c:if>
														
														<c:if test="${queans9.rscQuesAnsEtc4 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc4}</td>
														</c:if>
														<c:if test="${queans9.rscQuesAnsEtc4 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc4}</td>
														</c:if>
														
														<c:if test="${queans9.rscQuesAnsEtc5 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc5}</td>
														</c:if>
														<c:if test="${queans9.rscQuesAnsEtc5 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc5}</td>
														</c:if>
													</c:if>
													<c:if test="${queans9.rscQuesAns eq '2'}">
														<c:if test="${queans9.rscQuesAnsEtc1 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc1}</td>
														</c:if>
														<c:if test="${queans9.rscQuesAnsEtc1 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc1}</td>
														</c:if>
														
														<c:if test="${queans9.rscQuesAnsEtc2 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc2}</td>
														</c:if>
														<c:if test="${queans9.rscQuesAnsEtc2 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc2}</td>
														</c:if>
														
														<c:if test="${queans9.rscQuesAnsEtc3 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc3}</td>
														</c:if>
														<c:if test="${queans9.rscQuesAnsEtc3 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc3}</td>
														</c:if>
														
														<c:if test="${queans9.rscQuesAnsEtc4 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc4}</td>
														</c:if>
														<c:if test="${queans9.rscQuesAnsEtc4 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc4}</td>
														</c:if>
														
														<c:if test="${queans9.rscQuesAnsEtc5 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc5}</td>
														</c:if>
														<c:if test="${queans9.rscQuesAnsEtc5 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc5}</td>
														</c:if>
													</c:if>
													<c:if test="${queans9.rscQuesAns eq '3'}">
														<c:if test="${queans9.rscQuesAnsEtc1 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc1}</td>
														</c:if>
														<c:if test="${queans9.rscQuesAnsEtc1 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc1}</td>
														</c:if>
														
														<c:if test="${queans9.rscQuesAnsEtc2 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc2}</td>
														</c:if>
														<c:if test="${queans9.rscQuesAnsEtc2 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc2}</td>
														</c:if>
														
														<c:if test="${queans9.rscQuesAnsEtc3 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc3}</td>
														</c:if>
														<c:if test="${queans9.rscQuesAnsEtc3 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc3}</td>
														</c:if>
														
														<c:if test="${queans9.rscQuesAnsEtc4 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc4}</td>
														</c:if>
														<c:if test="${queans9.rscQuesAnsEtc4 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc4}</td>
														</c:if>
														
														<c:if test="${queans9.rscQuesAnsEtc5 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc5}</td>
														</c:if>
														<c:if test="${queans9.rscQuesAnsEtc5 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc5}</td>
														</c:if>
													</c:if>
													<c:if test="${queans9.rscQuesAns eq '4'}">
														<c:if test="${queans9.rscQuesAnsEtc1 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc1}</td>
														</c:if>
														<c:if test="${queans9.rscQuesAnsEtc1 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc1}</td>
														</c:if>
														
														<c:if test="${queans9.rscQuesAnsEtc2 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc2}</td>
														</c:if>
														<c:if test="${queans9.rscQuesAnsEtc2 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc2}</td>
														</c:if>
														
														<c:if test="${queans9.rscQuesAnsEtc3 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc3}</td>
														</c:if>
														<c:if test="${queans9.rscQuesAnsEtc3 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc3}</td>
														</c:if>
														
														<c:if test="${queans9.rscQuesAnsEtc4 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc4}</td>
														</c:if>
														<c:if test="${queans9.rscQuesAnsEtc4 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc4}</td>
														</c:if>
														
														<c:if test="${queans9.rscQuesAnsEtc5 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc5}</td>
														</c:if>
														<c:if test="${queans9.rscQuesAnsEtc5 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc5}</td>
														</c:if>
													</c:if>
													<c:if test="${queans9.rscQuesAns eq '5'}">
														<c:if test="${queans9.rscQuesAnsEtc1 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc1}</td>
														</c:if>
														<c:if test="${queans9.rscQuesAnsEtc1 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc1}</td>
														</c:if>
														
														<c:if test="${queans9.rscQuesAnsEtc2 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc2}</td>
														</c:if>
														<c:if test="${queans9.rscQuesAnsEtc2 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc2}</td>
														</c:if>
														
														<c:if test="${queans9.rscQuesAnsEtc3 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc3}</td>
														</c:if>
														<c:if test="${queans9.rscQuesAnsEtc3 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc3}</td>
														</c:if>
														
														<c:if test="${queans9.rscQuesAnsEtc4 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc4}</td>
														</c:if>
														<c:if test="${queans9.rscQuesAnsEtc4 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc4}</td>
														</c:if>
														
														<c:if test="${queans9.rscQuesAnsEtc5 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc5}</td>
														</c:if>
														<c:if test="${queans9.rscQuesAnsEtc5 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc5}</td>
														</c:if>
														
													</c:if>
													<c:if test="${queans9.rscQuesAns eq '6'}">
														<c:if test="${queans9.rscQuesAnsEtc1 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc1}</td>
														</c:if>
														<c:if test="${queans9.rscQuesAnsEtc1 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc1}</td>
														</c:if>
														
														<c:if test="${queans9.rscQuesAnsEtc2 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc2}</td>
														</c:if>
														<c:if test="${queans9.rscQuesAnsEtc2 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc2}</td>
														</c:if>
														
														<c:if test="${queans9.rscQuesAnsEtc3 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc3}</td>
														</c:if>
														<c:if test="${queans9.rscQuesAnsEtc3 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc3}</td>
														</c:if>
														
														<c:if test="${queans9.rscQuesAnsEtc4 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc4}</td>
														</c:if>
														<c:if test="${queans9.rscQuesAnsEtc4 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc4}</td>
														</c:if>
														
														<c:if test="${queans9.rscQuesAnsEtc5 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc5}</td>
														</c:if>
														<c:if test="${queans9.rscQuesAnsEtc5 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans9.rscQuesIdx}"><%-- (${Ques10}) --%>${queans9.rscQuesAnsEtc5}</td>
														</c:if>
													</c:if>
												</c:if>
											</c:forEach>
											
											
											<c:forEach items="${dataqus10List}" var="queans10" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans10.rscMemCode }">
													
													<c:if test="${queans10.rscQuesAns eq '1'}">
														<c:if test="${queans10.rscQuesAnsEtc1 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc1}</td>
														</c:if>
														<c:if test="${queans10.rscQuesAnsEtc1 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc1}</td>
														</c:if>
														
														<c:if test="${queans10.rscQuesAnsEtc2 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc2}</td>
														</c:if>
														<c:if test="${queans10.rscQuesAnsEtc2 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc2}</td>
														</c:if>
														
														<c:if test="${queans10.rscQuesAnsEtc3 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc3}</td>
														</c:if>
														<c:if test="${queans10.rscQuesAnsEtc3 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc3}</td>
														</c:if>
														
														<c:if test="${queans10.rscQuesAnsEtc4 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc4}</td>
														</c:if>
														<c:if test="${queans10.rscQuesAnsEtc4 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc4}</td>
														</c:if>
														
														<c:if test="${queans10.rscQuesAnsEtc5 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc5}</td>
														</c:if>
														<c:if test="${queans10.rscQuesAnsEtc5 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc5}</td>
														</c:if>
													</c:if>
													<c:if test="${queans10.rscQuesAns eq '2'}">
														<c:if test="${queans10.rscQuesAnsEtc1 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc1}</td>
														</c:if>
														<c:if test="${queans10.rscQuesAnsEtc1 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc1}</td>
														</c:if>
														
														<c:if test="${queans10.rscQuesAnsEtc2 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc2}</td>
														</c:if>
														<c:if test="${queans10.rscQuesAnsEtc2 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc2}</td>
														</c:if>
														
														<c:if test="${queans10.rscQuesAnsEtc3 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc3}</td>
														</c:if>
														<c:if test="${queans10.rscQuesAnsEtc3 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc3}</td>
														</c:if>
														
														<c:if test="${queans10.rscQuesAnsEtc4 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc4}</td>
														</c:if>
														<c:if test="${queans10.rscQuesAnsEtc4 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc4}</td>
														</c:if>
														
														<c:if test="${queans10.rscQuesAnsEtc5 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc5}</td>
														</c:if>
														<c:if test="${queans10.rscQuesAnsEtc5 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc5}</td>
														</c:if>
													</c:if>
													<c:if test="${queans10.rscQuesAns eq '3'}">
														<c:if test="${queans10.rscQuesAnsEtc1 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc1}</td>
														</c:if>
														<c:if test="${queans10.rscQuesAnsEtc1 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc1}</td>
														</c:if>
														
														<c:if test="${queans10.rscQuesAnsEtc2 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc2}</td>
														</c:if>
														<c:if test="${queans10.rscQuesAnsEtc2 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc2}</td>
														</c:if>
														
														<c:if test="${queans10.rscQuesAnsEtc3 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc3}</td>
														</c:if>
														<c:if test="${queans10.rscQuesAnsEtc3 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc3}</td>
														</c:if>
														
														<c:if test="${queans10.rscQuesAnsEtc4 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc4}</td>
														</c:if>
														<c:if test="${queans10.rscQuesAnsEtc4 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc4}</td>
														</c:if>
														
														<c:if test="${queans10.rscQuesAnsEtc5 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc5}</td>
														</c:if>
														<c:if test="${queans10.rscQuesAnsEtc5 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc5}</td>
														</c:if>
													</c:if>
													<c:if test="${queans10.rscQuesAns eq '4'}">
														<c:if test="${queans10.rscQuesAnsEtc1 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc1}</td>
														</c:if>
														<c:if test="${queans10.rscQuesAnsEtc1 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc1}</td>
														</c:if>
														
														<c:if test="${queans10.rscQuesAnsEtc2 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc2}</td>
														</c:if>
														<c:if test="${queans10.rscQuesAnsEtc2 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc2}</td>
														</c:if>
														
														<c:if test="${queans10.rscQuesAnsEtc3 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc3}</td>
														</c:if>
														<c:if test="${queans10.rscQuesAnsEtc3 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc3}</td>
														</c:if>
														
														<c:if test="${queans10.rscQuesAnsEtc4 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc4}</td>
														</c:if>
														<c:if test="${queans10.rscQuesAnsEtc4 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc4}</td>
														</c:if>
														
														<c:if test="${queans10.rscQuesAnsEtc5 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc5}</td>
														</c:if>
														<c:if test="${queans10.rscQuesAnsEtc5 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans10.rscQuesIdx}"><%-- (${Ques10}) --%>${queans10.rscQuesAnsEtc5}</td>
														</c:if>
													</c:if>
													
												</c:if>
											</c:forEach>
											
											<c:forEach items="${dataqus11List}" var="queans11" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans11.rscMemCode }">
													
													<c:if test="${queans11.rscQuesAns eq '1'}">
														<c:if test="${queans11.rscQuesAnsEtc1 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc1}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc1 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc1}</td>
														</c:if>
														
														<c:if test="${queans11.rscQuesAnsEtc2 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc2}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc2 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc2}</td>
														</c:if>
														
														<c:if test="${queans11.rscQuesAnsEtc3 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc3}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc3 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc3}</td>
														</c:if>
														
														<c:if test="${queans11.rscQuesAnsEtc4 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc4}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc4 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc4}</td>
														</c:if>
														
														<c:if test="${queans11.rscQuesAnsEtc5 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc5}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc5 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc5}</td>
														</c:if>
													</c:if>
													<c:if test="${queans11.rscQuesAns eq '2'}">
														<c:if test="${queans11.rscQuesAnsEtc1 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc1}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc1 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc1}</td>
														</c:if>
														
														<c:if test="${queans11.rscQuesAnsEtc2 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc2}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc2 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc2}</td>
														</c:if>
														
														<c:if test="${queans11.rscQuesAnsEtc3 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc3}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc3 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc3}</td>
														</c:if>
														
														<c:if test="${queans11.rscQuesAnsEtc4 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc4}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc4 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc4}</td>
														</c:if>
														
														<c:if test="${queans11.rscQuesAnsEtc5 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc5}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc5 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc5}</td>
														</c:if>
													</c:if>
													<c:if test="${queans11.rscQuesAns eq '3'}">
														<c:if test="${queans11.rscQuesAnsEtc1 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc1}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc1 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc1}</td>
														</c:if>
														
														<c:if test="${queans11.rscQuesAnsEtc2 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc2}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc2 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc2}</td>
														</c:if>
														
														<c:if test="${queans11.rscQuesAnsEtc3 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc3}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc3 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc3}</td>
														</c:if>
														
														<c:if test="${queans11.rscQuesAnsEtc4 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc4}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc4 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc4}</td>
														</c:if>
														
														<c:if test="${queans11.rscQuesAnsEtc5 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc5}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc5 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc5}</td>
														</c:if>
													</c:if>
													<c:if test="${queans11.rscQuesAns eq '4'}">
														<c:if test="${queans11.rscQuesAnsEtc1 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc1}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc1 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc1}</td>
														</c:if>
														
														<c:if test="${queans11.rscQuesAnsEtc2 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc2}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc2 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc2}</td>
														</c:if>
														
														<c:if test="${queans11.rscQuesAnsEtc3 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc3}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc3 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc3}</td>
														</c:if>
														
														<c:if test="${queans11.rscQuesAnsEtc4 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc4}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc4 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc4}</td>
														</c:if>
														
														<c:if test="${queans11.rscQuesAnsEtc5 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc5}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc5 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc5}</td>
														</c:if>
													</c:if>
													<c:if test="${queans11.rscQuesAns eq '5'}">
														<c:if test="${queans11.rscQuesAnsEtc1 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc1}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc1 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc1}</td>
														</c:if>
														
														<c:if test="${queans11.rscQuesAnsEtc2 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc2}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc2 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc2}</td>
														</c:if>
														
														<c:if test="${queans11.rscQuesAnsEtc3 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc3}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc3 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc3}</td>
														</c:if>
														
														<c:if test="${queans11.rscQuesAnsEtc4 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc4}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc4 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc4}</td>
														</c:if>
														
														<c:if test="${queans11.rscQuesAnsEtc5 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc5}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc5 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc5}</td>
														</c:if>
													</c:if>
													<c:if test="${queans11.rscQuesAns eq '6'}">
														<c:if test="${queans11.rscQuesAnsEtc1 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc1}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc1 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc1}</td>
														</c:if>
														
														<c:if test="${queans11.rscQuesAnsEtc2 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc2}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc2 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc2}</td>
														</c:if>
														
														<c:if test="${queans11.rscQuesAnsEtc3 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc3}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc3 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc3}</td>
														</c:if>
														
														<c:if test="${queans11.rscQuesAnsEtc4 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc4}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc4 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc4}</td>
														</c:if>
														
														<c:if test="${queans11.rscQuesAnsEtc5 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc5}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc5 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc5}</td>
														</c:if>
													</c:if>
													<c:if test="${queans11.rscQuesAns eq '7'}">
														<c:if test="${queans11.rscQuesAnsEtc1 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc1}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc1 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc1}</td>
														</c:if>
														
														<c:if test="${queans11.rscQuesAnsEtc2 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc2}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc2 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc2}</td>
														</c:if>
														
														<c:if test="${queans11.rscQuesAnsEtc3 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc3}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc3 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc3}</td>
														</c:if>
														
														<c:if test="${queans11.rscQuesAnsEtc4 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc4}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc4 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc4}</td>
														</c:if>
														
														<c:if test="${queans11.rscQuesAnsEtc5 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc5}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc5 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc5}</td>
														</c:if>
													</c:if>
													<c:if test="${queans11.rscQuesAns eq '8'}">
														<c:if test="${queans11.rscQuesAnsEtc1 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc1}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc1 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc1}</td>
														</c:if>
														
														<c:if test="${queans11.rscQuesAnsEtc2 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc2}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc2 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc2}</td>
														</c:if>
														
														<c:if test="${queans11.rscQuesAnsEtc3 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc3}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc3 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc3}</td>
														</c:if>
														
														<c:if test="${queans11.rscQuesAnsEtc4 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc4}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc4 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc4}</td>
														</c:if>
														
														<c:if test="${queans11.rscQuesAnsEtc5 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc5}</td>
														</c:if>
														<c:if test="${queans11.rscQuesAnsEtc5 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans11.rscQuesIdx}"><%-- (${Ques10}) --%>${queans11.rscQuesAnsEtc5}</td>
														</c:if>
													</c:if>
													
												</c:if>
											</c:forEach>
											
											<c:forEach items="${dataqus12List}" var="queans12" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans12.rscMemCode }">
													
													<c:if test="${queans12.rscQuesAns eq '1'}">
														<c:if test="${queans12.rscQuesAnsEtc1 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc1}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc1 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc1}</td>
														</c:if>
														
														<c:if test="${queans12.rscQuesAnsEtc2 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc2}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc2 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc2}</td>
														</c:if>
														
														<c:if test="${queans12.rscQuesAnsEtc3 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc3}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc3 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc3}</td>
														</c:if>
														
														<c:if test="${queans12.rscQuesAnsEtc4 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc4}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc4 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc4}</td>
														</c:if>
														
														<c:if test="${queans12.rscQuesAnsEtc5 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc5}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc5 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc5}</td>
														</c:if>
													</c:if>
													<c:if test="${queans12.rscQuesAns eq '2'}">
														<c:if test="${queans12.rscQuesAnsEtc1 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc1}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc1 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc1}</td>
														</c:if>
														
														<c:if test="${queans12.rscQuesAnsEtc2 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc2}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc2 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc2}</td>
														</c:if>
														
														<c:if test="${queans12.rscQuesAnsEtc3 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc3}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc3 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc3}</td>
														</c:if>
														
														<c:if test="${queans12.rscQuesAnsEtc4 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc4}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc4 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc4}</td>
														</c:if>
														
														<c:if test="${queans12.rscQuesAnsEtc5 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc5}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc5 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc5}</td>
														</c:if>
													</c:if>
													<c:if test="${queans12.rscQuesAns eq '3'}">
														<c:if test="${queans12.rscQuesAnsEtc1 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc1}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc1 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc1}</td>
														</c:if>
														
														<c:if test="${queans12.rscQuesAnsEtc2 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc2}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc2 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc2}</td>
														</c:if>
														
														<c:if test="${queans12.rscQuesAnsEtc3 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc3}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc3 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc3}</td>
														</c:if>
														
														<c:if test="${queans12.rscQuesAnsEtc4 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc4}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc4 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc4}</td>
														</c:if>
														
														<c:if test="${queans12.rscQuesAnsEtc5 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc5}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc5 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc5}</td>
														</c:if>
													</c:if>
													<c:if test="${queans12.rscQuesAns eq '4'}">
														<c:if test="${queans12.rscQuesAnsEtc1 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc1}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc1 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc1}</td>
														</c:if>
														
														<c:if test="${queans12.rscQuesAnsEtc2 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc2}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc2 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc2}</td>
														</c:if>
														
														<c:if test="${queans12.rscQuesAnsEtc3 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc3}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc3 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc3}</td>
														</c:if>
														
														<c:if test="${queans12.rscQuesAnsEtc4 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc4}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc4 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc4}</td>
														</c:if>
														
														<c:if test="${queans12.rscQuesAnsEtc5 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc5}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc5 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc5}</td>
														</c:if>
													</c:if>
													<c:if test="${queans12.rscQuesAns eq '5'}">
														<c:if test="${queans12.rscQuesAnsEtc1 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc1}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc1 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc1}</td>
														</c:if>
														
														<c:if test="${queans12.rscQuesAnsEtc2 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc2}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc2 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc2}</td>
														</c:if>
														
														<c:if test="${queans12.rscQuesAnsEtc3 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc3}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc3 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc3}</td>
														</c:if>
														
														<c:if test="${queans12.rscQuesAnsEtc4 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc4}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc4 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc4}</td>
														</c:if>
														
														<c:if test="${queans12.rscQuesAnsEtc5 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc5}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc5 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc5}</td>
														</c:if>
													</c:if>
													<c:if test="${queans12.rscQuesAns eq '6'}">
														<c:if test="${queans12.rscQuesAnsEtc1 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc1}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc1 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc1}</td>
														</c:if>
														
														<c:if test="${queans12.rscQuesAnsEtc2 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc2}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc2 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc2}</td>
														</c:if>
														
														<c:if test="${queans12.rscQuesAnsEtc3 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc3}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc3 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc3}</td>
														</c:if>
														
														<c:if test="${queans12.rscQuesAnsEtc4 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc4}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc4 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc4}</td>
														</c:if>
														
														<c:if test="${queans12.rscQuesAnsEtc5 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc5}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc5 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc5}</td>
														</c:if>
													</c:if>
													<c:if test="${queans12.rscQuesAns eq '7'}">
														<c:if test="${queans12.rscQuesAnsEtc1 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc1}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc1 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc1}</td>
														</c:if>
														
														<c:if test="${queans12.rscQuesAnsEtc2 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc2}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc2 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc2}</td>
														</c:if>
														
														<c:if test="${queans12.rscQuesAnsEtc3 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc3}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc3 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc3}</td>
														</c:if>
														
														<c:if test="${queans12.rscQuesAnsEtc4 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc4}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc4 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc4}</td>
														</c:if>
														
														<c:if test="${queans12.rscQuesAnsEtc5 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc5}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc5 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc5}</td>
														</c:if>
													</c:if>
													<c:if test="${queans12.rscQuesAns eq '8'}">
														<c:if test="${queans12.rscQuesAnsEtc1 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc1}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc1 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc1}</td>
														</c:if>
														
														<c:if test="${queans12.rscQuesAnsEtc2 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc2}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc2 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc2}</td>
														</c:if>
														
														<c:if test="${queans12.rscQuesAnsEtc3 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc3}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc3 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc3}</td>
														</c:if>
														
														<c:if test="${queans12.rscQuesAnsEtc4 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc4}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc4 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc4}</td>
														</c:if>
														
														<c:if test="${queans12.rscQuesAnsEtc5 eq 'Y'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc5}</td>
														</c:if>
														<c:if test="${queans12.rscQuesAnsEtc5 eq 'N'}">
															<td scope="row" class="table_left2" data-idx="${queans12.rscQuesIdx}"><%-- (${Ques10}) --%>${queans12.rscQuesAnsEtc5}</td>
														</c:if>
													</c:if>
													
												</c:if>
											</c:forEach>
											
											
											<c:forEach items="${dataqus13List}" var="queans13" varStatus="status">
												<c:if test="${queans.rscMemCode eq queans13.rscMemCode }">
													<td scope="row" class="table_left2" data-idx="${queans13.rscQuesIdx}">${queans13.rscQuesAns}<%-- (${Ques10}) --%></td>
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