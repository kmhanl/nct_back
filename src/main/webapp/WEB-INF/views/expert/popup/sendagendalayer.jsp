<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="Dimmed_Layer_Warpper" class="Dimmed_Layer_Warpper">
<script type="text/javascript" src="/resources/js/uploadForm.js"></script>
		<div id="Layer_Content_Warpper" class="Layer_Content_Warpper Layer_Content_2001">
        	<div class="layer_popup_tit">
				<h1 class="layer_tit">검토 요청</h1>
				<a href="javascript:void(0);" class="layer_closer"></a>
			</div>
			<div class="layer_popup_body agenda_send_popup">
				<div class="LayerBodySection">
					<div class="SectionTitleBox">
						<h1 class="TitleBoxTit">소관과 설정</h1>
					</div>
					<div class="SectionBarBox"></div>
				</div>
                <div class="agenda_send_warp">
                	<div class="top_information">
                        <ul class="top_info_list">
                            <li>* 관할 소관과를 선택 후 공문파일을 첨부해주세요.</li>
                            <li>* 다수의 소관과를 선택 한 경우 해당 접수건은 각 소관과의 안건으로 등록 됩니다.</li>
                        </ul>
                    </div>
                    <div class="depth_select_warp">
                        <ul class="dept_list_01">
	                        <c:forEach items="${techList}"
								var="tech"
								varStatus="status">
                            	<li data-tech-id="${tech.techId}">${tech.techName}</li>
                           	</c:forEach>
<!--                             <li>디스플레이</li> -->
<!--                             <li>전기전자</li> -->
<!--                             <li>자동차,철도</li> -->
<!--                             <li>철강</li> -->
<!--                             <li>조선</li> -->
<!--                             <li>원자력</li> -->
<!--                             <li class="chk">정보통신</li> -->
<!--                             <li>우주생명</li> -->
<!--                             <li>공학</li> -->
<!--                             <li>기계</li> -->
<!--                             <li>로봇</li> -->
                        </ul>
                    </div>
                </div>
                <div class="LayerBodySection" style="margin-top:10px;">
					<div class="SectionTitleBox">
						<h1 class="TitleBoxTit">공문 파일 첨부</h1>
					</div>
					<div class="SectionBarBox"></div>
				</div>
                <div class="agenda_send_warp">
                    <div class="" style="border:1px solid #d8d8d8;padding:10px;border-radius: 4px;">
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
                <a href="javascript:void(0);" class="btn btn_save">검토요청</a>
            </div>
		</div>
	</div>