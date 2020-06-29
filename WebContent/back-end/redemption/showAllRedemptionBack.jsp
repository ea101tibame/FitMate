<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.redemption.model.*"%>

<%
	RedemptionService redSvc = new RedemptionService();
	List<RedemptionVO> redlist = redSvc.showAll();
	pageContext.setAttribute("redlist", redlist);
%>
<html>
<head>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>FitMate管理後台</title>
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
			<h1>FitMate教練點數兌換申請審核</h1>
			<a href="<%=request.getContextPath()%>/back-end/backend_index.jsp">返回後台首頁</a>
		</div>
		
		<div class="table-responsive-sm table-hover table-success">
			<table class="table align-items-center">
				<tr>
					<th>兌換編號</th>
					<th>教練編號</th>
					<th>申請日期</th>
					<th>兌換金額</th>
					<th>處理狀態</th>
				</tr>
				<c:forEach var="redVO" items="${redlist}">
					<tr>
						<td>${redVO.redno}</td>
						<td>${redVO.coano}</td>
						<td><fmt:formatDate value="${redVO.reddate}" type="both"/></td>
						<td>${redVO.redprice}</td>
						<td id="sta">${redVO.redsta}</td>
						<td>
							<input type="button" value="審核" id="check" class="btn btn-outline-success my-2 my-sm-0">
							<input type="hidden" name="action" value="change" id="change">
							<input type="hidden" name="redno" value="${redVO.redno}" id="redno">
						</td>
					</tr>
				</c:forEach>
			</table>
			


			<!-- ------------------------------------從這裡結束編輯喔各位！----------------------- -->
		</div>
	</div>
<script>

	$(document).ready(function(){
		$('#check').click(function(){
			$.ajax({
				url:"<%=request.getContextPath()%>/redemption/redemption.do",
				type:"post",
				data:{
					action:"$('#change').val()",
					redno:"$('#redno').val()"
				},
				success:function(){
					$('#sta').innerHtml="${redVO.redsta}";
					swal('成功','已審核完畢','success');
				}
			});
		});
	});

</script>	
</body>
</html>