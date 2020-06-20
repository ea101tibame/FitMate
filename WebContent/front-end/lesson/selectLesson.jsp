<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.lesson.model.*"%>

<%
	LessonService lessonService = new LessonService();
	List<LessonVO> list = lessonService.getCoachLesson("C001");
	pageContext.setAttribute("list",list);

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
	background-color: #FFE66F;
    border: 2px solid black;
    width: 90%;
    margin: auto;
   	text-align:center;
  }
  tr td{
  border: 2px solid black;
  }
  tr th{
  border: 2px solid black;
  }
.innerpic {
height:100px;
width:200px;
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
		
		<div class="container col-12">
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
		<th>修改時段</th>
		<th>下架</th>
	</tr>
	<%@ include file="pages/page1.file" %> 
	<c:forEach var="lessonVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${lessonVO.lessno}</td>
			<td>${lessonVO.lessname}</td>
			<jsp:useBean id="lessonSvc" scope="page"
											class="com.lesson.model.LessonService" />
			<td>
			<c:forEach var="expertiseVO" items="${lessonSvc.allExpByExpno}">
				<c:if test="${lessonVO.lesstype==expertiseVO.expno}">${expertiseVO.expdesc}</c:if>
			</c:forEach>
			</td>
			<td>${lessonVO.lessmax}</td>
			<td>${lessonVO.lessmin}</td>
			<td>${lessonVO.lesstimes}</td> 
			<td>${lessonVO.lesssta}</td>
			<td>${lessonVO.lesscur}</td>
			<td>${lessonVO.lessprice}</td>
			<td>${lessonVO.lessloc}</td>
			<td>${lessonVO.lessstart}</td>
			<td>${lessonVO.lessend}</td>
			<td>${lessonVO.lessdesc}</td>
			<td><img src="<%=request.getContextPath()%>/lesson/PicServletJDBC.do?lessno=${lessonVO.lessno}" class="innerpic"></td>

			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/lesson/lesson.do" style="margin-bottom: 0px;">
			     <button type="submit" class="btn btn-danger">修改</button>
			     <input type="hidden" name="lessno"  value="${lessonVO.lessno}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/lesson/lessonTime.do" style="margin-bottom: 0px;">
			     <button type="submit" class="btn btn-success">修改時段</button>
				 <input type="hidden" name="lessno"  value="${lessonVO.lessno}">
				 <input type="hidden" name="action" value="getOneTime_For_Update">
			</FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/lesson/lesson.do" style="margin-bottom: 0px;">
<%-- 			     <input type="submit" value="下架" <c:if test="${lessonVO.lesssta=='下架'}">value="Disabled" disabled</c:if> > --%>
			    <button type="submit" class="btn btn-secondary" <c:if test="${lessonVO.lesssta=='下架'}">value="Disabled" disabled</c:if>>下架</button>
			     <input type="hidden" name="lessno"  value="${lessonVO.lessno}">
			     <input type="hidden" name="action" value="off_lesson"></FORM>
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
	<script src="${pageContext.request.contextPath}/js/active.js"></script>
	<!-- 打勾修改完成 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="${pageContext.request.contextPath}/js/custom-js/lesson/selectLesson.js"></script>
</body>

</html>