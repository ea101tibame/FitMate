<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%
	pageContext.setAttribute("context", request.getContextPath());
	pageContext.setAttribute("role", session.getAttribute("role"));
%>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>FitMate</title>
<link rel="stylesheet" type="text/css" href="${context}/css/css/core-style.css">
<link rel="stylesheet" type="text/css" href="${context}/css/custom-css/index.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" type="text/css" href="${context}/css/custom-css/login.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">
</head>
<body>
	
	<footer class="footer_area clearfix">
		<div class="container">
			<div class="row ">
				<div class="col-md-12 text-center">
					<p>
						Copyright &copy; 2020 by EA101G5
						<i class="fa fa-heart-o" aria-hidden="true"></i>
						by FitMate
						</a>
					</p>
				</div>
			</div>
		</div>
	</footer>
	
		<script src="${context}/js/jquery/jquery-2.2.4.min.js"></script>
		<script src="${context}/js/popper.min.js"></script>
		<script src="${context}/js/bootstrap.min.js"></script>
		<script src="${context}/js/plugins.js"></script>
		<script src="${context}/js/classy-nav.min.js"></script>
		<script src="${context}/js/active.js"></script>
		<script src="${context}/js/index.js"></script>
</body>

</html>