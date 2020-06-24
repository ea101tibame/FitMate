<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.coach.model.*"%>
<%@ page import="com.expertise.model.*"%>
<%@ page import="com.expertise_own.model.*"%>
<%@ page import="java.util.List"%>
<%@ page import="sun.misc.BASE64Encoder"%>

<!-- TODO Nullpointerexcption -->
<!-- TODO 用Ajax在同頁面顯示資料並修改,要套版，不用動態生成table-->
<!-- TODO 修改密碼，比對資料庫 -->
<!-- TODO 專長 圖片 -->


<%
	String coano = (String) session.getAttribute("coano");
	CoaService coaService = new CoaService();
	CoaVO coaVO = coaService.getOneCoa(coano);
	BASE64Encoder encoder = new BASE64Encoder();
	coaVO.setCoapicStr(encoder.encode(coaVO.getCoapic()));
	
	ExpOwnService expOwnService = new ExpOwnService();
	List<ExpOwnVO> expOwnVOs = expOwnService.getExpOwnsByCoano(coano);
	ExpService expService = new ExpService();
	for (ExpOwnVO expOwnVO : expOwnVOs) {
		ExpVO expVO = expService.getOneExp(expOwnVO.getExpno());
		expOwnVO.setExpdesc(expVO.getExpdesc());

		// encode bytes to base64 for display purpose
		expOwnVO.setExpownStr(encoder.encode(expOwnVO.getExpown()));
	}
	pageContext.setAttribute("coaVO", coaVO);
	pageContext.setAttribute("expOwnVOs", expOwnVOs);
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
		   <!-- TODO need to use img tag -->
		  <%--  <p>${expOwnVO.expownStr}</p> --%>
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
		<td>${coaVO.coano}</td>
		<td><%=coaVO.getCoaname()%></td>
		<td><%=coaVO.getCoamail()%></td>
		<td><%=coaVO.getCoatel()%></td>
		<td><%=coaVO.getCoaacc()%></td>
		<td><%=coaVO.getCoapoint()%></td>
		<td><%=coaVO.getCoasta()%></td>
		<!-- need to use img tag -->
		<td><img src="data:image/png;base64,${coaVO.coapicStr}" class="card-img-top expown" style="width: 400px; height: 400px;" alt="證照或獎狀圖">></td>
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