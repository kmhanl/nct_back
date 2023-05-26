<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <div id="Dimmed_Layer_Warpper" class="Dimmed_Layer_Warpper">
    	<input type="hidden" id="admId" value="${ user.admId }"/>
		<div id="Layer_Content_Warpper" class="Layer_Content_Warpper Layer_rsc_1001">
        	<div class="layer_popup_tit">
				<h1 class="layer_tit">담당자 수정</h1>
				<a href="javascript:void(0);" class="layer_closer"></a>
			</div>
			<div class="layer_popup_body content_01">
				<!-- <div class="DatePickInfoTop">
					<h1 class="">2022년 8회차 <span>반도체</span> 전문위원회 </h1>
					<div class="DatePickInfo">
						<ul>
							<li>※ 사업자 등록 번호와 담당자 이메일로 인증키가 생성됩니다.</li>
						</ul>
					</div>
				</div> -->
				<div class="rscCommodibox LayerBodySection">
					<div class="SectionTitleBox">
						<h1 class="TitleBoxTit">정보 변경</h1>
						<div class="SectionBarBox"></div>
					</div>
					<div class="makeForm">
						<dl class="formlist">
							<dt>대상 기업명 : ${loadCompany.rscMemCompany}</dt>
							<dd>
								<div class="Comregbox">
									
									<input type=hidden name="rscMemCode" class="input_01" id="rscMemCode" value="${rscMemCode}">
									<input type=hidden name="rscInviKey" class="input_01" id="rscInviKey">
									<input type=hidden name="rscmackchk" class="input_01" id="rscmackchk" value="N">
									<input type=text name="comName" class="input_01" id="comName" value="${loadCompany.rscMemCompany}">
								</div>
							</dd>	
							<dt>
								사업자번호 : 
								${loadCompany.rscMemComCode}
								<c:set var = "num" value = "${loadCompany.rscMemComCode}"/>
								<c:set var = "numSubString1" value ="${fn:substring(num, 0, 3)}" />
								<c:set var = "numSubString2" value ="${fn:substring(num, 4, 6)}" />
								<c:set var = "numSubString3" value ="${fn:substring(num, 7, 12)}" />  
							</dt>
							
							<dd>
								<div class="Comregbox">
									<input type=text name="regiNum1" class="input_01 regiNum1" id="regiNum1" maxlength="3" value="${numSubString1}">
									<span class="dash">-</span>
									<input type=text name="regiNum2" class="input_01 regiNum2" id="regiNum2" maxlength="2" value="${numSubString2}">
									<span class="dash">-</span>
									<input type=text name="regiNum3" class="input_01 regiNum3" id="regiNum3" maxlength="5" value="${numSubString3}">
								</div>
							</dd>	
							<dt>담당자명 : ${loadCompany.rscMemName}</dt>
							<dd>
								<div class="Comregbox">
									<input type=text name="memName" class="input_01 memName" id="memName" value="${loadCompany.rscMemName}">
								</div>
							</dd>	
							<dt>담당자 이메일 : ${loadCompany.rscMemEmail}</dt>
							<dd>
								<div class="Comregbox">
									<input type=text name="memEmail" class="input_01 memEmail" id="memEmail" value="${loadCompany.rscMemEmail}">
									
								</div>
							</dd>
						</dl>
						<div class="conInfoBtn">
							<a href="javascript:void(0);" class="btn makeKey" style="right:130px">인증키 생성</a>
						</div>
						<div class="makeKeyBox">
							사업자등록번호와 담당자 이메일 입력후 인증키를 생성해주세요.
						</div>
					</div>
				</div>
				
			</div>
            <div class="layer_popup_btn">
                <a href="#none" class="btn btn_close">닫기</a>
                <a href="#none" class="btn Savemodimem">저장</a>
            </div>
		</div>
	</div>
