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
					<li><a href="/rsc/ansDataList.do" class="tap_item">기관 기본 현황</a></li>
					<li class="on"><a href="/rsc/ansDataList01.do" class="tap_item">외국인상세</a></li>
					<li class=""><a href="/rsc/ansDataListSec01.do" class="tap_item">실태조사1영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec02.do" class="tap_item">실태조사2영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec03.do" class="tap_item">실태조사3영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec04.do" class="tap_item">실태조사4영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec05.do" class="tap_item">실태조사5영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec06.do" class="tap_item">실태조사6영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec07.do" class="tap_item">실태조사7영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec09.do" class="tap_item">기타설문조사</a></li>
				</ul>
				<a href="javascript:void(0);" class="tap_btn excelbtn" data-efilename='DataDownload_00.xls' data-sheetname="기관 기본현황" >엑셀 다운로드</a>
			</div>
            <div class="body_content_wrapper" style="border:1px solid #d8d8d8">
                <div class="main_body" style="height:calc(100%);    flex-direction: column;">
					<div class="search_wrapper">
						검색영역
					</div>
					<div class="ansDataTapBox">
						<ul class="ansDataTapList">
							<li><a href="/rsc/ansDataList01.do" class="ansDataTapItem">재직 외국인 근로자 상세 현황 </a></li>
							<li class="TapOn"><a href="/rsc/ansDataList02.do" class="ansDataTapItem">퇴직 외국인 근로자 상세 현황 </a></li>
						</ul>
					</div>
					<div class="content_wrapper" style="overflow:scroll">
						
						<div class="ansDataBox" style="">
							<table class="ansDataTable" style="width:2620px;" id="DownloadData">
								<colgroup>
								<col width="60px">
								<col width="240px">
								<col width="100px">
								<col width="360px">
								<col width="60px">
								<col width="60px">
								<col width="60px">
								<col width="60px">
								<col width="60px">
								<col width="60px">
								<col width="60px">
								<col width="60px">
								<col width="60px">
								<col width="60px">
								<col width="60px">
								<col width="60px">
								<col width="60px">
								<col width="60px">
								<col width="60px">
								<col width="60px">
								<col width="60px">
								<col width="60px">
								<col width="60px">
								<col width="60px">
								<col width="60px">
								<col width="60px">
								<col width="60px">
								<col width="60px">
								<col width="60px">
								<col width="60px">
								<col width="60px">
								<col width="60px">
								<col width="60px">
								<col width="60px">
								<col width="60px">
								</colgroup>
								<thead>
									<tr>
										<th rowspan="3">No.</th>
										<th rowspan="3">대상기관</th>
										<th rowspan="3">총 근로자 수</th>
										<th rowspan="3">국가</th>
										<th rowspan="1" colspan="21">학위(최종) / 재직기간</th>
										<th rowspan="1" colspan="3">고용형태</th>
										<th rowspan="1" colspan="6">채용기준</th>
									</tr>
									<tr>
										<th rowspan="1" colspan="5">학사</th>
										<th rowspan="1" colspan="5">석사</th>
										<th rowspan="1" colspan="5">박사</th>
										<th rowspan="1" colspan="5">기타</th>
										<th rowspan="2" colspan="1">소계</th>
										<th rowspan="2" colspan="1">정규직</th>
										<th rowspan="2" colspan="1">비정규직</th>
										<th rowspan="2" colspan="1">소계</th>
										<th rowspan="1" colspan="3">신입채용</th>
										<th rowspan="1" colspan="2">경력자채용</th>
										<th rowspan="2" colspan="1">소계</th>
									</tr>
									<tr>
										<th rowspan="1" colspan="1">1년미만</th>
										<th rowspan="1" colspan="1">1~3년</th>
										<th rowspan="1" colspan="1">3~5년</th>
										<th rowspan="1" colspan="1">5~10년</th>
										<th rowspan="1" colspan="1">10년이상</th>
										<th rowspan="1" colspan="1">1년미만</th>
										<th rowspan="1" colspan="1">1~3년</th>
										<th rowspan="1" colspan="1">3~5년</th>
										<th rowspan="1" colspan="1">5~10년</th>
										<th rowspan="1" colspan="1">10년이상</th>
										<th rowspan="1" colspan="1">1년미만</th>
										<th rowspan="1" colspan="1">1~3년</th>
										<th rowspan="1" colspan="1">3~5년</th>
										<th rowspan="1" colspan="1">5~10년</th>
										<th rowspan="1" colspan="1">10년이상</th>
										<th rowspan="1" colspan="1">1년미만</th>
										<th rowspan="1" colspan="1">1~3년</th>
										<th rowspan="1" colspan="1">3~5년</th>
										<th rowspan="1" colspan="1">5~10년</th>
										<th rowspan="1" colspan="1">10년이상</th>
										<th rowspan="1" colspan="1">경력없음</th>
										<th rowspan="1" colspan="1">국내경력</th>
										<th rowspan="1" colspan="1">해외경력</th>
										<th rowspan="1" colspan="1">국내경력</th>
										<th rowspan="1" colspan="1">해외경력</th>
									</tr>	
								</thead>
								<tbody>
									<c:set var = "rscMemCodeChk" value = ""/>
									<c:set var = "ComNo" value = "0"/>
									<c:forEach items="${ansDataForMemList}" var="formem" varStatus="status">
										
										<c:if test="${formem.rscMemCode ne rscMemCodeChk}">
											<c:set var = "ComNo" value = "${ComNo + 1}"/>	
										</c:if>
										<th scope="row" class="table_left2">${ComNo}</th>
										<th scope="row" class="tit" data-comidx="${formem.rscMemCode}">${formem.rscMemCompany}</th>		
										
										<td>${formem.rscForTotal}</td>
										<td>${formem.rscForCountry}</td>
										<td>${formem.rscForNum1}</td>
										<td>${formem.rscForNum2}</td>
										<td>${formem.rscForNum3}</td>
										<td>${formem.rscForNum4}</td>
										<td>${formem.rscForNum5}</td>
										<td>${formem.rscForNum6}</td>
										<td>${formem.rscForNum7}</td>
										<td>${formem.rscForNum8}</td>
										<td>${formem.rscForNum9}</td>
										<td>${formem.rscForNum10}</td>
										<td>${formem.rscForNum11}</td>
										<td>${formem.rscForNum12}</td>
										<td>${formem.rscForNum13}</td>
										<td>${formem.rscForNum14}</td>
										<td>${formem.rscForNum15}</td>
										<td>${formem.rscForNum16}</td>
										<td>${formem.rscForNum17}</td>
										<td>${formem.rscForNum18}</td>
										<td>${formem.rscForNum19}</td>
										<td>${formem.rscForNum20}</td>
										<td>${formem.rscForTotal}</td>
										<td>${formem.rscForNum21}</td>
										<td>${formem.rscForNum22}</td>
										<td>${formem.rscForTotal}</td>
										<td>${formem.rscForNum23}</td>
										<td>${formem.rscForNum24}</td>
										<td>${formem.rscForNum25}</td>
										<td>${formem.rscForNum26}</td>
										<td>${formem.rscForNum27}</td>
										<td>${formem.rscForTotal}</td>
										</tr>
										<c:set var = "rscMemCodeChk" value = "${formem.rscMemCode}"/>
									</c:forEach>
											
											
											
								</tbody>
							</table>
							
							
							
						</div>		
						
					</div>

				</div>
                
            </div>
        </div>