<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="Dimmed_Layer_Warpper" class="Dimmed_Layer_Warpper">
	<div id="LayerAlertWarpper" class="LayerAlertWarpper Layer_Exp_base" >
    	<div class="layer_alert_body" >
			<div class="LayerBodySec" style="height:100%">
				<div class="popMessegeTit">
					<c:if test="${aComent eq 'codeAgd001'}">
						<span class='colorR'>1개 이상</span>의  <br><span class='colorB'>접수완료건</span>을 선택해주세요.
					</c:if>
					
					<c:if test="${aComent eq 'codeAgd002'}">
						<span class='colorB'>소관과 이관</span> 가능한 <br><span class='colorB'>접수완료</span>건이 없습니다.
					</c:if>
					
					<c:if test="${aComent eq 'codeAgd003'}">
						<span class='colorR'>1개 이상</span>의  <br><span class='colorB'>소관과</span>를 선택해주세요.
					</c:if>
					
					<c:if test="${aComent eq 'codeAgd004'}">
						<span class='colorB'>검토요청 공문</span>을  <span class='colorB'>첨부</span>해주세요.
					</c:if>
					
					<c:if test="${aComent eq 'codeAgd005'}">
						소관과 <span class='colorB'>검토 요청</span>을 <span class='colorB'>완료</span>하였습니다.
					</c:if>
					
					
					<c:if test="${aComent eq 'codeRecV003'}">
						소관과 <span class='colorB'>검토 권한</span>을 <span class='colorB'>저장 완료</span>하였습니다.
					</c:if>
					<c:if test="${aComent eq 'codeRecV004'}">
						추가 할 소관과  <span class='colorB'>검토 권한</span>을 <span class='colorR'>선택</span>해주세요.
					</c:if>
					<c:if test="${aComent eq 'codeRecV005'}">
						<span class='colorB'>검토 의견</span>을 <span class='colorR'>입력</span>해주세요.
					</c:if>
					<c:if test="${aComent eq 'codeRecV006'}">
						작성하신 <span class='colorB'>검토 의견</span>을 <span class='colorB'>저장 완료</span>하였습니다.
					</c:if>
					<c:if test="${aComent eq 'codeRecV007'}">
						접수번호 <span class='colorB'>${recCode}</span>의 <br>접수를 <span class='colorB'>승인</span>하시겠습니까?
					</c:if>
					<c:if test="${aComent eq 'codeRecV008'}">
						 <span class='colorB'>접수승인</span>이 <span class='colorB'>완료</span>하였습니다.
					</c:if>
					<c:if test="${aComent eq 'codeRecV009'}">
						접수번호 <span class='colorB'>${recCode}</span>의 <br>접수를 <span class='colorR'>반려</span>하시겠습니까?
					</c:if>
					<c:if test="${aComent eq 'codeRecV010'}">
						 <span class='colorR'>접수 반려</span> 처리를 <span class='colorB'>완료</span>하었습니다.
					</c:if>
					<c:if test="${aComent eq 'codeRecV011'}">
						접수번호 <span class='colorB'>${recCode}</span>의 <br><span class='colorB'>승인</span>을 <span class='colorR'>회수</span>하시겠습니까?
					</c:if>
					<c:if test="${aComent eq 'codeRecV012'}">
						 <span class='colorB'>승인 회수</span> 처리를  <span class='colorB'>완료</span>하였습니다.
					</c:if>
					<c:if test="${aComent eq 'codeRecV013'}">
						접수번호 <span class='colorB'>${recCode}</span>의 <br><span class='colorB'>반려</span>를 <span class='colorR'>회수</span>하시겠습니까?
					</c:if>
					<c:if test="${aComent eq 'codeRecV014'}">
						 <span class='colorR'>반려 회수</span> 처리를 <span class='colorB'>완료</span>하었습니다.
					</c:if>
					<c:if test="${aComent eq 'codeRecW001'}">
						<span class='colorB'>접수분야</span>를 <span class='colorR'>변경</span>하시겠습니까?
					</c:if>
					<c:if test="${aComent eq 'codeRecW002'}">
						<span class='colorB'>대상 기업 설정</span>을 <span class='colorR'>변경</span>하시겠습니까?
					</c:if>
					<c:if test="${aComent eq 'codeRecW003'}">
						<span class='colorB'>대상 기업</span>을 <span class='colorB'>검색</span> 후 <br> <span class='colorR'>등록</span>해주세요.
					</c:if>
					<c:if test="${aComent eq 'codeRecW004'}">
						<span class='colorB'>기업명</span>을 <span class='colorR'>입력</span>해주세요.
					</c:if>
					<c:if test="${aComent eq 'codeRecW005'}">
						<span class='colorB'>대표명</span>을 <span class='colorR'>입력</span>해주세요.
					</c:if>
					<c:if test="${aComent eq 'codeRecW006'}">
						<span class='colorB'>사업자 등록번호</span>를 <span class='colorR'>입력</span>해주세요.
					</c:if>
					<c:if test="${aComent eq 'codeRecW007'}">
						<span class='colorB'>본사 주소</span>를 <span class='colorR'>입력</span>해주세요.
					</c:if>
					<c:if test="${aComent eq 'codeRecW008'}">
						<span class='colorB'>본사 주소</span>를 <span class='colorR'>입력</span>해주세요.
					</c:if>
					<c:if test="${aComent eq 'codeRecW009'}">
						<span class='colorB'>본사 상세주소</span>를 <span class='colorR'>입력</span>해주세요.
					</c:if>
					<c:if test="${aComent eq 'codeRecW010'}">
						<span class='colorB'>사업장 주소</span>를 <span class='colorR'>입력</span>해주세요.
					</c:if>
					<c:if test="${aComent eq 'codeRecW011'}">
						<span class='colorB'>사업장 주소</span>를 <span class='colorR'>입력</span>해주세요.
					</c:if>
					<c:if test="${aComent eq 'codeRecW012'}">
						<span class='colorB'>사업장 상세주소</span>를 <span class='colorR'>입력</span>해주세요.
					</c:if>
					<c:if test="${aComent eq 'codeRecW013'}">
						<span class='colorB'>담당자명</span>을 <span class='colorR'>입력</span>해주세요.
					</c:if>
					<c:if test="${aComent eq 'codeRecW014'}">
						<span class='colorB'>담당자 이메일</span>을 <span class='colorR'>입력</span>해주세요.
					</c:if>
					<c:if test="${aComent eq 'codeRecW015'}">
						<span class='colorB'>담당자 부서</span>를 <span class='colorR'>입력</span>해주세요.
					</c:if>
					<c:if test="${aComent eq 'codeRecW016'}">
						<span class='colorB'>담당자 직책</span>을 <span class='colorR'>입력</span>해주세요.
					</c:if>
					<c:if test="${aComent eq 'codeRecW017'}">
						<span class='colorB'>담당자 전화번호</span>를 <span class='colorR'>입력</span>해주세요.
					</c:if>
					<c:if test="${aComent eq 'codeRecW018'}">
						<span class='colorB'>담당자 휴대폰</span>을 <span class='colorR'>입력</span>해주세요.
					</c:if>
					<c:if test="${aComent eq 'codeRecV019'}">
						<span class='colorB'>접수분야</span>를 선택 후 <span class='colorB'>정보</span>를 입력해주세요.
					</c:if>
					<c:if test="${aComent eq 'codeRecV020'}">
						<span class='colorR'>1개 이상</span>의  <br><span class='colorB'>기술분야 및 기술명칭</span>을 등록해주세요.
					</c:if>
					<c:if test="${aComent eq 'codeRecW021'}">
						<span class='colorB'>선택</span>하신  <span class='colorB'>기술명칭</span>을 <span class='colorR'>삭제</span>하시겠습니까?
					</c:if>
					<c:if test="${aComent eq 'codeRecW022'}">
						<span class='colorB'>첫</span>뻔째  <span class='colorB'>기술 분야 및 명칭</span>입니다.
					</c:if>
					<c:if test="${aComent eq 'codeRecW023'}">
						<span class='colorB'>마지막</span> <span class='colorB'>기술 분야 및 명칭</span>입니다.
					</c:if>
					<c:if test="${aComent eq 'codeRecW024'}">
						<span class='colorB'>선택</span>하신 <span class='colorB'>대상국</span>을 <span class='colorR'>삭제</span>하시겠습니까?
					</c:if>
					<c:if test="${aComent eq 'codeRecW025'}">
						<span class='colorB'>첫</span>뻔째  <span class='colorB'>대상국</span>입니다.
					</c:if>
					<c:if test="${aComent eq 'codeRecW026'}">
						<span class='colorB'>마지막</span> <span class='colorB'>대상국</span>입니다.
					</c:if>
					<c:if test="${aComent eq 'codeRecW027'}">
						<span class='colorB'>안건 제목</span>을 <span class='colorR'>입력</span>해주세요.
					</c:if>
					<c:if test="${aComent eq 'codeRecW028'}">
						<span class='colorB'>신청 사유</span>를 <span class='colorR'>입력</span>해주세요.
					</c:if>
					<c:if test="${aComent eq 'codeRecW029'}">
						<span class='colorB'>기술 형태</span>를 <span class='colorR'>입력</span>해주세요.
					</c:if>
					<c:if test="${aComent eq 'codeRecW030'}">
						<span class='colorB'>기술 특성</span>을 <span class='colorR'>입력</span>해주세요.
					</c:if>
					<c:if test="${aComent eq 'codeRecW031'}">
						<span class='colorB'>신고 사유</span>를 <span class='colorR'>입력</span>해주세요.
					</c:if>
					<c:if test="${aComent eq 'codeRecW032'}">
						<span class='colorB'>승인 신청 사유</span>를 <span class='colorR'>입력</span>해주세요.
					</c:if>
					<c:if test="${aComent eq 'codeRecW033'}">
						<span class='colorB'>수출 사유 유형</span>을 <span class='colorR'>선택</span>해주세요.
					</c:if>
					<c:if test="${aComent eq 'codeRecW034'}">
						<span class='colorB'>수출 사유 내용</span>을 <span class='colorR'>입력</span>해주세요.
					</c:if>
					<c:if test="${aComent eq 'codeRecW035'}">
						<span class='colorB'>수출 예정일을</span>을 <span class='colorR'>선택</span>해주세요.
					</c:if>
					<c:if test="${aComent eq 'codeRecV036'}">
						<span class='colorR'>1개 이상</span>의  <br><span class='colorB'>수출 대상국</span>을 등록해주세요.
					</c:if>
					<c:if test="${aComent eq 'codeRecV037'}">
						<span class='colorB'>신규 접수 등록</span>이 <span class='colorB'>완료</span>되었습니다.
					</c:if>
					<c:if test="${aComent eq 'codeRecV038'}">
						<span class='colorB'>신규 접수 등록</span>을 <span class='colorR'>취소</span>하시겠습니까?
					</c:if>
				</div>
				<div class="popMessegeCopy">
					<c:if test="${aComent eq 'codeRecW001'}">
					작성중인 <span class="colorbold">신청내용</span>이 삭제됩니다.
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
        		<c:if test="${forAction eq 'closeAlert' or forAction eq 'goRecFormReset' or forAction eq 'goSaveAuth'}"> 
        			<a href="javascript:${forAction}();" class="btn canEx">확인</a>
        		</c:if>
        		<c:if test="${forAction eq 'saveRecConfirm' or forAction eq 'saveRecBaCon' or forAction eq 'saveRecReCon' or forAction eq 'saveRecBaRe' or forAction eq 'pageLocation'}">
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
