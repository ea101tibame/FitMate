<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.complaint.model.*"%>
<%@ page import="com.Stu.model.*" %>
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
    



</style>


</head>

<body>
     <!-- ##### Header Area Start ##### -->
    <header class="header_area">
        <div class="classy-nav-container breakpoint-off d-flex align-items-center justify-content-between">
            <!-- Classy Menu -->
            <nav class="classy-navbar" id="essenceNav">
                <!-- Logo -->
                <a class="nav-brand" href="index.html"><img src="${pageContext.request.contextPath}/img/core-img/logo.png" alt=""></a>
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
                    <a href="#"><img src="${pageContext.request.contextPath}/img/core-img/heart.svg" alt=""></a>
                </div>
                <div class="user-login-info">
                    <a href="#"><img src="${pageContext.request.contextPath}/img/core-img/user.svg" alt=""></a>
                </div>
                 <div class="user-login-info">
                    <a href="#"><img src="${pageContext.request.contextPath}/img/core-img/email.svg" alt=""></a>
                </div>
                

            </div>

        </div>
    </header>
    <!-- ##### Header Area End ##### -->

    <!-- ##### Right Side Cart Area ##### -->
    <div class="cart-bg-overlay"></div>

    <div class="right-side-cart-area">

        <!-- Cart Button -->
        <div class="cart-button">
            <a href="#" id="rightSideCart"><img src="${pageContext.request.contextPath}/img/core-img/bag.svg" alt=""> <span>3</span></a>
        </div>

        <div class="cart-content d-flex">

            <!-- Cart List Area -->
            <div class="cart-list">
                <!-- Single Cart Item -->
                <div class="single-cart-item">
                    <a href="#" class="uct-image">
                        <img src="${pageContext.request.contextPath}/img/uct-img/uct-1.jpg" class="cart-thumb" alt="">
                        <!-- Cart Item Desc -->
                        <div class="cart-item-desc">
                          <span class="uct-remove"><i class="fa fa-close" aria-hidden="true"></i></span>
                            <span class="badge">Mango</span>
                            <h6>Button Through Strap Mini Dress</h6>
                            <p class="size">Size: S</p>
                            <p class="color">Color: Red</p>
                            <p class="price">$45.00</p>
                        </div>
                    </a>
                </div>

                <!-- Single Cart Item -->
                <div class="single-cart-item">
                    <a href="#" class="uct-image">
                        <img src="${pageContext.request.contextPath}/img/uct-img/uct-2.jpg" class="cart-thumb" alt="">
                        <!-- Cart Item Desc -->
                        <div class="cart-item-desc">
                          <span class="uct-remove"><i class="fa fa-close" aria-hidden="true"></i></span>
                            <span class="badge">Mango</span>
                            <h6>Button Through Strap Mini Dress</h6>
                            <p class="size">Size: S</p>
                            <p class="color">Color: Red</p>
                            <p class="price">$45.00</p>
                        </div>
                    </a>
                </div>

    
            




            </div>

            




            <!-- Cart Summary -->
            <div class="cart-amount-summary">

                <h2>Summary</h2>
                <ul class="summary-table">
                    <li><span>subtotal:</span> <span>$274.00</span></li>
                    <li><span>delivery:</span> <span>Free</span></li>
                    <li><span>discount:</span> <span>-15%</span></li>
                    <li><span>total:</span> <span>$232.00</span></li>
                </ul>
                <div class="checkout-btn mt-100">
                    <a href="checkout.html" class="btn essence-btn">check out</a>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Right Side Cart End ##### -->

    <!-- ##### Blog Wrapper Area Start ##### -->
    <div class="single-blog-wrapper">

        <!-- Single Blog Post Thumb -->
        <div class="single-blog-post-thumb">
            <img src="${pageContext.request.contextPath}/img/bg-img/lesson1920.png" alt="">
        </div>

        <div class="container col-12">
            <div class="row justify-content-center">





<c:forEach var="LessonVO" items="${list}" >

<div class="card-deck col-md-4">

  <div class="card" >${LessonVO.lessno}
    
    <img src="<%=request.getContextPath()%>/lesson/PicServletJDBC.do?lessno=${LessonVO.lessno}" alt="" class="card-img-top" alt="...">
    <div class="card-body">
      <h5 class="card-title">${LessonVO.lessname}</h5>
      <p class="card-text">${LessonVO.lessdesc}</p>
      <p class="card-text">點數:${LessonVO.lessprice}<small class="text-muted">.....</small></p>
      <a href="#" class="btn btn-primary">GO買課程</a>
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
    <script src="${pageContext.request.contextPath}/css/js/popper.min.js"></script>
    <!-- Popper js -->
   	<script src="${pageContext.request.contextPath}/css/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${pageContext.request.contextPath}/css/js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="${pageContext.request.contextPath}/css/js/plugins.js"></script>
    <!-- Classy Nav js -->
    <script src="${pageContext.request.contextPath}/css/js/classy-nav.min.js"></script>
    <!-- Active js -->
    <script src="${pageContext.request.contextPath}/css/js/active.js"></script>


</body>

</html>









</body>
</html>