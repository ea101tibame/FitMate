<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.deposit.model.*"%>
<%@ page import="com.student.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>

<%
	List<DepositVO> deplist = (List<DepositVO>) request.getAttribute("deplist");
%>

<html>
<head>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<title>儲值紀錄</title>
</head>
<body>

		<div id="main">
			<h1>我的儲值紀錄</h1>
			<a href="<%=request.getContextPath()%>/front-end/deposit/deposit_index.jsp">返回儲值首頁</a>
		</div>
		
		<div>
			<table>
				<tr>
					<th>儲值日期</th>
					<th>儲值金額</th>
				</tr>
				<c:forEach var="depVO" items="${deplist}">
				<tr>
					<td><fmt:formatDate value="${depVO.depdate}" type="date" dateStyle="full"/></td>
					<td>${depVO.depprice}</td>
				</tr>
				</c:forEach>
			</table>
		</div>
</body>
</html>