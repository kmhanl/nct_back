<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="Page${ agdCode }" class="ComBrowserPage " data-pageIdx="${ agdCode }" style="">
	<input type="hidden" name="committeeIdx" id="committeeIdx" value="${ agdData.agdExIdx }">
	<input type="hidden" name="PageOpen" id="PageOpen" value="Y">
	<input type="hidden" name="PageIdx" id="PageIdx" value="${ agdCode }">
	<input type="hidden" name="PageModi" id="PageModi" value="N">
	<div class="BrowserViewerWrapper">
		<div class="BrowserViewerContentWrapper" style="height: calc(100%);">
			<!-- <div class=BrowserAgdViewer>
				검토 의견
			</div> -->
			<div class=BrowserAgdViewer>
				<div class="OpinionDetailBox" style="clear:both;">
					<div class="OpinionDetailBoxTop">
						<ul class="OpinionViewTypeList">
							<li class="OpinionViewTypeOn "><a href="javascript:void(0);" class="OpinionViewTypeItem">유효 검토 의견  2/5</a></li>
							<li><a href="javascript:void(0);" class="OpinionViewTypeItem">기타 검토 의견 2/5</a></li>
							<li><a href="javascript:void(0);" class="OpinionViewTypeItem">안건 상세 정보</a></li>
						</ul>
					</div>
					<!-- <div class="OpinionStatBox" >
						<ul class="OpinionStatList">
							<li><a href="javascript:void(0);" class="OpinionStatItem">승인 2</a></li>
							<li><a href="javascript:void(0);" class="OpinionStatItem">불승인 0</a></li>
							<li><a href="javascript:void(0);" class="OpinionStatItem">조건부 승인 0</a></li>
							<li><a href="javascript:void(0);" class="OpinionStatItem">일부 승인 0</a></li>
							<li><a href="javascript:void(0);" class="OpinionStatItem">재검토 0</a></li>
							<li><a href="javascript:void(0);" class="OpinionStatItem">기타 0</a></li>
						</ul>
					</div> -->
					<!-- <div class="OpinionMemBox OpinionMemBoxY" style="clear:both;">
						<ul class="OpinionMemTapList">
							<li><a href="javascript:void(0);" class="OpinionMemTapItem">전문 위원</a></li>
							<li><a href="javascript:void(0);" class="OpinionMemTapItem">기술 위원</a></li>
							<li><a href="javascript:void(0);" class="OpinionMemTapItem">보호 센터</a></li>
							<li><a href="javascript:void(0);" class="OpinionMemTapItem">소관과</a></li>
						</ul>
						<div class="OpinionMemListBox OpinionMemListBox00">
							<ul class="OpinionMemList">
								<li><a href="javascript:void(0);" class="OpinionMemItem">전문 위원 1</a></li>
								<li><a href="javascript:void(0);" class="OpinionMemItem">전문 위원 2</a></li>
								<li><a href="javascript:void(0);" class="OpinionMemItem">전문 위원 3</a></li>
								<li><a href="javascript:void(0);" class="OpinionMemItem">전문 위원 4</a></li>
							</ul>	
						</div>
						<div class="OpinionMemListBox OpinionMemListBox01">
							<ul class="OpinionMemList">
								<li><a href="javascript:void(0);" class="OpinionMemItem">기술 위원 1</a></li>
								<li><a href="javascript:void(0);" class="OpinionMemItem">기술 위원 2</a></li>
								<li><a href="javascript:void(0);" class="OpinionMemItem">기술 위원 3</a></li>
								<li><a href="javascript:void(0);" class="OpinionMemItem">기술 위원 4</a></li>
							</ul>	
						</div>
						<div class="OpinionMemListBox OpinionMemListBox02">
							<ul class="OpinionMemList">
								<li><a href="javascript:void(0);" class="OpinionMemItem">보호 센터 1</a></li>
								<li><a href="javascript:void(0);" class="OpinionMemItem">보호 센터 2</a></li>
								<li><a href="javascript:void(0);" class="OpinionMemItem">보호 센터 3</a></li>
								<li><a href="javascript:void(0);" class="OpinionMemItem">보호 센터 4</a></li>
							</ul>	
						</div>
						<div class="OpinionMemListBox OpinionMemListBox03">
							<ul class="OpinionMemList">
								<li><a href="javascript:void(0);" class="OpinionMemItem">소관과 1</a></li>
								<li><a href="javascript:void(0);" class="OpinionMemItem">소관과 2</a></li>
								<li><a href="javascript:void(0);" class="OpinionMemItem">소관과 3</a></li>
								<li><a href="javascript:void(0);" class="OpinionMemItem">소관과 4</a></li>
							</ul>	
						</div>
					</div> -->
					<!-- <div class="OpinionMemBoxN" style="clear:both;">
						<ul class="OpinionMemTapList">
							<li><a href="" class="OpinionMemTapItem">전문 위원</a></li>
							<li><a href="" class="OpinionMemTapItem">기술 위원</a></li>
							<li><a href="" class="OpinionMemTapItem">보호 센터</a></li>
							<li><a href="" class="OpinionMemTapItem">소관과</a></li>
						</ul>
					</div> -->
					<div class="OpinionDetailView" style="clear:both;">
						 <h1 style="display:block;font-size:20px;text-align:center;">전문위원회 여부 판정 검토 의견서</h1>
						 <div style="text-align:center;padding:40px 0 ;">
						 	검토의견서 데이터 호출에 실패 하였습니다. 다시 시도해주세요.	
						 </div>
						 
					</div>
				</div>
				
			</div>
			<div class="ComWriteBox">
				<c:if test="${user.admGroup ne 'AMG04'}">
					<div class="ComBoardNotInfo">
						<p>검토 의견 열람만 가능한 권한 입니다.<br></p>
					</div>
				</c:if>
				<c:if test="${user.admGroup eq 'AMG04'}">
					<div class="ComBoradFrom" >
						<c:if test="${ agdData.rcptTypeCode eq '01'}">
		             		
						</c:if>
						<div class="FormTitbox">
								<p class="FormTit01" style="font-size:18px;text-align:center;padding:15px 0;">최종 검토 결과서</p>
							</div>
							<div class="OpinionBox ">
								<p class="FormTit02">신청기술의 기술적 가치</p>
								<textarea name="opinion101" id="comment" rows="4" class="OpinionText OpinionText01" placeholder="검토의견을 작성해주세요."></textarea>
							</div>
							<div class="OpinionBox ">
								<p class="FormTit02">신청기술의 시장성·경쟁력 수준</p>
								<textarea name="opinion102" id="comment" rows="4" class="OpinionText OpinionText02" placeholder="검토의견을 작성해주세요."></textarea>
							</div>
							<div class="OpinionBox ">
								<p class="FormTit02">기타 중요한 사항</p>
								<textarea name="opinion103" id="comment" rows="4" class="OpinionText OpinionText03" placeholder="검토의견을 작성해주세요."></textarea>
							</div>
							<div class="OpinionBox BoxLast" >
								<p class="FormTit02">종합결론</p>
								<textarea name="opinion101" id="comment" rows="4" class="GeneralOpinionText OpinionText OpinionText03" placeholder="검토의견을 작성해주세요.">${ opinionData.committeeOptGeneral }</textarea>
							</div>
						<div class="ComBoradBtn">
							<a href="#none" class="btn ImSave" data-pageidxs="${ agdCode }" data-agdtype="${ agdData.rcptTypeCode}">임시 저장</a>
							<a href="#none" class="btn OpSave" data-pageidxs="${ agdCode }" data-agdtype="${ agdData.rcptTypeCode}">이관 의견 저장</a> 
						</div>
					</div>
				</c:if>
					
				
			</div>
		</div>
	</div>
</div>