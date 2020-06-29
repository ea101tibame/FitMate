<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.* , com.product.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% @SuppressWarnings("unchecked")
Vector<ProductVO> buylist = (Vector<ProductVO>) session.getAttribute("shoppingcart");%>
<%
	if (buylist != null && (buylist.size() > 0)) {
%>
</head>
<body>

	<h3>目前購物車內容如下：</h3>

	<div class="table-responsive-sm table-hover table-success">
		<table class="table align-items-center">
			<tr>
				<th>商品編號</th>
				<th>商品名稱</th>
				<th>商品價格</th>
				<th>商品數量</th>
				<th>刪除商品</th>
			</tr>
	
			<%
				for (int index = 0; index < buylist.size(); index++) {
					ProductVO order = buylist.get(index);
			%>
			<tr>
			
				<td class="align-middle"><%=order.getProdno()%></td>
				<td class="align-middle"><%=order.getProdname()%></td>
				<td class="align-middle"><%=order.getProdprice()%></td>
				<td class="align-middle"><%=order.getQty()%></td>
				<td width="400" class="align-middle"></td>
				<td class="align-middle">
	<form name="deleteForm" method="post" action="<%=request.getContextPath()%>/Shopping.html">				
						<input type="hidden" name="action" value="DELETE">
						<input type="hidden" name="del" value="<%=index%>"> 
						<input type="submit" value="刪除此商品" class="button">
	</form>
				</td>
			</tr>
			<%}%>
		</table>

			<form name="checkoutForm" action="<%=request.getContextPath()%>/Shopping.html" method="POST">
				
				<input type="hidden" name="action"	value="CHECKOUT"> 
                <input type="submit" value="付款結帳">
			</form>
	</div>

	<%}%>
</body>
</html>