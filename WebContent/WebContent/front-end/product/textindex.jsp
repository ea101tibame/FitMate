<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<table id="table-1">
  <tr> 
    <th width="200">商品編號</th>
    <th width="100">商品名稱</th>
    <th width="100">商品價格</th>
    <th width="100">商品數量</th>
    <th width="100">放入購物車</th>
  </tr></table>
 

  <form name="shoppingForm" action="<%=request.getContextPath() %>/Shopping.html" method="POST">
    <table><tr> 
      <td width="200"><div align="center">P001</div></td>
      <td width="100"><div align="center">運動背心</div></td>
      <td width="100"><div align="center">66</div></td>
      <td width="120"><div align="center">數量：<input type="text" name="prodqty" size="3" value=1></div></td>
      <td width="120"><div align="center"><input type="submit" class="button" value="放入購物車"> </div></td>
    </tr></table>
      <input type="hidden" name="prodno" value="P001">
      <input type="hidden" name="prodname" value="運動背心">
      <input type="hidden" name="prodprice" value="66">
      <input type="hidden" name="prodqty" value="6">
      <input type="hidden" name="action" value="ADD">
  </form>
  
  <form name="shoppingForm" action="/Shopping.html" method="POST">
    <table><tr> 
      <td width="200"><div align="center">P002</div></td>
      <td width="100"><div align="center">足球</div></td>
      <td width="100"><div align="center">900</div></td>
      <td width="120"><div align="center">數量：<input type="text" name="prodqty" size="3" value=1></div></td>
      <td width="120"><div align="center"><input type="submit" class="button" value="放入購物車"> </div></td>
    </tr></table>
      <input type="hidden" name="prodno" value="P002">
      <input type="hidden" name="prodname" value="足球">
      <input type="hidden" name="prodprice" value="900">
      <input type="hidden" name="prodqty" value="6">
      <input type="hidden" name="action" value="ADD">
  </form>
  

</body>
</html>