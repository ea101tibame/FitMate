<%@page import="com.lesson_order.model.Lesson_orderService"%>
<%@page import="com.lesson_fav.model.Lesson_favService"%>
<%@page import="java.util.List"%>
<%@page import="com.lessonTime.model.LessonTimeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.lesson.model.*"%>

<%@ include file="/front-end/header.jsp" %>
<%
	LessonVO lessonVO = (LessonVO) request.getAttribute("lessonVO");
	LessonTimeService ltsvc = new LessonTimeService();
	String lessno = lessonVO.getLessno();

	List<String> old = ltsvc.getOneTime(lessno);
	pageContext.setAttribute("role", session.getAttribute("role"));
	
	String stuno = (String)session.getAttribute("stuno");
	LessonService lessonSvc1 = new LessonService();
	
	String lesssta = lessonSvc1.getOneByPK(lessno).getLesssta();
	pageContext.setAttribute("lesssta", lesssta);
	
	Lesson_orderService lesson_orderSvc = new Lesson_orderService();
	boolean Y = lesson_orderSvc.getfindByStuno(stuno).stream().anyMatch( vo -> vo.getLessno().equals(lessno));
	pageContext.setAttribute("Y", Y);

	Lesson_favService lesson_favSvc = new Lesson_favService();
	boolean LY = lesson_favSvc.getfindByStuno(stuno).stream().anyMatch(o ->o.getLessno().equals(lessno));
	pageContext.setAttribute("LY", LY);
	
// 	System.out.println("已購買"+Y);
// 	System.out.println("已追蹤"+LY);
	
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Raleway"
	rel="stylesheet">

<!--jQuery library-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!--Latest compiled and minified JavaScript-->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css'>
<!-- <script defer src="https://use.fontawesome.com/releases/v5.0.0/js/all.js"></script> -->

<link rel="icon"
	href="${pageContext.request.contextPath}/images/core-img/FIT.ico">

<!-- Core Style CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/css/core-style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/custom-css/regular-page.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/custom-css/lesson/lesson_detail.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap"
	rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
.btn-success {
	position: absolute;
	bottom: 20px;
	right: 130px;
}

.btn-danger {
	position: absolute;
	bottom: 20px;
	right: 20px;
}

#title {
	margin-left: 50px;
}

.btn {
	font-size: 15px;
}

.button {
	cursor: pointer;
}

h4 {
	font-size: 18px;
}
h4 {
    color: black !important;
    display: block !important;
}
</style>
</head>

