<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.product.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><%--JSTLI18N標籤庫--%>

<%
	ProductService prodSvc = new ProductService();
	List<ProductVO> list = prodSvc.getAll();
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
		<c:if test="${not empty errorMsgs}">
	請修正以下錯誤：
	<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li>${message}</li>
				</c:forEach>
			</ul>
		</c:if>
		<h1>商品資料管理</h1>
		<div class="row">
			<div class="col-1"><h3>搜尋商品</h3></div>
			<div class="col-2">
				<form method="post"
					action="<%=request.getContextPath()%>/product/product.do">
					<input type="text" name="prodno"> <input type="hidden"
						name="action" value="getOne_For_Display"> <input
						type="submit" value="送出">
				</form>
			</div>
			<div class="col-8"></div>
			
			<div class="col-1">
				<form
					action="<%=request.getContextPath()%>/back-end/product/addProduct.jsp">
					<INPUT TYPE=SUBMIT VALUE="新增商品" class="btn btn-warning">
				</form>
			</div>

		</div>
		
		<%@ include file="page1.file"%>
		<div class="table-responsive-sm table-hover table-success">
			<table class="table align-items-center">
				<tr>
					<th>商品編號</th>
					<th>商品類別</th>
					<th>商品名稱</th>
					<th>商品價格</th>
					<th>商品數量</th>
					<th>商品圖片</th>
					<th>商品描述</th>
					<th>商品狀態</th>
					<th>修改</th>
				</tr>

				<c:forEach var="productVO" items="${list}" begin="<%=pageIndex%>"
					end="<%=pageIndex+rowsPerPage-1%>">
					<tr>
						<td class="align-middle">${productVO.prodno}</td>
						<td class="align-middle"><jsp:useBean id="product_classSvc" scope="page"
								class="com.product_class.model.Product_classService" /> <c:forEach
								var="product_classVO" items="${product_classSvc.all}">
								<c:if test="${productVO.pclass_id==product_classVO.pclass_id}">
				${product_classVO.pclass_name}
			</c:if>
							</c:forEach></td>
						<td class="align-middle">${productVO.prodname}</td>
						<td class="align-middle">${productVO.prodprice}</td>
						<td class="align-middle">${productVO.prodqty}</td>
						<td class="align-middle"><img
							src="<%= request.getContextPath()%>/product/product.pic?prodno=${productVO.prodno}"
							width="180px" height="190px"></td>
						<td width="400" class="align-middle">${productVO.proddesc}</td>
						<td class="align-middle">${productVO.prodsta}</td>
						<td class="align-middle">
							<form method="post"
								action="<%=request.getContextPath()%>/product/product.do">
								<input type="submit" value="修改"
									class="btn btn-outline-success my-2 my-sm-0"> <input
									type="hidden" name="prodno" value="${productVO.prodno}">
								<input type="hidden" name="action" value="getOne_For_Update">
							</form>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<%@ include file="page2.file"%>
	</div>

	<!-- ------------------------------------從這裡結束編輯喔各位！----------------------- -->



</body>
</html>