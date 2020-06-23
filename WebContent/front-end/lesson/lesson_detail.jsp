<%@page import="java.util.List"%>
<%@page import="com.lessonTime.model.LessonTimeService"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.lesson.model.*"%>
<%
	LessonVO lessonVO = (LessonVO) request.getAttribute("lessonVO");
	LessonTimeService ltsvc = new LessonTimeService();
	String lessno = lessonVO.getLessno();
	List<String> old = ltsvc.getOneTime(lessno);

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
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
  <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">

        <!--jQuery library-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

        <!--Latest compiled and minified JavaScript-->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css'>
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

	<style>
.btn-success{
position: absolute;
    bottom: 20px;
    right: 130px;
}
.btn-danger{
position: absolute;
    bottom: 20px;
    right: 20px;
}
#title{
margin-left:50px;
}
.btn{
font-size:15px;
}
</style>
</head>

<body>
	<!-- ##### Header Area Start ##### -->
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
							<li><a href="#">商城</a>
								<div class="megamenu">
									<ul class="single-mega cn-col-4">
										<li class="title">服飾</li>
										<li><a href="shop.html">男士服飾</a></li>
										<li><a href="shop.html">女士服飾</a></li>
										<li><a href="shop.html">T-shirts</a></li>
										<li><a href="shop.html">Jackets</a></li>
										<li><a href="shop.html">Trench</a></li>
									</ul>

									<ul class="single-mega cn-col-4">
										<li class="title">健身相關</li>
										<li><a href="shop.html">健身食品</a></li>
										<li><a href="shop.html">健身配件</a></li>
										<li><a href="shop.html">T-shirts</a></li>
										<li><a href="shop.html">Jackets</a></li>
										<li><a href="shop.html">Trench</a></li>
									</ul>

									<ul class="single-mega cn-col-4">
										<li class="title">促銷專案</li>
										<li><a href="shop.html">母親節</a></li>
										<li><a href="shop.html">父親節</a></li>
										<li><a href="shop.html">T-shirts</a></li>
										<li><a href="shop.html">Jackets</a></li>
										<li><a href="shop.html">Trench</a></li>
									</ul>

								</div></li>
							<li><a href="#">課程</a>
								<ul class="dropdown">
									<li><a href="index.html">課程總覽</a></li>
									<li><a href="shop.html">瑜珈</a></li>
									<li><a href="single-product-details.html">肌力訓練</a></li>
									<li><a href="checkout.html">溜冰/滑板</a></li>
									<li><a href="blog.html">有氧課程</a></li>
									<li><a href="single-blog.html">海上/海下運動</a></li>
									<li><a href="regular-page.html">登山健行</a></li>
									<li><a href="contact.html">重量訓練</a></li>
									<li><a href="contact.html">球類運動</a></li>
									<li><a href="contact.html">武術</a></li>
									<li><a href="contact.html">其他</a></li>
								</ul></li>
							<li><a href="contact.html">揪團</a></li>
							<li><a href="#">學員</a>
								<ul class="dropdown">
									<li><a href="index.html">個人資料</a></li>
									<li><a href=".html">查看課表</a></li>
									<li><a href=".html">購買清單</a></li>
									<li><a href=".html">錢包管理</a></li>
									<li><a href=".html">個人信箱</a></li>

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
						src="${pageContext.request.contextPath}/images/core-img/heart.svg"
						alt=""></a>
				</div>
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

								  
 <section>
 <h1 id="title">${lessonVO.lessname} </h1>
 <div class="container">
 <div class="row justify-content-center">
    <div class="col-6">
       <div class="thumbnail">
           <img src="<%=request.getContextPath()%>/lesson/PicServletJDBC.do?lessno=${lessonVO.lessno}" class="img-responsive" alt="">
           
           <div class="caption">
             <div class="row buttons">
               
                 <button class="btn  col-sm-4 col-sm-offset-2 btn-lg" style="background-color:#2894FF; color:#fff;font-size:1em;"  id="follow"><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;加入追蹤</button>
               
                                
               <button class="btn col-sm-4 col-sm-offset-1 btn-lg" style="background-color:#fb641b; color:#fff;font-size:1em;"><i class="fa fa-bolt" style="font-size:1.2em;"></i>&nbsp;立即購買</button>
               </div>
             
           </div>
         </div>
    </div>
    <div class="col-6">
          <div>
         

          <h4><span class="glyphicon glyphicon-calendar"></span> 查看課程時段 <i class="fa fa-chevron-right" id="button"  ></i></h4>  

          
          <div class="toggler">
  <div class="alert alert-primary">
    <h3 class="alert alert-primary">此堂課程時段如下</h3>
    <p>
     	<% 
   	 for(String a:old) {
  		out.print(a);
  		out.print("<br>");
  	}
     	%>

    </p>
  </div>
</div>


           <br>
  			<jsp:useBean id="lessonSvc" scope="page" class="com.lesson.model.LessonService" />
           <h4><i class="glyphicon glyphicon-bullhorn"></i><strong>  課程類型 : </strong><c:forEach var="expertiseVO" items="${lessonSvc.allExpByExpno}"> 
 				<c:if test="${lessonVO.lesstype==expertiseVO.expno}">${expertiseVO.expdesc}</c:if> 
 			</c:forEach> </h4>
           <h4><span class="glyphicon glyphicon-thumbs-up"></span><strong>  課程簡介:</strong> ${lessonVO.lessdesc} </h4>
         
         <h4><span class="glyphicon glyphicon-thumbs-up"></span><strong>  課程地點 : </strong>${lessonVO.lessloc} </h4>
         <h4><span class="glyphicon glyphicon-thumbs-up"></span><strong>  課程堂數 : </strong>${lessonVO.lesstimes}  堂</h4>
         <h4><span class="glyphicon glyphicon-thumbs-up"></span><strong>  販售點數 : </strong> ${lessonVO.lessprice} 點</h4>
          <h4><span class="glyphicon glyphicon-thumbs-up"></span><strong>  目前報名人數 :</strong> ${lessonVO.lesscur} 人</h4>
          <h4><span class="glyphicon glyphicon-thumbs-up"></span><strong>  最低成團人數 : </strong> ${lessonVO.lessmin} 人</h4>
           <h4><span class="glyphicon glyphicon-thumbs-up"></span><strong>  最高人數限制 : </strong> ${lessonVO.lessmax} 人</h4>
            <h4><span class="glyphicon glyphicon-thumbs-up"></span><strong>  開始報名日 : </strong> ${lessonVO.lessstart}</h4>
            <h4><span class="glyphicon glyphicon-thumbs-up"></span><strong>  截止報名日 : </strong> ${lessonVO.lessend}</h4>
            <h4><span class="glyphicon glyphicon-thumbs-up"></span><strong>  課程狀態 : </strong> ${lessonVO.lesssta}</h4>
         </div>   
         <br>
          
             <button type="button" class="btn btn-dark">查看教練介紹</button>
         
          
    </div>
  </div>
</div> 


    </section>
						
</div>

	<!-- ##### Blog Wrapper Area End ##### -->

	<!-- ##### Footer Area Start ##### -->
	<footer class="footer_area clearfix">
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

	<script src="${pageContext.request.contextPath}/js/jquery/jquery-2.2.4.min.js"></script>
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/custom-js/lesson/lesson_detail.js"></script>
	<script>

	$(document).ready(function(){
		$(".toggler").hide();
			
		  $("#button").click(function(){
		  $(".toggler").toggle();
		  }); 
		});
</script>
</body>

</html>