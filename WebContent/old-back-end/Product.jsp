<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.product.model.*"%>

<%
	ProductService prodSvc = new ProductService();
	List<ProductVO>list = prodSvc.getAll();
	pageContext.setAttribute("list",list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品列表</title>

<style>
  table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>
</head>
<body>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<table>
	商品列表<br>
	<thead>
		<th>商品編號</th>
		<th>商品類別</th>
		<th>商品名稱</th>
		<th>商品價格</th>
		<th>商品數量</th>
		<th>商品圖片</th>
		<th>商品描述</th>
		<th>商品狀態</th>
	</thead>
	<tbody>
	<%@ include file="page1.file" %> 
	<c:forEach var="empVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr>${productVO.prodno}</tr>
		<tr>${productVO.pclass_id}</tr>
		<tr>${productVO.prodname}</tr>
		<tr>${productVO.prodprice}</tr>
		<tr>${productVO.prodqty}</tr>
		<tr>${productVO.prodpic}</tr>
		<tr>${productVO.proddesc}</tr>
		<tr>${productVO.prodsta}</tr>	
	</c:forEach>
	</tbody>
</table>
</body>
</html>