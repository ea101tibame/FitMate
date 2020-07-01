<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sale_project.model.*"%>
<%@ page import="com.sale_list.model.*"%>

<%
	Sale_projectVO sale_projectVO = (Sale_projectVO) request.getAttribute("sale_projectVO");
	Sale_listVO sale_listVO = (Sale_listVO) request.getAttribute("Sale_listVO");	
%>

<!DOCTYPE html>
<html>
<head>
<title>FitMate管理後台</title>
<meta charset="utf-8">

<style>
		body{ 
			background:url("<%=request.getContextPath()%>/images/backend_public/bg1ori.jpg");
			 background-position: center center;
		}
</style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Caesar+Dressing&family=Coming+Soon&family=Noto+Sans+TC:wght@700&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js">
	
</script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js">
	
</script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js">
	
</script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.13.0/css/all.css">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
<link rel='stylesheet'
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/css/backend.css">
</head>

<body>

	<%@ include file="/back-end/backinclude.jsp"%>

	<!-- 主要內文區開始 -->
	<div class="article side-open">
		<!-- logo區開始 -->
		<div id="logo">
			<img src="<%=request.getContextPath()%>/images/backend_public/logo.png" alt="">
		</div>
		<!-- logo區結束 -->

		<!-- ------------------------------------從這裡開始編輯喔各位！----------------------- -->
		<div id="main">
			<h1>新增促銷專案</h1>
					<c:if test="${not empty errorMsgs}">
	請修正以下錯誤
	<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li>${message}</li>
				</c:forEach>
			</ul>
		</c:if>
			<div class="row">
			<div class="col-10">
			</div>
			<div class="col-2">
				<a href="<%=request.getContextPath()%>/back-end/product/sale_projectManage.jsp" class="btn btn-warning">回促銷管理首頁</a>
				<br>
			</div>
		</div>
			
		</div>
		<div class="spot" style="display:none">
		促銷商品編號：<input type="text" class="spot" style="margin-right: 20px" name="prodno" value="<%=(sale_listVO == null) ? "" : sale_listVO.getProdno()%>">&nbsp;
		促銷商品價格：<input  type="text" class="spot test" name="sapro_price" value="<%=(sale_listVO == null) ? "" : sale_listVO.getSapro_price()%>"><span>刪除</span>
	</div>
			
	<div class="table-responsive-sm table-hover table-success">
		<form id="myForm" method="post" action="<%=request.getContextPath()%>/product/sale_project.html" name="addSale_project">
		<table class="table align-items-center">
			<tr>
				<td>促銷專案名稱：</td>
				<td><input type="text" name="sapro_name" value="<%=(sale_projectVO == null) ? "" : sale_projectVO.getSapro_name()%>" placeholder="請輸入促銷專案名稱"/></td>
			</tr>
			<tr>
				<td>促銷開始日期：</td>
				<td><input type="date" name="sapro_start" value="<%=(sale_projectVO == null) ? "" : sale_projectVO.getSapro_start()%>" placeholder="請輸入促銷專案名稱"/></td>
			</tr>
			<tr>
				<td>促銷結束日期：</td>
				<td><input type="date" name="sapro_end" value="<%=(sale_projectVO == null) ? "" : sale_projectVO.getSapro_end()%>" placeholder="請輸入促銷專案名稱"/></td>
			</tr>
		</table>
		
	</div>

<div class="table-responsive-sm table-hover table-success">


<input type="button" name="" value="新增商品" placeholder="" id="btnAddSpot" class="btn btn-outline-success my-2 my-sm-0">
<br>
				<input type="hidden" name="action" value="insert">
				<input type="submit" value="送出新增" class="btn btn-outline-success my-2 my-sm-0"> 
</form>

</div>		
		
<script type="text/javascript">

function $id(id){
	return document.getElementById(id);
}

function addSpot(){
	let myForm = $id("myForm");
	let btnSend = $id("btnSend");
	let spot = document.querySelector(".spot");
	let newSpot = spot.cloneNode(true);
	newSpot.style.display = "";
	newSpot.getElementsByTagName("span")[0].onclick = removeSpot;
	myForm.insertBefore(newSpot,btnSend);
}

function removeSpot(e){
	$id("myForm").removeChild(e.target.parentNode);
}
window.addEventListener("load",function(){

$id("btnAddSpot").onclick = addSpot;

})


</script>

</div>
		<!-- ------------------------------------從這裡結束編輯喔各位！----------------------- -->



</body>
</html>