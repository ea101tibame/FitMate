<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><%--JSTLI18N標籤庫--%>
<%
Vector<ProductVO> buylist = (Vector<ProductVO>)session.getAttribute("shoppingcart");
%>
<%@ page import="com.product_order_list.model.*"%>
<% 
ProductService prodSvc = new ProductService();
if(buylist!=null && (buylist.size()>0)){
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/css/core-style.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/custom-css/product/product.css">
</head>
<body>

<h3>目前購物車內容如下：</h3>
	
	<div class="table-responsive-sm table-hover table-success">
		<table class="table align-items-center">
			<tr>
				<th>商品名稱</th>
				<th>商品價格</th>
				<th>商品圖片</th>
				<th>商品數量</th>
				<th>刪除商品</th>
			</tr>

			<tr>
					<td class="align-middle">${productVO.prodname}</td>
					<td class="align-middle">${productVO.prodprice}</td>
					<td class="align-middle">
					<img
						src="<%= request.getContextPath()%>/product/product.pic?prodno=${productVO.prodno}"
						width="180px" height="190px">
					</td>
					<td class="align-middle">
					<jsp:useBean id="polpordqty" scope="session" class="com.product_order_list.model.Product_order_listService" />
					<input type="text" size="3" value="1" name="${product_order_list.prod_qty}">			
					</td>
					<td width="400" class="align-middle">
					</td>
					<td class="align-middle">
						<form method="post"
							action="<%=request.getContextPath()%>/shopping.html">
							<input type="submit" value="刪除此商品"
								class="btn btn-outline-success my-2 my-sm-0">
							<input type="hidden" name="prodno" value="${productVO.prodno}">
							<input type="hidden" name="action" value="DELETE">
						</form>
					</td>
				</tr>

			<tr>
				<td>商品金額:${product_order_list.prodtotal}</td>
				<jsp:useBean id="prodor" scope="session" class="com.product_order.model.Product_orderService" />
				<td>運費:${product_order.fare}</td>
				<td>總計:${poduct_order_list.prodtatal}</td>
			</tr>
		</table>
	</div>

	
	
<%}%>
</body>
</html>