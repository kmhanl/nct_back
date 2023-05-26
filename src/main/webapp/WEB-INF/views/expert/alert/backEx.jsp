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
				${exInfo.committeeYear }년 ${exInfo.committeeTechNum }회차  ${exInfo.committeeTechName } 전문위원회<%--  ${exInfo.committeeType } --%> <br>
				<span class="sub">(통합 ${exInfo.committeeYear }년 ${exInfo.committeeNum }회차 전문위원회)</span><br>
				개최를 <span class="colorRed">회수</span>하시겠습니까?
			</div>
			<div class="popMessegeCopy">
				개최를 회수 하시면, <span class="colorbold">전문위 예정</span> 상태로 변경되며,<br>
				이미 작성된 검토 의견은 삭제 됩니다.<br>
				 <span class="colorbold">전문위 개최 버튼</span>을 통해서 다시 <span class="colorbold">전문위원회</span>를 개최할 수 있습니다. 
			</div>
			<%-- <div class="popMessegebox">
				<c:if test="${exInfo.committeeDatePick eq '1'}">
					<p class="CommitIdx"><span class="ListLabel">개최일 : ${exInfo.committeeDatePick1Ko } (${ exInfo.committeeDateAdd1 })</span></p>	
				</c:if>
				<c:if test="${exInfo.committeeDatePick eq '2'}">
					<p class="CommitIdx"><span class="ListLabel">개최일 : ${exInfo.committeeDatePick2Ko } (${ exInfo.committeeDateAdd2 })</span></p>	
				</c:if>
				<c:if test="${exInfo.committeeDatePick eq '3'}">
					<p class="CommitIdx"><span class="ListLabel">개최일 : ${exInfo.committeeDatePick3Ko } (${ exInfo.committeeDateAdd3 })</span></p>	
				</c:if>
			</div> --%>
			
		</div>
        <div class="layer_alert_btn">
        	<a href="javascript:void(0);" class="btn alertClose">닫기</a>
            <a href="javascript:backAlertEx('${committeeIdx}');" class="btn canEx">위원회 개최 회수</a>
        </div>
	</div>
</div>
