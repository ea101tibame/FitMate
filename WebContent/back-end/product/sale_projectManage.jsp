<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.sale_project.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><%--JSTLI18N標籤庫--%>
<%
Sale_projectService saproSvc = new Sale_projectService();
List<Sale_projectVO> list = saproSvc.getAll();
pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<title>FitMate管理後台</title>
<meta charset="utf-8">

<style>
body {
	background:
		url("<%=request.getContextPath()%>/images/backend_public/bg1ori.jpg");
	background-position: center center;
}
</style>
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
</head>

<body>

	<%@ include file="/back-end/backinclude.jsp"%>

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
			<h1>促銷管理</h1>
			<div class="row">
			<div class="col-10">
			</div>
			<div class="col-1">
				<form
					action="<%=request.getContextPath()%>/back-end/product/addSale_project.jsp">
					<INPUT TYPE="SUBMIT" VALUE="新增促銷專案" class="btn btn-warning">
				</form>
			</div>
		</div>
		</div>

		<c:if test="${not empty errorMsgs}">
				請修正以下錯誤：
				<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li>${message}</li>
				</c:forEach>
			</ul>
		</c:if>
		<%@ include file="page1.file"%>
		<div class="table-responsive-sm table-hover table-success">
			<table class="table align-items-center">
				<tr>
					<th>促銷編號</th>
					<th>促銷開始日期</th>
					<th>促銷結束日期</th>
					<th>修改</th>
				</tr>
				<c:forEach var="sale_projectVO" items="${list}"
					begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1 %>">
					<tr>
					
						<td>${sale_projectVO.sapro_no}</td>
						<td>${sale_projectVO.sapro_start}</td>
						<td>${sale_projectVO.sapro_end}</td>
						<td>
				<form method="post" action="<%=request.getContextPath()%>/product/sale_project.html">
					<input type="submit" value="修改" class="btn btn-outline-success my-2 my-sm-0"> 
					<input type="hidden" name="sapro_no" value="${sale_projectVO.sapro_no}">
					<input type="hidden" name="action" value="getOne_For_Update">
				</form>
						</td>
					</tr>
					<tr>
						<th colspan="2">促銷商品名稱</th>
						<th colspan="2">促銷價格</th>
					</tr>
					<jsp:useBean id="sale_listSvc" scope="page"
						class="com.sale_list.model.Sale_listService" />
					<c:forEach var="sale_listVO" items="${sale_listSvc.all}">
						<c:if test="${sale_projectVO.sapro_no==sale_listVO.sapro_no}">
							<tr>
								<td colspan="2">
								<jsp:useBean id="prodSvc" scope="page" class="com.product.model.ProductService" />
								<c:forEach var="productVO" items="${prodSvc.all}">
									<c:if test="${productVO.prodno==sale_listVO.prodno}">
									${productVO.prodname}
									</c:if>
								</c:forEach>
								</td>
								<td colspan="2">${sale_listVO.sapro_price}</td>
							</tr>
						</c:if>
					</c:forEach>
				</c:forEach>
			</table>
			<div class="newprod"></div>
		</div>
		<%@ include file="page2.file"%>
		<!-- ------------------------------------從這裡結束編輯喔各位！----------------------- -->
</body>
</html>