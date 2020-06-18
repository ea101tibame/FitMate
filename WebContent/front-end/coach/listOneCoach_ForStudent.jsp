<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.coach.model.*"%>
<%@ page import="com.expertise_own.model.*"%>
<%@ page import="java.util.List"%>

<!-- TODO Nullpointerexcption -->

<%
  CoaVO coaVO = (CoaVO) request.getAttribute("coaVO"); //CoaServlet.java(Concroller), 存入req的coaVO物件
  List<ExpOwnVO> expOwnVOs = (List) request.getAttribute("expOwnVOs"); //CoaServlet.java(Concroller), 存入req的coaVO物件
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.16.0/dist/bootstrap-table.min.css">

<title>教練個人資料 - listOneCoach_ForStudent.jsp</title>

</head>
<body>
	    <h3>教練資料</h3>
		 
		<c:forEach var="expOwnVO" items="${expOwnVOs}">
		   <p>${expOwnVO.expno}</p>
		   <p>${expOwnVO.expdesc}</p>
		</c:forEach>
		
<table class="table table-striped">
  <thead>
   <tr>
		<th>照片</th>
		<th>編號</th>
		<th>姓名</th>
		<th>性別</th>
		<th>信箱</th>
		<th>自我介紹</th>
		
	</tr>
  </thead>
  <tbody>
  	<tr>
		<td><%=coaVO.getCoapic()%></td>
		<td><%=coaVO.getCoano()%></td>
		<td><%=coaVO.getCoaname()%></td>
		<td><%=coaVO.getCoasex()%></td>
		<td><%=coaVO.getCoamail()%></td>
		<td><%=coaVO.getCoaintro()%></td>

	</tr>
  </tbody>
</table>
</body>
<script src="https://unpkg.com/bootstrap-table@1.16.0/dist/bootstrap-table.min.js"></script>
</html>