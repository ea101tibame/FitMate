<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.information.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	InformationVO infVO = (InformationVO)request.getAttribute("infVO");
%>

<html>
<head>
<title>消息詳情</title>
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
  #div1{
  	
  	border: 2px solid black;
    text-align: center;
    width :1296px ;
  }
  table {
	width: 1300px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid black;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>
</head>
<body bgcolor="white">

<div id="div1">
	<h3>FitMate消息詳情</h3>
	<a href="information_select_page.jsp"><img alt="" src="images/logo1.png" width="100" height="100" border="0">返回首頁</a> 	
</div>

<table>
	<tr>
		<td>消息編號</td>
		<td>發布日期</td>
		<td>標題</td>
		<td>內容</td>
	</tr>
	<tr>
		<td>${infVO.inno}</td>
		<td>${infVO.indate}</td>
		<td>${infVO.intitle}</td>
		<td>${infVO.indesc}</td>
	</tr>
</table>

</body>
</html>