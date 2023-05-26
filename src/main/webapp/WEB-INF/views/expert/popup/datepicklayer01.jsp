<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <div id="Dimmed_Layer_Warpper" class="Dimmed_Layer_Warpper">
    	<input type="hidden" id="admId" value="${ user.admId }"/>
		<div id="Layer_Content_Warpper" class="Layer_Content_Warpper Layer_Content_4001">
        	<div class="layer_popup_tit">
				<h1 class="layer_tit">참석일 선택1</h1>
				<a href="javascript:void(0);" class="layer_closer"></a>
			</div>
			<div class="layer_popup_body content_01">
				<div class="DatePickInfoTop">
					<!-- <h1 class="">2022년 8회차 <span>반도체</span> 전문위원회 </h1> -->
					<div class="DatePickInfo">
						<ul>
							<li>※ ${ committeeData.committeeDatePickEDispKo } 마감</li>
							<li>※ 참석가능한 후보일을 선택 해주세요.(중복선택 가능)</li>
						</ul>
					</div>
				</div>
				<c:set var="totMember" value="${fn:length(memberList)}"></c:set>
				<c:set var="pick1Member" value="0"></c:set>
				<c:set var="pick2Member" value="0"></c:set>
				<c:set var="pick3Member" value="0"></c:set>
				<c:set var="pick4Member" value="0"></c:set>
				<c:set var="myPick1" value="N"></c:set>
				<c:set var="myPick2" value="N"></c:set>
				<c:set var="myPick3" value="N"></c:set>
				<c:set var="myPick4" value="N"></c:set>
				<c:forEach items="${memberList}"
					var="item">
					<c:if test="${item.committeeDatePick1 eq 'Y'}">
						<c:set var="pick1Member" value = "${pick1Member + 1}"/>
						<c:if test="${ user.admId eq item.admId }">
							<c:set var="myPick1" value="Y"/>
						</c:if>
					</c:if>
					<c:if test="${item.committeeDatePick2 eq 'Y'}">
						<c:set var="pick2Member" value = "${pick2Member + 1}"/>
						<c:if test="${ user.admId eq item.admId }">
							<c:set var="myPick2" value="Y"/>
						</c:if>	
					</c:if>
					<c:if test="${item.committeeDatePick3 eq 'Y'}">
						<c:set var="pick3Member" value = "${pick3Member + 1}"/>
						<c:if test="${ user.admId eq item.admId }">
							<c:set var="myPick3" value="Y"/>
						</c:if>
					</c:if>
					<c:if test="${item.committeeDatePick4 eq 'Y'}">
						<c:set var="pick4Member" value = "${pick4Member + 1}"/>
						<c:if test="${ user.admId eq item.admId }">
							<c:set var="myPick4" value="Y"/>
						</c:if>
					</c:if>
				</c:forEach>
           		<div class="DatePickWrap" style="max-height: 452px;">
           			<div class="DatePickBody LayerBodySection" style="margin-right:5px;">
           				<div class="SectionTitleBox">
							<h1 class="TitleBoxTit">참석일 선택</h1>
							<div class="SectionBarBox"></div>
						</div>
						<div class="DatePickSelWrap" style="height: calc(100% - 47px);">
							<ul class="DatePickSelList">
								<li class="DatePickSelItem">
                                    <div class="checkedwarp ${ myPick1 eq 'Y' ? 'ChkOn' : '' }"><!-- 선택된 값이 Y면 ChkOn -->
                                    	<input type="hidden" id="DatePicker1" name="DatePicker1" class="DatePicker" value="${ myPick1 }">
                                        <a href="#none" class="DataPicjChk"></a>
                                    </div>
                                    <div class="DataPickSel">
                                        <div class="PickSelTop">
                                        	<p class="PickSelLoacation">
												${ committeeData.committeeDatePick1DispKo }
                                        		<br> 
												${ committeeData.committeeDateAdd1 }
                                        	</p>
                                        	<p class="PickSelCount">${ pick1Member }명 / ${ totMember }명</p>
                                        </div>
                                    	<div class="DatePickBar">
	                                        <div class="DatePickBarBg"></div>
	                                        <div class="DatePickBarActive" style="width:${ pick1Member / totMember * 100 }%"></div>
	                                    </div>    
                                    </div>
                                    
                                </li>
								<li class="DatePickSelItem">
                                    <div class="checkedwarp ${ myPick2 eq 'Y' ? 'ChkOn' : '' }"><!-- 선택된 값이 Y면 ChkOn -->
                                    	<input type="hidden" id="DatePicker2" name="DatePicker2" class="DatePicker" value="${ myPick2 }">
                                        <a href="#none" class="DataPicjChk"></a>
                                    </div>
                                    <div class="DataPickSel">
                                        <div class="PickSelTop">
                                        	<p class="PickSelLoacation">
												${ committeeData.committeeDatePick2DispKo }
                                        		<br> 
												${ committeeData.committeeDateAdd2 }
                                        	</p>
                                        	<p class="PickSelCount">${ pick2Member }명 / ${ totMember }명</p>
                                        </div>
                                    	<div class="DatePickBar">
	                                        <div class="DatePickBarBg"></div>
	                                        <div class="DatePickBarActive" style="width:${ pick2Member / totMember * 100 }%"></div>
	                                    </div>    
                                    </div>
                                    
                                </li>
                                <li class="DatePickSelItem ">
                                    <div class="checkedwarp ${ myPick3 eq 'Y' ? 'ChkOn' : '' }"> <!-- 선택된 값이 Y면 ChkOn -->
                                    	<input type="hidden" id="DatePicker3" name="DatePicker3" class="DatePicker" value="${ myPick3 }">
                                        <a href="#none" class="DataPicjChk"></a>
                                    </div>
                                    <div class="DataPickSel">
                                        <div class="PickSelTop">
                                        	<p class="PickSelLoacation">
												${ committeeData.committeeDatePick3DispKo }
                                        		<br> 
												${ committeeData.committeeDateAdd3 }
                                        	</p>
                                        	<p class="PickSelCount">${ pick3Member }명 / ${ totMember }명</p>
                                        </div>
                                    	<div class="DatePickBar">
	                                        <div class="DatePickBarBg"></div>
	                                        <div class="DatePickBarActive" style="width:${ pick3Member / totMember * 100 }%"></div>
	                                    </div>    
                                    </div>
                                    
                                </li>
                                <li class="DatePickSelItem">
                                    <div class="checkedwarp ${ myPick4 eq 'Y' ? 'ChkOn' : '' }"><!-- 선택된 값이 Y면 ChkOn -->
                                    	<input type="hidden" id="DatePicker4" name="DatePicker4" class="DatePicker" value="${ myPick4 }">
                                        <a href="#none" class="DataPicjChk"></a>
                                    </div>
                                    <div class="DataPickSel">
                                        <div class="PickSelTop">
                                        	<p class="PickSelLoacation">
                                        		미참석
                                        	</p>
                                        	<p class="PickSelCount">${ pick4Member }명 / ${ totMember }명</p>
                                        </div>
                                    	<div class="DatePickBar">
	                                        <div class="DatePickBarBg"></div>
	                                        <div class="DatePickBarActive" style="width:${ pick4Member / totMember * 100 }%"></div>
	                                    </div>  
	                                </div>
                                </li>
							</ul>
						</div>
           			</div>
           			<div class="DatePickBody LayerBodySection" style="margin-left:5px;">
           				<div class="SectionTitleBox">
							<h1 class="TitleBoxTit">참석일 선택 현황</h1>
							<div class="SectionBarBox"></div>
						</div>
						<div class="DatePickMemBox" style="height: calc(100% - 47px);">
							<div class="DatePickMemBoxTop">
								<p class="mem">전문위원</p>
								<p>참석가능일</p>
							</div>
							<div class="DatePickMemListBox">
								<ul class="DatePickMemList">
								<c:if test="${fn:length(memberList) != 0 }">
									<c:forEach items="${memberList}"
										var="mb"
										begin="0"
										end="${fn:length(memberList)}"
										varStatus="status">
									<li>	
										<div class="DatePickMemItem">
										    <div class="MemBox">${ mb.admName }</div>
										    <div class="DateBox">
										        <p class="DateRow Active">
										            ${ committeeData.committeeDatePick1DispKo }
										            <span class="${ mb.committeeDatePick1 eq 'Y' ? 'Chk' : '' }"></span>
										        </p>
										        <p class="DateRow Active">
										            ${ committeeData.committeeDatePick2DispKo }
										            <span class="${ mb.committeeDatePick2 eq 'Y' ? 'Chk' : '' }"></span>
										        </p>
										        <p class="DateRow Active">
										            ${ committeeData.committeeDatePick3DispKo }
										            <span class="${ mb.committeeDatePick3 eq 'Y' ? 'Chk' : '' }"></span>
										        </p>
										        <p class="DateRow Active">
										            미참석
										            <c:if test="${ mb.committeeDatePickEtcDispKo ne null }">
										                    (${ mb.committeeDatePickEtcDispKo })
										            </c:if> 
										            <span class="${ mb.committeeDatePick4 eq 'Y' ? 'Chk' : '' }"></span>
										        </p>
										    </div>
										</div>
									</li>
