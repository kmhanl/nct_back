<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="Dimmed_Layer_Warpper" class="Dimmed_Layer_Warpper">
	<div id="Layer_Content_Warpper" class="Layer_Content_Warpper Layer_Exp01">
       	<div class="layer_popup_tit">
			<h1 class="layer_tit">안건 등록</h1>
			<a href="javascript:void(0);" class="layer_closer"></a>
		</div>
		<div class="layer_popup_body popup_agd_box nct_scroll">
			<div class="top_information">
	           	<ul class="top_info_list">
					<li>* 관할 소관과를 선택 후 공문파일을 첨부해주세요.</li>
					<li>* 다수의 소관과를 선택 한 경우 해당 접수건은 각 소관과의 안건으로 등록 됩니다.</li>
				</ul>
			</div>
			<div class="nct_bro_item type_07">
				<c:if test="${fn:length(agdList) == 0 }">
					<div class="no_list">
						조회된 검색 결과가 없습니다.
					</div>
				</c:if>
				<!--검색결과가 없는 경우 : 끝-->
				<!--검색결과가 있는 경우 : 시작-->
				<c:if test="${fn:length(agdList) != 0 }">
        		<ul class="popup_agd_list">
        			<c:forEach items="${agdList}" var="expAgd"  varStatus="status">
					<li class="add_agd Agd${expAgd.nctAgdCode}" data-agd-code="${expAgd.nctAgdCode}">
						<div class="seleted_item"><p>이미 등록 된 안건 입니다.</p></div>
						<div class="agd_num">
							${status.count}
						</div>
						<div class="agd_body type01">
							<p class="agd_agd_top">
							<span class="agd_agd_type">
							<c:if test="${expAgd.nctMetaType eq 'T101'}">여부판정</c:if>
							<c:if test="${expAgd.nctMetaType eq 'T201'}">수출신고</c:if>
							<c:if test="${expAgd.nctMetaType eq 'T202'}">수출승인</c:if>
							<c:if test="${expAgd.nctMetaType eq 'T203'}">사전검토</c:if>
							<c:if test="${expAgd.nctMetaType eq 'T301'}">해외인수·합병 신고</c:if>
							<c:if test="${expAgd.nctMetaType eq 'T302'}">해외인수·합병 승인</c:if>
							<c:if test="${expAgd.nctMetaType eq 'T303'}">해외인수·합병 사전검토</c:if>
							<c:if test="${expAgd.nctMetaType eq 'T401'}">국가핵심기술 지정</c:if>
							<c:if test="${expAgd.nctMetaType eq 'T402'}">국가핵심기술 변경</c:if>
							<c:if test="${expAgd.nctMetaType eq 'T403'}">국가핵심기술 해제</c:if>
							<c:if test="${expAgd.nctMetaType eq 'T001'}">기타</c:if>
							</span>
							<span class="agd_agd_code">${expAgd.nctAgdCode}</span>
							</p>
							<p class="agd_agd_tit">${expAgd.nctMetaTechNm}</p>
							<p class="agd_agd_sub_info">
								<c:if test="${expAgd.nctMetaComType eq 'C301'}">
									대상기업없음
								</c:if>
								<c:if test="${expAgd.nctMetaComType ne 'C301'}">
									${expAgd.nctMetaComNm} | 대표명 : ${expAgd.nctMetaCeo} | 담당자 : ${expAgd.nctMetaPmNm}  
								</c:if>
								| 접수일 : ${expAgd.nctMetaRegiView} 
							</p>
						</div>
					</li>
					</c:forEach>
				</ul>
				</c:if>
        	</div>
	    </div>
        <div class="layer_popup_btn">
            <a href="#none" class="btn btn_close">닫기</a>
            <a href="javascript:addExpAgdList();" class="btn ">안건 등록</a>
        </div>
	</div>
</div>
