<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.deposit.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String stuno = (String)request.getAttribute("stuno");
%>

<html>
<head>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>點數儲值頁面</title>
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

		<div id="main">
			<h1>點數儲值</h1>
			<a href="<%=request.getContextPath()%>/front-end/deposit/deposit_index.jsp">返回儲值首頁</a>
		</div>
		
		<form action="<%=request.getContextPath()%>/deposit/deposit.do" method="post">
			<table>
				<tr>
					<td><input type="hidden" name="stuno" value="${stuno}"></td>
					<td>請輸入儲值金額</td>
					<td><input type="number" name="depprice"></td>
				</tr>
			</table><br>
			<input type="button" value="進入線上付款頁面" id="confirm">
			<input type="hidden" name="action" value="insert">
		</form>	

<script>
	$(document).ready(function(){
		$('input:button').on('click',function(e){
			e.preventDefault();
			swal({
				title:'注意',
				text:'接下來將進入線上刷卡頁面,您確定要繼續嗎?',
				icon:'warning',
				buttons:true,
				dangerMode:true
			}).then(function(isConfirm){
				if(isConfirm){
				window.open('/EA101G5/front-end/deposit/creditcard_index.html','線上刷卡',config='height=1080px,width=1920px');
				setTimeout(function(){
					swal('成功','你已經完成儲值作業	   請靜待頁面跳轉','success');
				},1000);	
				setTimeout(function(){
					$('input:button').parent('form').submit();
				},24000);
				} else {
					swal('取消','已取消儲值作業','error');
				}
			});
		});
	});
</script>
</body>
</html>