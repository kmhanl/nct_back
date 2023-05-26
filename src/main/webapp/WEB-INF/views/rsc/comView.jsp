<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript" src="/resources/js/research/rscDatapopup.js"></script>
<script type="text/javascript" src="/resources/js/research/rscData.js"></script>
	
		<div class="body_wrapper" style="height: 100%;background: #fbfbfb;">
			<div class="BodyTopUtile ">
				<a href="#none" class="sch_btn">
						<svg version="1.1" id="Capa_1" x="0px" y="0px" fill="#888" viewBox="0 0 124.524 124.524" xml:space="preserve">
							<path d="M51,102.05c10.5,0,20.2-3.2,28.3-8.6l29.3,29.3c2.301,2.3,6.101,2.3,8.5,0l5.7-5.7c2.3-2.3,2.3-6.1,0-8.5L93.4,79.35		c5.399-8.1,8.6-17.8,8.6-28.3c0-28.1-22.9-51-51-51c-28.1,0-51,22.9-51,51C0,79.149,22.8,102.05,51,102.05z M51,20.05
		c17.1,0,31,13.9,31,31c0,17.1-13.9,31-31,31c-17.1,0-31-13.9-31-31C20,33.95,33.9,20.05,51,20.05z"/>
						</svg>
				</a>
				<ul class="BodyTopUtilTap tap_list" style="">
					<!-- <li class="" data-status="ALL"><a href="#none" class="tap_item">전체 00</a></li>
					<li class="" data-status="ALL"><a href="#none" class="tap_item">전체 00</a></li> -->
				</ul>
				<!-- <a href="javascript:void(0);" class="top_btn SendMail" style="right:130px">초대 메일 발송</a>
				<a href="javascript:void(0);" class="top_btn savekey">저장</a> -->
				${rscMemCode}
			</div>
            <div class="body_content_wrapper" style="background: #fbfbfb;">
                <div class="rscComViewWrap">
					<div class="rscComInfo">
						<p class="infotit">대상기업 초대 정보</p>
						<input type=hidden name="rscMemCode" class="input_01" id="rscMemCode" value="${loadCompany.rscMemCode}">
						<input type=hidden name="rscInviKey" class="input_01" id="rscInviKey" value="${loadCompany.rscInviKey}">
						<input type=hidden name="rscMemCompany" class="input_01" id="rscMemCompany" value="${loadCompany.rscMemCompany}">
						<input type=hidden name="rscMemName" class="input_01" id="rscMemName" value="${loadCompany.rscMemName}">
						<input type=hidden name="rscMemEmail" class="input_01" id="rscMemEmail" value="${loadCompany.rscMemEmail}">
						<table class="detail_table_01">
							<colgroup>
								<col width="20%">
								<col width="80%">
							</colgroup>
							<tbody>
								<tr>
									<th>대상기업</th>
									<td>${loadCompany.rscMemCompany}</td>
								</tr>
								<tr>
									<th>사업자번호</th>
									<td>${loadCompany.rscMemComCode}</td>
								</tr>
								<tr>
									<th>담당자</th>
									<td>${loadCompany.rscMemName}</td>
								</tr>
								<tr>
									<th>담당자 이메일</th>
									<td>${loadCompany.rscMemEmail}</td>
								</tr>
								<tr>
									<th>인증키</th>
									<td >${loadCompany.rscInviKey}</td>
								</tr>
								<tr>
									<th>진행상태</th>
									<td>
										<ul>
											<c:if test="${loadCompany.rscStatus eq 'RD' }">
							                	<li class="stat_rd">인증전</li>
							                </c:if>
							                <c:if test="${loadCompany.rscStatus eq 'IM' }">
							                	<li class="stat_im">작성중<span>( 인증 휴대폰 : ${loadCompany.rscMemPhone} )</span></li>
							                </c:if>
							                <c:if test="${loadCompany.rscStatus eq 'CO'}">
							                	<li class="stat_co">최종제출완료<span>( 인증 휴대폰 : ${loadCompany.rscMemPhone} )</span></li>
							                </c:if>
										</ul>
									
									</td>
								</tr>
								
							</tbody>
						</table>
						<div class="conInfoBtn">
							<a href="javascript:void(0);" class="btn ModiMem" style="right:130px" data-memcode="${loadCompany.rscMemCode}">담당자변경</a>
							<a href="javascript:void(0);" class="btn SendMail" style="right:130px">메일 재발송</a>
						</div>
					</div>
					<div class="rscComData">
						<div class="todo_list_box">
							<div class="todo_list_wrap margin_r">
								<!-- <p class="icon"></p> -->
								<h2 >기관 기본현황</h2>
								<ul>
									<c:if test="${loadCompany.rscStatusCom1 eq 'RD' or loadCompany.rscStatusCom1 eq 'FI'}">
					                	<li class="stat_rd">기관 기본정보 </li>
					                </c:if>
					                <c:if test="${loadCompany.rscStatusCom1 eq 'IM'}">
					                	<li class="stat_im">기관 기본정보</li>
					                </c:if>
					                <c:if test="${loadCompany.rscStatusCom1 eq 'CO'}">
					                	<li class="stat_co">기관 기본정보</li>
					                </c:if>
					                
					                <c:if test="${loadCompany.rscStatusCom2 eq 'RD' or loadCompany.rscStatusCom2 eq 'FI'}">
					                	<li class="stat_rd">국가핵심기술 분야·성격</li>
					                </c:if>
					                <c:if test="${loadCompany.rscStatusCom2 eq 'IM'}">
					                	<li class="stat_im">국가핵심기술 분야·성격</li>
					                </c:if>
					                <c:if test="${loadCompany.rscStatusCom2 eq 'CO'}">
					                	<li class="stat_co">국가핵심기술 분야·성격</li>
					                </c:if>
					                
					                <c:if test="${loadCompany.rscStatusCom3 eq 'RD' or loadCompany.rscStatusCom3 eq 'FI'}">
					                	<li class="stat_rd">보안담당자 정보</li>
					                </c:if>
					                <c:if test="${loadCompany.rscStatusCom3 eq 'IM'}">
					                	<li class="stat_im">보안담당자 정보</li>
					                </c:if>
					                <c:if test="${loadCompany.rscStatusCom3 eq 'CO'}">
					                	<li class="stat_co">보안담당자 정보</li>
					                </c:if>
					                
					                <c:if test="${loadCompany.rscStatusCom4 eq 'RD' or loadCompany.rscStatusCom4 eq 'FI'}">
					                	<li class="stat_rd">전문인력 현황</li>
					                </c:if>
					                <c:if test="${loadCompany.rscStatusCom4 eq 'IM'}">
					                	<li class="stat_im">전문인력 현황</li>
					                </c:if>
					                <c:if test="${loadCompany.rscStatusCom4 eq 'CO'}">
					                	<li class="stat_co">전문인력 현황</li>
					                </c:if>
								</ul>
							</div>
							<div class="todo_list_wrap margin_r">
								<!-- <p class="icon"></p> -->
								<h2>보유기술 입력</h2>
								<ul>
									<c:if test="${loadCompany.rscStatusRegistration1 eq 'RD'}">
					                	<li class="stat_rd">보유사업장 현황</li>
					                </c:if>
					                <c:if test="${loadCompany.rscStatusRegistration1 eq 'IM'}">
					                	<li class="stat_im">보유사업장 현황</li>
					                </c:if>
					                <c:if test="${loadCompany.rscStatusRegistration1 eq 'CO'}">
					                	<li class="stat_co">보유사업장 현황</li>
					                </c:if>
					                <c:if test="${loadCompany.rscStatusRegistration2 eq 'RD'}">
					                	<li class="stat_rd">관련 특허 보유 현황</li>
					                </c:if>
					                <c:if test="${loadCompany.rscStatusRegistration2 eq 'IM'}">
					                	<li class="stat_im">관련 특허 보유 현황</li>
					                </c:if>
					                <c:if test="${loadCompany.rscStatusRegistration2 eq 'CO'}">
					                	<li class="stat_co">관련 특허 보유 현황</li>
					                </c:if>
					                <c:if test="${loadCompany.rscStatusRegistration3 eq 'RD'}">
					                	<li class="stat_rd">R&D 지원 현황 </li>
					                </c:if>
					                <c:if test="${loadCompany.rscStatusRegistration3 eq 'IM'}">
					                	<li class="stat_im">R&D 지원 현황</li>
					                </c:if>
					                <c:if test="${loadCompany.rscStatusRegistration3 eq 'CO'}">
					                	<li class="stat_co">R&D 지원 현황</li>
					                </c:if>
					                <c:if test="${loadCompany.rscStatusRegistration4 eq 'RD'}">
					                	<li class="stat_rd">제도 신청 현황 </li>
					                </c:if>
					                <c:if test="${loadCompany.rscStatusRegistration4 eq 'IM'}">
					                	<li class="stat_im">제도 신청 현황</li>
					                </c:if>
					                <c:if test="${loadCompany.rscStatusRegistration4 eq 'CO'}">
					                	<li class="stat_co">제도 신청 현황</li>
					                </c:if>
					            </ul>
					       </div>
							<div class="todo_list_wrap margin_r">
								<!-- <p class="icon"></p> -->
								<h2>현황 실태조사</h2>
								<ul>
									<c:if test="${loadCompany.rscStatusInvestigate1 eq 'RD'}">
					                	<li class="stat_rd">보안관리 체계(규정·조직) 현황 </li>
					                </c:if>
					                <c:if test="${loadCompany.rscStatusInvestigate1 eq 'IM'}">
					                	<li class="stat_im">보안관리 체계(규정·조직) 현황</li>
					                </c:if>
					                <c:if test="${loadCompany.rscStatusInvestigate1 eq 'CO'}">
					                	<li class="stat_co">보안관리 체계(규정·조직) 현황</li>
					                </c:if>
					                
					                <c:if test="${loadCompany.rscStatusInvestigate2 eq 'RD' }">
					                	<li class="stat_rd">보유자산의 분류 및 통제 현황</li>
					                </c:if>
					                <c:if test="${loadCompany.rscStatusInvestigate2 eq 'IM' }">
					                	<li class="stat_im">보유자산의 분류 및 통제 현황</li>
					                </c:if>
					                <c:if test="${loadCompany.rscStatusInvestigate2 eq 'CO' }">
					                	<li class="stat_co">보유자산의 분류 및 통제 현황</li>
					                </c:if>
					                
					                <c:if test="${loadCompany.rscStatusInvestigate3 eq 'RD' }">
					                	<li class="stat_rd">인력관리 현황</li>
					                </c:if>
					                <c:if test="${loadCompany.rscStatusInvestigate3 eq 'IM' }">
					                	<li class="stat_im">인력관리 현황</li>
					                </c:if>
					                <c:if test="${loadCompany.rscStatusInvestigate3 eq 'CO' }">
					                	<li class="stat_co">인력관리 현황</li>
					                </c:if>
					                
					                <c:if test="${loadCompany.rscStatusInvestigate4 eq 'RD' }">
					                	<li class="stat_rd">보호구역 관리 현황</li>
					                </c:if>
					                <c:if test="${loadCompany.rscStatusInvestigate4 eq 'IM' }">
					                	<li class="stat_im">보호구역 관리 현황</li>
					                </c:if>
					                <c:if test="${loadCompany.rscStatusInvestigate4 eq 'CO' }">
					                	<li class="stat_co">보호구역 관리 현황</li>
					                </c:if>
					                
					                <c:if test="${loadCompany.rscStatusInvestigate5 eq 'RD' }">
					                	<li class="stat_rd">정보시스템 관리 현황</li>
					                </c:if>
					                <c:if test="${loadCompany.rscStatusInvestigate5 eq 'IM' }">
					                	<li class="stat_im">정보시스템 관리 현황</li>
					                </c:if>
					                <c:if test="${loadCompany.rscStatusInvestigate5 eq 'CO' }">
					                	<li class="stat_co">정보시스템 관리 현황</li>
					                </c:if>
					                
					                <c:if test="${loadCompany.rscStatusInvestigate6 eq 'RD' }">
					                	<li class="stat_rd">유출사고 대응 및 복구 현황</li>
					                </c:if>
					                <c:if test="${loadCompany.rscStatusInvestigate6 eq 'IM' }">
					                	<li class="stat_im">유출사고 대응 및 복구 현황</li>
					                </c:if>
					                <c:if test="${loadCompany.rscStatusInvestigate6 eq 'CO' }">
					                	<li class="stat_co">유출사고 대응 및 복구 현황</li>
					                </c:if>
					                
					                <c:if test="${loadCompany.rscStatusInvestigate7 eq 'RD' }">
					                	<li class="stat_rd">산업보안 인식제고 현황</li>
					                </c:if>
					                <c:if test="${loadCompany.rscStatusInvestigate7 eq 'IM' }">
					                	<li class="stat_im">산업보안 인식제고 현황</li>
					                </c:if>
					                <c:if test="${loadCompany.rscStatusInvestigate7 eq 'CO' }">
					                	<li class="stat_co">산업보안 인식제고 현황</li>
					                </c:if>
								</ul>
							</div>
							<div class="todo_list_wrap">
								<!-- <p class="icon"></p> -->
								<h2>제도 설문조사</h2>
								<ul>
									<c:if test="${loadCompany.rscStatusSurvey eq 'RD' }">
					                	<li class="stat_rd">기타 및 건의사항</li>
					                </c:if>
					                <c:if test="${loadCompany.rscStatusSurvey eq 'IM' }">
					                	<li class="stat_im">기타 및 건의사항</li>
					                </c:if>
					                <c:if test="${loadCompany.rscStatusSurvey eq 'CO'}">
					                	<li class="stat_co">기타 및 건의사항</li>
					                </c:if>
								</ul>
							</div>
						</div>
						
						
						
					</div>

				</div>
                
            </div>
        </div>

