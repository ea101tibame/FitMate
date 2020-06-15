<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.activity.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
ActivityService activitySvc = new ActivityService();
    List<ActivityVO> list = activitySvc.getAllActivity();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>�d�ߩҦ����ʸ�� - listAllActivity.jsp</title>




</head>
<body bgcolor='white'>


<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
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
		<th>���ʽs��</th>
		<th>���ʦW��</th>
		<th>���ʦa�I</th>
		<th>���ʤ��</th>
		<th>���ʮɬq</th>
		<th>���ʶ}�l���W���</th>
		<th>���ʺI����W���</th>
		<th>��������</th>
		<th>�����I��</th>
		<th>���ʳ̤p���ΤH��</th>
		<th>���ʳ̤j�W���H��</th>
		<th>���ʥثe���W�H��</th>
		<th>���ʴy�z</th>
		<th>���ʪ��A</th>
		<th>���ʹϤ�</th>
		<th>�ǭ��s��</th>
		<th>�нm�s��</th>
		<th>�ק�</th>
		<th>�R��</th>
		
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
			<td><img src="<%=request.getContextPath()%>/activity/activitypic.do?actno=${activityVO.actno}" alt="���ʹϤ�"></td>
			<td>${activityVO.stuno}</td>
			<td>${activityVO.coano}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/activity.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="actno"  value="${activityVO.actno}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/activity.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�R��">
			     <input type="hidden" name="actno"  value="${activityVO.actno}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>