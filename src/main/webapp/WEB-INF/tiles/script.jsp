<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
Date now = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
String today = sf.format(now);
%>
<script type="text/javascript" src="/resources/js/jquery-2.2.4.min.js?v=<%=today%>"></script>
<script type="text/javascript" src="/resources/js/jquery-ui.min.js?v=<%=today%>"></script>
<script type="text/javascript" src="/resources/js/jquery.easing.1.3.js?v=<%=today%>"></script>
<script type="text/javascript" src="/resources/js/common.js?v=<%=today%>"></script>
<script type="text/javascript" src="/resources/js/datepicker.js?v=<%=today%>"></script>
<script type="text/javascript" src="/resources/js/datepicker.min.js?v=<%=today%>"></script>
<script type="text/javascript" src="/resources/js/datepicker.en.js?v=<%=today%>"></script>
<script type="text/javascript" src="/resources/js/loader.js?v=<%=today%>"></script>
<script type="text/javascript" src="/resources/js/login.js?v=<%=today%>"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/js/post.js"></script>
<script type="text/javascript" src="/resources/js/uploadForm.js?v=<%=today%>"></script>