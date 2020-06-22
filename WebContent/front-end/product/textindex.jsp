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
<meta charset="UTF-8">
<title>測試購物車</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/css/core-style.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/custom-css/product/product.css">
<script
	src="<%=request.getContextPath()%>/js/jquery/jquery-2.2.4.min.js"></script>
</head>
<body>
	<%@ include file="page1.file"%>
	<table id="table-1">
		<tr>
			<th width="200">商品編號</th>
			<th width="100">商品名稱</th>
			<th width="100">商品價格</th>
			<th width="100">商品數量</th>
			<th width="100">放入購物車</th>
		</tr>
	</table>



	<c:forEach var="productVO" items="${list}" begin="<%=pageIndex%>"
		end="<%=pageIndex+rowsPerPage-1%>">
		<form id="${productVO.prodno}_form" name="shoppingForm"
			action="<%=request.getContextPath()%>/Shopping.html" method="POST">
			<table>
				<tr>
					<td width="200"><div align="center">${productVO.prodno}</div></td>
					<td width="100"><div align="center">${productVO.prodname}</div></td>
					<td width="100"><div align="center">${productVO.prodprice}</div></td>
					<td width="120"><div align="center">
							數量：<input type="text" name="qty" value="1">
						</div></td>
					<td width="120"><div align="center">
							<input type="submit" class="button" value="放入購物車"> 
							<input type="hidden" name="prodno" value="${productVO.prodno}">
							<input type="hidden" name="prodname" value="${productVO.prodname}"> 
							<input type="hidden" name="prodprice" value="${productVO.prodprice}"> 
							<input type="hidden" name="qty" value="${productVO.qty}"> 
							<input type="hidden" name="action" value="ADD">
						</div></td>
				</tr>
			</table>
		</form>
		<script>
			$("#${productVO.prodno}_form").submit(function(e) {

				var form = $(this);
				var url = form.attr('action');

				$.ajax({
					type : "POST",
					url : url,
					data : form.serialize(), // serializes the form's elements.
					success : function(data) {
						console.log(data); // show response from the php script.
						$("#modal").html(data)
					},
					error : function(err) {
						console.log(data); // show response from the php script.
					}
				});

				e.preventDefault(); // avoid to execute the actual submit of the form.
			});
		</script>
	</c:forEach>

	<a
		href="<%=request.getContextPath()%>/front-end/product/textshoppingcar.jsp">查看我的購物車</a>

	<div id="modal"></div>


</body>
</html>