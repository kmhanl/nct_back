<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="body_wrapper">
 	<div class="BoardStat">
				<p class="StatP">총 게시물 <sapn>${paging.totalRows}</sapn>건 | 현재 페이지 ${paging.pageNo}/${paging.totalPage}</p>
				  <a href="/board/boardWrite" class="receipt_btn receiptWrite">글쓰기</a>
               
     </div>
     		<div class="content_table_wrapper">
	            <table class="table_type_01">
	                <colgroup>
	                    <col width="8%">
	                    <col width="">
	                    <col width="15%">
	                    <col width="11%">
	                    <col width="12%">
	                </colgroup>
	                <thead>
	                	<tr>
	                		<th>번호</th>
	                		<th>제목</th>
	                		<th>작성자</th>
	                		<th>등록일</th>
	                		<th>게시여부</th>
	                </thead>
	                <tbody>
		                <c:if test ="${empty boardList}">
		                 <tr>
		                 <td colspen="5">데이터가 없습니다.</td>
		                 </tr>
		                </c:if>
		                <c:if test ="${not empty boardList}">
	                	<c:forEach items="${boardList}" var="board" begin="${paging.startNo}" end="${paging.startNo + (paging.pageRows - 1)}" varStatus="status">
							<tr>
		                        <td>
		                           	<c:out value="${paging.totalRows - ((paging.pageNo - 1) * 10) - status.count + 1}"/>
		                        </td>
		                       
		                        <td class="tit">
		                         		
										<a href="/board/boardView.do?code=${board.infoBoardCode}&pageNo=${paging.pageNo}">${board.infoBoardTitle}</a>
	  							</td>
	  							<td>
		                           	${board.infoBoardId}
		                        </td>
		                        <td>
		                           	${board.policyDate8Ko}
		                        </td>
		                        <td>
		                       		 <c:if test="${board.infoBoardViewYn eq 'Y' }">
										게시 
									</c:if>
									<c:if test="${board.infoBoardViewYn eq 'N' }">
										미게시
									</c:if>
		                        
		                        </td>
		                    </tr>
							
						</c:forEach>
					</c:if>	
	                </tbody>
	            </table>
	        </div>
	        <c:if test="${fn:length(boardList) ne 0 }">
		        <div class="pager"> 
	            	<a href="javascript:void(0);" class="arr prev">&lt;</a>
					<c:forEach var="i" begin="1" end="${paging.totalPage }">
	                      	<a href="/board/informationList.do?pageNo=${i}&pageRows=10" class="item ${i eq paging.pageNo ? 'active' : '' }">${i}</a>
					</c:forEach>
	                <a href="javascript:void(0);" class="arr next">&gt;</a>
	            </div>
            </c:if>
  </div>