<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.information.model.*"%>

<%
	InformationService infSvc = new InformationService();
	List<InformationVO> inflist = infSvc.getAllInfByDate();
	pageContext.setAttribute("inflist", inflist);
%>
<html>
<head>
<meta charset="UTF-8">
<title>FitMate最新消息</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/list.js/1.5.0/list.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
a {
    text-decoration:none;
}
</style>
</head>

<body>

<!-- 正式內容區 -->
<div>
	<marquee onMouseOver="this.stop()" onMouseOut="this.start()" width="45%">
	<a href="#">跑馬燈測試</a>
	</marquee>
</div>
	
</body>

</html>