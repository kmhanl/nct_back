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
					<li class=""><a href="/rsc/eveDataListSec01.do" class="tap_item">실태조사1영역</a></li>
					<li class=""><a href="/rsc/eveDataListSec02.do" class="tap_item">실태조사2영역</a></li>
					<li class=""><a href="/rsc/eveDataListSec03.do" class="tap_item">실태조사3영역</a></li>
					<li class=""><a href="/rsc/eveDataListSec04.do" class="tap_item">실태조사4영역</a></li>
					<li class=""><a href="/rsc/eveDataListSec05.do" class="tap_item">실태조사5영역</a></li>
					<li class="on"><a href="/rsc/eveDataListSec06.do" class="tap_item">실태조사6영역</a></li>
					<li class=""><a href="/rsc/eveDataListSec07.do" class="tap_item">실태조사7영역</a></li>
					
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
										</tr>
									</c:forEach>
									
								</tbody>
							</table>
							
							
							
						</div>		
						
					</div>

				</div>
                
            </div>
        </div>