<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.product.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    ProductVO productVO = (ProductVO) request.getAttribute("productVO");
%>
<!DOCTYPE html>
<html>
<head>
<style>
 table,tr,td,th{
 	border:1px solid red;
 	text-align:center;
 }
 img{
 width:200px;
 height:150px;
 }
</style>
<meta charset="UTF-8">
<title>查詢一筆商品資料</title>
</head>
<body>
<a href="<%=request.getContextPath() %>/back-end/select_page.jsp">回首頁</a><br>
<table>
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
		<th>刪除</th>
	</tr>
	<tr>


		<td><%=productVO.getProdno()%></td>
		<td>
		<jsp:useBean id="product_classSvc" scope="page" class="com.product_class.model.Product_classService" />
		<c:forEach var="product_classVO" items="${product_classSvc.all}">
			<c:if test="${productVO.pclass_id==product_classVO.pclass_id}">
				${product_classVO.pclass_name}
			</c:if>
		</c:forEach>
		</td>
		<td><%=productVO.getProdname()%></td>
		<td><%=productVO.getProdprice()%></td>
		<td><%=productVO.getProdqty()%></td>
		<td><img src="<%= request.getContextPath()%>/product/product.pic?prodno=${productVO.prodno}"></td>
		<td><%=productVO.getProddesc()%></td>
		<td><%=productVO.getProdsta()%></td>
		<td>
			<form method="post" action="<%=request.getContextPath()%>/product/product.do">
				<input type="submit" value="修改">
				<input type="hidden" name="prodno" value="${productVO.prodno}">
				<input type="hidden" name="action" value="getOne_For_Update">
			</form>
		</td>
		<td>
			 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product.do">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="prodno"  value="${productVO.prodno}">
			     <input type="hidden" name="action" value="delete"></FORM>
		</td>
		
	</tr>
</table>
</body>
</html>