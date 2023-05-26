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
					<li class="on"><a href="/rsc/eveDataListSec02.do" class="tap_item">실태조사2영역</a></li>
					<li class=""><a href="/rsc/eveDataListSec03.do" class="tap_item">실태조사3영역</a></li>
					<li class=""><a href="/rsc/eveDataListSec04.do" class="tap_item">실태조사4영역</a></li>
					<li class=""><a href="/rsc/eveDataListSec05.do" class="tap_item">실태조사5영역</a></li>
					<li class=""><a href="/rsc/eveDataListSec06.do" class="tap_item">실태조사6영역</a></li>
					<li class=""><a href="/rsc/eveDataListSec07.do" class="tap_item">실태조사7영역</a></li>
					
				</ul>
				<a href="javascript:void(0);" class="tap_btn excelbtn" data-efilename='DataDownload_02.xls' data-sheetname="실태조사-영역2" >엑셀 다운로드</a>
			</div>
            <div class="body_content_wrapper" style="border:1px solid #d8d8d8">
                <div class="main_body" style="height:calc(100%)">
					<div class="search_wrapper">
						검색영역
					</div>
					<div class="content_wrapper" style="overflow:scroll">
						<div class="ansDataBox" style="">
							<table class="ansDataTable" style="width:1860px;" id="DownloadData">
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
								<col width="200px">
								</colgroup>
								<thead>
									<tr>
										<th rowspan="2">No.</th>
										<th rowspan="2">대상기관</th>
										<th rowspan="2">문항 1</th>
										<th rowspan="2">문항 2</th>
										<th rowspan="2">문항 3</th>
										<th rowspan="2">문항 4</th>
										<th rowspan="2">문항 5</th>
										<th rowspan="1" colspan="5">문항 6</th>
										<th rowspan="2">문항 7</th>
										<th rowspan="2">문항 8</th>
										<th rowspan="2">문항 9</th>
										<th rowspan="2">문항 10</th>
										<th rowspan="1" colspan="4">문항 11</th>
									</tr>
									<tr>
										<th rowspan="1">6.1</th>
										<th rowspan="1">6.2</th>
										<th rowspan="1">6.3</th>
										<th rowspan="1">6.4</th>
										<th rowspan="1">6.5</th>
										<th rowspan="1">11.1</th>
										<th rowspan="1">11.2</th>
										<th rowspan="1">11.3</th>
										<th rowspan="1">11.3 기타</th>
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