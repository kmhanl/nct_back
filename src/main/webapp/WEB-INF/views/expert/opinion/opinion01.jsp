<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="Page${ agdCode }" class="ComBrowserPage " data-pageIdx="${ agdCode }" style="">
	<input type="hidden" name="committeeIdx" id="committeeIdx" value="${ agdData.agdExIdx }">
	<input type="hidden" name="PageOpen" id="PageOpen" value="Y">
	<input type="hidden" name="PageIdx" id="PageIdx" value="${ agdCode }">
	<input type="hidden" name="PageModi" id="PageModi" value="N">
	
		<div class=BrowserAgdViewer>
			<div class="AgendaTopInfo">
            	<div class="AgendaTechType">
				<!--접수 분야 : 시작 kaits_receipt RCPT_TYPE_CODE // 01:여부판정 02:사전검토 03:수출신고 04:수출승인 05:해외인수·합병 사전검토 06:해외인수·합병 신고 07:해외인수·합병 승인 08:지정 09:변경 10:해제 11:기타-->
					<p class="type_icon">
						<svg class="svg-inline--fa fa-balance-scale fa-w-20" aria-hidden="true" data-prefix="fas" data-icon="balance-scale" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" data-fa-i2svg=""><path fill="currentColor" d="M256 336h-.02c0-16.18 1.34-8.73-85.05-181.51-17.65-35.29-68.19-35.36-85.87 0C-2.06 328.75.02 320.33.02 336H0c0 44.18 57.31 80 128 80s128-35.82 128-80zM128 176l72 144H56l72-144zm511.98 160c0-16.18 1.34-8.73-85.05-181.51-17.65-35.29-68.19-35.36-85.87 0-87.12 174.26-85.04 165.84-85.04 181.51H384c0 44.18 57.31 80 128 80s128-35.82 128-80h-.02zM440 320l72-144 72 144H440zm88 128H352V153.25c23.51-10.29 41.16-31.48 46.39-57.25H528c8.84 0 16-7.16 16-16V48c0-8.84-7.16-16-16-16H383.64C369.04 12.68 346.09 0 320 0s-49.04 12.68-63.64 32H112c-8.84 0-16 7.16-16 16v32c0 8.84 7.16 16 16 16h129.61c5.23 25.76 22.87 46.96 46.39 57.25V448H112c-8.84 0-16 7.16-16 16v32c0 8.84 7.16 16 16 16h416c8.84 0 16-7.16 16-16v-32c0-8.84-7.16-16-16-16z"></path></svg>
					</p>
					<p class="type_tit">${ agdData.rcptTypeCodeName }</p>
				<!-- 접수 분야 : 끝-->
				</div>
             	<div class="AgendaNumBox">
             		<span class="AgendaNumlabel">안건번호</span>
             		<p class="AgendaNum">${ agdData.agdViewCode }</p>
             		<!-- kaits_receipt RCPT_IDX-->
             	</div>
             	<div class="AgendaComBox">
             		<span class="AgendaComlabel">신청 기업</span>
             		<p class="AgendaCom">${ agdData.cpnNm }</p>
             		<!-- kaits_receipt RCPT_IDX-->
             	</div>
             </div>
             <div class="AgendaDetailBox" style="clear:both">
             	<%-- <div class="AgendaDetailTit">
             		<p class="Tit01">기술 명칭</p>
             	</div>
             	<div class="AgendaDetailCon">
             		<ul class="TechNameList">
             			<!-- 기술 명칭이 n개인 경우 li요소 추가 -->
             			<li>
             				<p class="TechTypeArea">
		             			<span class="TechTypeFlag">${ agdData.techName }</span>
		             			<span class="">${ agdData.techItemName }</span>
		             		</p>
		             		<p class="TechName">${ agdData.techRcptTechNm }</p>
             			</li> --%>
