<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="Page${ agdCode }" class="ComBrowserPage " data-pageIdx="${ agdCode }" style="">
	<input type="hidden" name="committeeIdx" id="committeeIdx" value="${ agdData.agdExIdx }">
	<input type="hidden" name="PageOpen" id="PageOpen" value="Y">
	<input type="hidden" name="PageIdx" id="PageIdx" value="${ agdCode }">
	<input type="hidden" name="PageModi" id="PageModi" value="N">
	<div class="BrowserViewerWrapper">
		<div class="BrowserViewerTopInfo">
			<span class="ViewNo">안건 ${ listIdx }.</span> <span class="ViewTopTitle">${ agdData.rcptTypeCodeName }</span>
		</div>
		<div class="BrowserViewerContentWrapper">
			<div class=BrowserAgdViewer>
				<div class="AgendaDetailBox" style="clear:both">
					<div class="DetailItemWarp">
						<p class="SummuryCom">기관명 : ${ agdData.cpnNm } [사업자등록번호 : ${ agdData.cpnSNo }]<p>
						<p class="SummuryType">접수번호 : ${ rcptIdx }</p>	
					</div>
					<div class="DetailItemWarp">
						<p class="ItemTitle">기술 명칭</p>
						<c:forEach items="${receiptTechList }" var="rcptTech" varStatus="status">
	       					<c:if test="${status.index ne 0 }"></c:if>
	       					<p class="TehcNameDepth">${ rcptTech.techItemName }</p>
	       					<p class="TehcNameTechNM">${ rcptTech.techRcptTechNm }</p>
	       				</c:forEach>
					</div>
					<div class="DetailItemWarp">
						<p class="ItemTitle">기술 형태</p>
						<p class="ItemTechForm">${ agdData.rcptTechForm}</p>
					</div>
					<c:if test="${
	             			agdData.rcptTypeCode eq '01' or agdData.rcptTypeCode eq '05' or agdData.rcptTypeCode eq '06'
	             		}">
	             		<div class="DetailItemWarp">
							<p class="ItemTitle">기술 특성</p>
							<p class="ItemTechForm">${ agdData.rcptTechQua}</p>
						</div>
             		</c:if>
					<c:if test="${
	             			agdData.rcptTypeCode eq '01' or agdData.rcptTypeCode eq '05' 
	             		}">
	             		<div class="DetailItemWarp">
							<p class="ItemTitle">신청 사유</p>
							<p class="ItemTechForm">${ agdData.rcptReason}</p>
						</div>
             		</c:if>
             		<c:if test="${
	             			agdData.rcptTypeCode eq '07' 
	             		}">
	             		<div class="DetailItemWarp">
							<p class="ItemTitle">승인 신청 사유</p>
							<p class="ItemTechForm">${ agdData.rcptReason}</p>
						</div>
             		</c:if>
					<c:if test="${
	             			agdData.rcptTypeCode eq '02' or agdData.rcptTypeCode eq '03' or agdData.rcptTypeCode eq '04'
	             		}">
	             		<div class="DetailItemWarp">
							<p class="ItemTitle">수출 사유</p>
							<p class="">
							매각:${ agdData.rcptExReasonSale}<br>
							매각사유${ agdData.rcptExReasonSCom}<br>
							이전 :${ agdData.rcptExReasonTrans}<br>
							이전사유${ agdData.rcptExReasonTCom}<br>
							기타 ${ agdData.rcptExReasonEtc}<br>
							기타사유${ agdData.rcptExReasonECom}<br>
							</p>
						</div>
             		</c:if>
             		<c:if test="${
	             			agdData.rcptTypeCode eq '02' or agdData.rcptTypeCode eq '03' or agdData.rcptTypeCode eq '04'
	             			
	             		}">
	             		<!-- and agdData.rcptExDate ne null -->
	             		<div class="DetailItemWarp">
							<p class="ItemTitle">수출 예정일</p>
							<p class="">
							${ agdData.rcptExDate}
							</p>
						</div>
             		</c:if>
             		<c:if test="${
	             			agdData.rcptTypeCode eq '02' or agdData.rcptTypeCode eq '03' or agdData.rcptTypeCode eq '04' or agdData.rcptTypeCode eq '05' or agdData.rcptTypeCode eq '06' or agdData.rcptTypeCode eq '07'
	             		}">
	             		<div class="DetailItemWarp">
							<p class="ItemTitle">수출 대상국/매입자</p>
							<ul class="section_sub_list">
	              				<c:forEach items="${receiptCountryList }" var="rcptCty" varStatus="status">
	              					<li>${rcptCty.ctyTargetCountryName }[${rcptCty.ctyTargetCountry }] : ${rcptCty.ctyBuyer }</li>
	              				</c:forEach>
	           				</ul>
						</div>
             		</c:if>
					
             		<c:if test="${
	             			agdData.rcptTypeCode eq '06'
	             		}">
	             		<div class="DetailItemWarp">
							<p class="ItemTitle">신고 사유</p>
							${ agdData.rcptReason}
							법률 1:${ agdData.rcptLaw01}<br>
							법률 2:${ agdData.rcptLaw02}<br>
							법률 3:${ agdData.rcptLaw03}<br>
						</div>
             		</c:if>
             		<div class="DetailItemWarp">
						<p class="ItemTitle">첨부 자료 <span>파일명을 클릭 하시면 뷰어가 호출 됩니다.</span></p>
						<div class="ItemRctpFile ItemRctpFileList ">
							<c:forEach items="${receiptFileList }" var="file" varStatus="status">
               					<c:if test="${fn:contains(file.fileRcptSeq, '1003')}">
		                			<p class="section_item">
		                				<a class="FileItem" data-viewer-path="${ viewerPath }"
		                					data-file-path="/home/tomcat/live/upload/file/"
		                					data-file-key="${ file.fileKey }"
											data-file-name="${ file.fileNm }"
											data-user-name="${ user.admName }"
											data-user-position="${ user.admPositon }"
											data-user-com="${ user.admCom }"
											data-user-dept="${ user.admDept }"
											data-user-phone1="${ user.admMobile1 }"
											data-user-phone2="${ user.admMobile2 }"
											data-user-phone3="${ user.admMobile3 }"
											data-user-email="${ user.admEmail }" href="javascript:void(0);">${file.fileOriginNm }</a>
		                			</p>
               					</c:if>
               				</c:forEach>
						</div>
					</div>
					<div class="DetailItemWarp">
						<p class="ItemTitle">접수 신청서  <span>파일명을 클릭 하시면 뷰어가 호출 됩니다.</span></p>
						<p class="ItemRctpFile ItemRctpFileList ">
							<c:forEach items="${receiptFileList }" var="file" varStatus="status">
             				<c:if test="${fn:contains(file.fileRcptSeq, '1001')}">
	                			<a class="FileItem" data-viewer-path="${ viewerPath }"
	                					data-file-path="/home/tomcat/live/upload/file/"
	                					data-file-key="${ file.fileKey }"
										data-file-name="${ file.fileNm }"
										data-user-name="${ user.admName }"
										data-user-position="${ user.admPositon }"
										data-user-com="${ user.admCom }"
										data-user-dept="${ user.admDept }"
										data-user-phone1="${ user.admMobile1 }"
										data-user-phone2="${ user.admMobile2 }"
										data-user-phone3="${ user.admMobile3 }"
										data-user-email="${ user.admEmail }" href="javascript:void(0);">${file.fileOriginNm }</a>
	                		</c:if>
               				</c:forEach>
						</p>
					</div>
					<div class="DetailItemWarp" style="border:0;">
						<p class="ItemTitle">접수 공문  <span>파일명을 클릭 하시면 뷰어가 호출 됩니다.</span></p>
						<p class="ItemRctpFile ItemRctpFileList ">
							<c:forEach items="${receiptFileList }" var="file" varStatus="status">
             				<c:if test="${fn:contains(file.fileRcptSeq, '1001')}">
	                				<a class="FileItem"	data-viewer-path="${ viewerPath }"
	                					data-file-path="/home/tomcat/live/upload/file/"
	                					data-file-key="${ file.fileKey }"
										data-file-name="${ file.fileNm }"
										data-user-name="${ user.admName }"
										data-user-position="${ user.admPositon }"
										data-user-com="${ user.admCom }"
										data-user-dept="${ user.admDept }"
										data-user-phone1="${ user.admMobile1 }"
										data-user-phone2="${ user.admMobile2 }"
										data-user-phone3="${ user.admMobile3 }"
										data-user-email="${ user.admEmail }" href="javascript:void(0);">${file.fileOriginNm }</a>
	                			
             				</c:if>
               				</c:forEach>
						</p>
					</div>
				</div>
			</div>
			<div class="ComWriteBox">
				<c:if test="${exStat eq 'RD'}">
					<div class="ComBoardNotInfo">
						<p>전문위원회 개회전 입니다.<br>개회 이후 검토 의견 작성이 가능 합니다.</p>
					</div>
				</c:if>
				
				<c:if test="${exStat eq 'EN'}">
					<div class="ComBoardNotInfo">
						<p>전문위원회가 종료되었습니다.<br>현재 자료 열람만 가능 합니다.</p>
					</div>
				</c:if>
				<c:if test="${exStat eq 'CO'}">
					<div class="ComBoardNotInfo">
						<p>전문위원회가 종료되었습니다.<br>현재 자료 열람만 가능 합니다.</p>
					</div>
				</c:if>
				<c:if test="${exStat eq 'IN'}">
					<div class="ComBoradFrom" >
						<c:if test="${ agdData.rcptTypeCode eq '01'}">
		             		<div class="FormTitbox">
								<p class="FormTit01">① 신청기술의 기술적 가치</p>
							</div>
							<div class="OpinionBox BoxLast">
								<p class="FormTit02">신청기술의 특성·용도 및 성능 등</p>
								<textarea name="opinion101" 
									id="comment" 
									rows="4"
									class="OpinionText OpinionText01" 
									placeholder="검토의견을 작성해주세요.">${ opinionData.committeeOpt01 }</textarea>
							</div>
							<div class="FormTitbox">
								<p class="FormTit01">② 신청기술의 시장성·경쟁력 수준</p>
							</div>
							<div class="OpinionBox BoxLast">
								<p class="FormTit01">신청기술을 사용한 관련 제품의 시장규모와 경쟁력 수준 등</p>
								<textarea name="opinion101" id="comment" rows="4" class="OpinionText OpinionText02" placeholder="검토의견을 작성해주세요.">${ opinionData.committeeOpt02 }</textarea>
							</div>
						</c:if>
						<c:if test="${ agdData.rcptTypeCode eq '11'}">
		             		<div class="FormTitbox">
								<p class="FormTit01">① 기타 검토 의견</p>
							</div>
							<div class="OpinionBox BoxLast">
								<textarea name="opinion101" 
									id="comment" 
									rows="4"
									class="OpinionText OpinionText01" 
									placeholder="검토의견을 작성해주세요.">${ opinionData.committeeOpt01 }</textarea>
							</div>
						</c:if>
						<c:if test="${ agdData.rcptTypeCode eq '02' or agdData.rcptTypeCode eq '03' or agdData.rcptTypeCode eq '05' or agdData.rcptTypeCode eq '06' or agdData.rcptTypeCode eq '07'}">
							<div class="FormTitbox">
								<p class="FormTit01">① 국가안보 및 국민 경제에 미치는 파급효과</p>
							</div>
							<div class="OpinionBox BoxLast">
								<p class="FormTit02">1.국가안보측면</p>
								<div class="FormTit03">
									<p>- 국방·치안 등 <!-- <a href="" class="FormTit03Guide">?</a> --></p>
									<!-- <div class="FormTip01">
										<p>*세부심의기준</p>
										<ul class="FormTipList">
											<li>① 타 법령 등에 의해 기술 등의 수출이나 M&A 등이 제한되는지 여부(전략물자, 방산물자 등)</li>
											<li>② 수출․M&A 대상 기술의 국방상 중요성</li>
											<li>③ 안보위협 국가로의 수출․M&A 여부</li>
										</ul>
									</div> -->
								</div>
								<textarea name="opinion101" id="comment" rows="4" class="OpinionText OpinionText01" placeholder="검토의견을 작성해주세요.">${ opinionData.committeeOpt01 }</textarea>
								<p class="FormTit03">- 해당 기술분야</p>
								<textarea name="opinion101" id="comment" rows="4" class="OpinionText OpinionText02" placeholder="검토의견을 작성해주세요.">${ opinionData.committeeOpt02 }</textarea>
								<p class="FormTit02">- 전체 산업</p>
								<textarea name="opinion101" id="comment" rows="4" class="OpinionText OpinionText03" placeholder="검토의견을 작성해주세요.">${ opinionData.committeeOpt03 }</textarea>
								<p class="FormTit02">- 국가경제 기반</p>
								<textarea name="opinion101" id="comment" rows="4" class="OpinionText OpinionText04" placeholder="검토의견을 작성해주세요.">${ opinionData.committeeOpt04 }</textarea>
								<p class="FormTit02">- 기타 중요한 사항</p>
								<textarea name="opinion101" id="comment" rows="4" class="OpinionText OpinionText05" placeholder="검토의견을 작성해주세요.">${ opinionData.committeeOpt05 }</textarea>
							</div>
						</c:if>
						<c:if test="${ agdData.rcptTypeCode eq '04' }">
							<div class="FormTitbox">
								<p class="FormTit01">① 국가안보 및 국민 경제에 미치는 파급효과</p>
							</div>
							<div class="OpinionBox ">
								<p class="FormTit02">1.국가안보측면</p>
								<div class="FormTit03">
									<p>- 국방·치안 등 <!-- <a href="" class="FormTit03Guide">?</a> --></p>
									<!-- <div class="FormTip01">
										<p>*세부심의기준</p>
										<ul class="FormTipList">
											<li>① 타 법령 등에 의해 기술 등의 수출이나 M&A 등이 제한되는지 여부(전략물자, 방산물자 등)</li>
											<li>② 수출․M&A 대상 기술의 국방상 중요성</li>
											<li>③ 안보위협 국가로의 수출․M&A 여부</li>
										</ul>
									</div> -->
								</div>
								<textarea name="opinion101" id="comment" rows="4" class="OpinionText OpinionText01" placeholder="검토의견을 작성해주세요.">${ opinionData.committeeOpt01 }</textarea>
								<p class="FormTit03">- 해당 기술분야</p>
								<textarea name="opinion101" id="comment" rows="4" class="OpinionText OpinionText02" placeholder="검토의견을 작성해주세요.">${ opinionData.committeeOpt02 }</textarea>
								<p class="FormTit02">- 전체 산업</p>
								<textarea name="opinion101" id="comment" rows="4" class="OpinionText OpinionText03" placeholder="검토의견을 작성해주세요.">${ opinionData.committeeOpt03 }</textarea>
								<p class="FormTit02">- 국가경제 기반</p>
								<textarea name="opinion101" id="comment" rows="4" class="OpinionText OpinionText04" placeholder="검토의견을 작성해주세요.">${ opinionData.committeeOpt04 }</textarea>
								<p class="FormTit02">- 기타 중요한 사항</p>
								<textarea name="opinion101" id="comment" rows="4" class="OpinionText OpinionText05" placeholder="검토의견을 작성해주세요.">${ opinionData.committeeOpt05 }</textarea>
							</div>
							<div class="OpinionBox BoxLast">
								<p class="FormTit02">2.국민경제 축면</p>
								<p class="FormTit03">- 국가 경제에 미치는 영향 등</p>
								<textarea name="opinion101" id="comment" rows="4" class="OpinionText OpinionText06" placeholder="검토의견을 작성해주세요.">${ opinionData.committeeOpt06 }</textarea>
								<p class="FormTit03">- 기타사항</p>
								<textarea name="opinion101" id="comment" rows="4" class="OpinionText OpinionText07" placeholder="검토의견을 작성해주세요.">${ opinionData.committeeOpt07 }</textarea>
							</div>
						</c:if>
						
						
						
						<c:if test="${ agdData.rcptTypeCode eq '01'  }">
							<div class="FormTitbox" style="margin-top:10px;">
								<p class="FormTit01">③ 종합의견</p>
							</div>
						</c:if>
						
						<c:if test="${ agdData.rcptTypeCode eq '02' or agdData.rcptTypeCode eq '03' or agdData.rcptTypeCode eq '04' or agdData.rcptTypeCode eq '05' or agdData.rcptTypeCode eq '06' or agdData.rcptTypeCode eq '07' or agdData.rcptTypeCode eq '11'}">
							<div class="FormTitbox" style="margin-top:10px;">
								<p class="FormTit01">② 종합의견</p>
							</div>
						</c:if>
						<c:if test="${ agdData.rcptTypeCode ne '11'}">
							<div class="FormInfo">
							<c:if test="${ agdData.rcptTypeCode eq '01'}">
								<p class="FormInfo03">
									종합의견을 기술하되, 신청기술이 국가핵심기술 해당여부(해당/미해당)에 대해 명확히 선택 
									<span class="InfoMentSub">(국가핵심기술에 속한다고 판단될 경우, 고시 기준, 해당 국가핵심기술名 선택)</span>
								</p>
							</c:if>
							<c:if test="${ agdData.rcptTypeCode eq '03' or agdData.rcptTypeCode eq '06' }">
								<p class="FormInfo03">
									국가안보 측면의 검토에 대해 종합의견을 기술하되, 국가핵심기술 수출의 여부(수리/불수리)에 대해 명확히 선택<br>
									<span class="InfoMentSub">(국가핵심기술에 속한다고 판단될 경우, 고시 기준, 해당 국가핵심기술名 선택)</span>
								</p>
							</c:if>
							<c:if test="${ agdData.rcptTypeCode eq '04' }">
								<p class="FormInfo03">
									① + ②의 검토에 대해 종합의견을 기술하되, 국가핵심기술 수출의 여부(승인/불승인)에 대해 명확히 선택<br>
									<span class="InfoMentSub">(국가핵심기술에 속한다고 판단될 경우, 고시 기준, 해당 국가핵심기술名 선택)</span>
								</p>
							</c:if>
							<c:if test="${ agdData.rcptTypeCode eq '07' }">
								<p class="FormInfo03">
									국가안보 측면의 검토에 대해 종합의견을 기술하되, 국가핵심기술 수출의 여부(승인/불승인)에 대해 명확히 선택<br>
									<span class="InfoMentSub">(국가핵심기술에 속한다고 판단될 경우, 고시 기준, 해당 국가핵심기술名 선택)</span>
								</p>
							</c:if>
							<c:if test="${ agdData.rcptTypeCode eq '01'}">
								<ul class="TechAreaType" data-pageidx="${ agdCode }">
									<li class="${ opinionData.committeeOptFlag eq 'F003' ? 'SelOn' : '' }"><a href="javascript:void(0);" class="TechAreaTypeItem" data-type="F003">해당</a></li>
									<li class="${ opinionData.committeeOptFlag eq 'F004' ? 'SelOn' : '' }"><a href="javascript:void(0);" class="TechAreaTypeItem" data-type="F004">미해당</a></li>
									<li class="${ opinionData.committeeOptFlag eq 'F011' ? 'SelOn' : '' }"><a href="javascript:void(0);" class="TechAreaTypeItem" data-type="F011">재검토</a></li>
									<li class="${ opinionData.committeeOptFlag eq 'F003' ? 'F012' : '' }"><a href="javascript:void(0);" class="TechAreaTypeItem" data-type="F012">기타</a></li>
								</ul>
							</c:if>
							<c:if test="${ agdData.rcptTypeCode eq '03' or agdData.rcptTypeCode eq '06' }">
								<ul class="TechAreaType" data-pageidx="${ agdCode }">
									<li class="${ opinionData.committeeOptFlag eq 'F005' ? 'SelOn' : '' }"><a href="javascript:void(0);" class="TechAreaTypeItem" data-type="F005">수리</a></li>
									<li class="${ opinionData.committeeOptFlag eq 'F006' ? 'SelOn' : '' }"><a href="javascript:void(0);" class="TechAreaTypeItem" data-type="F006">불수리</a></li>
									<li class="${ opinionData.committeeOptFlag eq 'F007' ? 'SelOn' : '' }"><a href="javascript:void(0);" class="TechAreaTypeItem" data-type="F007">조건부 수리</a></li>
									<li class="${ opinionData.committeeOptFlag eq 'F014' ? 'SelOn' : '' }"><a href="javascript:void(0);" class="TechAreaTypeItem" data-type="F014">일부 수리</a></li>
									<li class="${ opinionData.committeeOptFlag eq 'F011' ? 'SelOn' : '' }"><a href="javascript:void(0);" class="TechAreaTypeItem" data-type="F011">재검토</a></li>
									<li class="${ opinionData.committeeOptFlag eq 'F012' ? 'SelOn' : '' }"><a href="javascript:void(0);" class="TechAreaTypeItem" data-type="F012">기타</a></li>
								</ul>
							</c:if>
							<c:if test="${ agdData.rcptTypeCode eq '04' or agdData.rcptTypeCode eq '07' }">
								<ul class="TechAreaType" data-pageidx="${ agdCode }">
									<li class="${ opinionData.committeeOptFlag eq 'F008' ? 'SelOn' : '' }"><a href="javascript:void(0);" class="TechAreaTypeItem" data-type="F008">승인</a></li>
									<li class="${ opinionData.committeeOptFlag eq 'F009' ? 'SelOn' : '' }"><a href="javascript:void(0);" class="TechAreaTypeItem" data-type="F009">불승인</a></li>
									<li class="${ opinionData.committeeOptFlag eq 'F010' ? 'SelOn' : '' }"><a href="javascript:void(0);" class="TechAreaTypeItem" data-type="F010">조건부 승인</a></li>
									<li class="${ opinionData.committeeOptFlag eq 'F013' ? 'SelOn' : '' }"><a href="javascript:void(0);" class="TechAreaTypeItem" data-type="F013">일부 승인</a></li>
									<li class="${ opinionData.committeeOptFlag eq 'F011' ? 'SelOn' : '' }"><a href="javascript:void(0);" class="TechAreaTypeItem" data-type="F011">재검토</a></li>
									<li class="${ opinionData.committeeOptFlag eq 'F012' ? 'SelOn' : '' }"><a href="javascript:void(0);" class="TechAreaTypeItem" data-type="F012">기타</a></li>
								</ul>
							</c:if>
							<c:if test="${agdData.rcptTypeCode ne '02' or agdData.rcptTypeCode ne '05'}">
								<div class="TechAreaSelBox">
									<ul class="TechAreaSelList">
										<c:forEach items="${techAreaList}" var="techarea" varStatus="status">
											<li class="${ opinionData.techItemId eq techarea.techItemId ? 'SelOn' : '' }">
												<a href="javascript:void(0);" data-tech-ntc-gid="${techarea.techNtcGid}" data-tech-id="${techarea.techId}" data-tech-item-id="${techarea.techItemId}" class="TechAreaSelListItem">
												${techarea.techItemName}
											</a>
										</c:forEach>
										
									</ul>
									<div class="TechSelListBtn">
										<a href="javascript:void(0);" class="TechSelListClosedBtn">기술 범위 선택 리스트 닫기</a>
										<a href="javascript:void(0);" class="TechSelListOpenBtn">기술 범위 선택 리스트 더보기</a>
									</div>
								</div>
							</c:if>
							</div>
						</c:if>
						<div class="OpinionBox BoxLast" >
							<textarea name="opinion101" id="comment" rows="4" class="GeneralOpinionText OpinionText" placeholder="검토의견을 작성해주세요.">${ opinionData.committeeOptGeneral }</textarea>
						</div>
						<div class="FormInfo02">
							<c:if test="${ agdData.rcptTypeCode eq '01'}">
								<p>「산업기술보호법」제2조(정의) 2. “국가핵심기술”이라 함은 국내외 시장에서 차지하는 기술적·경제적 가치가 높거나 관련 산업의 성장잠재력이 높아 해외로 유출될 경우에 국가의 안전보장 및 국민경제의 발전에 중대한 악영향을 줄 우려가 있는 기술로서 제9조의 규정에 따라 지정된 것을 말함.</p>
							</c:if>
							<c:if test="${ agdData.rcptTypeCode eq '03' or agdData.rcptTypeCode eq '04'}">
								<p>「산업기술보호법」제11조(국가핵심기술의 수출 등) ⑤ 산업통상자원부장관은 제4항의 신고대상인 국가핵심기술의 수출이 국가안보에 심각한 영향을 줄 수 있는 경우에는 관계중앙행정기관의 장과 협의한 후 위원회의 심의를 거쳐 국가핵심기술의 수출중지·수출금지·원상회복 등의 조치를 명할 수 있다.</p>
							</c:if>	
							<c:if test="${ agdData.rcptTypeCode eq '11'}">
								<p>산업기술보호법」제9조(국가핵심기술의 지정·변경 및 해제 등) ③ 산업통상자원부장관은 국가핵심기술의 범위 또는 내용의 변경이나 지정의 해제가 필요하다고 인정되는 기술을 선정하거나 관계 중앙행정기관의 장으로부터 그 소관의 국가핵심기술의 범위 또는 내용의 변경이나 지정의 해제를 요청받은 경우에는 위원회 심의를 거쳐 변경 또는 해제할 수 있다. </p>
							</c:if>
						</div>
						<div class="ComBoradBtn">
							<c:if test="${opinionData.committeeOptStatus eq 'PW'}">
								<a href="#none" class="btn ImSave" data-pageidxs="${ agdCode }" data-agdtype="${ agdData.rcptTypeCode}">임시 저장</a>
							</c:if>
							<c:if test="${opinionData.committeeOptStatus eq 'TS'}">
								<a href="#none" class="btn ImSave" data-pageidxs="${ agdCode }" data-agdtype="${ agdData.rcptTypeCode}">임시 저장</a>
							</c:if>
							<a href="#none" class="btn OpSave" data-pageidxs="${ agdCode }" data-agdtype="${ agdData.rcptTypeCode}">의견 제출</a> 
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</div>