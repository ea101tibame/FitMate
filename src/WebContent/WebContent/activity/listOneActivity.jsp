<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.activity.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
	ActivityVO activityVO = (ActivityVO) request.getAttribute("activityVO"); //ActivityServlet.java(Concroller), 存入req的activityVO物件
%>

<html>
<head>
<title>列出單筆活動資料 - listOneActivity.jsp</title>

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
		 <h3>員工資料 - listOneActivity.jsp</h3>
		 <h4><a href="selectActivity_page.jsp">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>活動編號</th>
		<th>活動名稱</th>
		<th>活動地點</th>
		<th>活動日期</th>
		<th>活動時段</th>
		<th>活動開始報名日期</th>
		<th>活動截止報名日期</th>
		<th>活動類型</th>
		<th>活動點數</th>
		<th>活動最小成團人數</th>
		<th>活動最大上限人數</th>
		<th>活動目前報名人數</th>
		<th>活動描述</th>
		<th>活動狀態</th>
		<th>活動圖片</th>
		<th>學員編號</th>
		<th>教練編號</th>
	</tr>
	<tr>
			<td>${activityVO.actno}</td>
			<td>${activityVO.actname}</td>
			<td>${activityVO.actloc}</td>
			<td><fmt:formatDate value="${activityVO.actdate}" pattern="yyyy-MM-dd" /></td>
			<td>${activityVO.actss}</td>
			<td><fmt:formatDate value="${activityVO.actstart}" pattern="yyyy-MM-dd" /></td>
			<td><fmt:formatDate value="${activityVO.actend}" pattern="yyyy-MM-dd" /></td>
			<td>${activityVO.acttype}</td>
			<td>${activityVO.actprice}</td>
			<td>${activityVO.actmin}</td>
			<td>${activityVO.actmax}</td>
			<td>${activityVO.actcur}</td>
			<td>${activityVO.actdesc}</td>
			<td>${activityVO.actsta}</td>
			<td><img alt="活動圖片" src="<%=request.getContextPath()%>/activity/activitypic.do?actno=${activityVO.actno}" style="width:500px;height:500px;"></td>
			<td>${activityVO.stuno}</td>
			<td>${activityVO.coano}</td>
	</tr>
</table>

</body>
</html>