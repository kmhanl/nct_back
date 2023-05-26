<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="/resources/js/expert/receiptPopup.js"></script>
<script type="text/javascript" src="/resources/js/expert/researchList"></script>

	
		<div class="body_wrapper" style="height:100%;">
			<div class="BodyTopUtile ">
				<a href="#none" class="sch_btn">
						<svg version="1.1" id="Capa_1" x="0px" y="0px" fill="#888" viewBox="0 0 124.524 124.524" xml:space="preserve">
							<path d="M51,102.05c10.5,0,20.2-3.2,28.3-8.6l29.3,29.3c2.301,2.3,6.101,2.3,8.5,0l5.7-5.7c2.3-2.3,2.3-6.1,0-8.5L93.4,79.35		c5.399-8.1,8.6-17.8,8.6-28.3c0-28.1-22.9-51-51-51c-28.1,0-51,22.9-51,51C0,79.149,22.8,102.05,51,102.05z M51,20.05
		c17.1,0,31,13.9,31,31c0,17.1-13.9,31-31,31c-17.1,0-31-13.9-31-31C20,33.95,33.9,20.05,51,20.05z"/>
						</svg>
				</a>
				<ul class="BodyTopUtilTap tap_list" style="">
					<li class="" data-status="ALL"><a href="/rsc/ansDataList.do" class="tap_item">기관 기본 현황</a></li>
					<li class="" data-status="ALL"><a href="/rsc/ansDataListSec01.do" class="tap_item">실태조사1영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec01.do" class="tap_item">실태조사1영역</a></li>
					<li class="on"><a href="/rsc/ansDataListSec02.do" class="tap_item">실태조사2영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec03.do" class="tap_item">실태조사1영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec04.do" class="tap_item">실태조사1영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec05.do" class="tap_item">실태조사1영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec06.do" class="tap_item">실태조사1영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec07.do" class="tap_item">실태조사1영역</a></li>
					<li class=""><a href="/rsc/ansDataListSec08.do" class="tap_item">기타설문조사</a></li>
				</ul>
				<!-- <a href="javascript:void(0);" class="tap_btn">엑셀 일괄 등록</a> -->
			</div>
            <div class="body_content_wrapper" style="border:1px solid #d8d8d8">
                <div class="main_body" style="height:calc(100%)">
					<div class="search_wrapper">
						검색영역
					</div>
					<div class="content_wrapper" style="overflow:scroll">
						<div class="ansDataBox" style="">
							<table class="ansDataTable" style="width:4000px;">
								<colgroup>
								<col width="60px">
								<col width="140px">
								<col width="140px">
								<col width="140px">
								<col width="140px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="80px">
								<col width="">
								<col width="">
								</colgroup>
								<thead>
									<tr>
										<th rowspan="2">No.</th>
										<th rowspan="2">대상기관</th>
										<th rowspan="2">대상기관</th>
										<th rowspan="2">섹션</th>
										<th rowspan="2">문항 1</th>
										<th rowspan="2">문항 2</th>
										<th rowspan="2">문항 3</th>
										<th rowspan="2">문항 4</th>
										<th rowspan="2">문항 5</th>
										<th rowspan="2">문항 6</th>
										<th rowspan="1" colspan="5">문항 7</th>
										<th rowspan="2">문항 8</th>
										<th rowspan="1" colspan="8">문항 9</th>
										<th rowspan="2">문항 10</th>
										<th rowspan="2">문항 11</th>
										<th rowspan="1" colspan="8">문항 12</th>
									</tr>
									<tr>
										<th rowspan="1">7-1</th>
										<th rowspan="1">7-2</th>
										<th rowspan="1">7-3</th>
										<th rowspan="1">7-4</th>
										<th rowspan="1">7-5</th>
										<th rowspan="1">9-1</th>
										<th rowspan="1">9-2</th>
										<th rowspan="1">9-3</th>
										<th rowspan="1">9-4</th>
										<th rowspan="1">9-5</th>
										<th rowspan="1">9-6</th>
										<th rowspan="1">9-7</th>
										<th rowspan="1">9-8</th>
										<th rowspan="1">12-1</th>
										<th rowspan="1">12-2</th>
										<th rowspan="1">12-3</th>
										<th rowspan="1">12-4</th>
										<th rowspan="1">12-5</th>
										<th rowspan="1">12-6</th>
										<th rowspan="1">12-7</th>
										<th rowspan="1">12-8</th>
									</tr>
								</thead>
								<tbody>
									<c:set var = "QuesIdx" value = ""/>
									<c:set var = "ComNo" value = "1"/>
									<c:forEach items="${queDataList}" var="queans" varStatus="status">
										
											<c:if test="${QuesIdx ne queans.rscMemCode}">
											<tr>
												<th scope="row" class="table_left2">${ComNo}</th>
												<th scope="row" class="tit">${queans.rscMemCode}</th>
												<th scope="row" class="table_left2">${queans.rscMemCompany}</th>
												<td scope="row" class="table_left2">${queans.rscSection}</td>	
												<c:set var = "ComNo" value = "${ComNo + 1}"/>	
												<%-- <td class="txt">${queans.rscAnsType}</td>
												<td class="txt">${queans.rscAnsSelType}</td> --%>
												<%-- <td scope="row" class="tit">${queans.rscQuesIdx}</td> --%>
												<td class="txt" data-idx="${queans.rscQuesIdx}">${queans.rscQuesAns}</td>
												
											</c:if>
											<c:if test="${QuesIdx eq queans.rscMemCode}">
												<%-- <td class="txt">${queans.rscAnsType}</td>
												<td class="txt">${queans.rscAnsSelType}</td> --%>
												<%-- <td scope="row" class="tit">${queans.rscQuesIdx}</td> --%>
												<td class="txt" data-idx="${queans.rscQuesIdx}">${queans.rscQuesAns}</td>
											</c:if>
											<%-- <th scope="row" class="table_left2">${status.count}</th>
											<th scope="row" class="tit">${queans.rscMemCode}</th>
											
											<th scope="row" class="table_left2">${queans.rscMemCompany}</th>
											<td scope="row" class="tit">${queans.rscQuesIdx}</td>
											<td scope="row" class="table_left2">${queans.rscSection}</td>
											<td class="txt">${queans.rscAnsType}</td>
											<td class="txt">${queans.rscAnsSelType}</td>
											<td class="txt">${queans.rscQuesAns}</td> --%>
											<%-- <td class="txt">${queans.rscQuesAnsEtc1}</td>
											<td class="txt">${queans.rscQuesAnsEtc2}</td>
											<td class="txt">${queans.rscQuesAnsEtc3}</td>
											<td class="txt">${queans.rscQuesAnsEtc4}</td>
											<td class="txt">${queans.rscQuesAnsEtc5}</td>
											<td class="txt">${queans.rscQuesAnsEtc6}</td>
											<td class="txt">${queans.rscQuesAnsText}</td> --%>
											<c:if test="${comIdx ne queans.rscMemCode}">
														
											</c:if>	
												
										
										<c:set var = "QuesIdx" value = "${queans.rscMemCode}"/>
									</c:forEach>
									
								</tbody>
							</table>
							
							
							
						</div>		
						
					</div>

				</div>
                
            </div>
        </div>