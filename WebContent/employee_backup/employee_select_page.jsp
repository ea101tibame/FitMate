<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>EMPLOYEE</title>
</head>
<body bgcolor='white'>
 
<div>
	<img alt="" src="images/logo1.png" width="100" height="100" border="0">
	<h3>FitMate Employees</h3>
</div>

<h3>員工資料查詢</h3>

<c:if test="${not empty errorMsgs}">
	<a>看看你的錯:</a><br>
	<a>
	<c:forEach var="message" items="${errorMsgs}">${errorMsgs}</c:forEach>
	</a>
</c:if>

<ul>
<li><a href='showAllEmployee.jsp'>員工列表</a>點這看全部!! <br><br></li>


<jsp:useBean id="empSvc" scope="page" class="com.employee.model.EmployeeService" />

<li>
<form action="employee.do" method="post">
	<b>依員工編號選擇</b>
	<select size="1" name="empno">
		<c:forEach var="empVO" items="${empSvc.allEmp}">
		<option value="${empVO.empno}">${empVO.empno}
		</c:forEach>
	</select>
	<input type="hidden" name="action" value="getOne_Display">
	<input type="submit" value="查詢">
</form>
</li>

<li>
<form action="employee.do" method="post">
	<b>依員工姓名選擇</b>
	<select size="1" name="empno">
		<c:forEach var="empVO" items="${empSvc.allEmp}">
		<option value="${empVO.empno}">${empVO.ename}
		</c:forEach>
	</select>
	<input type="hidden" name="action" value="getOne_Display">
	<input type="submit" value="查詢">
</form>
</li>
</ul>

<h3>員工管理</h3>

<ul>
	<li><a href='insertOneEmp.jsp'>點此</a>新增員工</li>
</ul>

</body>
</html>