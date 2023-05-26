<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="Dimmed_Layer_Warpper" class="Dimmed_Layer_Warpper">
	<div id="LayerAlertWarpper" class="LayerAlertWarpper Layer_Exp_base" >
    	<div class="layer_alert_body" >
			<div class="LayerBodySec" style="height:100%">
				<div class="popMessegeTit">
					<c:if test="${aComent eq 'codeExp001'}">
						<span class='colorB'>선택</span>하신  <span class='colorB'>구성원</span>을 <span class='colorR'>삭제</span>하시겠습니까?
					</c:if>
					<c:if test="${aComent eq 'codeExp002'}">
						<span class='colorB'>선택</span>하신  <span class='colorB'>안건</span>을 <span class='colorR'>삭제</span>하시겠습니까?
					</c:if>
					<c:if test="${aComent eq 'codeExp003'}">
						<span class='colorB'>첫</span>뻔째  <span class='colorB'>안건</span>입니다.
					</c:if>
					<c:if test="${aComent eq 'codeExp004'}">
						<span class='colorB'>마지막</span> <span class='colorB'>안건</span>입니다.
					</c:if>
					<c:if test="${aComent eq 'codeExp005'}">
						전문위원회 <span class='colorB'>구성</span>을 위한<br> <span class='colorB'>기술 분야</span>를 선택해주세요.
					</c:if>
					<c:if test="${aComent eq 'codeExp006'}">
						<span class='colorB'>기술분야</span>를 <span class='colorR'>변경</span>하시겠습니까?
					</c:if>
					
					
					
					
				</div>
				<div class="popMessegeCopy">
					<c:if test="${aComent eq 'codeExp006'}">
					작성중인 <span class="colorbold">위원회 구성 내용</span>이 삭제됩니다.
					</c:if> 
					<c:if test="${aComent eq 'codeRecW002'}">
					작성중인 <span class="colorbold">신청내용</span>이 <span class='colorR'>삭제 </span>됩니다.
					</c:if> 
				</div>
			</div>
		</div>
        <div class="layer_alert_btn">
        	<c:if test="${alType eq 'dual'}">
	        	<a href="javascript:${reAction}();" class="btn alertClose">취소</a>
	        	<c:if test="${forAction eq 'pageReload'}">
        			<a href="javascript:${forAction}();" class="btn canEx">확인</a>
        		</c:if>
        		<c:if test="${forAction eq 'closeAlert' or forAction eq 'goExpFormReset' or forAction eq 'goSaveAuth'}"> 
        			<a href="javascript:${forAction}();" class="btn canEx">확인</a>
        		</c:if>
        		<c:if test="${forAction eq 'goExpMemDel' or forAction eq 'goExpAgdDel'}">
	        		<a href="javascript:${forAction}('${recCode}');" class="btn canEx">확인</a>
	        	</c:if>
	        </c:if>
        	<c:if test="${alType eq 'one'}">
        		<c:if test="${forAction eq 'pageReload'}">
        			<a href="javascript:${forAction}();" class="btn canEx">확인</a>
        		</c:if>
        		<c:if test="${forAction eq 'closeAlert'}">
        			<a href="javascript:${forAction}();" class="btn canEx">확인</a>
        		</c:if>
        		<c:if test="${forAction eq 'closeFocus' or forAction eq 'goMetaTechDel' or forAction eq 'pageLocation'}">
	        		<a href="javascript:${forAction}('${recCode}');" class="btn canEx">확인</a>
	        	</c:if>
        	</c:if>
        </div>
	</div>
</div>
