<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.activity_order.model.*"%>


<%
Activity_orderVO activity_orderVO = (Activity_orderVO) request.getAttribute("activity_orderVO"); //ActivityServlet.java(Concroller), 存入req的activityVO物件
%>

<html>
<head>
<title>列出單筆活動訂單資料 - listOneActivityOrder.jsp</title>

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

<table id="table-1">
	<tr><td>
		 <h3>單筆活動訂單資料 - listOneActivityOrder.jsp</h3>
		 <h4><a href="selectActivityOrder_page.jsp">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>活動訂單編號</th>
		<th>活動編號</th>
		<th>學員編號</th>
		<th>活動教練評價</th>
		<th>活動訂單時間</th>
	</tr>
	<tr>
			<td>${activity_orderVO.aord_no}</td>
			<td>${activity_orderVO.actno}</td>
			<td>${activity_orderVO.stuno}</td>
			<td>${activity_orderVO.aord_sc}</td>
			<td><fmt:formatDate value="${activity_orderVO.aord_time}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
			
	</tr>
</table>

</body>
</html>