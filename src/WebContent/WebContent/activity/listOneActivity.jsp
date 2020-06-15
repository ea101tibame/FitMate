<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.activity.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
	ActivityVO activityVO = (ActivityVO) request.getAttribute("activityVO"); //ActivityServlet.java(Concroller), �s�Jreq��activityVO����
%>

<html>
<head>
<title>�C�X�浧���ʸ�� - listOneActivity.jsp</title>

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
		 <h3>���u��� - listOneActivity.jsp</h3>
		 <h4><a href="selectActivity_page.jsp">�^����</a></h4>
	</td></tr>
</table>

<table>
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
			<td><img alt="���ʹϤ�" src="<%=request.getContextPath()%>/activity/activitypic.do?actno=${activityVO.actno}" style="width:500px;height:500px;"></td>
			<td>${activityVO.stuno}</td>
			<td>${activityVO.coano}</td>
	</tr>
</table>

</body>
</html>