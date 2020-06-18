<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.coach.model.*"%>
<%@ page import="com.expertise.model.*"%>
<%@ page import="com.expertise_own.model.*"%>
<%@ page import="java.util.List"%>

<!-- TODO Nullpointerexcption -->
<!-- TODO 用Ajax在同頁面顯示資料並修改,要套版，不用動態生成table-->
<!-- TODO 修改密碼，比對資料庫 -->
<!-- TODO 專長 圖片 -->


<%
  CoaVO coaVO = (CoaVO) request.getAttribute("coaVO"); //CoaServlet.java(Concroller), 存入req的coaVO物件
  List<ExpOwnVO> expOwnVOs = (List) request.getAttribute("expOwnVOs"); //CoaServlet.java(Concroller), 存入req的coaVO物件
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.16.0/dist/bootstrap-table.min.css">

<title>教練個人資料 - listOneCoach_ForStudent.jsp</title>

</head>
<body>
	    <h3>教練個人資料</h3>
		 
		<c:forEach var="expOwnVO" items="${expOwnVOs}">
		   <p>${expOwnVO.expno}</p>
		   <p>${expVO.expdesc}</p>
		   <p>${expOwnVO.expown}</p>
		</c:forEach>
		
<table class="table table-striped">
  <thead>
   <tr>
     	<th>編號</th>
     	<th>姓名</th>
     	<th>信箱</th>
     	<th>電話</th>
		<th>匯款帳戶</th>
		<th>點數</th>
		<th>狀態</th>
		<th>大頭照</th>
		<th>性別</th>
		<th>自我介紹</th>
		<th>總評價分數</th>
		<th>總評價人數</th>
		<th>輸入原密碼</th>
        <th>修改新密碼</th>
        <th>再次確認新密碼</th>
        <th>專長</th>
		<th>證照/獎狀</th>
		
	</tr>
  </thead>
  <tbody>
  	<tr>
		<td><%=coaVO.getCoano()%></td>
		<td><%=coaVO.getCoaname()%></td>
		<td><%=coaVO.getCoamail()%></td>
		<td><%=coaVO.getCoatel()%></td>
		<td><%=coaVO.getCoaacc()%></td>
		<td><%=coaVO.getCoapoint()%></td>
		<td><%=coaVO.getCoasta()%></td>
		<td><%=coaVO.getCoapic()%></td>
		<td><%=coaVO.getCoasex()%></td>
	    <td><%=coaVO.getCoaintro()%></td>
	    <td><%=coaVO.getCoaintro()%></td>
		<td><%=coaVO.getCoasctotal()%></td>
		<td><%=coaVO.getCoascqty()%></td>
		<td><%=coaVO.getCoapsw()%></td>
		<td><input type="text"></td>
		<td><input type="text"></td>
		<td></td>
		<td></td>
		

	</tr>
  </tbody>
</table>
</body>
<script src="https://unpkg.com/bootstrap-table@1.16.0/dist/bootstrap-table.min.js"></script>
</html>