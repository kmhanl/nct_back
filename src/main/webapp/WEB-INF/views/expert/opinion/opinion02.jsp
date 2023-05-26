<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="Page${ agdCode }" class="ComBrowserPage " data-pageIdx="${ agdCode }" style="">
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
                		
                		
              		<!-- ** 신청사유: 여부판정(01), 지정(08), 변경(09), 해제(10), 기타(11)  -->
                		
                		
                		
              		<!-- ** 신고사유: 해외인수-합병 신고(06)  -->
                		
              		<!-- ** 승인신청사유: 해외인수-합병 승인(07)  -->
                		
              		<!-- ** 수출사유/수출예정일: 사전검토(02), 수출신고(03), 수출승인(04)  -->
                		
              		<!-- ** 대상국: 사전검토(02), 수출신고(03), 수출승인(04), 해외인수-합병 사전검토(05), 해외인수-합병 신고(06), 해외인수-합병 승인(07) -->
                		
              		<!--  ** 신청공문 파일 조회 -->
                		<div class="info_section file_section">
                			<div class="section_box_03 default">
               					<p class="section_label">신청 공문</p>
             					<a href="http://211.42.198.36:8090/SynapDocViewServer/viewer/doc.html?key=edba958a79854c958191994845106268&convType=img&convLocale=ko_KR&contextPath=/SynapDocViewServer" target="_blank">
             					접수 현황 공문 테스트.pdf
             					</a>
                			</div>
                		</div>
              		<!--  ** 신청서 파일 조회 -->
                		<div class="info_section file_section">
                			<div class="section_box_03 default">
               					<p class="section_label">신청서 파일</p>
               					<a href="http://211.42.198.36:8090/SynapDocViewServer/viewer/doc.html?key=62252b352d4d48a98d4000d8fb48aada&convType=img&convLocale=ko_KR&contextPath=/SynapDocViewServer" target="_blank">
             					접수 현황 신청서 테스트.pdf
             					</a>
             				
                			</div>
                		</div>
              		<!--  ** 첨부 파일 조회 -->
                		<div class="info_section file_section">
                			<div class="section_box_03 default">
	                			<p class="section_label">첨부 서류</p>
                				<a href="http://211.42.198.36:8090/SynapDocViewServer/viewer/doc.html?key=65b8767bf2da4033b934fb303d8a895e&convType=html&convLocale=ko_KR&contextPath=/SynapDocViewServer/" target="_blank">
             					국가핵심기술_종합관리시스템_보유기술등록_프로세스_20220629.pptx
             					</a><br>
             					<a href="http://211.42.198.36:8090/SynapDocViewServer/viewer/doc.html?key=65b8767bf2da4033b934fb303d8a895e&convType=html&convLocale=ko_KR&contextPath=/SynapDocViewServer/" target="_blank">
             					전문위원_테스트 계정.xlsx
             					</a><br>
             					<a href="http://211.42.198.36:8090/SynapDocViewServer/viewer/doc.html?key=03207a19c47e4c1cb6b2b7fe0ce7c4c5&convType=html&convLocale=ko_KR&contextPath=/SynapDocViewServer/" target="_blank">
             					전문위원회_첨부파일_테스트.docx
             					</a><br>
             					<a href="http://211.42.198.36:8090/SynapDocViewServer/viewer/doc.html?key=ad80e3752f3f4e52bd717c2b3865b3a2&convType=img&convLocale=ko_KR&contextPath=/SynapDocViewServer" target="_blank">
             					전문위원회_첨부파일_테스트.pdf
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
				<h1>국가핵심기술 사전검토 검토 의견서</h1> 
			</div>
			<div class="ComBoradFrom">
				<!-- <p class="FormTip"><span></span>색 부분을 모두 작성해주세요.</p> -->
				<div class="FormTitbox">
					<p class="FormTit01">① 국가안보 및 국민 경제에 미치는 파급효과</p>
				</div>
				<div class="OpinionBox">
					<p class="FormTit02">1.국가안보측면</p>
					<p class="FormTit03">- 국방·치안 등</p>
					<div class="FormTip01">
						<p>*세부심의기준</p>
						<ul class="FormTipList">
							<li>① 타 법령 등에 의해 기술 등의 수출이나 M&A 등이 제한되는지 여부(전략물자, 방산물자 등)</li>
							<li>② 수출․M&A 대상 기술의 국방상 중요성</li>
							<li>③ 안보위협 국가로의 수출․M&A 여부</li>
						</ul>
					</div>
					<textarea name="opinion101" id="comment" rows="4" class="OpinionText2" placeholder="검토의견을 작성해주세요."></textarea>
				</div>
				<div class="OpinionBox">
					<p class="FormTit03">- 해당 기술분야</p>
					<div class="FormTip01">
						<p>*세부심의기준</p>
						<ul class="FormTipList">
							<li>④ 해당기술 확보의 난이도 및 해당산업의 성장에 미치는 영향</li>
							<li>⑤ 해당 산업의 대외 경쟁력에 미치는 영향</li>
							<li>⑥ 경쟁국의 기술수준에 미치는 영향</li>
							<li>⑦ 수출대상국 등의 법령․당사자간 계약 등에 의해 향후 기술유출 가능성</li>
						</ul>
					</div>
					<textarea name="opinion101" id="comment" rows="4" class="OpinionText2" placeholder="검토의견을 작성해주세요."></textarea>
				</div>
				<div class="OpinionBox">
					<p class="FormTit02">- 전체 산업</p>
					<div class="FormTip01">
						<p>*세부심의기준</p>
						<ul class="FormTipList">
							<li>⑧ 연관산업 파급 효과</li>
							<li>⑨ 중요 인프라 등 사회기반에 미치는 영향</li>
						</ul>
					</div>
					<textarea name="opinion101" id="comment" rows="4" class="OpinionText2" placeholder="검토의견을 작성해주세요."></textarea>
				</div>
				<div class="OpinionBox">
					<p class="FormTit02">- 국가경제 기반</p>
					<div class="FormTip01">
						<p>*세부심의기준</p>
						<ul class="FormTipList">
							<li>⑩ 정부수입 감소, 투자, 기술손실 등에 대한 영향</li>
							<li>⑪ 중요한 자원조달의 장기 전망에 미치는 영향 등</li>
						</ul>
					</div>
					<textarea name="opinion101" id="comment" rows="4" class="OpinionText2" placeholder="검토의견을 작성해주세요."></textarea>
				</div>
				<div class="OpinionBox BoxLast">
					<p class="FormTit02">- 기타 중요한 사항</p>
					<div class="FormTip01">
						<p>*세부심의기준</p>
						<ul class="FormTipList">
							<li>⑫ 기술보호 대책의 적절성</li>
							<li>⑬ 기타 위원회에서 중요하다고 인정한 사항</li>
						</ul>
					</div>
					<textarea name="opinion101" id="comment" rows="4" class="OpinionText2" placeholder="검토의견을 작성해주세요."></textarea>
				</div>
				<div class="FormTitbox">
					<p class="FormTit01">② 종합의견</p>
				</div>
				<div class="OpinionBox BoxLast" >
					<textarea name="opinion101" id="comment" rows="4" class="OpinionText" placeholder="검토의견을 작성해주세요."></textarea>
				</div>
				<div class="FormInfo02">
					<p>「산업기술보호법」제11조(국가핵심기술의 수출 등) ⑤ 산업통상자원부장관은 제4항의 신고대상인 국가핵심기술의 수출이 국가안보에 심각한 영향을 줄 수 있는 경우에는 관계중앙행정기관의 장과 협의한 후 위원회의 심의를 거쳐 국가핵심기술의 수출중지·수출금지·원상회복 등의 조치를 명할 수 있다.</p>
				</div>
				<div class="ComBoradBtn">
					<a href="#none" class="btn ImSave" data-pageidxs="${ agdCode }" data-agdtype="${ agdData.rcptTypeCode}">임시 저장</a>
					<a href="#none" class="btn OpSave" data-pageidxs="${ agdCode }" data-agdtype="${ agdData.rcptTypeCode}">의견 제출</a> 
				</div>
				
			</div>
			
		</div>
	
</div>