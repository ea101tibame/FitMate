<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.employee.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	EmployeeVO empVO = (EmployeeVO)request.getAttribute("empVO");
%>
<html>
<head>
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
  .pic{
  height:180px;
  width:150px;
  }
</style>
<title>員工資料</title>
</head>
<body bgcolor = 'white'>

<div id="div1">
	<h3>FitMate員工資料</h3>
	<img alt="" src="images/logo1.png" width="100" height="100" border="0">
	<a href="showAllEmployee.jsp">返回員工列表</a>
	<a href="employee_select_page.jsp">返回首頁</a> 	
</div>

<table>
	<tr>
		<th>員工編號</th>
		<th>員工姓名</th>
		<th>員工帳號</th>
		<th>員工密碼</th>
		<th>雇用日期</th>
		<th>員工照片</th>
		<th>員工權限</th>
	</tr>
	<tr>
		<td>${empVO.empno}</td>
		<td>${empVO.ename}</td>
		<td>${empVO.eacc}</td>
		<td>${empVO.epsw}</td>
		<td>${empVO.edate}</td>
		<td><img src="<%=request.getContextPath()%>/employee/employeePic.do?empno=${empVO.empno}" class="pic"></td>
		<td>${empVO.esta}</td>		
	</tr>
</table>
</body>
</html>