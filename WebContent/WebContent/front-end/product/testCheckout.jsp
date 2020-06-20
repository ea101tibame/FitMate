<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.* , com.product.model.*"%>
<html>
<head>
 <title>Mode II 範例程式 - Checkout.jsp</title>

 </head>
<body>

<hr><p>

<table id="table-1" style="margin: auto;">
	<tr>
		<th width="200">書名</th>
		<th width="100">作者</th>
		<th width="100">出版社</th>
		<th width="100">價格</th>
		<th width="100">數量</th>
		<th width="120"><h3>總價</h3></th>
	</tr></table><table style="margin: auto;">

	<%  @SuppressWarnings("unchecked")
		Vector<ProductVO> buylist = (Vector<ProductVO>) session.getAttribute("shoppingcart");
		String amount =  (String) request.getAttribute("amount");
	%>	
	<%	for (int i = 0; i < buylist.size(); i++) {
		ProductVO order = buylist.get(i);
			String prodno = order.getProdno();
			String prodname = order.getProdname();
			Integer prodprice = order.getProdprice();
			Integer qty = order.getQty();
	%>
	<tr>
		<td width="200"><%=prodno%>     </td>
		<td width="100"><%=prodname%>   </td>
		<td width="100"><%=prodprice%></td>
		<td width="100"><%=qty%>    </td>
	</tr>
	<%
		}
	%>
	 
	
	<tr>
		<td colspan="6" style="text-align:right;"> 
		   <font size="+2">總金額：$<%=amount%></font>
	    </td>
	</tr>
</table>
       
       
       <p><a href="<%=request.getContextPath()%>/front-end/product/textindex.jsp"><font size="+1"> 是 否 繼 續 購 物</font></a>

</body>
</html>