<!-- 									<li>	 -->
<!-- 										<div class="DatePickMemItem"> -->
<!-- 											<div class="MemBox">전문위원</div> -->
<!-- 											<div class="DateBox"> -->
<!-- 												<p class="DateRow Active">2000년 00월 00일 00:00<span class="Chk"></span></p> -->
<!-- 												<p class="DateRow Active">2000년 00월 00일 00:00<span class="Chk"></span></p> -->
<!-- 												<p class="DateRow Active">2000년 00월 00일 00:00<span class="Chk"></span></p> -->
<!-- 												<p class="DateRow">미참석 (2000년 00월 00일)<span class="Chk"></span></p> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</li> -->
<!-- 									<li>	 -->
<!-- 										<div class="DatePickMemItem"> -->
<!-- 											<div class="MemBox">전문위원</div> -->
<!-- 											<div class="DateBox"> -->
<!-- 												<p class="DateRow Active">2000년 00월 00일 00:00<span class="Chk"></span></p> -->
<!-- 												<p class="DateRow Active">2000년 00월 00일 00:00<span class="Chk"></span></p> -->
<!-- 												<p class="DateRow Active">2000년 00월 00일 00:00<span class="Chk"></span></p> -->
<!-- 												<p class="DateRow">미참석 (2000년 00월 00일)<span class="Chk"></span></p> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</li> -->
									</c:forEach>
									</c:if>
								</ul>
							</div>
						</div>
           			</div>
           		</div>
			</div>
            <div class="layer_popup_btn">
                <a href="#none" class="btn btn_close">닫기</a>
                <a href="#none" class="btn datepicksave1">참석일 저장</a>
            </div>
		</div>
	</div>
