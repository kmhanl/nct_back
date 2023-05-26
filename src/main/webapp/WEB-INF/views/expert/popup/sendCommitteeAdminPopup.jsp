<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <div id="Dimmed_Layer_Warpper" class="Dimmed_Layer_Warpper">
    <script type="text/javascript" src="/resources/js/signature.js"></script>
		<div id="Layer_Content_Warpper" class="Layer_Content_Warpper Layer_Content_5003">
        	<div class="layer_popup_tit">
        		<c:if test="${ user.admGroup eq 'AMG00' or user.admGroup eq 'AMG02'}">
					<h1 class="layer_tit">회의록 저장</h1>
				</c:if>
				<c:if test="${user.admGroup eq 'AMG04'}">
					<h1 class="layer_tit">기술안보과 이관</h1>
				</c:if>
				<a href="javascript:void(0);" class="layer_closer"></a>
			</div>
			<div class="layer_popup_body">
				<div class="secretAgreeBody">
					<c:if test="${user.admGroup eq 'AMG04'}">
						<h1 class="agreeTit">기술안보과 이관  ${committeeIdx} </h1>
						<p class="agreelow" style="font-size:17px;text-align:center;">
	            	    	전문위원회의 최종 검토의견이 기술 안보과로 이관 됩니다. <br>공문 첨부후 기술안보과 이관을 완료 해주세요.
	                	</p>
					</c:if>
				</div>
                <%-- <div class="LayerBodySection" style="margin-top:10px;">
					<div class="SectionTitleBox">
						<c:if test="${ user.admGroup eq 'AMG00' or user.admGroup eq 'AMG02'}">
							<h1 class="TitleBoxTit">회의록 및 자료 첨부</h1>
						</c:if>
						<c:if test="${user.admGroup eq 'AMG04'}">
							<h1 class="TitleBoxTit">공문 파일 첨부</h1>
						</c:if>
						
					</div>
					<div class="SectionBarBox"></div>
				</div> --%>
                <div class="agenda_send_warp">
                    <div class="" style="border:1px solid #d8d8d8;background:#fff;padding:10px;border-radius: 4px;">
                        <div class="new_file_box">
                            <div class="new_file_box_brn_warp">
                                <a href="javascript:attachFile();" class="file_box_brn add_file">파일첨부</a>
                                <a href="javascript:deleteAllFile();" class="file_box_brn select_all">전체삭제</a>
                            </div>
                            <div class="new_file_box_list">
                                <!-- 첨부파일 선택 전 -->
                                <p class="file-list_info">
                                     파일을 첨부해주세요.
                                </p>
                                <!-- 첨부파일 선택 전 -->
                                <!-- 파일 첨부 이후  -->
                                <ul class="file_list">
<!--                                     <li> -->
<!--                                         <p style="float:left;">첨부 파일명.pdf</p> -->
<!--                                         <a href="#none" class="delete_row_file">삭제</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <p style="float:left;">첨부 파일명.pdf</p> -->
<!--                                         <a href="#none" class="delete_row_file">삭제</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <p style="float:left;">첨부 파일명.pdf</p> -->
<!--                                         <a href="#none" class="delete_row_file">삭제</a> -->
<!--                                     </li> -->
                                    
                                </ul>
                            </div>
                        </div> 
                    </div>
                    
                </div>
            </div>
			<div class="layer_popup_btn">
				<a href="javascript:void(0)" class="btn btn_next">닫기</a>
				<c:if test="${ user.admGroup eq 'AMG00' or user.admGroup eq 'AMG02'}">
					<a href="#none" class="btn btn_AgreeCommite" data-admid="${user.admId }" data-exidx="${ exData.committeeIdx}">저장</a>
				</c:if>
				<c:if test="${user.admGroup eq 'AMG04'}">
					<a href="javascript:sendProcEx('${committeeIdx}','${user.admId }');" class="btn btn_AgreeCommite">기술안보과 이관</a>
				</c:if>
                
            </div>
		</div>
	</div>
