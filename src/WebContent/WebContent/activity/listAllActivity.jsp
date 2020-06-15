<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.activity.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
ActivityService activitySvc = new ActivityService();
    List<ActivityVO> list = activitySvc.getAllActivity();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>查詢所有活動資料 - listAllActivity.jsp</title>




</head>
<body bgcolor='white'>


<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<div class="table-responsive-xl">
  	<table class="table">
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
		<th>修改</th>
		<th>刪除</th>
		
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="activityVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
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
			<td><img src="<%=request.getContextPath()%>/activity/activitypic.do?actno=${activityVO.actno}" alt="活動圖片"></td>
			<td>${activityVO.stuno}</td>
			<td>${activityVO.coano}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/activity.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="actno"  value="${activityVO.actno}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/activity.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="actno"  value="${activityVO.actno}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>