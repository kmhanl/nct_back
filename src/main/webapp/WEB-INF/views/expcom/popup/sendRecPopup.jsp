<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="Dimmed_Layer_Warpper" class="Dimmed_Layer_Warpper">
<script type="text/javascript" src="/resources/js/uploadForm.js"></script>
<div id="Layer_Content_Warpper" class="Layer_Content_Warpper Layer_Agd01">
	<div class="layer_popup_tit">
		<h1 class="layer_tit">검토 요청</h1>
		<a href="javascript:void(0);" class="layer_closer"></a>
	</div>
	<div class="layer_popup_body agenda_send_popup">
		<div class="top_information">
           	<ul class="top_info_list">
				<li>* 관할 소관과를 선택 후 공문파일을 첨부해주세요.</li>
				<li>* 다수의 소관과를 선택 한 경우 해당 접수건은 각 소관과의 안건으로 등록 됩니다.</li>
			</ul>
		</div>
		<div class="nct_bro_item type_05">
			<div class="item_label">
				<p>소관과 설정</p>
			</div>
			<div class="item_box">
				<div class="nct_tech_list_box popup">
					<ul class="nct_tech_list ">
						<c:forEach items="${nctTechList}" var="tech" varStatus="status"><!-- compe_on -->
							<li class="" data-gid="${tech.techNtcGid}" data-tid="${tech.techId}">
								<a href="javascript:void(0);" class="nct_tech_item">${tech.techName}</a>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="item_tap type01"></div>
			<div class="item_label">
				<p>공문 파일 첨부</p>
			</div>
			<p style="height:140px;">공문 파일 첨부</p>
		</div>
			
	</div>
	<div class="layer_popup_btn">
	    <a href="javascript:void(0)" class="btn btn_next">닫기</a>
	    <a href="javascript:saveSendRec();" class="btn">검토요청</a>
	</div>
</div>
