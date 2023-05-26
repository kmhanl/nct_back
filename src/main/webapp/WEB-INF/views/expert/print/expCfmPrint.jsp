<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko" >
<head>
  	<meta charset="utf-8" />
  	<!-- layout1 -->
	<title>국가핵심기술 종합관리시스템</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=1200">
	<meta name="author" content="http://www..co.kr" />
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<meta name = "format-detection" content = "telephone=no"/>
	<meta property="og:type" content="website">
	<meta property="og:url" content="">
	<meta property="og:sitename" content="">
	<meta property="og:title" content="">
	<meta property="og:image" content=""  />
	<link rel="shortcut icon" type="text/css" href="/resources/images/common/motie.ico">
	<link type="text/css" rel="stylesheet" href="/resources/css/nct_ui.css">
	<script type="text/javascript">
		function printPage(){
			var initBody;
			window.onbeforeprint = function(){
				initBody = document.body.innerHTML;
				document.body.innerHTML =  document.getElementById('prtint_wrap').outerHTML;
			};
			window.onafterprint = function(){
				document.body.innerHTML = initBody;
			};
			window.print();
			return false;
		}
	</script>
	<style>
		.signed{}
		.signed svg fill{#fff}
		.optcom{width:100%;height:400px;font-size:13px;border-top:1px solid #222;display:flex;align-items: center;justify-content: center;flex-direction: column;}
		.optcomRow{display:flex;align-items: center;justify-content: center;}
		.optlabel{width:150px;}
		.optcomdata{flex:1;border-left:1px solid #222;}
	</style>
</head>
<body>

<div class="printbtn" style="">
	${committeeIdx}[${printadmId}]
	<a href="javascript:void(0);" onclick="printPage();" class="Btn page_print">검토 결과서 인쇄aa</a>
</div>
<div style="background:#f5f6f7;padding:20px 0 80px 0;">
	<div class="" style="display:block;">
		<p>${exeInfoData.committeeYear}</p>
		<ul class="ExAgendaList">
			<c:forEach items="${agendaOpList}" var="agendarow" begin="0" end="${fn:length(agendaOpList)}" varStatus="status">
			<li>
				<div>
					<span class="ExAgendaCun">안건 ${status.count}.</span>
					<span class="ExAgendaType">
						<c:if test="${agendarow.rcptTypeCode eq '01'}">
							여부판정
						</c:if>
						<c:if test="${agendarow.rcptTypeCode eq '02'}">
							사전검토
						</c:if>
						<c:if test="${agendarow.rcptTypeCode eq '03'}">
							수출신고
						</c:if>
						<c:if test="${agendarow.rcptTypeCode eq '04'}">
							수출승인
						</c:if>
						<c:if test="${agendarow.rcptTypeCode eq '05'}">
							해외인수·합병 사전검토
						</c:if>
						<c:if test="${agendarow.rcptTypeCode eq '06'}">
							해외인수·합병 신고
						</c:if>
						<c:if test="${agendarow.rcptTypeCode eq '07'}">
							해외인수·합병 승인
						</c:if>
						<c:if test="${agendarow.rcptTypeCode eq '08'}">
							지정
						</c:if>
						<c:if test="${agendarow.rcptTypeCode eq '09'}">
							변경
						</c:if>
						<c:if test="${agendarow.rcptTypeCode eq '10'}">
							해제
						</c:if>
						<c:if test="${agendarow.rcptTypeCode eq '11'}">
							기타
						</c:if>
						<%-- ${ agendarow.agdViewCode } --%>
					</span>
				</div>
				<div class="ExAgendaLinfo">
					<span>안건번호 :${agendarow.agdCode} ${ agendarow.agdViewCode }</span>
				</div>
				<div class="ExAgendaTit"><!--  ${ row.techItemName } -->
					<c:forEach items="${agendaTitList}" var="agendaTrow" begin="0" end="${fn:length(agendaTitList)}" varStatus="status">
						<c:if test="${agendarow.rcptMetaCode eq agendaTrow.rcptMetaCode}">
							<span class="">${ agendaTrow.techRcptTechNm }<br></span>
						</c:if>
					</c:forEach>
					<span>접수번호 : ${ agendarow.rcptCode } | 대상기업 : ${ agendarow.cpnNm }</span>
				</div>
			</li>
		</c:forEach>
		</ul>
		<p>
		<c:forEach items="${memberList}" var="memrow" begin="0" end="${fn:length(memberList)}" varStatus="statusmem">
			<c:if test="${memrow.admId eq printadmId}">
				${statusmem.count}. ${memrow.admId} : ${memrow.admName} [${memrow.admGroup}]<br>
			</c:if>
		</c:forEach>
		</p>
	</div>
	<div class="hidden_print">
		<div class="prtint_wrap" id="prtint_wrap">
			
			<!--비밀유지의무 동의서-->
			<table  cellspacing="0" cellpadding="0" style="width:100%; border-collapse:collapse;page-break-after: always;">
				<colgroup>
					<col width="15%">
					<col width="13%">
					<col width="72%">
				</colgroup>
				<tbody>
					<tr>
						<td colspan="3" style="">
							<p style="display:block;padding-top:30px;font-size:26px;font-weight: bold;letter-spacing: -1px;text-align: center;padding-bottom:40px;;">비밀유지의무 동의서</p>
						</td>
					</tr>
					<tr>
						<td colspan="3" style="">
							<p style="font-size:17px;letter-spacing: -1px;margin:0;text-align: center;padding:0 25px 10px 25px;text-align:left;line-height: 30px;">
								본인은 국가핵심기술 관련 아래 안건을 검토하기 위한  ${exeInfoData.committeeTechName}분야 전문위원회 산업기술보호전문위원회 참석함에,「산업기술의 유출방지 및 보호에 관한 법률」제 34조(비밀유지의무) 1, 2 및 3호에 따라 직무상 알게 된 비밀을 누설하거나 도용하지 않을 것이며, 이를 위반하였을 시에는 모든 책임을 질 것을 서약합니다.
							</p>
						</td>
					</tr>
					<tr>
						<td colspan="3" style="">
							<p style="font-size:16px;letter-spacing: -1px;text-align:center;padding:10px;">
								-&nbsp;&nbsp;아&nbsp;&nbsp;&nbsp;&nbsp;래&nbsp;&nbsp;- 
							</p>
						</td>
		            </tr>
		            <tr>
		                <td colspan="3" style="padding:0 10px">
							<p style="font-size:16px;letter-spacing: -1px;text-align:left;padding:20px 40px;line-height:30px;margin:0;">
								회의명 : ‘${exeInfoData.committeeYear}년 제  ${exeInfoData.committeeNum}차 산업기술보호전문위원회‘(${exeInfoData.committeeTechName} 분야)<br>
								일  시 : 2023. 04. 04(화)<br>
								검토내용<br>
								<span style="padding-left:30px;display: block;">
								<c:forEach items="${agendaOpList}" var="agendarow" begin="0" end="${fn:length(agendaOpList)}" varStatus="status">
									${status.count}. 국가핵심기술
										<c:if test="${agendarow.rcptTypeCode eq '01'}">여부판정</c:if>
										<c:if test="${agendarow.rcptTypeCode eq '02'}">사전검토</c:if>
										<c:if test="${agendarow.rcptTypeCode eq '03'}">수출신고</c:if>
										<c:if test="${agendarow.rcptTypeCode eq '04'}">수출승인</c:if>
										<c:if test="${agendarow.rcptTypeCode eq '05'}">해외인수·합병 사전검토</c:if>
										<c:if test="${agendarow.rcptTypeCode eq '06'}">해외인수·합병 신고</c:if>
										<c:if test="${agendarow.rcptTypeCode eq '07'}">해외인수·합병 승인</c:if>
										<c:if test="${agendarow.rcptTypeCode eq '08'}">지정</c:if>
										<c:if test="${agendarow.rcptTypeCode eq '09'}">변경</c:if>
										<c:if test="${agendarow.rcptTypeCode eq '10'}">해제</c:if>
										<c:if test="${agendarow.rcptTypeCode eq '11'}">기타</c:if>
										검토 (${ agendarow.cpnNm})<br>
								</c:forEach>
								</span>
							</p>
						</td>
		            </tr>
		            <tr>
		                 <td colspan="3" style="position: relative;height:94px">
							
		                    <c:forEach items="${memberList}" var="memrow" begin="0" end="${fn:length(memberList)}" varStatus="statusmem">
							<div class="sigPad signed" style="position: absolute;top: 0;right:20px;">
								<c:if test="${memrow.admId eq printadmId}">
									<img src="/resources/images/test/${printadmId}.png" style="width:165px;">
								</c:if>
							</div>
							<p style="position: absolute;top: 0;font-size:13px;letter-spacing: -1px;text-align: left;padding:5px 15px;z-index:999;top:10px;right:280px;">
								검토자 : 
							</p>
							<p style="position: absolute;top: 0;font-size:15px;font-weight: bold;letter-spacing: -1px;text-align:left;top:10px;right:200px;">
								
									<c:if test="${memrow.admId eq printadmId}">
										${memrow.admName}
									</c:if>
							</p>
		                    </c:forEach>
		                </td>
					</tr>
		            <tr>
		                <td colspan="3" style="border-top:1px solid #222;padding:0 20px ">
							<p style="font-size:14px;letter-spacing: -1px;text-align:left;padding:10px 40px;line-height:24px;">
								<p style="padding:0 0 0 0px;font-weight: bold;font-size:16px">[관련근거] 산업기술의 유출방지 및 보호에 관한 법률</p>
								<p style="padding:0 0 0 20px;font-size:14px;">제34조(비밀유지의무) 다음 각 호의 어느 하나에 해당하거나 해당하였던 자는 그 직무상 알게 된 비밀을 누설하거나 도용하여서는 아니 된다. </p>
								<p style="padding:0 0 0 40px;font-size:14px;">1. 대상기관의 임·직원(교수·연구원·학생을 포함한다)</p>
								<p style="padding:0 0 0 40px;font-size:14px;">2. 제9조의 규정에 따라 국가핵심기술의 지정·변경 및 해제 업무를 수행하는 자 또는 제16조의 규정에 따라 국가핵심기술의 보호·관리 등에 관한 지원 업무를 수행하는 자</p>
								<p style="padding:0 0 0 40px;font-size:14px;">3. 제11조 및 제11조의2에 따라 국가핵심기술의 수출 및 해외인수·합병 등에 관한 사항을 검토하거나 사전검토, 조사업무를 수행하는 자 </p>
								<p style="padding:0 0 0 20px;font-size:14px;">제36조(벌칙) ⑤제34조의 규정을 위반하여 비밀을 누설하거나 도용한 자는 5년 이하의 징역이나 10년 이하의 자격정지 또는 5천만원 이하의 벌금에 처한다.</p>
							</p>
						</td>
		            </tr>
					
				</tbody>
			</table>
			
			<c:forEach items="${printdata}" var="printrow" begin="0" end="${fn:length(printdata)}" varStatus="statusa">
				<%-- <li>
					<div>
						<span class="ExAgendaCun">안건 ${status.count}.</span>
						<span class="ExAgendaType">
							<c:if test="${agendarow.rcptTypeCode eq '01'}">
								여부판정
							</c:if>
							<c:if test="${agendarow.rcptTypeCode eq '02'}">
								사전검토
							</c:if>
							<c:if test="${agendarow.rcptTypeCode eq '03'}">
								수출신고
							</c:if>
							<c:if test="${agendarow.rcptTypeCode eq '04'}">
								수출승인
							</c:if>
							<c:if test="${agendarow.rcptTypeCode eq '05'}">
								해외인수·합병 사전검토
							</c:if>
							<c:if test="${agendarow.rcptTypeCode eq '06'}">
								해외인수·합병 신고
							</c:if>
							<c:if test="${agendarow.rcptTypeCode eq '07'}">
								해외인수·합병 승인
							</c:if>
							<c:if test="${agendarow.rcptTypeCode eq '08'}">
								지정
							</c:if>
							<c:if test="${agendarow.rcptTypeCode eq '09'}">
								변경
							</c:if>
							<c:if test="${agendarow.rcptTypeCode eq '10'}">
								해제
							</c:if>
							<c:if test="${agendarow.rcptTypeCode eq '11'}">
								기타
							</c:if>
							${ agendarow.agdViewCode }
						</span>
					</div>
					<div class="ExAgendaLinfo">
						<span>안건번호 :${agendarow.agdCode} ${ agendarow.agdViewCode }</span>
					</div>
					<div class="ExAgendaTit"><!--  ${ row.techItemName } -->
						<c:forEach items="${agendaTitList}" var="agendaTrow" begin="0" end="${fn:length(agendaTitList)}" varStatus="status">
							<c:if test="${agendarow.rcptMetaCode eq agendaTrow.rcptMetaCode}">
								<span class="">${ agendaTrow.techRcptTechNm }<br></span>
							</c:if>
						</c:forEach>
						<span>접수번호 : ${ agendarow.rcptCode } | 대상기업 : ${ agendarow.cpnNm }</span>
					</div>
				</li> --%>
				<table  cellspacing="0" cellpadding="0" style="border:2px solid #222;width:100%; border-collapse:collapse;page-break-after: always;">
					<colgroup>
						<col width="15%">
						<col width="13%">
						<col width="72%">
					</colgroup>
					<tbody>
						<tr>
							<td colspan="3" style="font-size:26px;font-weight: bold;letter-spacing: -1px;text-align: center;padding-top:20px;line-height:16px;">
								산업기술보호전문위원회 검토의견서 (#${statusa.count})
								<p style="font-size:16px;font-weight: bold;letter-spacing: -1px;text-align: center;padding-bottom:15px;">
									(
									<c:if test="${printrow.rcptTypeCode eq '01'}">
										국가핵심기술의  여부판정
									</c:if>
									<c:if test="${printrow.rcptTypeCode eq '02'}">
										국가핵심기술의  사전검토
									</c:if>
									<c:if test="${printrow.rcptTypeCode eq '03'}">
										국가핵심기술의  수출신고
									</c:if>
									<c:if test="${printrow.rcptTypeCode eq '04'}">
										국가핵심기술의  수출승인
									</c:if>
									<c:if test="${printrow.rcptTypeCode eq '05'}">
										국가핵심기술의  해외인수·합병 사전검토
									</c:if>
									<c:if test="${printrow.rcptTypeCode eq '06'}">
										국가핵심기술의  해외인수·합병 신고
									</c:if>
									<c:if test="${printrow.rcptTypeCode eq '07'}">
										국가핵심기술의  해외인수·합병 승인
									</c:if>
									<c:if test="${printrow.rcptTypeCode eq '08'}">
										국가핵심기술의  지정
									</c:if>
									<c:if test="${printrow.rcptTypeCode eq '09'}">
										국가핵심기술의  변경
									</c:if>
									<c:if test="${printrow.rcptTypeCode eq '10'}">
										국가핵심기술의  해제
									</c:if>
									<c:if test="${printrow.rcptTypeCode eq '11'}">
										기타 안건
									</c:if>
									)
								</p>
							</td>
						</tr>
						<tr>
							<td colspan="1" style="border-top:1px solid #222;padding:5px 10px">
								<p style="font-size:13px;font-weight: bold;letter-spacing: -1px;text-align:left;padding-bottom:5px;margin:0;">
									1. 검토안건 : 
								</p>
							</td>
			                <td colspan="2" style="border-top:1px solid #222;padding:5px 10px 5px 0">
			                    <ul style="font-size:13px;font-weight: bold;letter-spacing: -1px;text-align:left;padding-left: 25px;margin:0;">
			                        <li style="padding-bottom:3px;">신청기업 : ${ printrow.cpnNm }</li>
			                        <li style="padding-bottom:3px;">신청기술 : 
			                        
			                        	<c:forEach items="${agendaTitList}" var="agendaTrow" begin="0" end="${fn:length(agendaTitList)}" varStatus="status">
											<c:if test="${printrow.rcptMetaCode eq agendaTrow.rcptMetaCode}">
												<span class="">${ agendaTrow.techRcptTechNm }<br></span>
											</c:if>
										</c:forEach>
									</li>
								</ul>
			                </td>
						</tr>
			            <tr>
			                <td colspan="1" style="padding:0 10px">
								<p style="font-size:13px;font-weight: bold;letter-spacing: -1px;text-align: left;padding-bottom:15px;margin:0;">
									2. 검토일자 :  
								</p>
							</td>
			                <td colspan="2" style="padding:00 10px">
			                    <p style="font-size:13px;font-weight: bold;letter-spacing: -1px;text-align:left;padding-bottom:15px;margin:0;">
									2023년 04월 04일
								</p>
			                </td>
						</tr>
			            <tr>
			                <td colspan="1" style="padding:0 10px">
								<p style="font-size:13px;font-weight: bold;letter-spacing: -1px;text-align: left;padding-bottom:15px;">
									3. 성   명 : 
								</p>
							</td>
			                <td colspan="2" style="padding:00 10px;vertical-align: middle;">
			                    <p style="float:left;font-size:13px;font-weight: bold;letter-spacing: -1px;text-align:left;">
									<!-- 문&nbsp;&nbsp;&nbsp;대&nbsp;&nbsp;&nbsp;규 -->
									<c:if test="${printrow.committeeAdmId eq printadmId}">
										${printrow.admName}
									</c:if>
			                    </p>
			                    <p style="float:left;font-size:13px;font-weight: bold;letter-spacing: -1px;text-align:left;margin:0;">
									<c:if test="${printrow.committeeAdmId eq printadmId}">
										<img src="/resources/images/test/${printadmId}.png" style="width:165px;">
									</c:if>
								</p>
			                </td>
						</tr>
						<c:if test="${printrow.rcptTypeCode eq '11'}">
						<tr>
			                <td colspan="3" style="height:33px">
			                </td>
			              </tr>
						</c:if>
						<c:if test="${printrow.rcptTypeCode ne '11'}">
			            <tr>
			                <td colspan="1" style="padding:0 10px">
								<p style="font-size:13px;font-weight: bold;letter-spacing: -1px;text-align: left;padding-bottom:15px;margin:0;">
									4. 검토 결과 :
								</p>
							</td>
			                <td colspan="2" style="padding:00 10px">
			                    <p style="font-size:13px;font-weight: bold;letter-spacing: -1px;text-align:left;padding-bottom:15px;margin:0;">
			                    	<c:if test="${printrow.committeeOptFlag eq 'F003'}">
										해당 
									</c:if>
									<c:if test="${printrow.committeeOptFlag eq 'F004'}">
										미해당 
									</c:if>
									<c:if test="${printrow.committeeOptFlag eq 'F005'}">
										수리 
									</c:if>
									<c:if test="${printrow.committeeOptFlag eq 'F007'}">
										조건부수리
									</c:if>
									<c:if test="${printrow.committeeOptFlag eq 'F008'}">
										승인
									</c:if>
									<c:if test="${printrow.committeeOptFlag eq 'F010'}">
										조건부승인
									</c:if>
									<c:if test="${printrow.committeeOptFlag eq 'F012'}">
										기타
									</c:if>
								</p>
			                </td>
						</tr>
						</c:if>
						<%-- <tr>
							<td colspan="3">
								<div class="optcom">
									<c:if test="${printrow.rcptTypeCode eq '11'}">
										<div class="optcomRow">
											<p class="optlabel">기타 검토 의견</p>
											<p class="optcomdata">${printrow.committeeOpt01}</p>
										</div>
										<div class="optcomRow">
											<p class="optlabel">기타 검토 의견</p>
											<p class="optcomdata">${printrow.committeeOpt01}</p>
										</div>
									</c:if>
								</div>
							
							</td>
						</tr> --%>
						<c:if test="${printrow.rcptTypeCode eq '11'}">
						<tr>
							<td colspan="2"  rowspan="2" style="border-top:1px solid #222;padding:7px;font-size:12px;">
								① 기타 검토 의견
							</td>
							<td style="border-top:1px solid #222;border-left:1px solid #222;padding:5px;text-align: center;font-size:13px;">
								검토의견
							</td>
						</tr>
						
						<tr>
							<td colspan="1" style="border-top:1px solid #222;padding:5px;border-left:1px solid #222;font-size:13px;height:305px;vertical-align: top;">
								${printrow.committeeOpt01}
							</td>
						</tr>
						<tr>
							<td colspan="2"  rowspan="1" style="border-top:1px solid #222;padding:7px;font-size:12px;">
								② 종합의견
							</td>
							<td colspan="1" style="border-top:1px solid #222;padding:5px;border-left:1px solid #222;font-size:12px;height:310px;vertical-align: top;">
								<p style="font-size:12px;">- 종합의견을 기술하되, 신청기술이 국가핵심기술 해당여부(해당/미해당)에 대해 명확히 기재<br>
			   					(국가핵심기술에 속한다고 판단될 경우, 고시 기준, 해당 국가핵심기술名 적시)</p>
								<p style="font-size:13px;font-weight: bold;">
									
								</p>
								${printrow.committeeOptGeneral}
							</td>
						</tr>
						<tr>
							<td colspan="3"  rowspan="1" style="border-top:1px solid #222;padding:10px;font-size:12px;height:80px">
								<p style="font-size:13px;">
									-「산업기술보호법」제2조(정의) 2. “국가핵심기술”이라 함은 <strong>국내외 시장에서 차지하는 기술적·경제적 가치가 높거나 관련 산업의 성장잠재력이 높아 해외로 유출될 경우에 국가의 안전보장 및 국민경제의 발전에 중대한 악영향을 줄 우려가 있는 기술</strong>로서 제9조의 규정에 따라 지정된 것을 말함
								</p>
							
								
							</td>
						</tr>
						</c:if>
						<c:if test="${printrow.rcptTypeCode eq '01'}">
							<tr>
								<td colspan="2"  rowspan="2" style="border-top:1px solid #222;padding:7px;font-size:12px;">
									① 신청기술의 기술적 가치<br>
				   					(신청기술의 특성·용도 및 성능 등)
								</td>
								<td style="border-top:1px solid #222;border-left:1px solid #222;padding:5px;text-align: center;font-size:13px;">
									검토의견
								</td>
							</tr>
							<tr>
								<td colspan="1" style="border-top:1px solid #222;padding:5px;border-left:1px solid #222;font-size:13px;height:180px;vertical-align: top;">
									${printrow.committeeOpt01}
								</td>
							</tr>
							<tr>
								<td colspan="2"  rowspan="2" style="border-top:1px solid #222;padding:7px;font-size:12px;">
									② 신청기술의 시장성·경쟁력 수준<br>
				   					(신청기술을 사용한 관련 제품의 시장규모와 경쟁력 수준 등)
								</td>
								<td style="border-top:1px solid #222;border-left:1px solid #222;padding:5px;text-align: center;font-size:13px;">
									검토의견
								</td>
							</tr>
							<tr>
								<td colspan="1" style="border-top:1px solid #222;padding:5px;border-left:1px solid #222;font-size:13px;height:180px;vertical-align: top;">
									${printrow.committeeOpt02}
								</td>
							</tr>
							<tr>
								<td colspan="2"  rowspan="1" style="border-top:1px solid #222;padding:7px;font-size:12px;">
									③ 종합의견
								</td>
								<td colspan="1" style="border-top:1px solid #222;padding:5px;border-left:1px solid #222;font-size:12px;height:217px;vertical-align: top;">
									<p style="font-size:12px;">- 종합의견을 기술하되, 신청기술이 국가핵심기술 해당여부(해당/미해당)에 대해 명확히 기재<br>
				   					(국가핵심기술에 속한다고 판단될 경우, 고시 기준, 해당 국가핵심기술名 적시)</p>
									<p style="font-size:13px;font-weight: bold;">
									<c:if test="${printrow.committeeOptFlag eq 'F003'}">
										해당 <br>
										[자동차ㆍ철도]자율주행자동차 핵심 부품‧시스템 설계 및 제조기술(카메라 시스템, 레이더 시스템, 라이더 시스템 및 정밀 위치탐지 시스템에 한함)<br><br>
									</c:if>
									<c:if test="${printrow.committeeOptFlag eq 'F004'}">
										미해당 
									</c:if>
									<c:if test="${printrow.committeeOptFlag eq 'F011'}">
										재검토
									</c:if>
									<c:if test="${printrow.committeeOptFlag eq 'F012'}">
										기타
									</c:if>
									
								</p>
				                    ${printrow.committeeOptGeneral}
								</td>
							</tr>
							<tr>
								<td colspan="3"  rowspan="1" style="border-top:1px solid #222;padding:10px;font-size:12px;height:80px">
									<p style="font-size:13px;">
										-「산업기술보호법」제2조(정의) 2. “국가핵심기술”이라 함은 <strong>국내외 시장에서 차지하는 기술적·경제적 가치가 높거나 관련 산업의 성장잠재력이 높아 해외로 유출될 경우에 국가의 안전보장 및 국민경제의 발전에 중대한 악영향을 줄 우려가 있는 기술</strong>로서 제9조의 규정에 따라 지정된 것을 말함
									</p>
									
								</td>
							</tr>
						</c:if>
						<c:if test="${printrow.rcptTypeCode eq '03'}">
							<tr>
								<td colspan="1"  rowspan="6" style="border-top:1px solid #222;padding:7px;font-size:12px;">
									① 국가안보 및 국민경제에 미치는 파급효과
								</td>
				                <td colspan="1" style="border-top:1px solid #222;border-left:1px solid #222;padding:7px;font-size:12px;">
									국가안보 측면
								</td>
				                <td style="border-top:1px solid #222;border-left:1px solid #222;padding:5px;text-align: center;font-size:13px;">
									검토의견
								</td>
							</tr>
							<tr>
				                <td colspan="1" style="border-top:1px solid #222;padding:5px;border-left:1px solid #222;font-size:13px;vertical-align: top;">
									국방·치안 등
								</td>
								<td colspan="1" style="border-top:1px solid #222;padding:5px;border-left:1px solid #222;font-size:13px;height:65px;vertical-align: top;">
									${printrow.committeeOpt01}
								</td>
							</tr>
				            <tr>
				                <td colspan="1" style="border-top:1px solid #222;padding:5px;border-left:1px solid #222;font-size:13px;vertical-align: top;">
									해당 기술분야
								</td>
								<td colspan="1" style="border-top:1px solid #222;padding:5px;border-left:1px solid #222;font-size:13px;height:65px;vertical-align: top;">
									${printrow.committeeOpt02}
								</td>
							</tr>
				            <tr>
				                <td colspan="1" style="border-top:1px solid #222;padding:5px;border-left:1px solid #222;font-size:13px;vertical-align: top;">
									전체 산업
								</td>
								<td colspan="1" style="border-top:1px solid #222;padding:5px;border-left:1px solid #222;font-size:13px;height:65px;vertical-align: top;">
									${printrow.committeeOpt03}
								</td>
							</tr>
							<tr>
				                <td colspan="1" style="border-top:1px solid #222;padding:5px;border-left:1px solid #222;font-size:13px;vertical-align: top;">
									국가경제 기반
								</td>
								<td colspan="1" style="border-top:1px solid #222;padding:5px;border-left:1px solid #222;font-size:13px;height:65px;vertical-align: top;">
									${printrow.committeeOpt04}
								</td>
							</tr>
				            <tr>
				                <td colspan="1" style="border-top:1px solid #222;padding:5px;border-left:1px solid #222;font-size:13px;vertical-align: top;">
									기타 중요한 사항
								</td>
								<td colspan="1" style="border-top:1px solid #222;padding:5px;border-left:1px solid #222;font-size:13px;height:65px;vertical-align: top;">
									${printrow.committeeOpt05}
								</td>
							</tr>
							
							<tr>
								<td colspan="2"  rowspan="1" style="border-top:1px solid #222;padding:7px;font-size:12px;">
									② 종합의견
								</td>
								<td colspan="1" style="border-top:1px solid #222;padding:5px;border-left:1px solid #222;font-size:12px;height:244px;vertical-align: top;">
									<p style="font-size:12px;">- 국가안보 측면의 검토에 대해 종합의견을 기술하되, 국가핵심기술 수출의 여부(가/부/보류)에 대해 명확히 기재</p>
									<p style="font-size:13px;font-weight: bold;">
									<c:if test="${printrow.committeeOptFlag eq 'F005'}">
										수리 <br>
										[자동차ㆍ철도]자율주행자동차 핵심 부품‧시스템 설계 및 제조기술(카메라 시스템, 레이더 시스템, 라이더 시스템 및 정밀 위치탐지 시스템에 한함)<br><br>
			                    	</c:if>
									<c:if test="${printrow.committeeOptFlag eq 'F006'}">
										불수리
									</c:if>
									<c:if test="${printrow.committeeOptFlag eq 'F007'}">
										조건부 수리<br>
										[자동차ㆍ철도]자율주행자동차 핵심 부품‧시스템 설계 및 제조기술(카메라 시스템, 레이더 시스템, 라이더 시스템 및 정밀 위치탐지 시스템에 한함)<br><br>
			                    	</c:if>
			                    	<c:if test="${printrow.committeeOptFlag eq 'F014'}">
										일부 수리<br>
										[자동차ㆍ철도]자율주행자동차 핵심 부품‧시스템 설계 및 제조기술(카메라 시스템, 레이더 시스템, 라이더 시스템 및 정밀 위치탐지 시스템에 한함)<br><br>
			                    	</c:if>
									<c:if test="${printrow.committeeOptFlag eq 'F011'}">
										재검토 
			                    	</c:if>
			                    	<c:if test="${printrow.committeeOptFlag eq 'F012'}">
										기타<br>
									</c:if>
									
								</p>
				                    ${printrow.committeeOptGeneral}
								</td>
							</tr>
							<tr>
								<td colspan="3"  rowspan="1" style="border-top:1px solid #222;padding:10px;font-size:12px;height:80px">
									<p style="font-size:13px;">
										-「산업기술보호법」제2조(정의) 2. “국가핵심기술”이라 함은 <strong>국내외 시장에서 차지하는 기술적·경제적 가치가 높거나 관련 산업의 성장잠재력이 높아 해외로 유출될 경우에 국가의 안전보장 및 국민경제의 발전에 중대한 악영향을 줄 우려가 있는 기술</strong>로서 제9조의 규정에 따라 지정된 것을 말함
									</p>
								</td>
							</tr>
						</c:if>
						<c:if test="${printrow.rcptTypeCode eq '04'}">
							<tr>
								<td colspan="1"  rowspan="9" style="border-top:1px solid #222;padding:7px;font-size:12px;">
									① 국가안보 및 국민경제에 미치는 파급효과
								</td>
				                <td colspan="1" style="border-top:1px solid #222;border-left:1px solid #222;padding:7px;font-size:12px;">
									국가안보 측면
								</td>
				                <td style="border-top:1px solid #222;border-left:1px solid #222;padding:5px;text-align: center;font-size:13px;">
									검토의견
								</td>
							</tr>
							<tr>
				                <td colspan="1" style="border-top:1px solid #222;padding:5px;border-left:1px solid #222;font-size:13px;vertical-align: top;">
									국방·치안 등
								</td>
								<td colspan="1" style="border-top:1px solid #222;padding:5px;border-left:1px solid #222;font-size:13px;height:65px;vertical-align: top;">
									${printrow.committeeOpt01}
								</td>
							</tr>
				            <tr>
				                <td colspan="1" style="border-top:1px solid #222;padding:5px;border-left:1px solid #222;font-size:13px;vertical-align: top;">
									해당 기술분야
								</td>
								<td colspan="1" style="border-top:1px solid #222;padding:5px;border-left:1px solid #222;font-size:13px;height:65px;vertical-align: top;">
									${printrow.committeeOpt02}
								</td>
							</tr>
				            <tr>
				                <td colspan="1" style="border-top:1px solid #222;padding:5px;border-left:1px solid #222;font-size:13px;vertical-align: top;">
									전체 산업
								</td>
								<td colspan="1" style="border-top:1px solid #222;padding:5px;border-left:1px solid #222;font-size:13px;height:65px;vertical-align: top;">
									${printrow.committeeOpt03}
								</td>
							</tr>
							<tr>
				                <td colspan="1" style="border-top:1px solid #222;padding:5px;border-left:1px solid #222;font-size:13px;vertical-align: top;">
									국가경제 기반
								</td>
								<td colspan="1" style="border-top:1px solid #222;padding:5px;border-left:1px solid #222;font-size:13px;height:65px;vertical-align: top;">
									${printrow.committeeOpt04}
								</td>
							</tr>
				            <tr>
				                <td colspan="1" style="border-top:1px solid #222;padding:5px;border-left:1px solid #222;font-size:13px;vertical-align: top;">
									기타  사항
								</td>
								<td colspan="1" style="border-top:1px solid #222;padding:5px;border-left:1px solid #222;font-size:13px;height:65px;vertical-align: top;">
									${printrow.committeeOpt05}
								</td>
							</tr>
							<tr>
								<td colspan="1" style="border-top:1px solid #222;border-left:1px solid #222;padding:7px;font-size:12px;">
									국가경제 측면
								</td>
				                <td style="border-top:1px solid #222;border-left:1px solid #222;padding:5px;text-align: center;font-size:13px;">
									검토의견
								</td>
							</tr>
							<tr>
				                <td colspan="1" style="border-top:1px solid #222;padding:5px;border-left:1px solid #222;font-size:13px;vertical-align: top;">
									국가 경제에 미치는 영향 등 
								</td>
								<td colspan="1" style="border-top:1px solid #222;padding:5px;border-left:1px solid #222;font-size:13px;height:65px;vertical-align: top;">
									${printrow.committeeOpt06}
								</td>
							</tr>
				            <tr>
				                <td colspan="1" style="border-top:1px solid #222;padding:5px;border-left:1px solid #222;font-size:13px;vertical-align: top;">
									기타  사항
								</td>
								<td colspan="1" style="border-top:1px solid #222;padding:5px;border-left:1px solid #222;font-size:13px;height:65px;vertical-align: top;">
									${printrow.committeeOpt07}
								</td>
							</tr>
							<tr>
								<td colspan="2"  rowspan="1" style="border-top:1px solid #222;padding:7px;font-size:12px;">
									② 종합의견
								</td>
								<td colspan="1" style="border-top:1px solid #222;padding:5px;border-left:1px solid #222;font-size:12px;height:244px;vertical-align: top;">
									<p style="font-size:12px;">- 국가안보 측면의 검토에 대해 종합의견을 기술하되, 국가핵심기술 수출의 여부(가/부/보류)에 대해 명확히 기재</p>
									<p style="font-size:13px;font-weight: bold;">
										<c:if test="${printrow.committeeOptFlag eq 'F008'}">
											승인<br>
											[자동차ㆍ철도]자율주행자동차 핵심 부품‧시스템 설계 및 제조기술(카메라 시스템, 레이더 시스템, 라이더 시스템 및 정밀 위치탐지 시스템에 한함)<br><br>
				                    	</c:if>
										<c:if test="${printrow.committeeOptFlag eq 'F009'}">
											불승인
										</c:if>
										<c:if test="${printrow.committeeOptFlag eq 'F010'}">
											조건부 승인<br>
											[자동차ㆍ철도]자율주행자동차 핵심 부품‧시스템 설계 및 제조기술(카메라 시스템, 레이더 시스템, 라이더 시스템 및 정밀 위치탐지 시스템에 한함)<br><br>
				                    	</c:if>
				                    	<c:if test="${printrow.committeeOptFlag eq 'F013'}">
											일부 승인<br>
											[자동차ㆍ철도]자율주행자동차 핵심 부품‧시스템 설계 및 제조기술(카메라 시스템, 레이더 시스템, 라이더 시스템 및 정밀 위치탐지 시스템에 한함)<br><br>
				                    	</c:if>
										<c:if test="${printrow.committeeOptFlag eq 'F011'}">
											재검토
				                    	</c:if>
				                    	<c:if test="${printrow.committeeOptFlag eq 'F012'}">
											기타<br>
										</c:if>
										
									</p>
				                    ${printrow.committeeOptGeneral}
								</td>
							</tr>
							<tr>
								<td colspan="3"  rowspan="1" style="border-top:1px solid #222;padding:10px;font-size:12px;height:80px">
									<p style="font-size:13px;">
										-「산업기술보호법」제2조(정의) 2. “국가핵심기술”이라 함은 <strong>국내외 시장에서 차지하는 기술적·경제적 가치가 높거나 관련 산업의 성장잠재력이 높아 해외로 유출될 경우에 국가의 안전보장 및 국민경제의 발전에 중대한 악영향을 줄 우려가 있는 기술</strong>로서 제9조의 규정에 따라 지정된 것을 말함
									</p>
								</td>
							</tr>
						</c:if>
						<!-- <tr>
							<td colspan="2"  rowspan="2" style="border-top:1px solid #222;padding:7px;font-size:12px;">
								① 신청기술의 기술적 가치<br>
			   					(신청기술의 특성·용도 및 성능 등)
							</td>
							<td style="border-top:1px solid #222;border-left:1px solid #222;padding:5px;text-align: center;font-size:13px;">
								검토의견
							</td>
						</tr>
						<tr>
							<td colspan="1" style="border-top:1px solid #222;padding:5px;border-left:1px solid #222;font-size:13px;height:220px;vertical-align: top;">
								신청기술은 TV용 OLED를 증설하기 위한 노광 장비, 식각 장비 등 프론트 플레인 장비 반입 관련 내용임
							</td>
						</tr>
						<tr>
							<td colspan="2"  rowspan="2" style="border-top:1px solid #222;padding:7px;font-size:12px;">
								② 신청기술의 시장성·경쟁력 수준<br>
			   					(신청기술을 사용한 관련 제품의 시장규모와 경쟁력 수준 등)
							</td>
							<td style="border-top:1px solid #222;border-left:1px solid #222;padding:5px;text-align: center;font-size:13px;">
								검토의견
							</td>
						</tr>
						<tr>
							<td colspan="1" style="border-top:1px solid #222;padding:5px;border-left:1px solid #222;font-size:13px;height:220px;vertical-align: top;">
								신청 기술은 TV용 관련 기술로서 시장 규모가 높고 경쟁력 수준이 높음
							</td>
						</tr> -->
						<%-- <tr>
							<td colspan="2"  rowspan="1" style="border-top:1px solid #222;padding:7px;font-size:12px;">
								③ 종합의견
							</td>
							<td colspan="1" style="border-top:1px solid #222;padding:5px;border-left:1px solid #222;font-size:12px;height:190px;vertical-align: top;">
								<p style="font-size:12px;">- 종합의견을 기술하되, 신청기술이 국가핵심기술 해당여부(해당/미해당)에 대해 명확히 기재<br>
			   					(국가핵심기술에 속한다고 판단될 경우, 고시 기준, 해당 국가핵심기술名 적시)</p>
								<p style="font-size:13px;font-weight: bold;">
									수리 
									
								</p>
								[자동차ㆍ철도]자율주행자동차 핵심 부품‧시스템 설계 및 제조기술(카메라 시스템, 레이더 시스템, 라이더 시스템 및 정밀 위치탐지 시스템에 한함)<br><br>
			                    ${printrow.committeeOptGeneral}
							</td>
						</tr>
						<tr>
							<td colspan="3"  rowspan="1" style="border-top:1px solid #222;padding:10px;font-size:12px;height:80px">
								<c:if test="${printrow.rcptTypeCode eq '11'}">
									<p style="font-size:13px;">
										-「산업기술보호법」제2조(정의) 2. “국가핵심기술”이라 함은 <strong>국내외 시장에서 차지하는 기술적·경제적 가치가 높거나 관련 산업의 성장잠재력이 높아 해외로 유출될 경우에 국가의 안전보장 및 국민경제의 발전에 중대한 악영향을 줄 우려가 있는 기술</strong>로서 제9조의 규정에 따라 지정된 것을 말함
									</p>
								</c:if>
								
							</td>
						</tr> --%>
					</tbody>
				</table>
			</c:forEach>
		</div>
	</div>
</div>
</body>
</HTML>