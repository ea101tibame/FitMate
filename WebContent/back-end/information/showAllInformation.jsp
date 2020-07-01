<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.information.model.*"%>

<%
	InformationService infSvc = new InformationService();
	List<InformationVO> inflist = infSvc.getAllInfByDate();
	pageContext.setAttribute("inflist", inflist);
%>

<html>
<head>
<meta charset="UTF-8">
<title>FitMate消息清單</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/list.js/1.5.0/list.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>FitMate管理後台</title>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css2?family=Caesar+Dressing&family=Coming+Soon&family=Noto+Sans+TC:wght@700&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous">
	
</script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous">
	
</script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous">
	
</script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.13.0/css/all.css"
	integrity="sha384-Bfad6CLCknfcloXFOyFnlgtENryhrpZCe29RTifKEixXQZ38WheV+i/6YWSzkz3V"
	crossorigin="anonymous">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
<link rel='stylesheet'
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/css/backend.css">
<style>
.pic {
	height: 140px;
	width: 120px;
}

body {
	background:
		url("<%=request.getContextPath()%>/images/backend_public/bg1ori.jpg");
	background-position: center center;
}

#main {
	margin-left: 5px;
}
</style>
</head>
<body>

	<%@ include file="/back-end/backinclude_test.jsp"%>

	<!-- 主要內文區開始 -->
	<div class="article side-open">
		<!-- logo區開始 -->
		<div id="logo">
			<img
				src="<%=request.getContextPath()%>/images/backend_public/logo.png"
				alt="">
		</div>
		<!-- logo區結束 -->

		<div id="main">
			<h1>FitMate消息管理</h1>
			<a href="<%=request.getContextPath()%>/back-end/information/information_select_page.jsp">返回消息首頁</a>
		</div>
		<div class="table-responsive-sm table-hover table-success">
<table class="table align-items-center">
	<tr>
		<th>消息編號</th>
		<th>發布日期</th>
		<th>類別</th>
		<th>標題</th>
		<th>內容</th>
	</tr>
<c:forEach var="infVO" items="${inflist}">	
	<tr>
		<td>${infVO.inno}</td>
		<td>${infVO.indate}</td>
		<td>${infVO.intype}</td>
		<td>${infVO.intitle}</td>
		<td>${infVO.indesc}</td>
		<td>
			<form action="<%=request.getContextPath()%>/information/information.do" method="post" style="margin-bottom: 0px;">
			<input type="submit" value="更新消息" class="btn btn-outline-success my-2 my-sm-0">
			<input type="hidden" name="inno" value="${infVO.inno}">
			<input type="hidden" name="action" value="alterOneInf">
			</form>
		</td>
		<td>
			<form action="<%=request.getContextPath()%>/information/information.do" method="post" style="margin-bottom: 0px;">
			<input type="button" value="刪除消息" class="btn btn-outline-success my-2 my-sm-0">
			<input type="hidden" name="inno" value="${infVO.inno}">
			<input type="hidden" name="action" value="deleteOneInf">
			</form>
		</td>
	</tr>
	
</c:forEach>
</table>
</div>
</div>
<script>

$(document).ready(function(){
	$('input:button').on('click',function(e){
		e.preventDefault();
		swal({
			title:'注意',
			text:'你確定要刪除這則消息嗎?',
			icon:'warning',
			buttons:true,
			dangerMode:true
		}).then(function(isConfirm){
			if(isConfirm){
				swal('成功','已將此則消息刪除','success');
				setTimeout(function(){
					$('input:button').parent().submit();
				},1500);
			} else {
				swal('取消','你已經取消刪除作業','error');
			}
		});
	});
});


</script>

</body>
</html>