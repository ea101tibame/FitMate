<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.information.model.*"%>

<%
	InformationService infSvc = new InformationService();
	List<InformationVO> inflist = infSvc.getAllInfByDate();
	pageContext.setAttribute("inflist", inflist);
%>

<html>
<head>
<meta charset="UTF-8">
<title>FitMate消息清單</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/list.js/1.5.0/list.min.js"></script>
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
	width:1596px;
	border: 2px solid black;
    text-align: center;
  }

	table, th, td {
    border: 1px solid black;
  }
  table {
	width: 1600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  
  th, td {
    padding: 5px;
    text-align: center;

  }
  .pic{
  height:180px;
  width:150px;
  }

</style>
</head>
<body bgcolor="white">

<div id="div1">
	<h3>FitMate消息清單</h3>
	<a href="information_select_page.jsp"><img alt="" src="images/logo1.png" width="100" height="100" border="0">返回首頁</a> 	
</div>

<table>
	<tr>
		<th>消息編號</th>
		<th>發布日期</th>
		<th>標題</th>
		<th>內容</th>
	</tr>

<c:forEach var="infVO" items="${inflist}">	
	<tr>
		<td>${infVO.inno}</td>
		<td>${infVO.indate}</td>
		<td>${infVO.intitle}</td>
		<td>${infVO.indesc}</td>
		<td>
			<form action="<%=request.getContextPath()%>/information/information.do" method="post" style="margin-bottom: 0px;">
			<input type="submit" value="更新資料">
			<input type="hidden" name="inno" value="${infVO.inno}">
			<input type="hidden" name="action" value="alterOneInf">
			</form>
		</td>
		<td>
			<form action="<%=request.getContextPath()%>/information/information.do" method="post" style="margin-bottom: 0px;">
			<input type="submit" value="刪除資料" onclick="javascript:return bye();">
			<input type="hidden" name="inno" value="${infVO.inno}">
			<input type="hidden" name="action" value="deleteOneInf">
			</form>
		</td>
	</tr>
	
</c:forEach>
</table>

<script>

function bye(){
	var msg = '確定要刪除該則訊息嗎?';
	if(confirm(msg)==true){
		return true ;
	} else {
		return false ;
	}
}



</script>

</body>
</html>