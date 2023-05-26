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
				${exInfo.committeeYear }년 ${exInfo.committeeTechNum }회차  ${exInfo.committeeTechName } 전문위원회 <%-- ${deleteType} --%> <br>
				<span class="sub">(통합 ${exInfo.committeeYear }년 ${exInfo.committeeNum }회차 전문위원회)</span><br>
				개최를 <span class="colorRed">취소</span>하시겠습니까?
			</div>
			<c:if test="${exInfo.committeeType eq 'A'}">
				<c:if test="${deleteType eq 'live'}">
					<div class="popMessegeCopy">
						개최를 <span class="colorbold">취소</span> 하시면, <span class="colorbold">전문위 예정</span> 이전 <span class="colorbold"> 참석일선택 </span>상태로 변경됩니다.<br>
						 <span class="colorbold">참석일 선택 메뉴</span>에서 <span class="colorbold">개최일을 확정</span>하시면 다시 <span class="colorbold">전문위원회</span>를 진행할 수 있습니다. 
					</div>
				</c:if>
				<c:if test="${deleteType eq 'leady'}">
					<div class="popMessegeCopy">
						개최를 <span class="colorbold">취소</span> 하시면, 구성된 <span class="colorbold">전문위원회</span>가 <span class="colorbold"> 초기화 </span>됩니다.<br>
						포함된 안건은 <span class="colorbold">검토준비중 > 위원회구성 메뉴</span>를 통해서 다시  <span class="colorbold">재설정</span>할 수 있습니다. 
					</div>
				</c:if>
			</c:if>
			<c:if test="${exInfo.committeeType eq 'B'}">
				<div class="popMessegeCopy">
					개최를 <span class="colorbold">취소</span> 하시면, 구성된 <span class="colorbold">전문위원회</span>가 <span class="colorbold"> 초기화 </span>됩니다.<br>
					포함된 안건은 <span class="colorbold">검토준비중 > 위원회구성 메뉴</span>를 통해서 다시  <span class="colorbold">재설정</span>할 수 있습니다. 
				</div>
			</c:if>
			
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
        	<c:if test="${exInfo.committeeType eq 'A'}">
				<c:if test="${deleteType eq 'live'}">
					<a href="javascript:cancelAlertEx('${committeeIdx}','A');" class="btn canEx">전문위원회 취소</a>
				</c:if>
				<c:if test="${deleteType eq 'leady'}">
					<a href="javascript:cancelAlertEx('${committeeIdx}','B');" class="btn canEx">전문위원회 취소</a>
				</c:if>
			</c:if>
			<c:if test="${exInfo.committeeType eq 'B'}">
				<a href="javascript:cancelAlertEx('${committeeIdx}','B');" class="btn canEx">전문위원회 취소</a>
			</c:if>
            
        </div>
	</div>
</div>
