<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.employee.model.*"%>


<%
	EmployeeService empSvc = new EmployeeService();
	List<EmployeeVO> emplist = empSvc.getAllEmp();
	pageContext.setAttribute("emplist", emplist);
%>

<html>
<head>
<title>FitMate所有員工資料</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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
	width:1296px;
	border: 2px solid black;
    text-align: center;
  }

	table, th, td {
    border: 1px solid black;
  }
  table {
	width: 1300px;
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
<body bgcolor = 'white'>

<div id="div1">
	<h3>FitMate所有員工資料</h3>
	<a href="employee_select_page.jsp"><img alt="" src="images/logo1.png" width="100" height="100" border="0">返回首頁</a> 	
</div>


<table>
	<tr>
		<th>員工編號</th>
		<th>員工姓名</th>
		<th>員工帳號</th>
		<th>雇用日期</th>
		<th>員工圖片</th>
		<th>員工權限</th>
		
	</tr>
<%@ include file="page1.file" %> 
<c:forEach var="empVO" items="${emplist}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">

	<tr>
		<td>${empVO.empno}</td>
		<td>${empVO.ename}</td>
		<td>${empVO.eacc}</td>	
		<td>${empVO.edate}</td>
		<td><img src="<%=request.getContextPath()%>/backend/employee/employeePic.do?empno=${empVO.empno}" class="pic"></td>
		<td>${empVO.esta}</td>	
		<td>
			<form action="<%=request.getContextPath()%>/backend/employee/employee.do" method="post" style="margin-bottom: 0px;">
			<input type="submit" value="更新資料">
			<input type="hidden" name="empno" value="${empVO.empno}">
			<input type="hidden" name="action" value="alterOneEmp">
			</form>
		</td>
		<td>
			<form action="<%=request.getContextPath()%>/backend/employee/employee.do" method="post" style="margin-bottom: 0px;">
			<input type="submit" value="刪除資料" onclick="javascript:return bye();">
			<input type="hidden" name="empno" value="${empVO.empno}">
			<input type="hidden" name="action" value="deleteOneEmp">
			</form> 
		</td>	
	</tr>
</c:forEach>
</table>
<%@ include file="page2.file" %> 
<script>

function bye(){
	var msg = '你真的要把人家給刪掉嗎OAQ?';
	if(confirm(msg)==true){
		return true ;
	} else {
		return false ;
	}
}

</script>

</body>
</html>