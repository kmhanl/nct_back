<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script>
$( document ).ready(function() {
	$(".WriteBtnWrapper .policySave").on("click",function(){
		var policyViewYn = $('input[name=policyViewYn]:checked').val();
		var policyCode = $("#policyCode").val();
		var policyAnswer = $("#policyAnswer").val();
		
		if(policyViewYn == ""){
			alert("승인여부를 체크해 주세요.");
			return false;
		}else{
			$.ajax({
				type:'POST',
				url: "/policy/setUpData.do",
				data : {
			 		  "policyViewYn": policyViewYn 
			 		 ,"policyCode": policyCode 
			 		 ,"policyAnswer": policyAnswer
			 	}, 
			 	dataType : "json",
				success : function(data) {
					console.log("메타 데이터 저장 완료 > 파일 저장 시도 ");
					console.log(data);
					alert("수정되었습니다.");
					location.reload();
				},
				error: function(e) {
					alert("접수 신청서 임시 저장에 실패 했습니다. 다시 시도해주세요.");
					return;
				}
			});
				
		}
			
		
		
		
	});
});


</script>
<div class="body_wrapper">
 <div class="list_wrapper ">
	            <table class="table_list receiptList InsertReceipt" style="border-bottom:0;">
	                <colgroup>
	                    <col width="15%">
	                    <col width="">
	                </colgroup>
	                <tbody>
	                    <tr>
	                        <th class="stat">
	                           	제목
	                        </th>
	                        <td class="tit">
	                        	${policyView.policyTitle}
	                           <%-- 	${policyView.policyCode} --%>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th class="stat">
	                           	카테고리
	                        </th>
	                          <td class="tit">
	                           
	                           		<c:if test="${policyView.policyType eq 'PO01'}"> 보안장비</c:if>
	                           		 <c:if test="${policyView.policyType eq 'PO02'}"> 기술유출 </c:if>
	                           		<c:if test="${policyView.policyType eq 'PO03'}"> 보호지침 </c:if>
	                           		 <c:if test="${policyView.policyType eq 'PO04'}">제도신청 </c:if>
	                          
	                        </td>
	                    </tr>
	                    <tr>
	                        <th class="stat">
	                           	작성자
	                        </th>
	                        <td class="tit">
	                           ${policyView.policyId}
	                        </td>
	                    </tr>
	                    <tr>
	                        <th class="stat">
	                           	내용
	                        </th>
	                        <td>
	                           	<textarea class="rcptTechForm textareaForm" name="policyContent" id="policyContent" rows="12" title="" readonly>${policyView.policyContent}</textarea>
	                        </td>
	                    </tr>
	                    <c:if test="${fn:length(policyFileList) != 0 }">
	                    <tr>
	                    	 <th class="stat">
	                           	첨부파일
	                        </th>
	                        <td class="file-list-td numbering">
	                      
					            		 <c:if test ="${not empty policyFileList}">
					            		  <c:forEach items="${policyFileList}" var="file">
					           
					            		  <p style="float:left;">${file.fileOriginNm}</p></br>
					           
					            		</c:forEach>
					            		 
					            		 </c:if>
										
	                        </td>
						</tr>
						</c:if>  
						</tbody>
						</table>
						<br>
						 <table class="table_list receiptList InsertReceipt" style="border-bottom:0;">
		                <colgroup>
		                    <col width="15%">
		                    <col width="">
		                </colgroup>
		                <tbody>
		                <tr>
	                    	 <th class="stat">
	                           	승인여부 
	                        </th>
	                         <td>
	                           <input type="hidden" name="policyCode" class="forminput02" id="policyCode" value="${policyView.policyCode}">
	                            <input type="radio" name="policyViewYn" value="Y" id="policyViewYn1" <c:if test="${policyView.policyViewYn eq 'Y'}"> checked </c:if>><label for="policyViewYn1">승인</label>
	                            <input type="radio" name="policyViewYn" value="N" id="policyViewYn2" <c:if test="${policyView.policyViewYn eq 'N'}"> checked </c:if>><label for="policyViewYn2">미승인</label>
	                         </td>
	                         </tr>
	                        
							<tr>
	                    	 <th class="stat">
	                           	답변</br> [답변이 있을경우 </br>사용자 한테 보여집니다.]
	                        </th>
	                         <td>
	                           	<textarea class="rcptTechForm textareaForm" name="policyAnswer" id="policyAnswer" rows="12" title="">${policyView.policyAnswer}</textarea>
	                        </td>
	                        </tr>
	                        
			                </tbody>
			            </table>
	        </div>
	        <div class="WriteBtnWrapper">
            	<a href="/policy/policyList.do?pageNo=${pageNo}&pageRows=10" class="Btn">목록보기</a>
            	<a href="javascript:void(0);" class="Btn policySave">저장하기</a>
            </div>
</div>