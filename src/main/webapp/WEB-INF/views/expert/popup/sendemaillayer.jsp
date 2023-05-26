<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <div id="Dimmed_Layer_Warpper" class="Dimmed_Layer_Warpper">
		<div id="Layer_Content_Warpper" class="Layer_Content_Warpper Layer_Content_1001">
        	<div class="layer_popup_tit">
				<h1 class="layer_tit">이메일 발송</h1>
				<a href="javascript:void(0);" class="layer_closer"></a>
			</div>
			<div class="layer_popup_body content_01">
                	이메일 발송 레이어
                	<div>
                		<p>수신자 
	    					<input type="text" class="" name="email-receiver" value="" placeholder="수신  이메일 입력">
	    				</p>
                	</div>
                	<div>
                		<p>제목
	    					<input type="text" id="email-subject" class="" name="" value="" placeholder="메일 제목 입력">
	    				</p>
                	</div>
                	<div>
                		<p>내용</p>
	                	<textarea id="email-body" class="" name="" rows="4" placeholder="메일 내용 입력"></textarea>
                	</div>
			</div>
            <div class="layer_popup_btn">
                <a href="javascript:void(0);" class="btn btn_send_0001 send_test_email">테스트발송</a>
                <a href="javascript:void(0);" class="btn btn_next btn_close">닫기</a>
            </div>
		</div>
	</div>
