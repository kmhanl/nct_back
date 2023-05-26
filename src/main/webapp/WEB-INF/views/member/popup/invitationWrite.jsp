<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <div id="Dimmed_Layer_Warpper" class="Dimmed_Layer_Warpper">
		<div id="Layer_Content_Warpper" class="Layer_Content_Warpper Layer_Content_7001">
        	<div class="layer_popup_tit">
				<h1 class="layer_tit">신규 회원 초대</h1>
				<a href="javascript:void(0);" class="layer_closer"></a>
			</div>
			<div class="layer_popup_body content_01">
           		<div class="InvitionWrap">
           			<p>소속</p>
           			<div class="InviConpany">
           				<input type="hidden" name="InviCompany" id="InviCompany" value="">
						<ul class="InviCompanyList">
							<li class=""><a href="#none" class="InviCompanyItem">소관과</a></li>
							<li><a href="#none" class="InviCompanyItem">전문위원</a></li>
							<li><a href="#none" class="InviCompanyItem">기술간사</a></li>
							<li><a href="#none" class="InviCompanyItem">국정원</a></li>
							<li><a href="#none" class="InviCompanyItem">보호협회</a></li>
							<li class=""><a href="#none" class="InviCompanyItem">기술안보과</a></li>
						</ul>
						<div class="InviComDWrap" id="InviComDWrap">
							<input type="hidden" name="InviComD" id="InviComD" value="">
							<ul class="InviComDList">
								<li class=""><a href="#none" class="InviComDItem">간사</a></li>
								<li><a href="#none" class="InviComDItem">사무관</a></li>
							</ul>
						</div>
						<div class="InviComYear" id="InviComYear">
							<div class="InviComYL" style="margin-right:5px;">
								<p>위촉 연도</p>
								<input type="text" name="InviComYear" id="InviComYearDate" value="" placeholder="연도" >
							</div>
							<div class="InviComYL" style="margin-left:5px;">
								<p>위촉 기수</p>
							<input type="text" name="InviComIdx" id="InviComIdx" value="" placeholder="기수" >
							</div>
						</div>
           			</div>
           			<p style="margin-top:10px;">위원회 권한</p>
           			<div class="InviCommit">
           				<input type="hidden" name="InviCommit" id="InviCommit" value="">
						<ul class="InviCommitList">
							<li class=""><a href="#none" class="InviCommitItem" data-com-item="PRO">전문위원회</a></li>
							<li><a href="#none" class="InviCommitItem" data-com-item="SAVE">보호위원회</a></li>
							<li><a href="#none" class="InviCommitItem" data-com-item="SUB">소위원회</a></li>
						</ul>
           			</div>
           			<p>기술 분야 권한 </p>
           			<div class="InviTech">
           				<input type="hidden" name="InviTech" id="InviTech" value="">
						<ul class="InviTechList">
                       		<li><a href="#none" data-tech-id="KTS00701" class="InviTechItem">반도체</a></li>
							<li><a href="#none" data-tech-id="KTS00702" class="InviTechItem">디스플레이</a></li>
							<li><a href="#none" data-tech-id="KTS00703" class="InviTechItem">전기전자</a></li>
							<li><a href="#none" data-tech-id="KTS00704" class="InviTechItem">자동차ㆍ철도</a></li>
							<li><a href="#none" data-tech-id="KTS00705" class="InviTechItem">철강</a></li>
							<li><a href="#none" data-tech-id="KTS00706" class="InviTechItem">조선</a></li>
						</ul>
						<ul class="InviTechList">
							<li><a href="#none" data-tech-id="KTS00707" class="InviTechItem">원자력</a></li>
							<li><a href="#none" data-tech-id="KTS00708" class="InviTechItem">정보통신</a></li>
							<li><a href="#none" data-tech-id="KTS00709" class="InviTechItem">우주</a></li>
							<li><a href="#none" data-tech-id="KTS00710" class="InviTechItem">생명공학</a></li>
							<li><a href="#none" data-tech-id="KTS00711" class="InviTechItem">기계</a></li>
							<li><a href="#none" data-tech-id="KTS00712" class="InviTechItem">로봇</a></li>
							<li><a href="#none" data-tech-id="KTS00713" class="InviTechItem">수소</a></li>
						</ul>
           			</div>
           			
           			<p>이름</p>
           			<p class="InviInput Input01">
						<input type="text" id="InviName" name="InviName" placeholder="이름" autocomplete="off">
					</p>
					<p>휴대폰 번호</p>
           			<p class="InviInput Input01">
						<input type="text" id="InviPhone" name="InviPhone" placeholder="'-'을 제외한 휴대폰 번호를 입력해주세요." autocomplete="off">
					</p>
					<p>이메일</p>
           			<p class="InviInput Input01">
						<input type="text" id="InviEmail" name="InviEmail" placeholder="이메일" autocomplete="off">
					</p>
					
           		</div>
			</div>
            <div class="layer_popup_btn">
                <a href="#none" class="btn btn_close">닫기</a>
                <a href="#none" class="btn btn_invisace">저장</a>
            </div>
		</div>
	</div>
