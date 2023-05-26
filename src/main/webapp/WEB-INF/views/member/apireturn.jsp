<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<input type="hidden" id="resultMoblieNo" value="${ resultData.mobileno }"/>
<input type="hidden" id="resultName" value="${ resultData.name }"/>
<input type="hidden" id="resultDi" value="${ resultData.di }"/>
<input type="hidden" id="resultBno" value="${ resultData.businessNo }"/>
<script>
$(document).ready(function(){
	isAuthSuccess = true;
	var mobileNo= $("#resultMoblieNo").val();
	//var rscMemPhone = mobileNo.substr(0,3)+"-"+mobileNo.substr(3,4)+"-"+mobileNo.substr(7,4);
	var rscMemPhone = $("#resultMoblieNo").val();
	var resultDi= $("#resultDi").val();
	var resultName= $("#resultName").val();
	
	opener.NiceSuccess(rscMemPhone, resultDi, resultName);
	window.close();
});
</script>