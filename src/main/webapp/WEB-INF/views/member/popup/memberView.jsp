<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="tech01" value="N"></c:set>
<c:set var="tech02" value="N"></c:set>
<c:set var="tech03" value="N"></c:set>
<c:set var="tech04" value="N"></c:set>
<c:set var="tech05" value="N"></c:set>
<c:set var="tech06" value="N"></c:set>
<c:set var="tech07" value="N"></c:set>
<c:set var="tech08" value="N"></c:set>
<c:set var="tech09" value="N"></c:set>
<c:set var="tech10" value="N"></c:set>
<c:set var="tech11" value="N"></c:set>
<c:set var="tech12" value="N"></c:set>
<c:set var="tech13" value="N"></c:set>

<c:set var="AuthCnt" value="${fn:length(memberAuth)}"></c:set>
<c:forEach items="${memberAuth}" var="data" varStatus="status">
	
	<c:if test="${data.admAuthTech eq 'KTS00701'}"><c:set var="tech01" value="Y"></c:set></c:if>
	<c:if test="${data.admAuthTech eq 'KTS00702'}"><c:set var="tech02" value="Y"></c:set></c:if>
	<c:if test="${data.admAuthTech eq 'KTS00703'}"><c:set var="tech03" value="Y"></c:set></c:if>
	<c:if test="${data.admAuthTech eq 'KTS00704'}"><c:set var="tech04" value="Y"></c:set></c:if>
	<c:if test="${data.admAuthTech eq 'KTS00705'}"><c:set var="tech05" value="Y"></c:set></c:if>
	<c:if test="${data.admAuthTech eq 'KTS00706'}"><c:set var="tech06" value="Y"></c:set></c:if>
	<c:if test="${data.admAuthTech eq 'KTS00707'}"><c:set var="tech07" value="Y"></c:set></c:if>
	<c:if test="${data.admAuthTech eq 'KTS00708'}"><c:set var="tech08" value="Y"></c:set></c:if>
	<c:if test="${data.admAuthTech eq 'KTS00709'}"><c:set var="tech09" value="Y"></c:set></c:if>
	<c:if test="${data.admAuthTech eq 'KTS00710'}"><c:set var="tech10" value="Y"></c:set></c:if>
	<c:if test="${data.admAuthTech eq 'KTS00711'}"><c:set var="tech11" value="Y"></c:set></c:if>
	<c:if test="${data.admAuthTech eq 'KTS00712'}"><c:set var="tech12" value="Y"></c:set></c:if>
	<c:if test="${data.admAuthTech eq 'KTS00713'}"><c:set var="tech13" value="Y"></c:set></c:if>	
