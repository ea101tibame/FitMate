<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.student.model.*"%>
<%@ include file="/front-end/header.jsp"%>
<%
	StuVO stuVO = (StuVO) session.getAttribute("stuVO");
%>

<html>
<head>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<title>我的點數</title>
</head>
<body>


<div class="single-blog-wrapper" style="background-color: black;">
        <div class="single-blog-post-thumb">
            <img src="<%=request.getContextPath()%>/images//bg-img/STU1920.png" alt="">
        </div>
        </div>
	<div>
	
	<ul>
		<li>
			<form action="<%=request.getContextPath()%>/deposit/deposit.do" method="post">
				<input type="submit" value="查看儲值紀錄">
				<input type="hidden" name="stuno" value="${stuVO.stuno}">
				<input type="hidden" name="action" value="selectAll"> 
			</form>	
		</li>
		<li>
			<form action="<%=request.getContextPath()%>/deposit/deposit.do" method="post">
				<input type="submit" value="我要儲值">
				<input type="hidden" name="stuno" value="${stuVO.stuno}">
				<input type="hidden" name="action" value="goInsert"> 
			</form>
		</li>
	</ul>
	
	</div>

 <%@ include file="/front-end/footer.jsp"%>
</body>
</html>