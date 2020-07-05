<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.coach.model.*"%>

<%
	String coano = (String)session.getAttribute("coano");
	CoaService coaSvc = new CoaService(); 
	CoaVO coaVO = coaSvc.getOneCoa(coano);
	pageContext.setAttribute("coaVO", coaVO);
%>
<html>
<head>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<title>我的點數</title>
</head>
<body>
	<div>
	
	<ul>
		<li>
			<form action="<%=request.getContextPath()%>/redemption/redemption.do" method="post">
				<input type="submit" value="查看兌換紀錄">
				<input type="hidden" name="coano" value="${coaVO.coano}">
				<input type="hidden" name="action" value="showAll"> 
			</form>	
		</li>
		<li>
			<form action="<%=request.getContextPath()%>/redemption/redemption.do" method="post">
				<input type="submit" value="兌換申請">
				<input type="hidden" name="coano" value="${coaVO.coano}">
				<input type="hidden" name="action" value="goInsert"> 
			</form>
		</li>
	</ul>
	
	</div>
</body>
</html>