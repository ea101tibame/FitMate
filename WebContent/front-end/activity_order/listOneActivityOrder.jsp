<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.activity_order.model.*"%>


<%
Activity_orderVO activity_orderVO = (Activity_orderVO) request.getAttribute("activity_orderVO"); //ActivityServlet.java(Concroller), �s�Jreq��activityVO����
%>

<html>
<head>
<title>�C�X�浧���ʭq���� - listOneActivityOrder.jsp</title>

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
		 <h3>�浧���ʭq���� - listOneActivityOrder.jsp</h3>
		 <h4><a href="selectActivityOrder_page.jsp">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>���ʭq��s��</th>
		<th>���ʽs��</th>
		<th>�ǭ��s��</th>
		<th>���ʱнm����</th>
		<th>���ʭq��ɶ�</th>
	</tr>
	<tr>
			<td>${activity_orderVO.aord_no}</td>
			<td>${activity_orderVO.actno}</td>
			<td>${activity_orderVO.stuno}</td>
			<td>${activity_orderVO.aord_sc}</td>
			<td><fmt:formatDate value="${activity_orderVO.aord_time}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
			
	</tr>
</table>

</body>
</html>