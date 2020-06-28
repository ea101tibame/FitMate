<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.activity_order.model.*"%>

<%
Activity_orderVO activity_orderVO = (Activity_orderVO) request.getAttribute("activity_orderVO");
%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>活動新增 - addActivityOrder.jsp</title>

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
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}
</style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">

<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>
</head>
<body bgcolor='white'>
	<table id="table-1">
		<tr>
			<td>
				<h3>活動訂單新增 - addActivity.jsp</h3>
			</td>
			<td>
				<h4>
					<a href="selectActivityOrder_page.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>活動訂單新增:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="activityorder.do" name="form1">
		<table>
		
			<tr>
				<td>活動編號:</td>
				<td><input type="TEXT" name="actno" size="45" value=""
					placeholder="請輸入活動編號" /></td>
			</tr>
			<tr>
				<td>學員編號:</td>
				<td><input type="text" name="stuno" id="date"
					placeholder="請輸入學員編號"></td>
			</tr>
			<tr>
				<td>教練評價數:</td>
				<td><input type="TEXT" name="aord_sc" size="45" value=""
					placeholder="請輸入教練評價數" /></td>
			</tr>
	
		</table>

		<input
			type="hidden" name="action" value="insert"> 
		<input
			type="submit" value="送出新增">
	</FORM>

</body>



</html>