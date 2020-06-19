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
	href="${pageContext.request.contextPath}/css/custom-css/lesson/addLesson.css">
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
						<form method="post"
							action="<%=request.getContextPath()%>/lesson/lesson.do"
							
							enctype="multipart/form-data">
							<div class="regular-page-text">
								<h2>建立課程</h2>
								<!--表單開始-->




								<div class="row">
									<div class="col-md-12 mb-3">
										<label for="firstName">課程名稱</label> <input type="text"
											class="form-control" name="lessname"
											value="<%=(lessonVO == null) ? "" : lessonVO.getLessname()%>">

									</div>
									<div class="col-md-12 mb-3">
										<label for="country">課程類型</label>
										<jsp:useBean id="lessonSvc" scope="page"
											class="com.lesson.model.LessonService" />
										<select class="custom-select d-block " name="lesstype">
											<option value="">請選擇</option>
											<c:forEach var="expertiseVO"
												items="${lessonSvc.allExpByExpno}">
												<option value="${expertiseVO.expno}">${expertiseVO.expdesc}
											</c:forEach>
										</select>


									</div>


									<div class="col-md-12 mb-3">
										<label for="lastName">人數上限(最多幾位學生)</label> <input type="text"
											class="form-control" name="lessmax"
											value="<%=(lessonVO == null) ? "" : lessonVO.getLessmax()%>">

									</div>

									<div class="col-md-12 mb-3">
										<label for="lastName">人數下限(下限人數到即開團)</label> <input
											type="text" class="form-control" name="lessmin"
											value="<%=(lessonVO == null) ? "" : lessonVO.getLessmin()%>">

									</div>
								</div>



								<div class="mb-3">
									<label for="address">課程欲售點數</label> <input type="text"
										class="form-control" name="lessprice"
										value="<%=(lessonVO == null) ? "" : lessonVO.getLessprice()%>">

								</div>

								<div class="mb-3">
									<label for="address">課程地點</label>
									<!-- 									<input type="text" class="form-control" name="lessloc" -->
									<%-- 										value="<%=(LessonVO == null) ? "" : LessonVO.getLessloc()%>"> --%>
									<div id="zipcode3">
										<div class="f3" data-role="county"></div>
										<div class="f4" data-role="district"></div>
									</div>
									<input type="text" class="f13 address form-control"
										name="lesslocAdd">

								</div>

								<div class="mb-3">
									<label for="address">課程報名開始</label> <input type="text"
										class="form-control" id="from" name="lessstart"
										value="<%=(lessonVO == null) ? "" : lessonVO.getLessstart()%>">

								</div>
								<div class=" mb-3">
									<label for="address">課程報名截止</label> <input type="text"
										class="form-control" id="to" name="lessend"
										value="<%=(lessonVO == null) ? "" : lessonVO.getLessend()%>">

								</div>

								<div class="mb-3">
									<label for="address">課程堂數</label> <input type="text"
										class="form-control" name="lesstimes"
										value="<%=(lessonVO == null) ? "" : lessonVO.getLesstimes()%>">

								</div>

								<div>
									<div class="col-md-12 mb-3">
										<label for="address">課程說明</label>
										<textarea name="lessdesc"><%=(lessonVO == null) ? "" : lessonVO.getLessdesc()%></textarea>
										<%--測試ckeditor 4
										 <div>
											<script
												src="https://cdn.ckeditor.com/4.7.3/standard-all/ckeditor.js"></script>
											<textarea name="editor1"></textarea>
											<script>
// 												CKEDITOR.plugins
// 														.addExternal(
// 																"codesnippet",
// 																"https://cdnjs.cloudflare.com/ajax/libs/ckeditor/4.7.3/plugins/codesnippet/plugin.js",
// 																"");
// 												CKEDITOR
// 														.replace("editor1", {
// 																	extraPlugins : "codesnippet",
// 																	codeSnippet_theme : "solarized_dark"
// 																});
												
											</script>
										</div>--%>
									</div>
									<div>
										<div>
											<div>
												<label>上傳課程封面圖片: </label> <br>
												 <input type="file"
													id="myFile" name="lesspic">
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
							<input type="hidden" name="action" value="insert">
							<button class="btn btn-primary btn-lg btn-block" type="submit">課程建立>>>下一步 新增時段</button>
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
	<!-- 地址 -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>

	<script>
		$("#zipcode3").twzipcode({
			"zipcodeIntoDistrict" : true,
			"css" : [ "city form-control", "town form-control" ],
			"countyName" : "city", // 指定城市 select name
			"districtName" : "town" // 指定地區 select name
		});
	</script>
	<style>
.city, .town {
	width: 100%;
}

.f1 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(5% - 10px)
}

.f2 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(10% - 10px)
}

.f3 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(15% - 10px)
}

.f4 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(20% - 10px)
}

.f5 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(25% - 10px)
}

.f6 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(30% - 10px)
}

.f7 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(35% - 10px)
}

.f8 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(40% - 10px)
}

.f9 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(45% - 10px)
}

.f10 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(50% - 10px)
}

.f11 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(55% - 10px)
}

.f12 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(60% - 10px)
}

.f13 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(65% - 10px)
}

.f14 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(70% - 10px)
}

.f15 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(75% - 10px)
}

.f16 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(80% - 10px)
}

.f17 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(85% - 10px)
}

.f18 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(90% - 10px)
}

.f19 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(95% - 10px)
}

.f20 {
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: calc(100% - 10px)
}
</style>

</body>

</html>