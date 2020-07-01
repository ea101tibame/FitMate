<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.sale_project.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><%--JSTLI18N標籤庫--%>
<%
Sale_projectVO sale_projectVO = (Sale_projectVO)request.getAttribute("sale_projectVO");
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
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Caesar+Dressing&family=Coming+Soon&family=Noto+Sans+TC:wght@700&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js">
	
</script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js">
	
</script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js">
	
</script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css">
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
			<h2>促銷管理</h2>
		</div>
		<c:if test="${not empty errorMsgs}">
			<font style="color: red">請修正以下錯誤:</font>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>
		<h4>1.促銷專案</h4>
		<div class="table-responsive-sm table-hover table-success">
			<table class="table align-items-center">
				<tr>
					<td class="text-right">促銷專案編號</td>
					<td class="text-left">${sale_projectVO.sapro_no}</td>
				</tr>
				<tr>
					<td class="text-right">促銷專案名稱</td>
					<td class="text-left">
					<input type="text" value="${sale_projectVO.sapro_name}" name="sapro_name" size="30"/>
					</td>
				</tr>
				<tr>
					<td class="text-right">促銷開始日期</td>
					<td class="text-left">
					<input type="date" value="${sale_projectVO.sapro_start}" name="sapro_start" size="45"/>
					</td>
				</tr>
				<tr>
					<td class="text-right">促銷結束日期</td>
					<td class="text-left">
					<input type="date" value="${sale_projectVO.sapro_end}" name="sapro_end" size="45"/>
					</td>
				</tr>
			</table>
		</div>
		<h4>2.促銷商品明細 <input type="button" value="新增商品" class="btn btn-primary"></h4>
		<div class="table-responsive-sm table-hover table-success">
			<table class="table align-items-center">
				<tr>
					<th>商品名稱</th>
					<th>促銷價格</th>
					<th>修改</th>
					<th>刪除</th>
				</tr>
  <jsp:useBean id="sale_listSvc" scope="page" class="com.sale_list.model.Sale_listService" /> 
	  <c:forEach var="sale_listVO" items="${sale_listSvc.all}">
	  	<c:if test="${sale_projectVO.sapro_no==sale_listVO.sapro_no}">
					<tr>
			<jsp:useBean id="productSvc" scope="page" class="com.product.model.ProductService" /> 
				  <c:forEach var="productVO" items="${productSvc.all}">
				  	<c:if test="${productVO.prodno==sale_listVO.prodno}">
				  	<th>${productVO.prodname}</th>
				  </c:if>
				  </c:forEach>
						<th>${sale_listVO.sapro_price}</th>
						<th>修改</th>
						<th>刪除</th>
					</tr>
		</c:if>
		</c:forEach>	
			</table>
		</div>


		<!-- ------------------------------------從這裡結束編輯喔各位！----------------------- -->
</body>
</html>