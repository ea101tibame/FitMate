<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>活動查詢首頁</title>

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
			<td><h3>Activity: Home</h3>
				<h4>( MVC )</h4></td>
		</tr>
	</table>

	<p>This is the Home page for EA101G5 Activity: Home</p>

	<h3>活動查詢:</h3>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<ul>
		<li><a href='listAllActivity.jsp'>List</a> all Activity. <br>
			<br></li>

		<li>
			<FORM METHOD="post" ACTION="activity.do">
				<b>輸入活動編號 (如A001):</b> 
				<input type="text" name="actno"> 
				<input type="hidden" name="action" value="getOne_For_Display"> 
				<input type="submit" value="送出">
			</FORM>
		</li>

		<jsp:useBean id="actSvc" scope="page"
			class="com.activity.model.ActivityService" />

		<li>
			<FORM METHOD="post" ACTION="activity.do">
				<b>選擇活動編號:</b> <select size="1" name="actno">
					<c:forEach var="activityVO" items="${actSvc.allActivity}">
						<option value="${activityVO.actno}">${activityVO.actno}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>
	</ul>


	<h3>活動新增</h3>

	<ul>
		<li><a href='addActivity.jsp'>Add</a> a new Activity.</li>
	</ul>

</body>
</html>