</c:forEach>
   <div id="Dimmed_Layer_Warpper" class="Dimmed_Layer_Warpper">
		<div id="Layer_Content_Warpper" class="Layer_Content_Warpper Layer_member_1001">
        	<div class="layer_popup_tit">
				<h1 class="layer_tit">업무 포털 회원 관리</h1>
				<a href="javascript:void(0);" class="layer_closer"></a>
			</div>
			<div class="layer_popup_body content_01">
				<div class="memverViewer">
					<div class="memberInfomation">
						<h1 class="info_title">회원 정보</h1>
						<div class="adminMemTopInfo">
							<c:if test="${member.admGroup eq null}">
								소속에 대한 권한이 설정되지 않았습니다.	
							</c:if>
							<c:if test="${member.admGroup eq 'AMG01'}">
								<span>기술안보과</span>권한의 회원입니다.
							</c:if>
							<c:if test="${member.admGroup eq 'AMG02'}">
								<span>보호협회</span>권한의 회원입니다.
							</c:if>
							<c:if test="${member.admGroup eq 'AMG03'}">
								<span>기밀센터</span>권한의 회원입니다.
							</c:if>
							<c:if test="${member.admGroup eq 'AMG04'}">
								<span>소관과</span>권한의 회원입니다.
							</c:if>
							<c:if test="${member.admGroup eq 'AMG05'}">
								<span>전문위원</span>권한의 회원입니다.
							</c:if>
							<c:if test="${member.admGroup eq 'AMG06'}">
								<span>기술간사</span>권한의 회원입니다.
							</c:if>
						</div>
						<div class="flexbox">
							<div class="infoBox flexitem flexitemL">
								<div class="infoLabel">아이디</div>
								<div class="infoData">${member.admId}</div>
							</div>
							<div class="infoBox flexitem flexitemR">
								<div class="infoLabel">이름</div>
								<div class="infoData">${member.admName}</div>
							</div>
						</div>
						<div class="flexbox">
							<div class="infoBox flexitem flexitemL">
								<div class="infoLabel">휴대폰 번호</div>
								<div class="infoData">${member.admMobile1}-${member.admMobile2}-${member.admMobile3}</div>
							</div>
							<div class="infoBox flexitem flexitemR">
								<div class="infoLabel">이메일</div>
								<div class="infoData">${member.admEmail}</div>
							</div>
						</div>
						<div class="flexbox">
							<div class="infoBox flexitem flexitemL">
								<div class="infoLabel">소속 기관</div>
								<div class="infoData">${member.admCom}</div>
							</div>
							
						</div>
						<div class="flexbox">
							<div class="infoBox flexitem flexitemL">
								<div class="infoLabel">부서</div>
								<div class="infoData">${member.admDept}</div>
							</div>
							<div class="infoBox flexitem flexitemR">
								<div class="infoLabel">직책</div>
								<div class="infoData">${member.admPositon}</div>
							</div>
						</div>
					</div>
		           	<div class="InvitionWrap">
		           		<input type="hidden" name="admId" id="admId" value="${member.admId}">
		           		<input type="hidden" name="admCom" id="admCom" value="${member.admCom}">
		           		<input type="hidden" name="admDept" id="admDept" value="${member.admDept}">
		           		<input type="hidden" name="admPositon" id="admPositon" value="${member.admPositon}">
		           		<input type="hidden" name="inviName" id="inviName" value="${member.admName}">
		           		<input type="hidden" name="inviEmail" id="inviEmail" value="${member.admEmail}">
		           		<input type="hidden" name="admStat" id="admStat" value="${member.admStat}">
		           		
	           			<c:if test="${member.admStat eq '400' }">
							<c:if test="${AuthCnt == 0}">
								<div class="adminMemTopInfo">
									일반 회원가입을 통해 유입된 회원입니다.<br>
									권한 설정후 승인하시면 해당 아이디가 활성화 됩니다.
									
								</div>
							</c:if>	
							<c:if test="${AuthCnt != 0}">
								<div class="adminMemTopInfo">
									초대 메일을 통해 유입된 회원입니다.<br>
									초대시 설정한 권한을 확인 후 승인하시면 해당 아이디가 활성화 됩니다.
								</div>
							</c:if>	
						</c:if>
						<p style="margin-top:10px;">소속 권한</p>
						<div class="InviConpany">
	           				<input type="hidden" name="InviCompany" id="InviCompany" value="${member.admGroup}">
							<ul class="InviCompanyList">
								<li class="${member.admGroup eq 'AMG01' ? 'ChkOn' : '' }"><a href="#none" class="InviCompanyItem" data-admgid='AMG01'>기술안보과</a></li>
								<li class="${member.admGroup eq 'AMG04' ? 'ChkOn' : '' }"><a href="#none" class="InviCompanyItem" data-admgid='AMG04'>소관과</a></li>
								<li class="${member.admGroup eq 'AMG05' ? 'ChkOn' : '' }"><a href="#none" class="InviCompanyItem"  data-admgid='AMG05'>전문위원</a></li>
							</ul>
							<ul class="InviCompanyList">
								<li class="${member.admGroup eq 'AMG06' ? 'ChkOn' : '' }"><a href="#none" class="InviCompanyItem" data-admgid='AMG06'>기술간사</a></li>
								<li class="${member.admGroup eq 'AMG03' ? 'ChkOn' : '' }"><a href="#none" class="InviCompanyItem" data-admgid='AMG03'>기밀센터</a></li>
								<li class="${member.admGroup eq 'AMG02' ? 'ChkOn' : '' }"><a href="#none" class="InviCompanyItem" data-admgid='AMG02'>보호협회</a></li>
							</ul>
						</div>
	           			<p style="margin-top:10px;">위원회 권한</p>
	           			<div class="InviCommit">
	           				<input type="hidden" name="InviCommit" id="InviCommit" value="">
							<ul class="InviCommitList">
								<li class="${member.admProYn eq 'Y' ? 'ChkOn' : '' }"><a href="#none" class="InviCommitItem" data-com-item="PRO">전문위원회</a></li>
								<li class="${member.admSaveYn eq 'Y' ? 'ChkOn' : '' }"><a href="#none" class="InviCommitItem" data-com-item="SAVE">보호위원회</a></li>
								<li class="${member.admSubYn eq 'Y' ? 'ChkOn' : '' }"><a href="#none" class="InviCommitItem" data-com-item="SUB">소위원회</a></li>
							</ul>
	           			</div>
	           			
	           			<p>기술 분야 권한 </p>
	           			<div class="InviTech">
	           				<input type="hidden" name="InviTech" id="InviTech" value="">
	           				<ul class="InviTechList">
	                       		<li class="${tech01 eq 'Y' ? 'ChkOn' : '' }"><a href="#none" data-tech-id="KTS00701" class="InviTechItem">반도체</a></li>
								<li class="${tech02 eq 'Y' ? 'ChkOn' : '' }"><a href="#none" data-tech-id="KTS00702" class="InviTechItem">디스플레이</a></li>
								<li class="${tech03 eq 'Y' ? 'ChkOn' : '' }"><a href="#none" data-tech-id="KTS00703" class="InviTechItem">전기전자</a></li>
							</ul>
							<ul class="InviTechList">
								<li class="${tech04 eq 'Y' ? 'ChkOn' : '' }"><a href="#none" data-tech-id="KTS00704" class="InviTechItem">자동차ㆍ철도</a></li>
								<li class="${tech05 eq 'Y' ? 'ChkOn' : '' }"><a href="#none" data-tech-id="KTS00705" class="InviTechItem">철강</a></li>
								<li class="${tech06 eq 'Y' ? 'ChkOn' : '' }"><a href="#none" data-tech-id="KTS00706" class="InviTechItem">조선</a></li>
							</ul>
							<ul class="InviTechList">
								<li class="${tech07 eq 'Y' ? 'ChkOn' : '' }"><a href="#none" data-tech-id="KTS00707" class="InviTechItem">원자력</a></li>
								<li class="${tech08 eq 'Y' ? 'ChkOn' : '' }"><a href="#none" data-tech-id="KTS00708" class="InviTechItem">정보통신</a></li>
								<li class="${tech09 eq 'Y' ? 'ChkOn' : '' }"><a href="#none" data-tech-id="KTS00709" class="InviTechItem">우주</a></li>
							</ul>
							<ul class="InviTechList">
								<li class="${tech10 eq 'Y' ? 'ChkOn' : '' }"><a href="#none" data-tech-id="KTS00710" class="InviTechItem">생명공학</a></li>
								<li class="${tech11 eq 'Y' ? 'ChkOn' : '' }"><a href="#none" data-tech-id="KTS00711" class="InviTechItem">기계</a></li>
								<li class="${tech12 eq 'Y' ? 'ChkOn' : '' }"><a href="#none" data-tech-id="KTS00712" class="InviTechItem">로봇</a></li>
								<li class="${tech13 eq 'Y' ? 'ChkOn' : '' }"><a href="#none" data-tech-id="KTS00712" class="InviTechItem">수소</a></li>
							</ul>
	           			</div>
	           			
	           		</div>
	           	</div>
			</div>
            <div class="layer_popup_btn">
                <a href="#none" class="btn btn_close">닫기</a>
                <c:if test="${member.admStat eq '400' }">
                	<a href="#none" class="btn btn_memsetup">권한 승인</a>
                </c:if>
                <c:if test="${member.admStat eq '300' }">
                	<a href="#none" class="btn btn_memsetup">권한 수정</a>
                </c:if>
                <c:if test="${member.admStat eq '200' }">
                	<a href="#none" class="btn btn_memsetup">권한 수정</a>
                	<a href="#none" class="btn btn_memhold">사용 정지</a>
                </c:if>
            </div>
		</div>
	</div>
