<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.lesson.model.*"%>
<%@ page import="com.coach.model.*"%>
<%@ include file="/front-end/header.jsp"%>

<jsp:useBean id="lessonSvc" scope="page"
	class="com.lesson.model.LessonService" />

<%
	List<LessonVO> list = lessonSvc.getAllLesson();
	pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Core Style CSS -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/css/core-style.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/custom-css/regular-page.css">

<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap"
	rel="stylesheet">


<style>
.card-img-top {
	height: 300px;
	width: 100%;
}

.btn-primary {
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

.card-text {
	font-size: 18px;
}

.nice-select {
	display: none !important;
}

select {
	display: inline-block !important;
	width: 300px !important;
}

label {
	display: contents;
}

.title {
	font-size: 16px;
}
</style>


</head>

<body>

	<!-- ##### Header Area End ##### -->

	<!-- ##### Blog Wrapper Area Start ##### -->
	<div class="single-blog-wrapper">

		<!-- Single Blog Post Thumb -->
		<div class="single-blog-post-thumb">
			<img
				src="${pageContext.request.contextPath}/images/bg-img/lesson1920.png"
				alt="">
		</div>

		<div class="container col-12">
			<div class="row justify-content-center">
				
					<div class="container col-12 " >
						<div class="row justify-content-center">
							<form method="post"
							action="<%=request.getContextPath()%>/lesson/lesson.do">
							
								<label for="country" class="title">依照課程類型分類:</label>
							
								<select class="custom-select d-block " name="lesstype">
									<option value="" style="margin-left: 20px">請選擇喜歡的類型</option>
									<c:forEach var="expertiseVO" items="${lessonSvc.allExpByExpno}">
										<option value="${expertiseVO.expno}">${expertiseVO.expdesc}
										
									</c:forEach>
								</select>
								<input type="hidden" name="action" value="getListFromType">
								<button  type="submit" >搜尋</button>	
								
							</form>		
						</div>
					</div>
					
				
			<c:if test="${empty getTypeList}">
				<c:forEach var="lessonVO" items="${list}">

					<div class="card-deck col-md-4">

						<div class="card"
							style="box-shadow: 3px 3px 12px gray; padding: 3px;">

							<%--     <img src="<%=request.getContextPath()%>/lesson/PicServletJDBC.do?lessno=${lessonVO.lessno}" alt="" class="card-img-top" alt="..."> --%>
							<div class="card-img-top img-region"
								style="background:url('<%=request.getContextPath()%>/lesson/PicServletJDBC.do?lessno=${lessonVO.lessno}');background-size:cover;background-position: center;"></div>
							<div class="card-body">
								<h5 class="card-title">${lessonVO.lessname}</h5>
								<p class="card-text">${lessonVO.lessdesc}</p>
								<p class="card-text">
									堂數:${lessonVO.lesstimes} 點數:${lessonVO.lessprice}<small
										class="text-muted"></small>
								</p>
								<p class="card-text">
									狀態:${lessonVO.lesssta}<small class="text-muted"></small>
								</p>

								<!--       <a href="#" class="btn btn-primary">GO買課程</a> -->

								<FORM METHOD="post"
									ACTION="<%=request.getContextPath()%>/lesson/lesson.do"
									style="margin-bottom: 0px;">
									<!-- 			     <input type="submit" value="GO買課程" class="gosubmit"> -->
									<button type="submit" class="btn btn-primary">GO買課程</button>
									<input type="hidden" name="lessno" value="${lessonVO.lessno}">
									<input type="hidden" name="coano" value="${lessonVO.coano}">
									<input type="hidden" name="action" value="show_lesson_detail">
								</FORM>
							</div>

						</div>

					</div>

				</c:forEach>
				</c:if>
				
				<c:if test="${not empty getTypeList}">
					<%
					String lesstype = (String)request.getAttribute("lesstype");
					List<LessonVO> typelist =(List<LessonVO>)request.getAttribute("getTypeList");
					pageContext.setAttribute("typelist", typelist);
					%>
					<c:forEach var="lessonVO" items="${typelist}">
	
							<div class="card-deck col-md-4">
		
								<div class="card"
									style="box-shadow: 3px 3px 12px gray; padding: 3px;">
		
									<div class="card-img-top img-region"
										style="background:url('<%=request.getContextPath()%>/lesson/PicServletJDBC.do?lessno=${lessonVO.lessno}');background-size:cover;background-position: center;"></div>
									<div class="card-body">
										<h5 class="card-title">${lessonVO.lessname}</h5>
										<p class="card-text">${lessonVO.lessdesc}</p>
										<p class="card-text">
											堂數:${lessonVO.lesstimes} 點數:${lessonVO.lessprice}<small
												class="text-muted"></small>
										</p>
										<p class="card-text">
											狀態:${lessonVO.lesssta}<small class="text-muted"></small>
										</p>
		
										<FORM METHOD="post"
											ACTION="<%=request.getContextPath()%>/lesson/lesson.do"
											style="margin-bottom: 0px;">
											<!-- 			     <input type="submit" value="GO買課程" class="gosubmit"> -->
											<button type="submit" class="btn btn-primary">GO買課程</button>
											<input type="hidden" name="lessno" value="${lessonVO.lessno}">
											<input type="hidden" name="coano" value="${lessonVO.coano}">
											<input type="hidden" name="action" value="show_lesson_detail">
										</FORM>
									</div>
		
								</div>
		
							</div>
		
						</c:forEach>
					
				</c:if>
				

			</div>
		</div>
	</div>

	<!-- ##### Blog Wrapper Area End ##### -->

	<!-- ##### Footer Area Start ##### -->
	<%@ include file="/front-end/footer.jsp"%>
	<!-- ##### Footer Area End ##### -->

	<!-- jQuery (Necessary for All JavaScript Plugins) -->
	<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
	<!-- Popper js -->
	<script
		src="${pageContext.request.contextPath}/js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Bootstrap js -->
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<!-- Plugins js -->
	<script src="${pageContext.request.contextPath}/js/plugins.js"></script>
	<!-- Classy Nav js -->
	<script src="${pageContext.request.contextPath}/js/classy-nav.min.js"></script>
	<!-- Active js -->
	<script src="${pageContext.request.contextPath}/js/active.js"></script>


</body>

</html>
