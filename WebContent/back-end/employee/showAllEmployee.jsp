<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<title>FitMate管理後台</title>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css2?family=Caesar+Dressing&family=Coming+Soon&family=Noto+Sans+TC:wght@700&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous">
	
</script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous">
	
</script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous">
	
</script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.13.0/css/all.css"
	integrity="sha384-Bfad6CLCknfcloXFOyFnlgtENryhrpZCe29RTifKEixXQZ38WheV+i/6YWSzkz3V"
	crossorigin="anonymous">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
<link rel='stylesheet'
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/css/backend.css">
<style>
.pic {
	height: 140px;
	width: 120px;
}

body {
	background:
		url("<%=request.getContextPath()%>/images/backend_public/bg1ori.jpg");
	background-position: center center;
}

#main {
	margin-left: 5px;
}
</style>
</head>

<body>

	<%@ include file="/backinclude_test.jsp"%>

	<!-- 主要內文區開始 -->
	<div class="article side-open">
		<!-- logo區開始 -->
		<div id="logo">
			<img
				src="<%=request.getContextPath()%>/images/backend_public/logo.png"
				alt="">
		</div>
		<!-- logo區結束 -->

		<!-- ------------------------------------從這裡開始編輯喔各位！----------------------- -->


		<div id="main">
			<h1>FitMate所有員工資料</h1>
			<a href="<%=request.getContextPath()%>/back-end/employee/employee_select_page.jsp">返回首頁</a>
		</div>
		<div class="table-responsive-sm table-hover table-success">
			<table class="table align-items-center">
				<tr>
					<th>員工編號</th>
					<th>員工姓名</th>
					<th>員工帳號</th>
					<th>員工信箱</th>
					<th>雇用日期</th>
					<th>員工圖片</th>
					<th>員工權限</th>
				</tr>
				<%@ include file="page1.file"%>
				<c:forEach var="empVO" items="${emplist}" begin="<%=pageIndex%>"
					end="<%=pageIndex+rowsPerPage-1%>">

					<tr>
						<td>${empVO.empno}</td>
						<td>${empVO.ename}</td>
						<td>${empVO.eacc}</td>
						<td>${empVO.email}</td>
						<td>${empVO.edate}</td>
						<td><img
							src="<%=request.getContextPath()%>/employee/employeePic.do?empno=${empVO.empno}"
							class="pic"></td>
						<td>${empVO.esta}</td>
						<td>
							<form
								action="<%=request.getContextPath()%>/employee/employee.do"
								method="post" style="margin-bottom: 0px;">
								<input type="submit" value="更新資料"
									class="btn btn-outline-success my-2 my-sm-0"> <input
									type="hidden" name="empno" value="${empVO.empno}"> <input
									type="hidden" name="action" value="alterOneEmp">
							</form>
						</td>
						<td>
							<form
								action="<%=request.getContextPath()%>/employee/employee.do"
								method="post" style="margin-bottom: 0px;">
								<input type="submit" value="刪除資料"
									onclick="javascript:return bye();"
									class="btn btn-outline-success my-2 my-sm-0"> <input
									type="hidden" name="empno" value="${empVO.empno}"> <input
									type="hidden" name="action" value="deleteOneEmp">
							</form>
						</td>
						
					</tr>
				</c:forEach>
			</table>
			<%@ include file="page2.file"%>


			<!-- ------------------------------------從這裡結束編輯喔各位！----------------------- -->
		</div>
	</div>
	<script>
		function bye() {
			var msg = '你真的要把人家給刪掉嗎OAQ?';
			if (confirm(msg) == true) {
				return true;
			} else {
				return false;
			}
		}
		
	</script>

</body>
</html>