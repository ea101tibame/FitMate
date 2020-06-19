<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.information.model.*"%>

<%
	InformationVO infVO = (InformationVO)request.getAttribute("infVO");
%>

<%
	Date indate = null ;
	try{
		indate = infVO.getIndate();
	} catch (Exception e){
		indate = new Date(System.currentTimeMillis());
	}
%>
<html>
<head>
<title>新增消息</title>
<script src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
</head>
<body>
	<div id="div1">
		<h3>新增消息</h3>
		<a href="information_select_page.jsp"><img alt="" src="images/logo1.png" width="100" height="100" border="0">返回首頁</a>
	</div>
	<c:if test="${not empty errorMsgs}">
		<a>看看你的錯:</a><br>
		<a><c:forEach var="message" items="${errorMsgs}">${errorMsgs}</c:forEach></a>
	</c:if>
	
<form action="information.do" method="post">

<table>
	<tr>
		<td>發布日期:</td>
		<td><input type="date" name="indate"></td>
	</tr>
	<tr>
		<td>標題:</td>
		<td><input type="text" name="intitle"></td>
	</tr>
	<tr>
		<td>內容:</td>
		<td><textarea style="width:500px;height:350px;" name="indesc" id="cke"></textarea></td>
	</tr>
</table><br>

<input type="submit" value="新增" onclick="javascript:return confirm();" id="confirm">
<input type="hidden" name="action" value="insert">

</form>	
<script>

function confirm(){
	var msg = '確定新增嗎?';
	if(confirm(msg)==true){
		return true ;
	} else {
		return false ;
	}
}

CKEDITOR.replace('cke', {});
</script>
</body>
</html>