<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
Date now = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
String today = sf.format(now);
%>
<link type="text/css" rel="stylesheet" href="/resources/css/nct_common.css?v=<%=today%>"  />
<link type="text/css" rel="stylesheet" href="/resources/css/nct_member.css?v=<%=today%>"  />
<link type="text/css" rel="stylesheet" href="/resources/css/nct_style.css?v=<%=today%>"  />
<link type="text/css" rel="stylesheet" href="/resources/css/nct_design.css?v=<%=today%>"  />
<link type="text/css" rel="stylesheet" href="/resources/css/nct_research.css?v=<%=today%>"  />
<link type="text/css" rel="stylesheet" href="/resources/css/datepicker.css?v=<%=today%>"  />
<link type="text/css" rel="stylesheet" href="/resources/css/datepicker.min.css?v=<%=today%>"  />