<body>

	<!-- ##### Header Area End ##### -->

	<!-- ##### Right Side Cart Area ##### -->
	<div class="cart-bg-overlay"></div>





	<!-- ##### Blog Wrapper Area Start ##### -->
	<div class="single-blog-wrapper">

		<!-- Single Blog Post Thumb -->
		<div class="single-blog-post-thumb">
			<img
				src="${pageContext.request.contextPath}/images/bg-img/LessonDetail.png"
				alt="">
		</div>
		<%-- 追蹤成功 --%>
		<c:if test="${not empty followOK}">
		
			<script>
			
				$(document).ready(function(){
					swal("追蹤成功", "", "success");
				});
			</script>
		</c:if>

		<section>
			<h1 id="title">${lessonVO.lessname}</h1>
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-6">
						<div class="thumbnail">
							<img
								src="<%=request.getContextPath()%>/lesson/PicServletJDBC.do?lessno=${lessonVO.lessno}"
								class="img-responsive" alt="">

							<div class="caption">


																<c:if test="${role == 'student'}">
									
									<div class="row buttons">
									
										<FORM METHOD="post"
											ACTION="<%=request.getContextPath()%>/front-end/lesson_fav/lesson_fav.do" class="col-6">
											
											
											<button type="submit"
												class="btn  col-sm-10 col-sm-offset-1 btn-lg"
												style="background-color: #2894FF; color: #fff; font-size: 1em;"
												  <c:if test='${lesssta == "下架" || LY}'> disabled="disabled" title="課程以下架或已追蹤" </c:if>    >
												<span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;加入追蹤
											</button>
											
											
											<input type="hidden" name="rurl"
												value="<%=request.getServletPath()%>"> <input
												type="hidden" name="Lessno" value="${lessonVO.lessno}">
											<input type="hidden" name="action" value="insert"> <input
												type="hidden" name="Stuno" value="${stuno}">
											
										</FORM>
										<FORM METHOD="post"
											ACTION="<%=request.getContextPath()%>/front-end/lesson_order/lesson_order.do" class="col-6">
										<button  class="btn col-sm-10 col-sm-offset-1 btn-lg"
											style="background-color: #fb641b; color: #fff; font-size: 1em; " <c:if test='${lesssta == "下架" ||  Y}'> disabled="disabled" title="課程已下架或已購買" </c:if>   >
											<i class="fa fa-bolt" style="font-size: 1.2em;"></i>&nbsp;立即購買

										</button>
								
		<input type="hidden" name="Stuno" value="${stuno}"> 
        <input type="hidden" name="Lessno" value="${lessonVO.lessno}">
		<input type="hidden" name="action" value="insert">								
														
										</FORM>
									</div>
								</c:if>
								
								<c:if test="${role != 'student'}">
									<div class="row buttons">
										<button type="submit"
											class="btn  col-sm-4 col-sm-offset-2 btn-lg"
											style="background-color: #2894FF; color: #fff; font-size: 1em;"
											id="follow" <c:if test="${lessonVO.lesssta=='下架'}">value="Disabled" disabled</c:if>>

											<span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;加入追蹤
										</button>

										<button class="btn col-sm-4 col-sm-offset-1 btn-lg" id="buy"
											style="background-color: #fb641b; color: #fff; font-size: 1em;"
											<c:if test="${lessonVO.lesssta=='下架'}">value="Disabled" disabled</c:if>>
											<i class="fa fa-bolt" style="font-size: 1.2em;"></i>&nbsp;立即購買
										</button>
									</div>
											<script>
			document.getElementById("follow").addEventListener("click", function() {
				swal("提醒", "請先以學員身分登入", "warning");
			});
			document.getElementById("buy").addEventListener("click", function() {
				swal("提醒", "請先以學員身分登入", "warning");
			});
	
		</script>
								</c:if>
							</div>
						</div>
					</div>
					<div class="col-6">
						<div>


							<h4 class="button">
								<span class="glyphicon glyphicon-calendar" class="button"></span>
								查看課程時段 <i class="fa fa-chevron-right " class="button"></i>
							</h4>


							<div class="toggler">
								<div class="alert alert-primary">
									<h3 class="alert alert-primary">此堂課程時段如下</h3>
									<p>
									<%@ include file="/front-end/lesson/showOneLessonTime.jsp" %>
										
									</p>
								</div>
							</div>

							<br>
							<jsp:useBean id="lessonSvc" scope="page"
								class="com.lesson.model.LessonService" />
							<h4>
								<i class="glyphicon glyphicon-bullhorn"></i><strong>
									課程類型 : </strong>
								<c:forEach var="expertiseVO" items="${lessonSvc.allExpByExpno}">
									<c:if test="${lessonVO.lesstype==expertiseVO.expno}">${expertiseVO.expdesc}</c:if>
								</c:forEach>
							</h4>
							<h4>
								<span class="glyphicon glyphicon-thumbs-up"></span><strong>
									課程簡介:</strong> ${lessonVO.lessdesc}
							</h4>

							<h4>
								<span class="glyphicon glyphicon-thumbs-up"></span><strong>
									課程地點 : </strong>${lessonVO.lessloc}
							</h4>
							<h4>
								<span class="glyphicon glyphicon-thumbs-up"></span><strong>
									課程堂數 : </strong>${lessonVO.lesstimes} 堂
							</h4>
							<h4>
								<span class="glyphicon glyphicon-thumbs-up"></span><strong>
									販售點數 : </strong> ${lessonVO.lessprice} 點
							</h4>
							<h4>
								<span class="glyphicon glyphicon-thumbs-up"></span><strong>
									目前報名人數 :</strong> ${lessonVO.lesscur} 人
							</h4>
							<h4>
								<span class="glyphicon glyphicon-thumbs-up"></span><strong>
									最低成團人數 : </strong> ${lessonVO.lessmin} 人
							</h4>
							<h4>
								<span class="glyphicon glyphicon-thumbs-up"></span><strong>
									最高人數限制 : </strong> ${lessonVO.lessmax} 人
							</h4>
							<h4>
								<span class="glyphicon glyphicon-thumbs-up"></span><strong>
									開始報名日 : </strong> ${lessonVO.lessstart}
							</h4>
							<h4>
								<span class="glyphicon glyphicon-thumbs-up"></span><strong>
									截止報名日 : </strong> ${lessonVO.lessend}
							</h4>
							<h4>
								<span class="glyphicon glyphicon-thumbs-up"></span><strong>
									課程狀態 : </strong> ${lessonVO.lesssta}
							</h4>
						</div>
						<br>
						<form action="<%=request.getContextPath()%>/coach/coach.do"
							method="post">

							<input type="hidden" name="coano" value="${lessonVO.coano}">
							<input type="hidden" name="action" value="getOne">
							<button type="submit" class="btn btn-dark">查看教練介紹</button>
						</form>
					</div>
					<div class="col-12">
						<h4>
							<span class="glyphicon glyphicon-thumbs-up"></span><strong>
								上課地點 : </strong>
						</h4>
						<iframe width="1100" height="600" frameborder="0" scrolling="no"
							marginheight="0" marginwidth="0"
							src=https://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q=${lessonVO.lessloc}&z=16&output=embed&t=></iframe>
					</div>
					<!-- ifram 嵌入googleMap
					width=寬度
					height=高度
					q=輸入查詢的完整地址(.net 最好用Server.UrlEncode(string 地址)包起來)  或   經緯度，如果需要標明可在結尾加上()，於()中輸入表示名稱
					z=地圖比例大小，可輸入 1-18 (建議最佳16)
					t=模式，沒輸入值時為預設地圖(建議)；h為衛星圖加路線；p為地形圖
					 -->
				</div>
			</div>


		</section>

	</div>

	<!-- ##### Blog Wrapper Area End ##### -->

	<!-- ##### Footer Area Start ##### -->
<%@ include file="/front-end/footer.jsp" %>
	<!-- ##### Footer Area End ##### -->

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
<!-- 	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>



	<script>
		$(document).ready(function() {
			$(".toggler").hide();

			$(".button").click(function() {
				$(".toggler").toggle();
			});
		});
	</script>
</body>

</html>