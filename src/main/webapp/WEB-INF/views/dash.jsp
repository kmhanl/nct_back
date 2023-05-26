<%--
  Created by IntelliJ IDEA.
  User: imtaeyeong
  Date: 2021/12/06
  Time: 4:06 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<div class="body_wrapper" style="padding:80px 50px 0 50px ">
        <%-- <div class="rsc_dash_content_wrapper">
            <div class="dash_card_wrapper">
                <div class="rsc_dash_card">
                    <h1><a href="/rsc/main.do" class="quick_Link_item">2022년 국가핵심기술 보유기관 대상 현황 실태조사 진행 현황 </a></h1>
                    <div class="statusTop">
                       	<ul class="stausList">
                            <c:forEach items="${inviStatList}" var="inviStat" varStatus="status">
								<li>
	                                <a href="javascript:void(0);" class="stausListIitem">
	                                	<p class="statusTit">인증전</p>
	                                	<p class="statusCnt Cnt01">${inviStat.rscStatusRd}</p>
	                                </a>
	                            </li>
	                            <li>
	                                <a href="javascript:void(0);" class="stausListIitem">
	                                	<p class="statusTit">인증완료</p>
	                                	<p class="statusCnt Cnt02">${inviStat.rscStatusIm}</p>
	                                </a>
	                            </li>
	                            <li>
	                                <a href="javascript:void(0);" class="stausListIitem">
	                               		<p class="statusTit">작성완료</p>
	                                	<p class="statusCnt Cnt03">${inviStat.rscStatusCo}</p>
	                                </a>
	                            </li>
							</c:forEach>
							
                              <li>
                                <a href="javascript:void(0);" class="stausListIitem">
                                	<p class="statusTit">대상기관</p>
                                	<p class="statusCnt Cnt04">199</p>
								</a>
                            </li> 
                       </ul>
					</div>
				</div>
            </div>
        </div> --%>
        <div class="dash_content_wrapper">
            <div class="dash_card_wrapper">
                
            </div>
            <script>
            	$(document).ready(function(){
            		
            		$("#emailTest").on("click",function(){
            			emailList.push({
	            			emailHisEmail: 'plan6ix@naver.com',
	            			emailHisCom: '이티',
	            			emailHisName: '김연식',
	            			emailInviKey: 'gFS7TKB5HqK6tVeP8jGnMOILIEMSJXFXtgjpYmseueE=',
	            		});
//            			$(".InsertReceipt div.TechInNameBox").each(function(idx,tech){
//            				emailList.push({
//    	            			emailHisEmail: 'plan6ix@naver.com',
//    	            			emailHisCom: '이티',
//    	            			emailHisName: '김연식',
//    	            			emailInviKey: 'gFS7TKB5HqK6tVeP8jGnMOILIEMSJXFXtgjpYmseueE=',
//    	            		});
//                		});
            			$.ajax({
            				type : "POST", 
            				url : "/expert/proc/send/email.do", 
            				data: JSON.stringify({
            					emailInfo: {
            						emailHisSenderName: "국가핵심기술 보호 실태조사",
            						emailHisSubject: "(산보협) 국가핵심기술 보유기관 실태조사 협조 요청의 건", // 이메일 제목
            						emailHisBody: "", // 이메일 내용
            					},
            					emailList: emailList
            					
            				}),
            				dataType: "json",
            				contentType: 'application/json;charset=UTF-8',
            			 	success : function(data) { 
            					// data 정보
            					// resultCode: S(성공), F(실패)
            					switch(data.resultCode){
            						case "S":
            							alert("테스트 Email 발송 결과 : "+data.resultData.message
            									+ "\n제목: "+emailSubject
            									+ "\n내용: "+emailBody
            									+ "\n수신이메일: "+emailList.length+"건"
            									);
            							break;
            						case "F":
            							alert("[" + data.resultData.status + "] " + data.resultData.message);
            							break;
            					}
            				},
            			 	error : function() { 
            			 		console.log("통신장애"); 
            			 	} 
            			});
            		});
            	});
            </script>
            <div class="dash_content_box">
            	<div class="dash_card_wrapper" style="display:block;">
                    <div class="dash_card">
                        <h1 style="font-size:20px;font-weight: 400;letter-spacing: 0;">전문위원회 바로가기</h1>
                        <div style="text-align: left;">
                        	<ul class="quick_Link">
	                            <li>
	                                <a href="/expcom/expRecList.do" class="quick_Link_item">접수현황</a>
	                            </li>
	                            <li>
	                                <a href="/expcom/expAgdList.do" class="quick_Link_item">안건현황</a>
	                            </li>
	                            <li>
	                                <a href="/expcom/expRdyList.do" class="quick_Link_item">검토준비중</a>
	                            </li>
	                            <li>
	                                <a href="/expert/datepickList.do" class="quick_Link_item">참석일 선택</a>
	                            </li>
	                            <li>
	                                <a href="/expert/committeeList.do" class="quick_Link_item">위원회현황</a>
	                            </li>
	                        </ul>
						</div>
						<div style="display:flex;padding:0 10px 15px 15px ;">
							<div class="dash_card" style="margin-top:0;">
							<c:set var="totCnt" value="0"></c:set>
							<c:set var="apCnt" value="0"></c:set>
							<c:set var="rcCnt" value="0"></c:set>
							<c:set var="raCnt" value="0"></c:set>
							<c:set var="rjCnt" value="0"></c:set>
							<c:set var="acCnt" value="0"></c:set>
							<c:forEach items="${tabList}" var="item">
							<c:set var="totCnt" value = "${totCnt + item.count}"/>
							<c:choose>
								<c:when test="${item.title eq 'AP'}">
									<c:set var="apCnt" value = "${item.count}"/>
								</c:when>
								<c:when test="${item.title eq 'RC'}">
									<c:set var="rcCnt" value = "${item.count}"/>
								</c:when>
								<c:when test="${item.title eq 'RA'}">
									<c:set var="raCnt" value = "${item.count}"/>
								</c:when>
								<c:when test="${item.title eq 'RJ'}">
									<c:set var="rjCnt" value = "${item.count}"/>
								</c:when>
								<c:when test="${item.title eq 'AC'}">
									<c:set var="acCnt" value = "${item.count}"/>
								</c:when>
							</c:choose>
						</c:forEach>
		                        <h1>접수현황</h1>
		                        <ul class="dash_list">
		                            <li>
		                                <p class="dash_item_tit">접수검토</p>
		                                <p class="dash_item_con">${apCnt}건</p>
		                            </li>
		                            <li>
		                                <p class="dash_item_tit">접수완료</p>
		                                <p class="dash_item_con">${rcCnt}건</p>
		                            </li>
		                            <li>
		                                <p class="dash_item_tit">재접수요청</p>
		                                <p class="dash_item_con">${raCnt}건</p>
		                            </li>
		                            <li>
		                                <p class="dash_item_tit">접수반려</p>
		                                <p class="dash_item_con">${rjCnt}건</p>
		                            </li>
		                            <li>
		                                <p class="dash_item_tit">접수철회</p>
		                                <p class="dash_item_con">${acCnt}건</p>
		                            </li>
		                        </ul>
		                    </div>
		                    <div class="dash_card" style="margin-top:0;">
		                        <c:set var="atotCnt" value="0"></c:set>
								<c:set var="arcCnt" value="0"></c:set>
								<c:set var="aasCnt" value="0"></c:set>
								<c:set var="aceCnt" value="0"></c:set>
								<c:set var="aciCnt" value="0"></c:set>
								<c:set var="accCnt" value="0"></c:set>
								<c:set var="aseCnt" value="0"></c:set>
								<c:set var="aicCnt" value="0"></c:set>
								<c:set var="acsCnt" value="0"></c:set>
								<c:set var="aragdCnt" value="0"></c:set>
								<c:forEach items="${tabList2}" var="item">
									<c:set var="atotCnt" value = "${totCnt + item.count}"/>
									<c:choose>
										<c:when test="${item.title eq 'RC'}">
											<c:set var="arcCnt" value = "${item.count}"/>
										</c:when>
										<c:when test="${item.title eq 'AS'}">
											<c:set var="aasCnt" value = "${item.count}"/>
										</c:when>
										<c:when test="${item.title eq 'CE'}">
											<c:set var="aceCnt" value = "${item.count}"/>
										</c:when>
										<c:when test="${item.title eq 'CI'}">
											<c:set var="aciCnt" value = "${item.count}"/>
										</c:when>
										<c:when test="${item.title eq 'CC'}">
											<c:set var="accCnt" value = "${item.count}"/>
										</c:when>
										<c:when test="${item.title eq 'SE'}">
											<c:set var="aseCnt" value = "${item.count}"/>
										</c:when>
										<c:when test="${item.title eq 'IC'}">
											<c:set var="aicCnt" value = "${item.count}"/>
										</c:when>
										<c:when test="${item.title eq 'CS'}">
											<c:set var="acsCnt" value = "${item.count}"/>
										</c:when>
										<c:when test="${item.title eq '05'}">
											<c:set var="aragdCnt" value = "${item.count}"/>
										</c:when>
									</c:choose>
								</c:forEach>
		                        <h1>안건현황</h1>
		                        <ul class="dash_list">
		                            <li>
		                                <p class="dash_item_tit">접수완료 </p>
		                                <p class="dash_item_con">${arcCnt }건</p>
		                            </li>
		                            <li>
		                                <p class="dash_item_tit">소관과이관완료</p>
		                               <p class="dash_item_con">${aasCnt }건</p>
		                            </li>
		                            <li>
		                                <p class="dash_item_tit">위원회예정</p>
		                                <p class="dash_item_con">${aceCnt }건</p>
		                            </li>
		                            <li>
		                                <p class="dash_item_tit">위원회진행중</p>
		                               <p class="dash_item_con">${aciCnt }건</p>
		                            </li>
		                            <li>
		                                <p class="dash_item_tit">협의결과도출증</p>
		                                 <p class="dash_item_con">${accCnt }건</p>
		                            </li>
		                            <li>
		                                <p class="dash_item_tit">소관과결과도중</p>
		                                <p class="dash_item_con">${aseCnt }건</p>
		                            </li>
		                            <li>
		                                <p class="dash_item_tit">최종검토완료</p>
		                                <p class="dash_item_con">${aicCnt }건</p>
		                            </li>
		                            <li>
		                                <p class="dash_item_tit">최종결과확정</p>
		                               <p class="dash_item_con">${acsCnt }건</p>
		                            </li>
		                            <li>
		                                <p class="dash_item_tit">재검토확정</p>
		                                <p class="dash_item_con">${aragdCnt }건</p>
		                            </li>
		                        </ul>
		                    </div>
		                    <div class="dash_card" style="margin-top:0;">
								<c:set var="mjoin" value="0"></c:set>
								<c:set var="mwating" value="0"></c:set>
								<c:set var="mapproved" value="0"></c:set>
								<c:set var="mstop" value="0"></c:set>
								<c:forEach items="${totComMemberList}" var="item">
								<c:choose>
										<c:when test="${item.cpnStat eq '200'}">
											<c:set var="mapproved" value = "${item.cnt}"/>
										</c:when>
										<c:when test="${item.cpnStat eq '300'}">
											<c:set var="mjoin" value = "${item.cnt}"/>
										</c:when>
										<c:when test="${item.cpnStat eq '400'}">
											<c:set var="mwating" value = "${item.cnt}"/>
										</c:when>
										<c:when test="${item.cpnStat eq '500'}">
											<c:set var="mstop" value = "${item.cnt}"/>
										</c:when>
								</c:choose>		
								
								</c:forEach>
		                        <h1>회원가입 승인</h1>
		                        <ul class="dash_list">
		                            <li>
		                                <p class="dash_item_tit">사용중</p>
		                                <p class="dash_item_con">${mapproved}건</p>
		                            </li>
		                            <li>
		                                <p class="dash_item_tit">승인전</p>
		                                <p class="dash_item_con">${mwating}건</p>
		                            </li>
		                            <li>
		                                <p class="dash_item_tit">회원가입</p>
		                                <p class="dash_item_con">${mjoin}건</p>
		                            </li>
		                            <li>
		                                <p class="dash_item_tit">사용중지</p>
		                                <p class="dash_item_con">${mstop}건</p>
		                            </li>
		                           
		                            <!-- <li>
		                                <p class="dash_item_tit">결과입력완료</p>
		                                <p class="dash_item_con">9,999건</p>
		                            </li>
		                            <li>
		                                <p class="dash_item_tit">검토결과확정</p>
		                                <p class="dash_item_con">9,999건</p>
		                            </li> -->
		                        </ul>
		                    </div>
						</div>
                    </div>
                </div>
            	<!-- <div class="dash_card_wrapper" style="margin-bottom:40px;">
	                <div class="dash_card">
	                    <h1 style="font-size:20px;font-weight: 400;letter-spacing: 0;">보호위원회 바로가기</h1>
	                    <div style="height:100px;">
	                    	
	                    </div>
	                </div>
	            </div> -->
                
            </div>
        </div>
    </div>
