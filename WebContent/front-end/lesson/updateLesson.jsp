<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.lesson.model.*"%>
<%@ page import="test.expertise.model.*"%>
<%@ page import="text.coach.model.*"%>

<%
	LessonVO lessonVO = (LessonVO) request.getAttribute("lessonVO");
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
	href="${pageContext.request.contextPath}/images/core-img/FIT.ico">

<!-- Core Style CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/css/core-style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/custom-css/regular-page.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/custom-css/lesson/updateLesson.css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
</head>

<body>
	<header class="header_area">
		<div
			class="classy-nav-container breakpoint-off d-flex align-items-center justify-content-between">
			<!-- Classy Menu -->
			<nav class="classy-navbar" id="essenceNav">
				<!-- Logo -->
				<a class="nav-brand" href="index.html"><img
					src="${pageContext.request.contextPath}/images/core-img/logo.png"
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
									<li><a href="addLesson.jsp">建立課程</a></li>
									<li><a href="selectLesson.jsp">查看課程</a></li>
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
						src="${pageContext.request.contextPath}/images/core-img/user.svg"
						alt=""></a>
				</div>
				<div class="user-login-info">
					<a href="#"><img
						src="${pageContext.request.contextPath}/images/core-img/email.svg"
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
			<img src="${pageContext.request.contextPath}/images/bg-img/COA1920.png"
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
						<form method="post"	action="lesson.do" name="form1" enctype="multipart/form-data">
							<div class="regular-page-text">
								<h2>課程資料修改</h2>
								<!--表單開始-->




								<div class="row">
									<div class="col-md-12 mb-3">
										<label for="firstName">課程名稱</label> 
										<input type="text"
											class="form-control" name="lessname"
											value="<%=lessonVO.getLessname()%>">

									</div>
									<div class="col-md-12 mb-3">
										<label for="country">課程類型</label>
										<jsp:useBean id="lessonSvc" scope="page"
											class="com.lesson.model.LessonService" />

										<select class="custom-select d-block " name="lesstype">
											<c:forEach var="expertiseVO" items="${lessonSvc.allExpByExpno}">
												<option value="${lessonVO.lesstype}" ${(lessonVO.lesstype==expertiseVO.expno)?'selected':'' }>${expertiseVO.expdesc}
											</c:forEach>
										</select>
											

									</div>


									<div class="col-md-12 mb-3">
										<label for="lastName">人數上限(最多幾位學生)</label> <input type="text"
											class="form-control" name="lessmax"
											value="<%=lessonVO.getLessmax()%>">

									</div>

									<div class="col-md-12 mb-3">
										<label for="lastName">人數下限(下限人數到即開團)</label> <input type="text"
											class="form-control" name="lessmin"
											value="<%=lessonVO.getLessmin()%>">

									</div>
								</div>



								<div class="mb-3">
<!-- 									<label for="address">課程欲售點數</label> <input type="text" -->
<!-- 										class="form-control" name="lessprice" -->
<%-- 										value="<%=lessonVO.getLessprice()%>"> --%>
										
									<input type="text"
										class="form-control" disabled value="<%=lessonVO.getLessprice()%>"><li style="color: red" font-size="16px">課程欲售點數不可修改</li></input>
									<input type="hidden"
										class="form-control" name="lessprice"
										value="<%=lessonVO.getLessprice()%>" >
								</div>

								<div class="mb-3">
									<label for="address">課程地點</label> <input type="text"
										class="form-control" name="lessloc"
										value="<%=lessonVO.getLessloc()%>">

								</div>

								<div class="mb-3">
									<label for="address">課程報名開始</label> <input type="text"
										class="form-control" id="from" name="lessstart"
										value="<%=lessonVO.getLessstart()%>">

								</div>
								<div class=" mb-3">
									<label for="address">課程報名截止</label> <input type="text"
										class="form-control" id="to" name="lessend"
										value="<%=lessonVO.getLessend()%>">

								</div>

								<div class="mb-3">
									<label for="address" >課程堂數</label>
									 <input type="text"
										class="form-control" disabled value="<%=lessonVO.getLesstimes()%>"><li style="color: red" font-size="16px">堂數不可修改</li></input>
									<input type="hidden"
										class="form-control" name="lesstimes"
										value="<%=lessonVO.getLesstimes()%>" >



								</div>

								<div>
									<div class="col-md-12 mb-3">
										<label for="address">課程說明</label>
										<textarea name="lessdesc"><%=lessonVO.getLessdesc()%></textarea>
									</div>
									<div>
									<label>原始封面圖片: </label> <br> 
										<img src="<%=request.getContextPath()%>/lesson/PicServletJDBC.do?lessno=${lessonVO.lessno}" class="innerpic">
										
										<div>
											<div>
												<label>上傳新課程封面圖片: </label> <br> 
												<input type="file" id="myFile" name="lesspic" >
											</div>
										</div>
										<div>
											<label>圖片預覽: </label>
											<div id="preview"></div>
											
										</div>
										<br>
										<div>
											<button type="button" id="deletebtn">刪除</button>

										</div>
									</div>


								</div>
							</div>

							<hr class="mb-4">
							<input type="hidden" name="action" value="update">
							<input type="hidden" name="lessno" value="${lessonVO.lessno}">
							
							<button class="btn btn-primary btn-lg btn-block" type="submit">送出修改</button>
						</form>
						<!--表單結束-->
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
		src="${pageContext.request.contextPath}/js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script
		src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<!-- Plugins js -->
	<script src="${pageContext.request.contextPath}/js/plugins.js"></script>
	<!-- Classy Nav js -->
	<script
		src="${pageContext.request.contextPath}/js/classy-nav.min.js"></script>
	<!-- Active js -->
	<script src="${pageContext.request.contextPath}/js/custom-js/lesson/addLesson.js"></script>
	<script src="${pageContext.request.contextPath}/js/active.js"></script>
	<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>

</body>

</html>