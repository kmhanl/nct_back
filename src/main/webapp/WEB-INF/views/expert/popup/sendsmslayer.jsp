<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <div id="Dimmed_Layer_Warpper" class="Dimmed_Layer_Warpper">
		<div id="Layer_Content_Warpper" class="Layer_Content_Warpper Layer_Content_0001">
        	<div class="layer_popup_tit">
				<h1 class="layer_tit">문자 발송</h1>
				<a href="javascript:void(0);" class="layer_closer"></a>
			</div>
			<div class="layer_popup_body content_01">
				
                <div class="sms_send_popup_wrap">
                	<div class="sms_preview">
                		<div class="phone_top">
                			<div class="sound"></div>
                			<div class="lens"></div>
                		</div>
                		<div class="phone_screen">
                			<div class="indicator">
	                			<p class="time">9:00</p>
	                			<div class="icon">
	                				<p class="bar bar01"></p>
	                				<p class="bar bar02"></p>
	                				<p class="bar bar03"></p>
	                				<p class="bar bar04"></p>
	                			</div>
	                		</div>
	                		<div class="send_mem_warp">
	                			<div class="send_mem_top">
		                			<a href="#none" class="clase_mem">닫기</a>
									<p class="indititle02">전문위원회 구성원</p>
									<a href="#none" class="add_mem">추가</a>
								</div>
								<div class="commit_meem_list">
									<ul class="mem_list">
									<c:if test="${fn:length(memberList) != 0 }">
									<c:forEach items="${memberList}"
										var="mem"
										varStatus="status">
										<li class="P${ mem.admMobile } chk_on" data-phone="${ mem.admMobile }">
	                						<div class="mem_box">
		                						<p class="name">${ mem.admName }</p>
		                						<p class="phone">${ mem.admMobile1 }-${ mem.admMobile2 }-${ mem.admMobile3 }</p>
		                						<p class="com">${ mem.admCom }</p>
	                						</div>
	                						<a href="javascript:void(0);" class="to_chk"></a>
	                					</li>
									</c:forEach>
									</c:if>
									</ul>
								</div>
							</div>
                			<p class="indititle">국가핵심기술 종합관리시스템 문자 발송</p>
	                		<div class="Messege_box">
	                			<input type="hidden" id="send_mode" name="send_mode " value="S">
	                			<input name="SmsTitle" class="SmsTitle" id="SmsTitle" value="" placeholder="LMS 제목을 입력해주세요." disabled>
	                			<textarea name="SmsText" id="SmsText" rows="10" class="SmsText" placeholder="메세지 내용을 입력해주세요."></textarea>
	                			<div class="messege_length_box">
	                				<span class="insert_length">0</span> / <span class="limit_length">90</span> byte
	                			</div>
	                			<div class="notice">
	                				※ SMS : 최대 90Byte까지 장성 가능 <br>
	                				※ LMS : 최대 2000Byte까지 장성 가능<br>
	                				※ LMS제목은 한글 20자 영문 40자까지 가능<br>
		                			※  야간시간대(오후 9시~오전 8시) 또는 주말, 연휴 기간에는 문자 인증이 다소 지연될 수 있습니다.
		                		</div>
	                		</div>
	                		
                		</div>
                		
                	</div>
                	<div class="sms_target">
                		<div class="to_list_wrap">
                			<p class="to_list_tit">받는 사람</p>
                			<div class="to_list_box">
                				<div class="to_item to_item_top">
                					<a href="#none" class="to_chk_all"></a>
               						<p class="name">이름</p>
               						<p class="phone">휴대폰 번호</p>
               						<p class="com">소속</p>
               					</div>
               					<div class="to_scroll">
               						<ul class="to_list">
	                					
	                				</ul>
               					</div>
                			</div>
                			<div class="to_list_wrap_info">
                				<a href="#none" class="to_del_btn">선택 삭제</a>
                				<a href="#none" class="open_mem_warp">주소록</a>
                				<p class="to_list_count">총 <span class="count">0</span>명</p> 
                			</div>
                			<div class="section_bar">
                			</div>
                			<p class="to_list_tit">받는사람 추가<span>(휴대폰 번호는 "-" 제외 하고 입력해주세요. )</span></p>
                			<div class="to_insert_box">
                				<input type="text" class="to_insert name" name="" value="" placeholder="이름(선택)">
                				<input type="text" class="to_insert phone" name="" value="" placeholder="휴대폰번호(필수)">
                				<input type="text" class="to_insert com" name="" value="" placeholder="소속(선택)"> 
                			</div>
                			<div class="to_list_wrap_btn">
                				<a href="#none" class="to_insert_btn">받는사람 추가</a>
                			</div>
                			<div class="section_bar">
                			</div>
                			<!-- <p class="to_list_tit">발송 설정</p> -->
                			<div class="send_type">
                				<input type="hidden" id="send_flag" name="send_flag " value="N">
                				<ul class="send_type_list">
                					<li class="on"><a href="#none" class="send_type_item">즉시발송</a></li>
                					<li><a href="#none" class="send_type_item">예약발송</a></li>
                				</ul>
                				<div class="send_reserve_box">
                					<div class="DateLength" style="    display: block;">
		                    			<div class="DateForm DateFormL">
		                    				<input type="text" id="DateNom01" name="nomedate01" class="DateFormI" value="" placeholder="발송일" data-language="en" autocomplete="off" style="max-width:140px;">
		                    				<a href="#none" class="DateH">08</a>
		                    				<input type="hidden" id="nome_date1H" class="DateHD" name="nomedateH01 " value="08">
		                    				<div class="HourPick AutoH01" style="display: none;">
		                    					<ul class="HourPickList">
		                    						<li><a href="#none" class="HourPickItem" data-selhour="08">08</a></li>
		                    						<li><a href="#none" class="HourPickItem" data-selhour="09">09</a></li>
		                    						<li><a href="#none" class="HourPickItem" data-selhour="10">10</a></li>
		                    						<li><a href="#none" class="HourPickItem" data-selhour="11">11</a></li>
		                    						<li><a href="#none" class="HourPickItem" data-selhour="12">12</a></li>
		                    						<li><a href="#none" class="HourPickItem" data-selhour="13">13</a></li>
		                    						<li><a href="#none" class="HourPickItem" data-selhour="14">14</a></li>
		                    						<li><a href="#none" class="HourPickItem" data-selhour="15">15</a></li>
		                    						<li><a href="#none" class="HourPickItem" data-selhour="16">16</a></li>
		                    						<li><a href="#none" class="HourPickItem" data-selhour="17">17</a></li>
		                    						<li><a href="#none" class="HourPickItem" data-selhour="18">18</a></li>
		                    					</ul>
		                    				</div>
		                    				<div class="DateD">:</div>
		                    				<a href="#none" class="DateM">00</a>
		                    				<input type="hidden" id="nome_date1M" class="DateMD" name="nomedateM01" value="00">
			                    			<div class="MinPick AutoH01" style="display: none;">
		                    					<ul class="MinPickList">
		                    						<li><a href="#none" class="MinPickItem" data-selmin="00">00</a></li>
		                    						<li><a href="#none" class="MinPickItem" data-selmin="10">10</a></li>
		                    						<li><a href="#none" class="MinPickItem" data-selmin="20">20</a></li>
		                    						<li><a href="#none" class="MinPickItem" data-selmin="30">30</a></li>
		                    						<li><a href="#none" class="MinPickItem" data-selmin="40">40</a></li>
		                    						<li><a href="#none" class="MinPickItem" data-selmin="50">50</a></li>
		                    					</ul>
		                    				</div>
		                    			</div>
		                    			<br>
		                    			
		                    		</div>
                					<!-- <p class="reserve_date">2022년 00월 00일 09:00</p>
                					<a href="#none" class="reserve_modify_btn">수정</a>-->
                				</div>
                			</div>
                		</div>
                	</div>
                </div>
			</div>
            <div class="layer_popup_btn">
                <a href="#none" class="btn btn_close">닫기</a>
                <a href="#none" class="btn btn_send_0001">발송하기</a>
            </div>
		</div>
	</div>
