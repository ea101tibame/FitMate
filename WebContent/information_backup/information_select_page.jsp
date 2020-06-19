<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Information</title>
</head>
<body bgcolor='white'>

<div>
	<img alt="" src="images/logo1.png" width="100" height="100" border="0">
	<h3>FitMate Information</h3>
</div>

<h3>消息查詢</h3>

<c:if test="${not empty errorMsgs}">
	<a>看看你的錯:</a><br>
	<a>
	<c:forEach var="message" items="${errorMsgs}">${errorMsgs}</c:forEach>
	</a>
</c:if>

<ul>
<li><a href='showAllInformation.jsp'>消息列表</a>點這看全部!! <br><br></li>


<jsp:useBean id="infSvc" scope="page" class="com.information.model.InformationService" />

<li>
<form action="information.do" method="post">
	<b>依編號選擇</b>
	<select size="1" name="inno">
		<c:forEach var="infVO" items="${infSvc.allInfByDate}">
		<option value="${infVO.inno}">${infVO.inno}
		</c:forEach>
	</select>
	<input type="hidden" name="action" value="getOne_Display">
	<input type="submit" value="查詢">
</form>
</li>

<li>
<form action="information.do" method="post">
	<b>依發布日期選擇</b>
	<select size="1" name="inno">
		<c:forEach var="infVO" items="${infSvc.allInfByDate}">
		<option value="${infVO.inno}">${infVO.indate}
		</c:forEach>
	</select>
	<input type="hidden" name="action" value="getOne_Display">
	<input type="submit" value="查詢">
</form>
</li>
</ul>

<h3>消息管理</h3>

<ul>
	<li><a href='insertOneInformation.jsp'>點此</a>新增消息</li>
</ul>

</body>
</html>