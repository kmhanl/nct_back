<%--
  Created by IntelliJ IDEA.
  User: imtaeyeong
  Date: 2021/12/06
  Time: 4:06 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
	<div class="body_wrapper" style="padding:80px 50px 0 50px ">
        <div class="dash_content_wrapper">
            <div class="body_tit_wrapper" style="border:1px solid #e0e0e0;">
                <h1 style="font-size:20px;letter-spacing: 0;">로그인 사용중지(300)</h1>
                
            </div>
            
            <div class="dash_content_box">
            	<div class="dash_card_wrapper">
                    <div class="dash_card">
                        <h1 style="font-size:18px;font-weight: 400;letter-spacing: 0;">전문위원회 바로가기</h1>
                        <div style="text-align: left;">
                        	<ul class="quick_Link">
	                            <li>
	                                <a href="/expert/receiptList.do" class="quick_Link_item">접수현황</a>
	                            </li>
	                            <li>
	                                <a href="/expert/agendaList.do" class="quick_Link_item">안건현황</a>
	                            </li>
	                            <li>
	                                <a href="/expert/readyList.do" class="quick_Link_item">검토준비중</a>
	                            </li>
	                            <li>
	                                <a href="/expert/datepickList.do" class="quick_Link_item">참석일 선택</a>
	                            </li>
	                            <li>
	                                <a href="/expert/committeeList.do" class="quick_Link_item">위원회현황</a>
	                            </li>
	                        </ul>
						</div>
                    </div>
                </div>
            	<div class="dash_card_wrapper">
                    
	                <div class="dash_card">
                        <h1>접수현황</h1>
                        
                    </div>
                    <div class="dash_card">
                        <h1>안건현황</h1>
                        <ul class="dash_list">
                            <li>
                                <p class="dash_item_tit">검토준비중</p>
                                <p class="dash_item_con">9,999건</p>
                            </li>
                            <li>
                                <p class="dash_item_tit">개최예정</p>
                                <p class="dash_item_con">9,999건</p>
                            </li>
                            <li>
                                <p class="dash_item_tit">결과입력중</p>
                                <p class="dash_item_con">9,999건</p>
                            </li>
                            <li>
                                <p class="dash_item_tit">결과입력완료</p>
                                <p class="dash_item_con">9,999건</p>
                            </li>
                            <li>
                                <p class="dash_item_tit">검토결과확정</p>
                                <p class="dash_item_con">9,999건</p>
                            </li>
                            <li>
                                <p class="dash_item_tit">재검토요청</p>
                                <p class="dash_item_con">9,999건</p>
                            </li>
                        </ul>
                    </div>
                    <div class="dash_card">
                        <h1>회원가입 승인</h1>
                        <ul class="dash_list">
                            <li>
                                <p class="dash_item_tit">기업회원</p>
                                <p class="dash_item_con">9,999건</p>
                            </li>
                            <li>
                                <p class="dash_item_tit">기술안보과</p>
                                <p class="dash_item_con">9,999건</p>
                            </li>
                            <li>
                                <p class="dash_item_tit">전문위원</p>
                                <p class="dash_item_con">9,999건</p>
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
                <div class="dash_card_wrapper">
                    <div class="dash_card">
                        <h1>전문위원회</h1>
                        <div style="height:250px;">전문위원회</div>
                    </div>
                </div>
                <div class="dash_card_wrapper">
                    <div class="dash_card">
                        <h1>보호위원회</h1>
                        <div style="height:250px;">
                        <a href="/system/techhisList.do">시스템관리</a>
                        </div>
                    </div>
                </div>
                <div class="dash_card_wrapper">
                    <div class="dash_card">
                        <h1>소위원회</h1>
                        <div style="padding:20px;text-align:left;margin-bottom:20px;">
                        	<a href="#none" class="NiceCallBtn">본인인증</a>
                        	<div class="NiceCallResult">
                        		호출 결과
                        	</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
