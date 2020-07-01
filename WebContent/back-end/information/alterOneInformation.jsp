<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.information.model.*"%>
<%@page import="java.sql.Date"%>

<%
	InformationVO infVO = (InformationVO)request.getAttribute("infVO");
%>

<%
	Date indate = null ;
	try{
		indate = infVO.getIndate();
	} catch(Exception e){
		indate = new Date(System.currentTimeMillis());
	}
%>
<html>
<head>
<script src="<%=request.getContextPath()%>/back-end/ckeditor/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<title>修改消息</title>
</head>
<body>
	<div id="div1">
		<h3>修改消息</h3>
		<img alt="" src="images/logo1.png" width="100" height="32" border="0">
		<a href="<%=request.getContextPath()%>/back-end/information/showAllInformation.jsp">返回消息列表</a>
		<a href="<%=request.getContextPath()%>/back-end/information/information_select_page.jsp">返回首頁</a>
	</div>
	<c:if test="${not empty errorMsgs}">
		<a>看看你的錯:</a><br>
		<a><c:forEach var="message" items="${errorMsgs}">${errorMsgs}</c:forEach></a>
	</c:if>
	
	<form action="information.do" method="post">
	<table>
		<tr>
			<td>消息編號:<font color="red"><b>*</b></font></td>
			<td>${infVO.inno}</td>
		</tr>
		<tr>
			<td>類別:</td>
			<td>${infVO.intype}</td>
		</tr>
		<tr>
			<td>發布日期:</td>
			<td><input type="date" name="indate" value="${infVO.indate}">${infVO.indate}</td>
		</tr>
		<tr>
			<td>標題:</td>
			<td><input type="text" name="intitle" value="${infVO.intitle}"></td>
		</tr>
		<tr>
			<td>內容:</td>
			<td><textarea style="width:500px;height:350px;" name="indesc" id="cke">${infVO.indesc}</textarea></td>
		</tr>
	</table><br>
	
	<input type="submit" value="修改送出" onclick="javascript:return bye();">
	<input type="hidden" value="alter" name="action">	
	<input type="hidden" value="${infVO.inno}" name="inno">
	<input type="hidden" name="intype" value="${infVO.intype}">
	
	</form>
<script>

function bye(){
	var msg = '確定送出修改資料嗎?';
	if(confirm(msg)==true){
		return true ;
	} else {
		return false ;
	}
}

CKEDITOR.replace('cke');
</script>	

</body>
</html>