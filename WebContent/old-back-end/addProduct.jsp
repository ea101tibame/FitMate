<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product.model.*"%> 

<%
	ProductVO productVO = (ProductVO) request.getAttribute("productVO");

%>
<jsp:useBean id="productSvc" scope="page" class="com.product.model.ProductService" />


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta charset="UTF-8">
<title>新增商品</title>


</head>
<body>
<h3>新增商品資料：</h3>
<a href="<%=request.getContextPath() %>/back-end/select_page.jsp">回首頁</a>
<c:if test="${not empty errorMsgs}">
	請修正以下錯誤
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
</c:if>

<form method="post" action="<%=request.getContextPath() %>/product/product.do" name="form1" enctype="multipart/form-data">
<table>
	<tr>
		<td>商品類別</td>
		<td>
	<jsp:useBean id="product_classSvc" scope="page" class="com.product_class.model.Product_classService" />
			<select size="1" name="pclass_id">
			
			<c:forEach var="product_classVO" items="${product_classSvc.all}">
				<option value="${product_classVO.pclass_id}" ${(productVO.pclass_id==product_classVO.pclass_id)? 'selected':'' }>
				${product_classVO.pclass_name}</option>
			</c:forEach>
			
	</select>
	
		</td>
	</tr>
	<tr>
		<td>商品名稱</td>
		<td><input type="text"  placeholder="請輸入商品名稱" name="prodname" size="40" value="<%= (productVO==null)? "" : productVO.getProdname()%>"/></td>
	</tr>
	<tr>
		<td>商品價格</td>
		<td><input type = "text" placeholder="請輸入商品價格" name="prodprice" size="40" value="<%= (productVO==null)? "":productVO.getProdprice()%>"/></td>
	</tr>
	<tr>
		<td>商品數量</td>
		<td><input type = "text" name="prodqty" placeholder="請輸入商品數量"  size="40" value="<%= (productVO==null)?"":productVO.getProdqty()%>"/></td>
	</tr>
	<tr>
		<td>商品狀態</td>
		<td><input type = "radio" name="prodsta" value="上架中" checked/>上架中
			<input type = "radio" name="prodsta" value="未上架" />未上架
		</td>
	</tr>
<tr>
		<td>商品圖片</td>
		<td>
		<input type="file" name="prodpic" placeholder="請選擇圖片" value=""/>

	</tr>
<tr>
		<td>商品描述</td>
		<td>
		<input type = "text" placeholder="請輸入商品描述" name="proddesc" size="40" value="<%= (productVO==null)?"":productVO.getProddesc()%>"/></td>
	</tr>
</table>

<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增">
</form>

</body>
</html>