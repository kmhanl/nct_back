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
				${exInfo.committeeYear }년 ${exInfo.committeeTechNum }회차  ${exInfo.committeeTechName } 전문위원회 <%-- ${exInfo.committeeType } --%> <br>
				<span class="sub">(통합 ${exInfo.committeeYear }년 ${exInfo.committeeNum }회차 전문위원회)</span><br>
				전문위원회를 <span class="colorRed">종료</span>하시겠습니까?
			</div>
			<div class="popMessegeCopy">
				위원회 종료 후에는 구성원의 <span class="colorbold">의견작성</span>이 불가능하며,<br>
				의견 수정이 필요한경우 <span class="colorbold">종료 회수</span>를 통해서  다시 <span class="colorbold">전문위원회</span>를 진행할 수 있습니다. 
			</div>
		</div>
        <div class="layer_alert_btn">
        	<a href="javascript:void(0);" class="btn alertClose">닫기</a>
            <a href="javascript:endAlertEx('${committeeIdx}');" class="btn canEx">위원회 종료</a>
        </div>
	</div>
</div>
