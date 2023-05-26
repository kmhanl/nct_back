<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="Dimmed_Layer_Warpper" class="Dimmed_Layer_Warpper">
	<div id="LayerAlertWarpper" class="LayerAlertWarpper Layer_Upload01" >
    	<div class="layer_alert_body" >
			<div class="LayerBodySec" style="height:100%">
				<div class="uploadMessegeTit">
					첨부 파일을 업로드 중입니다.<br>
					잠시만 기다려 주세요.<span class='colorR'>${fileCnt}</span>
				</div>
				<div class="upload_box_wrap">
					<div class="upload_info">
						<p>업로드 파일 : ${fileCnt}</p>
						<p>업로드 용량 : ${fileCnt}</p>
					</div>
					<div class="upload_list_box">
						<ul class="upload_list">
						</ul>
					</div>
				</div>
			</div>
		</div>
    </div>
</div>
