<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="java.util.* , com.product.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	Vector<ShoppingVO> buylist = (Vector<ShoppingVO>) session.getAttribute("shoppingcart");
%>
<%
	if (buylist != null && (buylist.size() > 0)) {
%>
</head>
<body>

	<h3>�ثe�ʪ������e�p�U�G</h3>

	<div class="table-responsive-sm table-hover table-success">
		<table class="table align-items-center">
			<tr>
				<th>�ӫ~�s��</th>
				<th>�ӫ~�W��</th>
				<th>�ӫ~����</th>
				<th>�ӫ~�ƶq</th>
				<th>�R���ӫ~</th>
			</tr>

			<%
				for (int index = 0; index < buylist.size(); index++) {
						ShoppingVO order = buylist.get(index);
			%>
			<tr>
				<td class="align-middle"><%=order.getProdno()%></td>
				<td class="align-middle"><%=order.getProdname()%></td>
				<td class="align-middle"><%=order.getProdprice()%></td>
				<td class="align-middle"><%=order.getProdqty()%></td>
				<td width="400" class="align-middle"></td>
				<td class="align-middle">
					<form method="post" action="<%=request.getContextPath()%>/shopping.html">
						<input type="hidden" name="action" value="DELETE">
						<input type="hidden" name="del" value="<%=index%>"> 
						<input type="submit" value="�R�����ӫ~">
					</form>
				</td>
			</tr>
			<%
				}
			%>
		</table>
		<table>
			<tr>
			<form name="checkoutForm" action="Shopping.html" method="POST">
				<input type="hidden" name="action"	value="CHECKOUT"> 
               <input type="submit" value="�I�ڵ��b">
			</form>
		</table>

	</div>



	<%
		}
	%>
</body>
</html>