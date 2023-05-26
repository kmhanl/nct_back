<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <div id="Dimmed_Layer_Warpper" class="Dimmed_Layer_Warpper">
		<div id="LayerAlertWarpper" class="LayerAlertWarpper Layer_Ex_5001" >
        	<div class="layer_alert_tit">
				<a href="javascript:void(0);" class="layer_closer"></a>
			</div>
			<div class="layer_alert_body" >
				<div class="LayerBodySec" style="height:100%">
					<div class="popMessegeTit">
						전문위원회 개최를 <span class="colorRed">취소</span>하시겠습니까?
					</div>
					<div class="popMessegeCopy">
						개최를 취소 하시면, <span class="colorbold">개최예정</span> 이전 <span class="colorbold">[참석일선택]</span>상태로 변경됩니다.<br>
						참석일 선택 메뉴에서 <span class="colorbold">개최일을 확정</span>하시면 다시 전문위원회를 진행할 수 있습니다. 
					</div>
					<!-- <div class="popMessegebox">
						test
					</div>
					
					 -->
				</div>
			</div>
            <div class="layer_alert_btn">
            	<a href="#none" class="btn alertClose">닫기</a>
                <a href="#none" class="btn canEx">전문위원회 취소</a>
            </div>
		</div>
	</div>
