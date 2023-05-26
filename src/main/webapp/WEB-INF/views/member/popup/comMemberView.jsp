<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <div id="Dimmed_Layer_Warpper" class="Dimmed_Layer_Warpper">
    	<div id="Layer_Content_Warpper" class="Layer_Content_Warpper Layer_rsc_1001">
        	<div class="layer_popup_tit">
				<h1 class="layer_tit">기업 포털 회원</h1>
				<a href="javascript:void(0);" class="layer_closer"></a>
			</div>
			<div class="layer_popup_body content_01">
				<div class="rscCommodibox LayerBodySection">
					<div class="SectionTitleBox">
						<h1 class="TitleBoxTit">회원 정보</h1>
						<div class="SectionBarBox"></div>
					</div>
					<div class="makeForm">
						<dl class="formlist">
							<dt>기업명</dt>
							<dd style="font-size:18px;">
							    ${user.cpnNm}
							</dd>	
							<dt>
								사업자번호  
							</dt>
							<dd style="font-size:18px;">
							    ${user.cpnSNo}
							</dd>
							<dt>담당자명 </dt>
							<dd style="font-size:18px;">
							    ${user.cpnPNm}
							</dd>
							<dt>담당자명 </dt>
							<dd style="font-size:18px;">
							    ${user.cpnPNm}
							</dd>
							<c:if test="${user.cpnStat eq '400'}">
							<dt>재직증명서</dt>
							<dd>
								<div class="Comregbox">
								 <c:if test="${fn:length(endStausFile.fileOriginNm) != 0}">
									<p class="section_item">
		                				<a 	data-viewer-path="${ viewerPath }"
		                					data-file-path="${ endStausFile.filePath }"
		                					data-file-key="${ endStausFile.fileKey }"
											data-file-name="${ endStausFile.fileNm }"
											data-user-name="${ user.cpnNm }"
											data-user-position="${ user.cpnPPosition }"
											data-user-com="${ user.cpnNm }"
											data-user-dept="${ user.cpnPDept }"
											data-user-phone1="${ user.cpnPMobile1 }"
											data-user-phone2="${ user.cpnPMobile2 }"
											data-user-phone3="${ user.cpnPMobile3 }"
											data-user-email="${ user.cpnPEmail }" href="javascript:void(0);">${endStausFile.fileOriginNm }</a>
									</p>
								 </c:if>	 
								</div>
							</dd>
							</c:if>
							<c:if test="${fn:length(endStausFile.fileOriginNm) == 0}">
							
							</c:if>
						</dl>
						<c:if test="${user.cpnStat eq '300'}">
							<div class="makeKeyBox">
								회원 가입 후 재직증명서 등록 전입니다.
							</div>
						</c:if>
						<c:if test="${user.cpnStat eq '400'}">
							<div class="makeKeyBox">
								재직 증명서를 확인 후 승인 처리해주세요.
							</div>
						</c:if>
						<c:if test="${user.cpnStat eq '500'}">
							<div class="makeKeyBox" style="color:#ffoooo;">
								사용이 중지된 사용자 입니다.
							</div>
						</c:if>
					</div>
				</div>
				
			</div>
            <div class="layer_popup_btn">
                <a href="#none" class="btn btn_close">닫기</a>
                <c:if test="${user.cpnStat eq '400' || user.cpnStat eq '500'}">
					<a href="#none" class="btn btn_shipSave">승인</a>
				</c:if>
				<c:if test="${user.cpnStat eq '200'}">
					<a href="#none" class="btn btn_shipStop">사용중지</a>
				</c:if>
            </div>
		</div>
	</div>


    
