<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product.model.*"%>
<%@ page import="com.product_order_list.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><%--JSTLI18N標籤庫--%>
<%
	ProductService prodSvc = new ProductService();
	Product_order_listService prod_order_listSvc = new Product_order_listService();
	List<ProductVO> list = prodSvc.getOnShelves();
	pageContext.setAttribute("list", list);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>測試購物車</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/css/core-style.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/custom-css/product/product.css">
</head>
<body>

		<%@ include file="page1.file"%>
		<div class="table-responsive-sm table-hover table-success">
			<table class="table align-items-center">
				<tr>
					<th>商品名稱</th>
					<th>商品價格</th>
					<th>商品圖片</th>
					

					<th>加入購物車</th>
				</tr>

				<c:forEach var="productVO" items="${list}" begin="<%=pageIndex%>"
					end="<%=pageIndex+rowsPerPage-1%>">
					<form method="post" action="<%=request.getContextPath()%>/shopping.html">
					<tr>
						<td class="align-middle">${productVO.prodname}</td>
						<td class="align-middle">${productVO.prodprice}</td>
						<td class="align-middle"><img
							src="<%= request.getContextPath()%>/product/product.pic?prodno=${productVO.prodno}"
							width="180px" height="190px"></td>
						<td>


						</td>	
						<td width="400" class="align-middle">
								<input type="submit" value="加入購物車" class="btn btn-outline-success my-2 my-sm-0"> 
								<input type="hidden" name="prodno" value="${productVO.prodno}">
								<input type="hidden" name="action" value="getOne_For_Update">
						</td>
					</tr>
					</form>
				</c:forEach>
			</table>
		</div>
		<%@ include file="page2.file"%>





</body>
</html>