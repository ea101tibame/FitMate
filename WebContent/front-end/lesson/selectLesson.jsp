<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.lesson.model.*"%>

<%
	String coano = (String)session.getAttribute("coano");
	LessonService lessonService = new LessonService();
	List<LessonVO> list = lessonService.getCoachLesson(coano);
	pageContext.setAttribute("list", list);
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
	href="${pageContext.request.contextPath}/css/custom-css/lesson/selectLesson.css">
<style>
table { 
background-color: #ffffff; 
font-size:16px;
width: 100%; *
margin: auto; 
text-align: center; 
} 

/* tr td { */
/* 	border: 2px solid black; */
/* } */

/* tr th { */
/* 	border: 2px solid black; */
/* } */


.card-img-top {
	height: 300px;
	width: 100%;
}

.gosubmit {
	position: absolute;
	bottom: 20px;
	right: 20px;
}

.card-deck {
	margin-top: 20px;
}

.row {
	margin-right: 70px;
	margin-left: 70px;
}

.img-region {
	height: 300px;
	width: 100%;
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
			<img
				src="${pageContext.request.contextPath}/images/bg-img/COA1920.png"
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

		<div class="container col-12">
			<div class="row justify-content-center">
				<div class="col-12 col-md-12">
					<div class="regular-page-content-wrapper section-padding-80">
						<div class="regular-page-text">
							<h2>查詢課程</h2>
							<%@ include file="pages/page1.file"%>
							<c:forEach var="lessonVO" items="${list}" begin="<%=pageIndex%>"
								end="<%=pageIndex+rowsPerPage-1%>">
								<table border="1"
									 class="table table-striped table-dark  align-items-center align-middle" style="table-layout:fixed;word- wrap:break-word; word-break;break-all;">
									<tr>
										<td rowspan="8" style="width: 400px;height:250px"  >
										<img src="<%=request.getContextPath()%>/lesson/PicServletJDBC.do?lessno=${lessonVO.lessno}" class="rounded float-right img-thumbnail">
											<table id="innertable" class="table-secondary">
											<tr>
												<td>
											<FORM METHOD="post"
												ACTION="<%=request.getContextPath()%>/lesson/lesson.do"
												style="margin-bottom: 0px;">
												<button type="submit" class="btn btn-warning" <c:if test="${lessonVO.lesssta=='下架'}">value="Disabled" disabled</c:if>>修改課程</button>
												<input type="hidden" name="lessno"
													value="${lessonVO.lessno}"> <input type="hidden"
													name="requestURL" value="<%=request.getServletPath()%>">
												<input type="hidden" name="action" value="getOne_For_Update">
											</FORM>												
												</td>
												<td>
											<FORM METHOD="post"
												ACTION="<%=request.getContextPath()%>/lesson/lessonTime.do"
												style="margin-bottom: 0px;">
												<button type="submit" class="btn btn-info" <c:if test="${lessonVO.lesssta=='下架'}">value="Disabled" disabled</c:if>>修改時段</button>
												<input type="hidden" name="lessno"
													value="${lessonVO.lessno}"> <input type="hidden"
													name="action" value="getOneTime_For_Update">
											</FORM>												
												</td>
												<td>
											<FORM METHOD="post"
												ACTION="<%=request.getContextPath()%>/lesson/lesson.do"
												style="margin-bottom: 0px;">
												<button type="submit" class="btn btn-secondary"
													<c:if test="${lessonVO.lesssta=='下架'}">value="Disabled" disabled</c:if>>下架課程</button>
												<input type="hidden" name="lessno"
													value="${lessonVO.lessno}"> <input type="hidden"
													name="action" value="off_lesson">
											</FORM>												
												</td>
												
											</tr>
											
											</table>

										
									<tr  >
										<td style="width: 130px">課程編號</td>
										<td style="width: 130px">${lessonVO.lessno}</td>
										<td style="width: 130px">課程名稱</td>
										<td style="width: 200px">${lessonVO.lessname}</td>
									</tr>
									<tr>
										<td>課程類型</td>
										<jsp:useBean id="lessonSvc" scope="page"
											class="com.lesson.model.LessonService" />
										<td><c:forEach var="expertiseVO"
												items="${lessonSvc.allExpByExpno}">
												<c:if test="${lessonVO.lesstype==expertiseVO.expno}">${expertiseVO.expdesc}</c:if>
											</c:forEach></td>
										<td>課程狀態</td>
										<td>${lessonVO.lesssta}</td>
									</tr>
									<tr>
										<td>課程堂數</td>
										<td>${lessonVO.lesstimes}</td>
										<td>課程地點</td>
										<td>${lessonVO.lessloc}</td>
									</tr>
									<tr>
										<td>課程報名起始日</td>
										<td>${lessonVO.lessstart}</td>

										<td>課程報名截止日</td>
										<td>${lessonVO.lessend}</td>
									</tr>
									<tr>
										<td>最小成團人數</td>
										<td>${lessonVO.lessmin}</td>
										<td>最多上限人數</td>
										<td>${lessonVO.lessmax}</td>
									</tr>
									<tr>
										<td>目前報名人數</td>
										<td>${lessonVO.lesscur}</td>
										<td>課程點數價格</td>
										<td>${lessonVO.lessprice}</td>
									</tr>

										
										<tr>
										<td>課程說明</td>
										<td colspan="3">${lessonVO.lessdesc}</td>
										</tr>
									</table>
									

								

							</c:forEach>
							<%@ include file="pages/page2.file"%>
							

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
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<!-- Plugins js -->
	<script src="${pageContext.request.contextPath}/js/plugins.js"></script>
	<!-- Classy Nav js -->
	<script src="${pageContext.request.contextPath}/js/classy-nav.min.js"></script>
	<!-- Active js -->
	<script src="${pageContext.request.contextPath}/js/active.js"></script>
	<!-- 打勾修改完成 -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/custom-js/lesson/selectLesson.js"></script>
</body>

</html>