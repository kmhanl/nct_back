<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

	<div class="body_wrapper" style="padding:100px 50px 0 50px ">
        <div class="rsc_dash_content_wrapper">
            <div class="dash_card_wrapper">
                <div class="rsc_dash_card">
                    <h1>2022년 국가핵심기술 보유기관 대상 현황 실태조사 진행 현황 </h1>
                    <div class="statusTop">
                       	<ul class="stausList">
                            <c:forEach items="${inviStatList}" var="inviStat" varStatus="status">
								<li>
	                                <a href="javascript:void(0);" class="stausListIitem">
	                                	<p class="statusTit">인증전</p>
	                                	<p class="statusCnt Cnt01">${inviStat.rscStatusRd}</p>
	                                </a>
	                            </li>
	                            <li>
	                                <a href="javascript:void(0);" class="stausListIitem">
	                                	<p class="statusTit">인증완료</p>
	                                	<p class="statusCnt Cnt02">${inviStat.rscStatusIm}</p>
	                                </a>
	                            </li>
	                            <li>
	                                <a href="javascript:void(0);" class="stausListIitem">
	                               		<p class="statusTit">작성완료</p>
	                                	<p class="statusCnt Cnt03">${inviStat.rscStatusCo}</p>
	                                </a>
	                            </li>
							</c:forEach>
							
                            <li>
                                <a href="javascript:void(0);" class="stausListIitem">
                                	<p class="statusTit">대상기관</p>
                                	<p class="statusCnt Cnt04">199</p>
								</a>
                            </li>
                       </ul>
					</div>
					<div class="statusBottom" style="margin-top:0;">
						<div class="statusLine">
							<div class="statusBox">
								<h2>기관 기본 현황</h2>
		                        <ul class="sdash_list">
		                            <c:forEach items="${comStatList}" var="comStat" varStatus="status">
										<li>
											<c:if test="${comStat.statCode eq 'RSC_COM_CNT1'}">
							                	<p class="dash_item_tit">기관 기본정보</p>
							                </c:if>
							                <c:if test="${comStat.statCode eq 'RSC_COM_CNT2'}">
							                	<p class="dash_item_tit">국가핵심기술 분야·성격</p>
							                </c:if>
							                <c:if test="${comStat.statCode eq 'RSC_COM_CNT3'}">
							                	<p class="dash_item_tit">보안담당자 정보</p>
							                </c:if>
							                <c:if test="${comStat.statCode eq 'RSC_COM_CNT4'}">
							                	<p class="dash_item_tit">전문인력 현황</p>
							                </c:if>
							                <p class="dash_item_con Cnt03">${comStat.rscComCnt1Rd}</p>
			                                <p class="dash_item_con Cnt02">${comStat.rscComCnt1Im}</p>
			                                <p class="dash_item_con Cnt01">${comStat.rscComCnt1Co}</p>
			                                
			                            </li>
									</c:forEach>
								</ul>
							</div>
							<div class="statusBox">
								<h2>보유기술 입력</h2>
		                        <ul class="sdash_list">
		                            <c:forEach items="${haveStatList}" var="haveStat" varStatus="status">
										<li>
											<c:if test="${haveStat.statCode eq 'RSC_HAVE_CNT1'}">
							                	<p class="dash_item_tit">보유사업장 현황</p>
							                </c:if>
							                <c:if test="${haveStat.statCode eq 'RSC_HAVE_CNT2'}">
							                	<p class="dash_item_tit">관련 특허 보유 현황</p>
							                </c:if>
							                <c:if test="${haveStat.statCode eq 'RSC_HAVE_CNT3'}">
							                	<p class="dash_item_tit">R&D 지원 현황</p>
							                </c:if>
							                <c:if test="${haveStat.statCode eq 'RSC_HAVE_CNT4'}">
							                	<p class="dash_item_tit">제도 신청 현황</p>
							                </c:if>
							                <p class="dash_item_con Cnt03">${haveStat.rscHaveCnt1Rd}</p>
			                                <p class="dash_item_con Cnt02">${haveStat.rscHaveCnt1Im}</p>
			                                <p class="dash_item_con Cnt01">${haveStat.rscHaveCnt1Co}</p>
			                                
			                            </li>
									</c:forEach>
								</ul>
							</div>
							<div class="statusBox">
								<h2>현황 실태조사</h2>
		                        <ul class="sdash_list">
		                            <c:forEach items="${inqStatList}" var="inqStat" varStatus="status">
										<li>
											<c:if test="${inqStat.statCode eq 'RSC_INQ_CNT1'}">
							                	<p class="dash_item_tit">보안관리 체계(규정·조직) 현황 </p>
							                </c:if>
							                <c:if test="${inqStat.statCode eq 'RSC_INQ_CNT2'}">
							                	<p class="dash_item_tit">보유자산의 분류 및 통제 현황</p>
							                </c:if>
							                <c:if test="${inqStat.statCode eq 'RSC_INQ_CNT3'}">
							                	<p class="dash_item_tit">인력관리 현황</p>
							                </c:if>
							                <c:if test="${inqStat.statCode eq 'RSC_INQ_CNT4'}">
							                	<p class="dash_item_tit">보호구역 관리 현황</p>
							                </c:if>
							                <c:if test="${inqStat.statCode eq 'RSC_INQ_CNT5'}">
							                	<p class="dash_item_tit">정보시스템 관리 현황</p>
							                </c:if>
							                <c:if test="${inqStat.statCode eq 'RSC_INQ_CNT6'}">
							                	<p class="dash_item_tit">유출사고 대응 및 복구 현황</p>
							                </c:if>
							                <c:if test="${inqStat.statCode eq 'RSC_INQ_CNT7'}">
							                	<p class="dash_item_tit">산업보안 인식제고 현황</p>
							                </c:if>
							                <p class="dash_item_con Cnt03">${inqStat.rscInqCnt1Rd}</p>
			                                <p class="dash_item_con Cnt02">${inqStat.rscInqCnt1Im}</p>
			                                <p class="dash_item_con Cnt01">${inqStat.rscInqCnt1Co}</p>
			                                
			                            </li>
									</c:forEach>
								</ul>
							</div>
							<div class="statusBox">
								<h2>제도 설문조사</h2>
		                        <ul class="sdash_list">
		                            <c:forEach items="${surStatList}" var="surStat" varStatus="status">
										<li>
											<c:if test="${surStat.statCode eq 'RSC_INQ_CNT8'}">
							                	<p class="dash_item_tit">기타 및 건의사항</p>
							                </c:if>
							                <p class="dash_item_con Cnt03">${surStat.rscInqCnt8Rd}</p>
			                                <p class="dash_item_con Cnt02">${surStat.rscInqCnt8Im}</p>
			                                <p class="dash_item_con Cnt01">${surStat.rscInqCnt8Co}</p>
			                                
			                            </li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
                </div>
            </div>
            
            
        </div>
    </div>
