<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	                        	${BoardView.infoBoardTitle}
	                           <%-- 	${policyView.policyCode} --%>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th class="stat">
	                           	작성자
	                        </th>
	                        <td class="tit">
	                           ${BoardView.infoBoardId}
	                        </td>
	                    </tr>
	                    <tr>
	                        <th class="stat">
	                           	내용
	                        </th>
	                        <td>
	                           	<textarea class="rcptTechForm textareaForm" name="infoBoardContent" id="infoBoardContent" rows="12" title="" readonly>${BoardView.infoBoardContent}</textarea>
	                        </td>
	                    </tr>
	                    <c:if test="${fn:length(BoardFileList) != 0 }">
	                    <tr>
	                    	 <th class="stat">
	                           	첨부파일
	                        </th>
	                        <td class="file-list-td numbering">
	                      
					            		 <c:if test ="${not empty BoardFileList}">
					            		  <c:forEach items="${BoardFileList}" var="file">
					           
					            		  <p style="float:left;">${file.fileOriginNm}</p></br>
					           
					            		</c:forEach>
					            		 
					            		 </c:if>
										
	                        </td>
						</tr>
						</c:if>  
	                </tbody>
	            </table>
	        </div>
	        <div class="WriteBtnWrapper">
            	<a href="/board/informationList.do?pageNo=${pageNo}&pageRows=10" class="Btn">목록보기</a>
            	<a href="/board/boardModify.do?code=${code}&pageNo=${pageNo}&pageRows=10" class="Btn">수정하기</a>
            </div>
</div>