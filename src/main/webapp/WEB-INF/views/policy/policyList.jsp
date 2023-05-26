<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="body_wrapper">
 	<div class="BoardStat">
				<p class="StatP">총 게시물 <sapn>${paging.totalRows}</sapn>건 | 현재 페이지 ${paging.pageNo}/${paging.totalPage}</p>
               
     </div>
     		<div class="content_table_wrapper">
	            <table class="table_type_01">
	                <colgroup>
	                    <col width="8%">
	                    <col width="15%">
	                    <col width="">
	                    <col width="11%">
	                    <col width="12%">
	                    <col width="8%">
	                </colgroup>
	                <thead>
	                	<tr>
	                		<th>번호</th>
	                		<th>카테고리</th>
	                		<th>제목</th>
	                		<th>작성자</th>
	                		<th>등록일</th>
	                		<th>승인여부</th>
	                </thead>
	                <tbody>
		                <c:if test ="${empty policyList}">
		                 <tr>
		                 <td colspen="6">데이터가 없습니다.</td>
		                 </tr>
		                </c:if>
		                <c:if test ="${not empty policyList}">
	                	<c:forEach items="${policyList}" var="policy" begin="${paging.startNo}" end="${paging.startNo + (paging.pageRows - 1)}" varStatus="status">
							<tr>
		                        <td>
		                           	<c:out value="${paging.totalRows - ((paging.pageNo - 1) * 10) - status.count + 1}"/>
		                        </td>
		                        <td>
		                        	<c:if test="${policy.policyType eq 'PO01' }">
										보안장비
									</c:if>
									<c:if test="${policy.policyType eq 'PO02' }">
										기술유출
									</c:if>
									<c:if test="${policy.policyType eq 'PO03' }">
										보호지침
									</c:if>
									<c:if test="${policy.policyType eq 'PO04' }">
										제도신청
									</c:if>
		                        </td>
		                        <td class="tit">
		                         		<c:if test="${policy.policyPwYn eq 'Y'}">[비밀글]</c:if>
										<a href="/policy/policyView.do?code=${policy.policyCode}&pageNo=${paging.pageNo}">${policy.policyTitle}</a>
	  							</td>
	  							<td>
		                           	${policy.policyId}
		                        </td>
		                        <td>
		                           	${policy.policyDate8Ko}
		                        </td>
		                        <td>
		                       		 <c:if test="${policy.policyViewYn eq 'Y' }">
										승인
									</c:if>
									<c:if test="${policy.policyViewYn eq 'N' }">
										미승인
									</c:if>
		                        
		                        </td>
		                    </tr>
							
						</c:forEach>
					</c:if>	
	                </tbody>
	            </table>
	        </div>
	        <c:if test="${fn:length(policyList) ne 0 }">
		        <div class="pager"> 
	            	<a href="javascript:void(0);" class="arr prev">&lt;</a>
					<c:forEach var="i" begin="1" end="${paging.totalPage }">
	                      	<a href="/policy/policyList.do?pageNo=${i}&pageRows=10" class="item ${i eq paging.pageNo ? 'active' : '' }">${i}</a>
					</c:forEach>
	                <a href="javascript:void(0);" class="arr next">&gt;</a>
	            </div>
            </c:if>
  </div>