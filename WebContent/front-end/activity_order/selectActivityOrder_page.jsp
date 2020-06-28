<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>活動訂單查詢首頁</title>

<style>
table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
	border: 3px ridge Gray;
	height: 80px;
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

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td><h3>ActivityOrder: Home</h3>
				<h4>( MVC )</h4></td>
		</tr>
	</table>

	<p>This is the Home page for EA101G5 ActivityOrder: Home</p>

	<h3>活動訂單查詢:</h3>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<ul>
		<li><a href='listAllActivityOrder.jsp'>List</a> all ActivityOrder. <br>
			<br></li>

		
		<jsp:useBean id="activity_orderSvc" scope="page"
			class="com.activity_order.model.Activity_orderService" />

		<li>
			<FORM METHOD="post" ACTION="activityorder.do">
				<b>選擇活動訂單編號:</b> <select size="1" name="aord_no">
					<c:forEach var="activity_orderVO" items="${activity_orderSvc.allActivityOrder}">
						<option value="${activity_orderVO.aord_no}">${activity_orderVO.aord_no}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>
	</ul>


	<h3>活動訂單新增</h3>

	<ul>
		<li><a href='addActivityOrder.jsp'>Add</a> a new ActivityOrder.</li>
	</ul>

</body>
</html>