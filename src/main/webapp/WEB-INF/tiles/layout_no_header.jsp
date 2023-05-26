<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko" >
<head>
  	<meta charset="utf-8" />
	<title>국가핵심기술 종합관리시스템</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=1200">
	<meta name="author" content="http://www..co.kr" />
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<meta name = "format-detection" content = "telephone=no"/>
	<meta property="og:type" content="website">
	<meta property="og:url" content="">
	<meta property="og:sitename" content="">
	<meta property="og:title" content="">
	<meta property="og:image" content=""  />
	<link rel="shortcut icon" type="text/css" href="/resources/images/common/motie.ico">
	<tiles:insertAttribute name="css" />
	<tiles:insertAttribute name="script" />
</head>
<body>
<div id="wrapper" class="wrapper">
	<!-- Mem T -->
		<!-- s: content-->
		<tiles:insertAttribute name="content" />
		<!-- e: content -->
</div>
</body>
</html>