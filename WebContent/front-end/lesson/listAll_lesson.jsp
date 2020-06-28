<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.lesson.model.*" %>



<jsp:useBean id="lessonSvc" scope="page" class="com.lesson.model.LessonService" />

<%

    List<LessonVO> list = lessonSvc.getAllLesson();
    pageContext.setAttribute("list",list);
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
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
   <title>FitMate</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Style CSS -->
  	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/css/core-style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/custom-css/regular-page.css">
  	
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">
    

<style>
    .card-img-top {
    height:300px;
    width:100% ;
    
    }
.btn-primary{
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
	height:300px;
    width:100%;
}
.card-text{
font-size:18px;
}
</style>


</head>

<body>
     <!-- ##### Header Area Start ##### -->
    <header class="header_area">
        <div class="classy-nav-container breakpoint-off d-flex align-items-center justify-content-between">
            <!-- Classy Menu -->
            <nav class="classy-navbar" id="essenceNav">
                <!-- Logo -->
                <a class="nav-brand" href="index.html"><img src="${pageContext.request.contextPath}/images/core-img/logo.png" alt=""></a>
                <!-- Navbar Toggler -->
                <div class="classy-navbar-toggler">
                    <span class="navbarToggler"><span></span><span></span><span></span></span>
                </div>
                <!-- Menu -->
                <div class="classy-menu">
                    <!-- close btn -->
                    <div class="classycloseIcon">
                        <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
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
               
                                </div>
                            </li>
                            <li><a href="#">課程</a>
                                <ul class="dropdown">
                                    <li><a href="index.html">課程總覽</a></li>
                                    <li><a href="shop.html">瑜珈</a></li>
                                    <li><a href="single-uct-details.html">肌力訓練</a></li>
                                    <li><a href="checkout.html">溜冰/滑板</a></li>
                                    <li><a href="blog.html">有氧課程</a></li>
                                    <li><a href="single-blog.html">海上/海下運動</a></li>
                                    <li><a href="regular-page.html">登山健行</a></li>
                                    <li><a href="contact.html">重量訓練</a></li>
                                    <li><a href="contact.html">球類運動</a></li>
                                    <li><a href="contact.html">武術</a></li>
                                    <li><a href="contact.html">其他</a></li>
                                </ul>
                            </li>
                            <li><a href="contact.html">揪團</a></li>
                            <li><a href="#">學員</a>
                                <ul class="dropdown">
                                    <li><a href="index.html">個人資料</a></li>
                                    <li><a href=".html">查看課表</a></li>
                                     <li><a href=".html">購買清單</a></li>
                                    <li><a href=".html">錢包管理</a></li>
                                    <li><a href=".html">個人信箱</a></li>

                                </ul>
                            </li>
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
                    <a href="#"><img src="${pageContext.request.contextPath}/images/core-img/heart.svg" alt=""></a>
                </div>
                <div class="user-login-info">
                    <a href="#"><img src="${pageContext.request.contextPath}/images/core-img/user.svg" alt=""></a>
                </div>
                 <div class="user-login-info">
                    <a href="#"><img src="${pageContext.request.contextPath}/images/core-img/email.svg" alt=""></a>
                </div>
                

            </div>

        </div>
    </header>
    <!-- ##### Header Area End ##### -->

 

    <!-- ##### Blog Wrapper Area Start ##### -->
    <div class="single-blog-wrapper">

        <!-- Single Blog Post Thumb -->
        <div class="single-blog-post-thumb">
            <img src="${pageContext.request.contextPath}/images/bg-img/lesson1920.png" alt="">
        </div>

        <div class="container col-12">
            <div class="row justify-content-center">





<c:forEach var="lessonVO" items="${list}" >

<div class="card-deck col-md-4">

  <div class="card" >
    
<%--     <img src="<%=request.getContextPath()%>/lesson/PicServletJDBC.do?lessno=${lessonVO.lessno}" alt="" class="card-img-top" alt="..."> --%>
    <div class="card-img-top img-region" style="background:url('<%=request.getContextPath()%>/lesson/PicServletJDBC.do?lessno=${lessonVO.lessno}');background-size:cover;background-position: center;"></div>
    <div class="card-body">
      <h5 class="card-title">${lessonVO.lessname}</h5>
      <p class="card-text">${lessonVO.lessdesc}</p>
      <p class="card-text">堂數:${lessonVO.lesstimes} 點數:${lessonVO.lessprice}<small class="text-muted"></small></p>
      <p class="card-text">狀態:${lessonVO.lesssta}<small class="text-muted"></small></p>
      
<!--       <a href="#" class="btn btn-primary">GO買課程</a> -->

    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/lesson/lesson.do" style="margin-bottom: 0px;">
<!-- 			     <input type="submit" value="GO買課程" class="gosubmit"> -->
			     <button type="submit" class="btn btn-primary">GO買課程</button>
			     <input type="hidden" name="lessno"  value="${lessonVO.lessno}">
			      <input type="hidden" name="coano"  value="${lessonVO.coano}">
			     <input type="hidden" name="action"	value="show_lesson_detail"></FORM>
    </div>
 
  </div>

  </div>

</c:forEach>









                
                </div>
            </div>
        </div>
   
    <!-- ##### Blog Wrapper Area End ##### -->

   <!-- ##### Footer Area Start ##### -->
    <footer class="footer_area clearfix">
        <div class="container">
           

    <div class="row ">
                <div class="col-md-12 text-center">
                    <p>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
    Copyright &copy;<script>document.write(new Date().getFullYear());</script> by EA101G5 <i class="fa fa-heart-o" aria-hidden="true"></i> by FitMate</a>
    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </p>
                </div>
            </div>

        </div>
    </footer>
    <!-- ##### Footer Area End ##### -->

    <!-- jQuery (Necessary for All JavaScript Plugins) -->
    <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
    <!-- Popper js -->
   	<script src="${pageContext.request.contextPath}/js/jquery/jquery-2.2.4.min.js"></script>
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
