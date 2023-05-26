/**
 * [전문위원회] 접수현황 화면 스크립트
 * - 작성일: 2022-01-11
 * 
 * - 다른 스크립트 사용
 * 1. [datepickPopup.js] AgendaModify, DateModify, MemberModify
 */
$(document).ready(function(){    
	var url = "/expert/committeeView.do"
	
	// ** 안건 수정 버튼 클릭 이벤트 **
	$("div.ComViewTBox  a.agdmodify").on("click",function(){
		var exIdx = $(this).data("ex-idx");
		AgendaModify.open(exIdx, "Y", url+"?committeeIdx="+exIdx);
	});
	
	// ** 위원 구성  수정 버튼 클릭 이벤트 **
	$("div.ComViewTBox  a.memmodify").on("click",function(){
		var exIdx = $(this).data("ex-idx");
		var techId = $(this).data("ex-tech-id");
		MemberModify.open(exIdx, techId, 'Y', url+"?committeeIdx="+exIdx);
	});
	
	// ** 개최예정일  버튼 클릭 이벤트 **
	$("div.ComViewTBox  a.datemodify").on("click",function(){
		var exIdx = $(this).data("ex-idx");
		DateModify.open(exIdx, 'Y', url);
	});
	
	// ** 참석일 현황  버튼 클릭 이벤트 **
	$("div.ComViewTBox  a.datestat1").on("click",function(){
		var exIdx = $(this).data("ex-idx");
		DateStat01.open();
	});
	
	// ** SMS발송  버튼 클릭 이벤트 **
	$("div.ComViewTBox  a.sendsms").on("click",function(){
		var exIdx = $(this).data("ex-idx");
		SendSms.open();
	});
	
	// ** 이메일발송  버튼 클릭 이벤트 **
	$("div.ComViewTBox  a.sendemail").on("click",function(){
		var exIdx = $(this).data("ex-idx");
		SendEmail.open();
	});
	
	// 
	
	
	
	
	
	
});