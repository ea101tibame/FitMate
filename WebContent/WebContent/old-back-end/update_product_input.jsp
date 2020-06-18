<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product.model.*"%>
<%
	ProductVO productVO = (ProductVO)request.getAttribute("productVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改商品資料</title>
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

<FORM METHOD="post" ACTION="<%=request.getContextPath() %>/product/product.do" name="form1" enctype="multipart/form-data">
<a href="<%=request.getContextPath() %>/back-end/select_page.jsp">回首頁</a>
<table>
	<tr>
		<td>商品編號:<font color=red><b>*</b></font></td>
		<td><%=productVO.getProdno()%></td>
	</tr>
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
		<td>商品名稱:</td>
		<td><input type="TEXT" name="prodname" size="45" value="<%=productVO.getProdname()%>" /></td>
	</tr>
	<tr>
		<td>商品價格:</td>
		<td><input type="TEXT" name="prodprice" size="45" value="<%=productVO.getProdprice()%>" /></td>
	</tr>
	<tr>
		<td>商品數量:</td>
		<td>
		<input type="TEXT" name="prodqty" size="45" value="<%=productVO.getProdqty()%>" />
		</td>
	</tr>
	<tr>
		<td>商品圖片:</td>
		<td>
		<img src="<%= request.getContextPath()%>/product/product.pic?prodno=${productVO.prodno}"><br><br>
		<input type="file" name="prodpic" size="45" value="<%=productVO.getProdpic()%>" />
		</td>
	</tr>
	<tr>
		<td>商品描述:</td>
		<td><input type="text" name="proddesc" size="45" value="<%=productVO.getProddesc()%>" /></td>
	</tr>
	<tr>
		<td>商品狀態:</td>
		<td><input type = "radio" name="prodsta" value="上架中" checked/>上架中
			<input type = "radio" name="prodsta" value="未上架" />未上架</td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="prodno" value="<%=productVO.getProdno()%>">
<input type="submit" value="送出修改"></FORM>
</body>
</html>