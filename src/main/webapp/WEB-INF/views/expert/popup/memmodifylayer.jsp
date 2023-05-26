<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <div id="Dimmed_Layer_Warpper" class="Dimmed_Layer_Warpper">
		<div id="Layer_Content_Warpper" class="Layer_Content_Warpper Layer_Content_4010 committee_setup_popup" >
        	<div class="layer_popup_tit">
				<h1 class="layer_tit">전문위원회 구성</h1>
				<a href="javascript:void(0);" class="layer_closer"></a>
			</div>
			<div class="layer_popup_body" >
				<div class="LayerBodySection" style="height:100%">
					<div class="SectionTitleBox">
						<input type="hidden" name="stap_idx" class="stap_idx" id="stap_idx" value="1"> 
						<h1 class="TitleBoxTit">위원 구성 설정</h1>
					</div>
					<div class="SectionBarBox"></div>
					<div class="AgendaModiForm">
						<div class="top_information">
	                        <ul class="top_info_list">
	                            <li>*  위원회를 구성원을 설정해주세요.</li>
	                            <li>*  사무관 권한의 구성원은 위원회 열람만 가능 하며, 의견제출이 불가능 합니다.</li>
							</ul>
	                    </div>
	                    <div class="ComMemeberBox">
	                    	<div class="MemberTapBox">
	                    		<ul class=MemberTapList>
	                    			<li class="TapOn"><a href="#none" class="MemberTapItem">전문위원</a>
	                    			<li><a href="#none" class="MemberTapItem">기술위원</a>
	                    			<li><a href="#none" class="MemberTapItem">보호센터</a>
	                    			<li><a href="#none" class="MemberTapItem">소관과</a>
	                    		</ul> 
	                    	</div>
	                    	<div class="MemberListBox MemberListBox0">
	                    		<ul class="ComMemList">
								<c:forEach items="${memberList}"
									var="member"
									begin="0"
									end="${fn:length(memberList)}"
									varStatus="status">
									<c:if test="${member.admGroup eq 'AMG05'}">
	                    			<li class='ComMemItem ${member.committeeIdx ne null ? 'MemOn' : '' }"' data-id="${member.admId}">
										<input type='hidden' class='AgdYn' value='Y'>
										<div class='ComMemItem_top'>
											<div class='ComMemCard'>
												<p>
													<span class='ComMemName'>${member.admName }</span>
													<span>${member.admDept } / ${member.admPositon }</span>
													<span>${member.admCom }</span>
												</p>
												<p>
													<span class='ComMemInfo'>${member.admMobile1 }-${member.admMobile2 }-${member.admMobile3 } | ${member.admEmail }</span>
												</p>
											</div>
											<a href='#none' class='MemAgdYN MemAgdYNOn'>검토권한</a>
											<a href='#none' class='MemAgdChk'>상세설정</a>
										</div>
										<div class='MemAgendaCHListbox'>
											<ul class='MemAgendaCHList'>
											</ul>
										</div>
									</li>
									</c:if>
								</c:forEach>
	                    		</ul>
	                    	</div>
	                    	<div class="MemberListBox MemberListBox1">
	                    		<ul class="ComMemList">
								<c:forEach items="${memberList}"
									var="member"
									begin="0"
									end="${fn:length(memberList)}"
									varStatus="status">
									<c:if test="${member.admGroup eq 'AMG06' }">
	                    			<li class='ComMemItem ${member.committeeIdx ne null ? 'MemOn' : '' }"' data-id="${member.admId}">
										<input type='hidden' class='AgdYn' value='Y'>
										<div class='ComMemItem_top'>
											<div class='ComMemCard'>
												<p>
													<span class='ComMemName'>${member.admName }</span>
													<span>${member.admDept } / ${member.admPositon }</span>
													<span>${member.admCom }</span>
												</p>
												<p>
													<span class='ComMemInfo'>${member.admMobile1 }-${member.admMobile2 }-${member.admMobile3 } | ${member.admEmail }</span>
												</p>
											</div>
											<a href='#none' class='MemAgdYN MemAgdYNOn'>검토권한</a>
											<a href='#none' class='MemAgdChk'>상세설정</a>
										</div>
										<div class='MemAgendaCHListbox'>
											<ul class='MemAgendaCHList'>
											</ul>
										</div>
									</li>
									</c:if>
								</c:forEach>
	                    		</ul>
	                    	</div>
	                    	<div class="MemberListBox MemberListBox2">
	                    		<ul class="ComMemList">
								<c:forEach items="${memberList}"
									var="member"
									begin="0"
									end="${fn:length(memberList)}"
									varStatus="status">
									<c:if test="${member.admGroup eq 'AMG03' }">
	                    			<li class='ComMemItem ${member.committeeIdx ne null ? 'MemOn' : '' }"' data-id="${member.admId}">
										<input type='hidden' class='AgdYn' value='Y'>
										<div class='ComMemItem_top'>
											<div class='ComMemCard'>
												<p>
													<span class='ComMemName'>${member.admName }</span>
													<span>${member.admDept } / ${member.admPositon }</span>
													<span>${member.admCom }</span>
												</p>
												<p>
													<span class='ComMemInfo'>${member.admMobile1 }-${member.admMobile2 }-${member.admMobile3 } | ${member.admEmail }</span>
												</p>
											</div>
											<a href='#none' class='MemAgdYN MemAgdYNOn'>검토권한</a>
											<a href='#none' class='MemAgdChk'>상세설정</a>
										</div>
										<div class='MemAgendaCHListbox'>
											<ul class='MemAgendaCHList'>
											</ul>
										</div>
									</li>
									</c:if>
								</c:forEach>
	                    		</ul>
	                    	</div>
	                    	<div class="MemberListBox MemberListBox3">
	                    		<ul class="ComMemList">
								<c:forEach items="${memberList}"
									var="member"
									begin="0"
									end="${fn:length(memberList)}"
									varStatus="status">
									<c:if test="${member.admGroup eq 'AMG04' }">
	                    			<li class='ComMemItem ${member.committeeIdx ne null ? 'MemOn' : '' }"' data-id="${member.admId}">
										<input type='hidden' class='AgdYn' value='Y'>
										<div class='ComMemItem_top'>
											<div class='ComMemCard'>
												<p>
													<span class='ComMemName'>${member.admName }</span>
													<span>${member.admDept } / ${member.admPositon }</span>
													<span>${member.admCom }</span>
												</p>
												<p>
													<span class='ComMemInfo'>${member.admMobile1 }-${member.admMobile2 }-${member.admMobile3 } | ${member.admEmail }</span>
												</p>
											</div>
											<a href='#none' class='MemAgdYN MemAgdYNOn'>검토권한</a>
											<a href='#none' class='MemAgdChk'>상세설정</a>
										</div>
										<div class='MemAgendaCHListbox'>
											<ul class='MemAgendaCHList'>
											</ul>
										</div>
									</li>
									</c:if>
								</c:forEach>
	                    		</ul>
	                    	</div>
	                    </div>
	                </div>
				</div>
			</div>
            <div class="layer_popup_btn">
                <a href="#none" class="btn btn_pre_4002 btn_close">닫기</a>
                <a href="#none" class="btn btn_save_4002">저장</a>
            </div>
		</div>
	</div>
