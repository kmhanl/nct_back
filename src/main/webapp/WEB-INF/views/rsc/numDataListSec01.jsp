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
					<li class="on"><a href="/rsc/eveDataListSec01.do" class="tap_item">실태조사1영역</a></li>
					<li class=""><a href="/rsc/eveDataListSec02.do" class="tap_item">설문조사2영역</a></li>
					<li class=""><a href="/rsc/eveDataListSec03.do" class="tap_item">실태조사3영역</a></li>
					<li class=""><a href="/rsc/eveDataListSec04.do" class="tap_item">실태조사4영역</a></li>
					<li class=""><a href="/rsc/eveDataListSec05.do" class="tap_item">실태조사5영역</a></li>
					<li class=""><a href="/rsc/eveDataListSec06.do" class="tap_item">실태조사6영역</a></li>
					<li class=""><a href="/rsc/eveDataListSec07.do" class="tap_item">실태조사7영역</a></li>
					
				</ul>
				<!-- <a href="javascript:void(0);" class="tap_btn excelbtn" data-efilename='DataDownload_01.xls' data-sheetname="실태조사-영역1" >엑셀 다운로드</a> -->
			</div>
            <div class="body_content_wrapper" style="border:1px solid #d8d8d8">
                <div class="main_body" style="height:calc(100%)">
					<div class="search_wrapper">
						검색영역
					</div>
					<div class="content_wrapper" style="overflow:scroll">
						<div class="ansDataBox" style="position: relative;">
							
							<table class="ansDataTable" style="width:100%" id="DownloadData">
								<colgroup>
								<col width="80px">
								<col width="80px">
								<col width="">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								
								
								</colgroup>
								<thead>
									<tr>
										<th rowspan="1">문항 번호</th>
										<th colspan="2">문항</th>
										<th rowspan="1">구분</th>
										<th rowspan="1">선택지</th>
										<th rowspan="1">점수화</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row" class="table_left2">1</th>
										<th colspan="2" scope="row" class="table_left2" style="text-align:left;">세부적인 보안관리 규정 보유 여부 </th>
										<td>S01</td>
										<td>2</td>
										<td><input type="text"></td>
									</tr>
									<tr>
										<th scope="row" class="table_left2">2</th>
										<th scope="row" class="table_left2">종속</th>
										<th colspan="1" scope="row" class="table_left2" style="text-align:left;">보안규정 내 주요 관리 항목 포함 여부 </th>
										<td>S02</td>
										<td>3</td>
										<td><input type="text"></td>
									</tr>
									<tr>
										<th scope="row" class="table_left2">3</th>
										<th scope="row" class="table_left2">종속</th>
										<th colspan="1" scope="row" class="table_left2" style="text-align:left;">보안관리 규정의 주기적 검토 여부 </th>
										<td>S02</td>
										<td>3</td>
										<td><input type="text"></td>
									</tr>
									<tr>
										<th scope="row" class="table_left2">4</th>
										<th scope="row" class="table_left2">종속</th>
										<th colspan="1" scope="row" class="table_left2" style="text-align:left;">보안관리 규정 개정 시 경영진 보고 여부 </th>
										<td>S02</td>
										<td>3</td>
										<td><input type="text"></td>
									</tr>
									<tr>
										<th scope="row" class="table_left2">5</th>
										<th scope="row" class="table_left2">종속</th>
										<th colspan="1" scope="row" class="table_left2" style="text-align:left;">보안관리 규정 개정 시 임직원 공지 여부 </th>
										<td>S02</td>
										<td>3</td>
										<td><input type="text"></td>
									</tr>
									<tr>
										<th scope="row" class="table_left2">6</th>
										<th colspan="2" scope="row" class="table_left2" style="text-align:left;">보안우수자 및 규정위반자에 대한 상벌조치 명시 여부 </th>
										<td>S02</td>
										<td>3</td>
										<td><input type="text"></td>
									</tr>
									<tr>
										<th scope="row" class="table_left2">7</th>
										<th colspan="2" scope="row" class="table_left2" style="text-align:left;">연간 보안계획 수립 시 고려사항 (체크박스) </th>
										<td>M01</td>
										<td>5</td>
										<td><input type="text"></td>
									</tr>
									<tr>
										<th scope="row" class="table_left2">8</th>
										<th colspan="2" scope="row" class="table_left2" style="text-align:left;">국가핵심기술 관리책임자 지정 여부</th>
										<td>S02</td>
										<td>3</td>
										<td><input type="text"></td>
									</tr>
									<tr>
										<th scope="row" class="table_left2">9</th>
										<th colspan="2" scope="row" class="table_left2" style="text-align:left;">국가핵심기술 관리책임자의 보안관리 업무 (체크박스)</th>
										<td>M01</td>
										<td>8</td>
										<td><input type="text"></td>
									</tr>
									<tr>
										<th scope="row" class="table_left2">10</th>
										<th colspan="2" scope="row" class="table_left2" style="text-align:left;">보안관리 전담조직 또는 전담인력 보유 여부</th>
										<td>S02</td>
										<td>3</td>
										<td><input type="text"></td>
									</tr>
									<tr>
										<th scope="row" class="table_left2">11</th>
										<th scope="row" class="table_left2">종속</th>
										<th colspan="1" scope="row" class="table_left2" style="text-align:left;">보안관리 전담조직 또는 전담인력 세부 현황 </th>
										<td>E01</td>
										<td>-</td>
										<td><input type="text"></td>
									</tr>
									<tr>
										<th scope="row" class="table_left2">12</th>
										<th scope="row" class="table_left2">종속</th>
										<th colspan="1" scope="row" class="table_left2" style="text-align:left;">보안 전담인력의 업무 (체크박스)</th>
										<td>M01</td>
										<td>8</td>
										<td><input type="text"></td>
									</tr>
									
									
								</tbody>
							</table>
							
							
							
						</div>		
						
					</div>

				</div>
                
            </div>
        </div>