<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.coach.model.*"%>
<!DOCTYPE html>

<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  CoaVO coaVO = (CoaVO) request.getAttribute("coaVO"); //CoaServlet.java(Concroller), 存入req的coaVO物件
%>

<html>
<head>
<meta charset="UTF-8">
<title>員工資料 - listOneCoach.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<h4>此頁暫練習採用 Script 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>員工資料 - ListOneCoach.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>編號</th>
		<th>姓名</th>
		<th>密碼</th>
		<th>信箱</th>
		<th>電話</th>
		<th>帳戶</th>
		<th>點數</th>
		<th>狀態</th>
		<th>照片</th>
		<th>性別</th>
		<th>總評價</th>
		<th>總評價數</th>
	</tr>
	<tr>
		<td><%=coaVO.getCoano()%></td>
		<td><%=coaVO.getCoaname()%></td>
		<td><%=coaVO.getCoapsw()%></td>
		<td><%=coaVO.getCoamail()%></td>
		<td><%=coaVO.getCoatel()%></td>
		<td><%=coaVO.getCoaacc()%></td>
		<td><%=coaVO.getCoapoint()%></td>
		<td><%=coaVO.getCoasta()%></td>
		<td><%=coaVO.getCoapic()%></td>
		<td><%=coaVO.getCoasex()%></td>
		<td><%=coaVO.getCoasctotal()%></td>
		<td><%=coaVO.getCoascqty()%></td>
	</tr>
</table>

</body>
</html>