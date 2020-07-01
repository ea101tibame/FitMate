<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.redemption.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>

<%
	String coano = (String)session.getAttribute("coano");
	RedemptionService redSvc = new RedemptionService();
	List<RedemptionVO>redlist = redSvc.showAllRed(coano); 
%>
<html>
<head>
<meta charset="utf-8">
<title>兌換紀錄</title>
</head>
<body>

</body>
</html>