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
					<li class="on"><a href="/rsc/ansDataList.do" class="tap_item">기관 기본 현황</a></li>
					<li><a href="/rsc/ansDataList01.do" class="tap_item">외국인상세</a></li>
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
                <div class="main_body" style="height:calc(100%)">
					<div class="search_wrapper">
						검색영역
					</div>
					<div class="content_wrapper" style="overflow:scroll">
						<div class="ansDataBox" style="">
							<table class="ansDataTable" style="width:5320px;" id="DownloadData">
								<colgroup>
								<col width="60px">
								<col width="240px">
								<col width="60px">
								<col width="360px">
								<col width="150px">
								<col width="300px">
								<col width="100px">
								<col width="100px">
								<col width="100px">
								<col width="100px">
								<col width="90px">
								<col width="90px">
								<col width="90px">
								<col width="90px">
								<col width="90px">
								<col width="90px">
								<col width="90px">
								<col width="90px">
								<col width="90px">
								<col width="90px">
								<col width="90px">
								<col width="90px">
								<col width="90px">
								<col width="120px">
								<col width="120px">
								<col width="120px">
								<col width="120px">
								<col width="100px">
								<col width="100px">
								<col width="100px">
								<col width="100px">
								<col width="100px">
								<col width="100px">
								<col width="100px">
								<col width="100px">
								<col width="100px">
								<col width="100px">
								<col width="100px">
								<col width="100px">
								<col width="100px">
								<col width="100px">
								<col width="100px">
								<col width="100px">
								<col width="100px">
								<col width="100px">
								<col width="100px">
								<col width="100px">
								</colgroup>
								<thead>
									<tr>
										<th rowspan="2">No.</th>
										<th rowspan="2">대상기관</th>
										<th rowspan="2">설립년도</th>
										<th rowspan="2">주소</th>
										<th rowspan="2">사업자등록번호</th>
										<th rowspan="2">업종구분</th>
										<th rowspan="2">기업규모</th>
										<th rowspan="2">매출액</th>
										<th rowspan="2">영업이익</th>
										<th rowspan="2">연구개발투자액</th>
										<th colspan="13">국가핵심기술분야·성격</th>
										<th colspan="4">국가핵심기술 성격</th>
										<th colspan="6">응답자</th>
										<th colspan="6">보안책임자답자</th>
										<th colspan="6">관리책임자</th>
										<th colspan="4">전문인력현황</th>
									</tr>
									<tr>
										<th rowspan="1">반도체</th>
										<th rowspan="1">디스플레이</th>
										<th rowspan="1">전기전자</th>
										<th rowspan="1">자동차·철도</th>
										<th rowspan="1">철강</th>
										<th rowspan="1">조선</th>
										<th rowspan="1">원자력</th>
										<th rowspan="1">정보통신</th>
										<th rowspan="1">우주</th>
										<th colspan="1">생명공학</th>
										<th colspan="1">기계</th>
										<th colspan="1">로봇</th>
										<th colspan="1">수소</th>
										<th colspan="1">개발·설계기술</th>
										<th colspan="1">생산·공정기술 </th>
										<th colspan="1">기타</th>
										<th colspan="1">기타</th>
										<th colspan="1">성명</th>
										<th colspan="1">소속부서</th>
										<th colspan="1">직위</th>
										<th colspan="1">전화번호</th>
										<th colspan="1">휴대폰번호</th>
										<th colspan="1">e-mail</th>
										<th colspan="1">성명</th>
										<th colspan="1">소속부서</th>
										<th colspan="1">직위</th>
										<th colspan="1">전화번호</th>
										<th colspan="1">휴대폰번호</th>
										<th colspan="1">e-mail</th>
										<th colspan="1">성명</th>
										<th colspan="1">소속부서</th>
										<th colspan="1">직위</th>
										<th colspan="1">전화번호</th>
										<th colspan="1">휴대폰번호</th>
										<th colspan="1">e-mail</th>
										<th colspan="1">상시재직근로자</th>
										<th colspan="1">상시외국인근로자</th>
										<th colspan="1">전문인력수</th>
										<th colspan="1">전문인력 외국인 수</th>
									</tr>	
								</thead>
								<tbody>
									<c:forEach items="${ansDataList}" var="target" varStatus="status">
										<tr>
											<th scope="row" class="table_left2">${status.count}</th>
											<th scope="row" class="tit">${target.rscTargetComName}</th>
											<th scope="row" class="table_left2">${target.rscTargetComYear}</th>
											<td scope="row" class="tit">(${target.rscTargetAddPost}) ${target.rscTargetAdd1} ${target.rscTargetAdd2}</td>
											<td scope="row" class="table_left2">${target.rscTargetRegiNum}</td>
											<td class="txt">${target.rscTargetComType}</td>
											<td>
												<c:if test="${target.rscTargetComVol eq 'C01'}">
													대기업
												</c:if>
												<c:if test="${target.rscTargetComVol eq 'C02'}">
													중견기업
												</c:if>
												<c:if test="${target.rscTargetComVol eq 'C03'}">
													중소기업
												</c:if>
												<c:if test="${target.rscTargetComVol eq 'C04'}">
													연구기관
												</c:if>
												<c:if test="${target.rscTargetComVol eq 'C05'}">
													대학
												</c:if>
											</td> 
											<td class="txt">${target.rscTargetPay1}</td>
											<td class="txt">${target.rscTargetPay2}</td>
											<td class="txt">${target.rscTargetPay3}</td>
											<td class="txt">${target.rscTargetTech1}</td>
											<td class="txt">${target.rscTargetTech2}</td>
											<td class="txt">${target.rscTargetTech3}</td>
											<td class="txt">${target.rscTargetTech4}</td>
											<td class="txt">${target.rscTargetTech5}</td>
											<td class="txt">${target.rscTargetTech6}</td>
											<td class="txt">${target.rscTargetTech7}</td>
											<td class="txt">${target.rscTargetTech8}</td>
											<td class="txt">${target.rscTargetTech9}</td>
											<td class="txt">${target.rscTargetTech10}</td>
											<td class="txt">${target.rscTargetTech11}</td>
											<td class="txt">${target.rscTargetTech12}</td>
											<td class="txt">${target.rscTargetTech13}</td>
											<td class="txt">${target.rscTargetCharacter1}</td>
											<td class="txt">${target.rscTargetCharacter2}</td>
											<td class="txt">${target.rscTargetCharacter3}</td>
											<td class="txt">${target.rscTargetCharacterEtc}</td>
											
											<td class="txt">${target.rscCrew01Name}</td>
											<td class="txt">${target.rscCrew01Depth}</td>
											<td class="txt">${target.rscCrew01Position}</td>
											<td class="txt">${target.rscCrew01Phone}</td>
											<td class="txt">${target.rscCrew01Mobile}</td>
											<td class="txt">${target.rscCrew01Email}</td>
											<td class="txt">${target.rscCrew02Name}</td>
											<td class="txt">${target.rscCrew02Depth}</td>
											<td class="txt">${target.rscCrew02Position}</td>
											<td class="txt">${target.rscCrew02Phone}</td>
											<td class="txt">${target.rscCrew02Mobile}</td>
											<td class="txt">${target.rscCrew02Email}</td>
											<td class="txt">${target.rscCrew03Name}</td>
											<td class="txt">${target.rscCrew03Depth}</td>
											<td class="txt">${target.rscCrew03Position}</td>
											<td class="txt">${target.rscCrew03Phone}</td>
											<td class="txt">${target.rscCrew03Mobile}</td>
											<td class="txt">${target.rscCrew03Email}</td>
											
											<td class="txt">${target.rscComMem1}</td>
											<td class="txt">${target.rscComMem2}</td>
											<td class="txt">${target.rscComMem3}</td>
											<td class="txt">${target.rscComMem4}</td>
											<%-- <c:forEach items="${queDataList}" var="queans" varStatus="status">
												<c:if test="${target.rscMemCode} eq ${queans.rscMemCode}">
													
												</c:if>
												<br>
											</c:forEach> --%>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							
							
							
						</div>		
						
					</div>

				</div>
                
            </div>
        </div>