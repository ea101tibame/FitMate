<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.lesson.model.*"%>

<%
	LessonService LessonService = new LessonService();
	List<LessonVO> list = LessonService.getCoachLesson("C004");
	session.setAttribute("list",list);

%>



<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title  -->
<title>FitMate</title>

<!-- Favicon  -->
<link rel="icon"
	href="${pageContext.request.contextPath}/img/core-img/favicon.ico">

<!-- Core Style CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/css/core-style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/custom-css/regular-page.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/custom-css/coach _form.css">
<style>
  table {
	background-color: #FFE66F;
    border: 2px solid black;
    text-align: center;
  }
  tr td{
  border: 2px solid black;
  }
  tr th{
  border: 2px solid black;
  }

</style>
</head>

<body>

	<header class="header_area">
		<div
			class="classy-nav-container breakpoint-off d-flex align-items-center justify-content-between">
			<!-- Classy Menu -->
			<nav class="classy-navbar" id="essenceNav">
				<!-- Logo -->
				<a class="nav-brand" href="index.html"><img
					src="${pageContext.request.contextPath}/img/core-img/logo.png"
					alt=""></a>
				<!-- Navbar Toggler -->
				<div class="classy-navbar-toggler">
					<span class="navbarToggler"><span></span><span></span><span></span></span>
				</div>
				<!-- Menu -->
				<div class="classy-menu">
					<!-- close btn -->
					<div class="classycloseIcon">
						<div class="cross-wrap">
							<span class="top"></span><span class="bottom"></span>
						</div>
					</div>
					<!-- Nav Start -->
					<div class="classynav">
						<ul>
							<li><a href="index.html">首頁</a></li>
							<li><a href="blog.html">消息</a></li>

							</li>


							<li><a href="#">教練</a>
								<ul class="dropdown">
									<li><a href="index.html">個人資料</a></li>
									<li><a href="coachTimeTable.jsp">查看課表</a></li>
									<li><a href=".html">建立課程</a></li>
									<li><a href=".html">查看課程</a></li>
									<li><a href=".html">點數兌換</a></li>

								</ul></li>
							<li><a href="blog.html">討論區</a></li>

						</ul>
					</div>
					<!-- Nav End -->
				</div>
			</nav>

			<!-- Header Meta Data -->
			<div class="header-meta d-flex clearfix justify-content-end">
				<!-- Search Area -->

				<!-- User Login Info -->
				<div class="user-login-info">
					<a href="#"><img
						src="${pageContext.request.contextPath}/img/core-img/user.svg"
						alt=""></a>
				</div>
				<div class="user-login-info">
					<a href="#"><img
						src="${pageContext.request.contextPath}/img/core-img/email.svg"
						alt=""></a>
				</div>


			</div>

		</div>
	</header>
	<!-- ##### Header Area End ##### -->



	<!-- ##### Blog Wrapper Area Start ##### -->
	<div class="single-blog-wrapper">

		<!-- Single Blog Post Thumb -->
		<div class="single-blog-post-thumb">
			<img src="${pageContext.request.contextPath}/img//bg-img/COA1920.png"
				alt="">
		</div>
		<%-- 錯誤表列 --%>
		<c:if test="${not empty errorMsgs}">
			<font style="color: red">請修正以下錯誤:</font>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>
		
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12 col-md-12">
					<div class="regular-page-content-wrapper section-padding-80">
						<div class="regular-page-text">
							<h2>查詢課程</h2>
<table>
	<tr>
		<th>課程編號</th>
		<th>課程名稱</th>
		<th>課程類型</th>
		<th>人數上限</th>
		<th>人數下限</th>
		<th>課程堂數</th>
		<th>課程狀態</th>
		<th>目前報名人數</th>
		<th>課程點數價格</th>
		<th>課程地點</th>
		<th>課程報名起始時間</th>
		<th>課程報名截止時間</th>
		<th>課程說明</th>
		<th>課程圖片</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	<%@ include file="pages/page1.file" %> 
	<c:forEach var="LessonVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${LessonVO.lessno}</td>
			<td>${LessonVO.lessname}</td>
			<td>${LessonVO.lesstype}</td>
			<td>${LessonVO.lessmax}</td>
			<td>${LessonVO.lessmin}</td>
			<td>${LessonVO.lesstimes}</td> 
			<td>${LessonVO.lesssta}</td>
			<td>${LessonVO.lesscur}</td>
			<td>${LessonVO.lessprice}</td>
			<td>${LessonVO.lessloc}</td>
			<td>${LessonVO.lessstart}</td>
			<td>${LessonVO.lessend}</td>
			<td>${LessonVO.lessdesc}</td>
			<td><img src="PicServletJDBC.do?coano=C004"></td>
			<%--拿到教練專長SVC再來
			<td><c:forEach var="deptVO" items="${deptSvc.all}">
                    <c:if test="${empVO.deptno==deptVO.deptno}">
	                    ${deptVO.deptno}【${deptVO.dname} - ${deptVO.loc}】
                    </c:if>
                </c:forEach>
			</td>
			 --%>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/lesson/lesson.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="lessno"  value="${lessonVO.lessonVO}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/lesson/lesson.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="lessno"  value="${lessonVO.lessonVO}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="pages/page2.file" %>


						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Blog Wrapper Area End ##### -->

	<!-- ##### Footer Area Start ##### -->
	<footer class="footer_area">
		<div class="container">
			<div class="row ">
				<div class="col-md-12 text-center">
					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						by EA101G5 <i class="fa fa-heart-o" aria-hidden="true"></i> by
						FitMate</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>

		</div>
	</footer>
	<!-- ##### Footer Area End ##### -->

	<!-- jQuery (Necessary for All JavaScript Plugins) -->
	<script
		src="${pageContext.request.contextPath}/css/js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script src="${pageContext.request.contextPath}/css/js/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script
		src="${pageContext.request.contextPath}/css/js/bootstrap.min.js"></script>
	<!-- Plugins js -->
	<script src="${pageContext.request.contextPath}/css/js/plugins.js"></script>
	<!-- Classy Nav js -->
	<script
		src="${pageContext.request.contextPath}/css/js/classy-nav.min.js"></script>
	<!-- Active js -->
	<script src="${pageContext.request.contextPath}/css/js/active.js"></script>

</body>

</html>