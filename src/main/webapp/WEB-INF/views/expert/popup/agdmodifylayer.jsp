<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <div id="Dimmed_Layer_Warpper" class="Dimmed_Layer_Warpper">
		<div id="Layer_Content_Warpper" class="Layer_Content_Warpper Layer_Content_4000 committee_setup_popup" >
        	<div class="layer_popup_tit">
				<h1 class="layer_tit">전문위원회 구성</h1>
				<a href="javascript:void(0);" class="layer_closer"></a>
			</div>
			<div class="layer_popup_body" >
				<div class="LayerBodySection" style="height:100%">
					<div class="SectionTitleBox">
						<h1 class="TitleBoxTit">안건 구성 설정</h1> 
					</div>
					<div class="SectionBarBox"></div>
					<div class="AgendaModiForm AgendaModi01">
						<div class="top_information">
	                        <ul class="top_info_list">
	                            <li>* 위원회를 구성할 안건을 선택해주세요.</li>
								<li>* 검토 준비중인 안건을 선택 하여 추가 버튼을 선택하거나 드래그하여  안건을 추가 할수 있습니다.</li>
	                        </ul>
	                    </div>
	                    <div class="WriteFormItem02">
	             			<div class="PupLeft height100">
	             				<div class="write_section02" style="height: calc(100% - 2px);">
				                	<div class="write_section_tit">
				            			<p class="section_label">검토 준비중 안건</p> 
				            			<a href="javascript:moveToAgenda();" class="agendaadd">선택 안건 추가</a>
				            		</div>
				            		<div class="AgendaListBox">
					            		<ul id="sortable1" class="agenda_list connectedSortable ui-sortable" data-list-name="results_agenda">
										<c:set var="idx" value="1"></c:set>
										<c:forEach items="${agendaList}"
											var="agd"
											begin="${paging.startNo }"
											end="${paging.totalRows }"
											varStatus="status">
											<c:if test="${agd.agdStatus eq 'AS' and committeeData.committeeTechId eq agd.agdTechId}">
					            			<li class="agenda_list_item ui-sortable-handle agenda_none_ex_list" data-index="${idx }" data-agd-code="${agd.agdCode }" data-rcptseq="0">
												<div class="agenda_sub_item_01">
													<p class="agenda_no">${idx}</p>
												</div>
												<div class="agenda_sub_item_02">
													<p class="type_flag">
														${agd.rcptTypeCodeName } 
													</p>
													<span class="agenda_date">
														접수번호 : ${agd.rcptCode }
														(접수일: ${agd.agdRegDateStr })
													</span>
													<p class="agenda_tit">
														${agd.techItemName }
													</p>
													<p class="agenda_company">
														신청기관 : ${agd.cpnNm }
													</p>
												</div>
											</li>
											<c:set var="idx" value="${idx + 1 }"></c:set>
											</c:if>
										</c:forEach>
										</ul>
					            	</div>
				            	</div>
	             			</div>
	             			<div class="PupRight height100">
	             				<div class="write_section02" style="height: calc(100% - 2px);">
				                	<div class="write_section_tit">
				            			<p class="section_label">위원회 구성 안건</p> 
				            			<a href="javascript:backToAgenda();" class="agendadel">선택 안건 삭제</a>
				            		</div>
				            		<div class="AgendaListBox">
				            			<input type="hidden" name="send_agenda_count" class="send_agenda_count" id="send_agenda_count" value="0"> 
				            		 	<ul id="sortable2" class="agenda_list connectedSortable ui-sortable" data-list-name="send_agenda">
										<c:set var="idx" value="1"></c:set>
										<c:forEach items="${agendaList}"
											var="agd"
											begin="${paging.startNo }"
											end="${paging.totalRows }"
											varStatus="status">
											<c:if test="${agdExIdx eq agd.agdExIdx }">
					            			<li class="agenda_list_item ui-sortable-handle agenda_ex_list" data-index="0" data-agd-code="${agd.agdCode }" data-rcptseq="0">
												<div class="agenda_sub_item_01">
													<p class="agenda_no">${idx}</p>
												</div>
												<div class="agenda_sub_item_02">
													<p class="type_flag">
														${agd.rcptTypeCodeName } 
													</p>
													<span class="agenda_date">
														접수번호 : ${agd.rcptCode }
														(접수일: ${agd.agdRegDateStr })
													</span>
													<p class="agenda_tit">
														${agd.techItemName }
													</p>
													<p class="agenda_company">
														신청기관 : ${agd.cpnNm }
													</p>
												</div>
											</li>
											<c:set var="idx" value="${idx + 1 }"></c:set>
											</c:if>
										</c:forEach>
										</ul>
					            	</div>
				            	</div>
	             			</div>
			            </div>
					</div>
				</div>
			</div>
            <div class="layer_popup_btn">
            	<a href="#none" class="btn btn_clase_4001 btn_close">닫기</a>
                <a href="#none" class="btn btn_save_4001">저장</a>
            </div>
		</div>
	</div>
