<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="Dimmed_Layer_Warpper" class="Dimmed_Layer_Warpper">
<script type="text/javascript" src="/resources/js/uploadForm.js"></script>
<div id="Layer_Content_Warpper" class="Layer_Content_Warpper Layer_Agd01">
	<div class="layer_popup_tit">
		<h1 class="layer_tit">수출 대상국 등록</h1>
		<a href="javascript:void(0);" class="layer_closer"></a>
	</div>
	<div class="layer_popup_body rec_tech_add_popup">
		<div class="top_information">
           	<ul class="top_info_list">
				<li>* 대상국을 검색하여 선택 후 매입자를 입력해주세요.</li>
			</ul>
		</div>
		<div class="nct_bro_item type_05">
			<div class="item_label">
				<p>기술 분야</p>
			</div>
			
			
			<div class="item_label">
				<p>기술 범위</p>
			</div>
			<div class="item_tap type01"></div>
			<div class="item_label">
				<p>매입자</p>
			</div>
			<div class="item_box">
				<input type="text" id="schCompay" class="company_search_input" value="" placeholder="매입자를 입력하세요." autocomplete="off">
			</div>
		</div>
			
	</div>
	<div class="layer_popup_btn">
	    <a href="javascript:void(0)" class="btn btn_next">닫기</a>
	    <a href="javascript:void(0);" class="btn btn_save">수출 대상국 등록</a>
	</div>
</div>