<!--              			<li> -->
<!--              				<p class="TechTypeArea"> -->
<!-- 		             			<span class="TechTypeFlag">자동차ㆍ철도</span> -->
<!-- 		             			<span class="">30나노 이하급 D램에 해당되는 조립‧검사기술30나노 이하급 D램에 해당되는 조립‧검사기술30나노 이하급 D램에 해당되는 조립‧검사기술</span> -->
<!-- 		             		</p> -->
<!-- 		             		<p class="TechName">신청기술명칭 신청 기술명칭 신청기술명칭 신청 기술명칭신청기술명칭 신청 기술명칭 신청기술명칭 신청 기술명칭신청기술명칭 신청 기술명칭 신청기술명칭 신청 기술명칭</p> -->
<!--              			</li> -->
             		<%-- </ul>
             	</div>
             	<div class="AgendaDetailTit">
             		<p class="Tit01">기술 형태</p>
             	</div>
             	<div class="AgendaDetailCon">
             		<p class="AgendaDetailItem">
						${ agdData.rcptTechForm }
             		</p>
             	</div>
             	<div class="AgendaDetailTit">
             		<p class="Tit01">기술 특성</p>
             	</div>
             	<div class="AgendaDetailCon">
             		<p class="AgendaDetailItem">
             			${ agdData.rcptTechQua }
             		</p>
             	</div>
             	<div class="AgendaDetailTit">
             		<p class="Tit01">신청사유</p>
             	</div>
             	<div class="AgendaDetailCon">
             		<p class="AgendaDetailItem">
             			${ agdData.rcptReason }
             		</p>
             	</div> --%>
				<div class="detail_content">
                	<h2 class="info_tit">신청 내용</h2>
                	<div class="receipt_info">
                		<div class="info_section">
                			<div class="section_box_03 default">
	                			<p class="section_label">기술명칭</p>
	                			<ul class="TechNameList">
			             			<!-- 기술 명칭이 n개인 경우 li요소 추가 -->
			             			<li>
			             				<p class="TechTypeArea">
					             			<span class="TechTypeFlag">${ agdData.techName }</span>
					             			<span class="">${ agdData.techItemName }</span>
					             		</p>
					             		<p class="TechName">${ agdData.techRcptTechNm }</p>
			             			</li>
			<!--              			<li> -->
			<!--              				<p class="TechTypeArea"> -->
			<!-- 		             			<span class="TechTypeFlag">자동차ㆍ철도</span> -->
			<!-- 		             			<span class="">30나노 이하급 D램에 해당되는 조립‧검사기술30나노 이하급 D램에 해당되는 조립‧검사기술30나노 이하급 D램에 해당되는 조립‧검사기술</span> -->
			<!-- 		             		</p> -->
			<!-- 		             		<p class="TechName">신청기술명칭 신청 기술명칭 신청기술명칭 신청 기술명칭신청기술명칭 신청 기술명칭 신청기술명칭 신청 기술명칭신청기술명칭 신청 기술명칭 신청기술명칭 신청 기술명칭</p> -->
			<!--              			</li> -->
			             		</ul>
	                		</div>
                		</div>
                		<div class="info_section">
                			<div class="section_box_03 default">
	                			<p class="section_label">기술형태</p>
	                			<p class="section_item" style="white-space:pre-line;">
	                			${ agdData.rcptTechForm }
	                			</p>
                			</div>
                		</div>
                		<div class="info_section">
                			<div class="section_box_03 default">
	                			<p class="section_label">기술특성</p>
	                			<p class="section_item" style="white-space:pre-line;">
	                			${ agdData.rcptTechQua }
	                			</p>
                			</div>
                		</div>
              		<!-- ** 신청사유: 여부판정(01), 지정(08), 변경(09), 해제(10), 기타(11)  -->
                		
                		<div class="info_section">
                			<div class="section_box_03 default">
	                			<p class="section_label" "="">신청사유</p>
	                			<p class="section_item" style="white-space:pre-line;">
	                			${ agdData.rcptReason }
	                			 </p>
                			</div>
                		</div>
                		
              		<!-- ** 신고사유: 해외인수-합병 신고(06)  -->
                		
              		<!-- ** 승인신청사유: 해외인수-합병 승인(07)  -->
                		
              		<!-- ** 수출사유/수출예정일: 사전검토(02), 수출신고(03), 수출승인(04)  -->
                		
              		<!-- ** 대상국: 사전검토(02), 수출신고(03), 수출승인(04), 해외인수-합병 사전검토(05), 해외인수-합병 신고(06), 해외인수-합병 승인(07) -->
                		
              		<!--  ** 신청공문 파일 조회 -->
                		<div class="info_section file_section">
                			<div class="section_box_03 default">
               					<p class="section_label">신청 공문</p>
             					<a href="http://211.42.198.36:8090/SynapDocViewServer/viewer/doc.html?key=785251e7198c43dfa8da15d211612948&convType=img&convLocale=ko_KR&contextPath=/SynapDocViewServer" target="_blank">
             					02_접수 공문 테스트.pdf
             					</a>
                			</div>
                		</div>
              		<!--  ** 신청서 파일 조회 -->
                		<div class="info_section file_section">
                			<div class="section_box_03 default">
               					<p class="section_label">신청서 파일</p>
               					<a href="http://211.42.198.36:8090/SynapDocViewServer/viewer/doc.html?key=40599998aebf435195f388c8d65ed598&convType=img&convLocale=ko_KR&contextPath=/SynapDocViewServer" target="_blank">
             					01_접수 신청서 테스트.pdf
             					</a>
             				
                			</div>
                		</div>
              		<!--  ** 첨부 파일 조회 -->
                		<div class="info_section file_section">
                			<div class="section_box_03 default">
	                			<p class="section_label">첨부 서류</p>
                				<a href="http://211.42.198.36:8090/SynapDocViewServer/viewer/doc.html?key=411bd3a99ba64152909d7938dba98212&convType=html&convLocale=ko_KR&contextPath=/SynapDocViewServer" target="_blank">
             					03_국가핵심기술_종합관리시스템_보유기술등록_프로세스_20220629.pptx
             					</a><br>
             					<a href="http://211.42.198.36:8090/SynapDocViewServer/viewer/doc.html?key=3cb9de2c4eb24cdc9fb0f953836c362d&convType=html&convLocale=ko_KR&contextPath=/SynapDocViewServer" target="_blank">
             					04_전문위원회_첨부파일_테스트.docx
             					</a><br>
             					<a href="http://211.42.198.36:8090/SynapDocViewServer/viewer/doc.html?key=989ee2bf7bb94085b0efc5069f243031&convType=img&convLocale=ko_KR&contextPath=/SynapDocViewServer" target="_blank">
             					05_전문위원회_첨부파일_테스트.pdf
             					</a>
             					
                			</div>
                		</div>
                	</div>
                	<h2 class="info_tit">신청인 정보</h2>
	                	<div class="receipt_company_info">
	                		<div class="info_section">
	                			<div class="section_box_03 comname">
		                			<p class="section_label">기관명</p>
		                			<p class="section_item">테스트기업</p>
	                			</div>
	                			<div class="section_box_03 comceo">
		                			<p class="section_label">대표명</p>
		                			<p class="section_item">홍길동</p>
	                			</div>
	                			<div class="section_box_03 comnum">
		                			<p class="section_label">사업자등록번호</p>
		                			<p class="section_item">1630111111</p>
	                			</div>
	                		</div>
	                		<div class="info_section">
	                			<div class="section_box_03 comadd">
		                			<p class="section_label">본사 소재지</p>
		                			<p class="section_item">서울 마포구 독막로3길 13</p>
	                			</div>
	                			<div class="section_box_03 comphone">
		                			<p class="section_label">본사전화번호</p>
		                			<p class="section_item">02-1234-5678</p>
	                			</div>
	                			
	                		</div>
	                		<div class="info_section">
	                			<div class="section_box_03 comadd">
		                			<p class="section_label">사업장 소재지</p>
		                			<p class="section_item">서울 마포구 독막로3길 13</p>
	                			</div>
	                			<div class="section_box_03 comphone">
		                			<p class="section_label">본사전화번호</p>
		                			<p class="section_item">02-1234-5678</p>
	                			</div>
	                		</div>
	                	</div>
                </div>
             </div>
        </div>
		<div class="ComWriteBox">
			<div class="ComBoradTit">
				<h1>국가핵심기술 여부 판정 검토 의견서</h1> 
			</div>
			<div class="ComBoradFrom">
				<!-- <p class="FormTip"><span></span>색 부분을 모두 작성해주세요.</p> -->
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
				<div class="FormTitbox">
					<p class="FormTit01">③ 종합의견</p>
				</div>
				<div class="FormInfo">
					<p class="Infoment01">
						* 종합의견을 기술하되, 신청기술이 국가핵심기술 해당여부(해당/미해당)에 대해 명확히 선택<br>
						<span class="InfoMentSub">(국가핵심기술에 속한다고 판단될 경우, 고시 기준, 해당 국가핵심기술名 선택)</span>
					</p>
					<ul class="TechAreaType" data-pageidx="${ agdCode }">
						<li class="${ opinionData.committeeOptFlag eq 'F003' ? 'SelOn' : '' }"><a href="javascript:void(0);" class="TechAreaTypeItem" data-type="F003">해당</a></li>
						<li class="${ opinionData.committeeOptFlag eq 'F004' ? 'SelOn' : '' }"><a href="javascript:void(0);" class="TechAreaTypeItem" data-type="F004">미해당</a></li>
						<li class="${ opinionData.committeeOptFlag eq 'F011' ? 'SelOn' : '' }"><a href="javascript:void(0);" class="TechAreaTypeItem" data-type="F011">재검토</a></li>
						<li class="${ opinionData.committeeOptFlag eq 'F003' ? 'F012' : '' }"><a href="javascript:void(0);" class="TechAreaTypeItem" data-type="F012">기타</a></li>
					</ul>
					<div class="TechAreaSelBox">
						<ul class="TechAreaSelList">
							<li class="${ opinionData.techItemId eq 'NCT_KTS00701_001' ? 'SelOn' : '' }">
								<a href="#none" data-tech-item-id="NCT_KTS00701_001" data-tech-ntc-gid="NTC_2021_0001" data-tech-id="KTS00701" data-tech-item-id="NCT_KTS00701_001" class="TechAreaSelListItem">
								30나노 이하급 D램에 해당되는 설계·공정·소자기술 및 3차원 적층형성 기술
								</a>
							</li>
							<li class="${ opinionData.techItemId eq 'NCT_KTS00701_002' ? 'SelOn' : '' }">
								<a href="#none" data-tech-item-id="NCT_KTS00701_002" data-tech-ntc-gid="NTC_2021_0001" data-tech-id="KTS00701" class="TechAreaSelListItem">
								D램에 해당되는 적층조립기술 및 검사기술
								</a>
							</li>
							<li class="${ opinionData.techItemId eq 'NCT_KTS00701_003' ? 'SelOn' : '' }">
								<a href="#none" data-tech-item-id="NCT_KTS00701_003" data-tech-ntc-gid="NTC_2021_0001" data-tech-id="KTS00701" class="TechAreaSelListItem">
								30나노 이하급 또는 적층 3D 낸드플래시에 해당되는 설계·공정·소자 기술
								</a>
							</li>
							<li class="${ opinionData.techItemId eq 'NCT_KTS00701_004' ? 'SelOn' : '' }">
								<a href="#none" data-tech-item-id="NCT_KTS00701_004" data-tech-ntc-gid="NTC_2021_0001" data-tech-id="KTS00701" class="TechAreaSelListItem">
								낸드플래시에 해당되는 적층조립기술 및 검사기술
								</a>
							</li>
							<li class="${ opinionData.techItemId eq 'NCT_KTS00701_005' ? 'SelOn' : '' }">
								<a href="#none" data-tech-item-id="NCT_KTS00701_005" data-tech-ntc-gid="NTC_2021_0001" data-tech-id="KTS00701" class="TechAreaSelListItem">
								30나노급 이하 파운드리에 해당되는 공정·소자기술 및 3차원 적층형성 기술
								</a>
							</li>
							<li class="${ opinionData.techItemId eq 'NCT_KTS00701_006' ? 'SelOn' : '' }">
								<a href="#none" data-tech-item-id="NCT_KTS00701_006" data-tech-ntc-gid="NTC_2021_0001" data-tech-id="KTS00701" class="TechAreaSelListItem">
								모바일 Application Processor SoC 설계·공정기술</a>
							</li>
							<li class="${ opinionData.techItemId eq 'NCT_KTS00701_007' ? 'SelOn' : '' }">
								<a href="#none" data-tech-item-id="NCT_KTS00701_007" data-tech-ntc-gid="NTC_2021_0001" data-tech-id="KTS00701" class="TechAreaSelListItem">
								LTE/LTE_adv/5G Baseband Modem 설계기술
								</a>
							</li>
							<li class="${ opinionData.techItemId eq 'NCT_KTS00701_009' ? 'SelOn' : '' }">
								<a href="#none" data-tech-item-id="NCT_KTS00701_008" data-tech-ntc-gid="NTC_2021_0001" data-tech-id="KTS00701" class="TechAreaSelListItem">
								대구경(300mm 이상) 반도체 웨이퍼 제조를 위한 단결정 성장 기술
								</a>
							</li>
							<li class="${ opinionData.techItemId eq 'NCT_KTS00701_009' ? 'SelOn' : '' }">
								<a href="#none" data-tech-item-id="NCT_KTS00701_009" data-tech-ntc-gid="NTC_2021_0001" data-tech-id="KTS00701" class="TechAreaSelListItem">
								픽셀 1㎛ 이하 이미지센서 설계·공정·소자 기술
								</a>
							</li>
							<li class="${ opinionData.techItemId eq 'NCT_KTS00701_010' ? 'SelOn' : '' }">
								<a href="#none" data-tech-item-id="NCT_KTS00701_010" data-tech-ntc-gid="NTC_2021_0001" data-tech-id="KTS00701" class="TechAreaSelListItem">
								시스템반도체용 첨단 패키지 (FO-WLP, FO-PLP, FO-PoP 등) 조립·검사 기술
								</a>
							</li>
							<li class="${ opinionData.techItemId eq 'NCT_KTS00701_011' ? 'SelOn' : '' }">
								<a href="#none" data-tech-item-id="NCT_KTS00701_011" data-tech-ntc-gid="NTC_2021_0001" data-tech-id="KTS00701" class="TechAreaSelListItem">
								HD급 이상의 디스플레이 패널 구동을 위한 DDI(Display Driver IC) 설계 및 제조기술
								</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="OpinionBox BoxLast" >
					<textarea name="opinion101" id="comment" rows="4" class="GeneralOpinionText OpinionText OpinionText03" placeholder="검토의견을 작성해주세요.">${ opinionData.committeeOptGeneral }</textarea>
				</div>
				<div class="FormInfo02">
					<p>「산업기술보호법」제2조(정의) 2. “국가핵심기술”이라 함은 국내외 시장에서 차지하는 기술적·경제적 가치가 높거나 관련 산업의 성장잠재력이 높아 해외로 유출될 경우에 국가의 안전보장 및 국민경제의 발전에 중대한 악영향을 줄 우려가 있는 기술로서 제9조의 규정에 따라 지정된 것을 말함.</p>
				</div>
				<div class="ComBoradBtn">
					<a href="#none" class="btn ImSave" data-pageidxs="${ agdCode }" data-agdtype="${ agdData.rcptTypeCode}">임시 저장</a>
					<a href="#none" class="btn OpSave" data-pageidxs="${ agdCode }" data-agdtype="${ agdData.rcptTypeCode}">의견 제출</a> 
				</div>
				
			</div>
			
		</div>
	
</div>