<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.product.model.*"%>
<%@ page import="com.product_fav.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
// 	Product_favVO product_favVO = (Product_favVO) request.getAttribute("product_favVO");
	Product_favService product_favSvc = new Product_favService();
	List<Product_favVO> list = product_favSvc.getOnePf("S002");
	pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>FitMate</title>

    <!-- Favicon  -->
    <link rel="icon" href="<%=request.getContextPath()%>/images/core-img/heart.svg">

    <!-- Core Style CSS -->
    
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/css/core-style.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/custom-css/product/product.css">
    <style>
footer{
   position:absolute;
   bottom:0;
   width:100%;
   height:100px;
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
                <a class="nav-brand" href="index.html"><img src="<%=request.getContextPath()%>/images/core-img/logo.png" alt=""></a>
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
                                    </ul>

                                    <ul class="single-mega cn-col-4">
                                        <li class="title">健身相關</li>
                                        <li><a href="shop.html">健身食品</a></li>
                                        <li><a href="shop.html">健身配件</a></li>
                                    </ul>
                                   
                                    <ul class="single-mega cn-col-4">
                                        <li class="title">促銷專案</li>
                                        <li><a href="shop.html">母親節</a></li>
                                        <li><a href="shop.html">父親節</a></li>
                                    </ul>
               
                                </div>
                            </li>
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
                    <a href="#"><img src="<%=request.getContextPath()%>/images/core-img/heart.svg" alt=""></a>
                </div>
                <div class="user-login-info">
                    <a href="#"><img src="<%=request.getContextPath()%>/images/core-img/user.svg" alt=""></a>
                </div>

                 <!-- Cart Area -->
                <div class="cart-area">
                    <a href="#" id="essenceCartBtn"><img src="<%=request.getContextPath()%>/images/core-img/bag.svg" alt=""> <span>3</span></a>
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
            <a href="#" id="rightSideCart"><img src="<%=request.getContextPath()%>/images/core-img/bag.svg" alt=""> <span>3</span></a>
        </div>

        <div class="cart-content d-flex">

            <!-- Cart List Area -->
            <div class="cart-list">
                <!-- Single Cart Item -->
                <div class="single-cart-item">
                    <a href="#" class="product-image">
                        <img src="<%=request.getContextPath()%>/images/product/P003.PNG" class="cart-thumb" id="cartimg" alt="">
                        <!-- Cart Item Desc -->
                        <div class="cart-item-desc">
                          <span class="product-remove"><i class="fa fa-close" aria-hidden="true"></i></span>
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
                    <a href="#" class="product-image">
                        <img src="<%=request.getContextPath()%>/images/product/P003.PNG" class="cart-thumb" alt="">
                        <!-- Cart Item Desc -->
                        <div class="cart-item-desc">
                          <span class="product-remove"><i class="fa fa-close" aria-hidden="true"></i></span>
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
                    <a href="#" class="product-image">
                        <img src="<%=request.getContextPath()%>/images/product/P003.PNG" class="cart-thumb" alt="">
                        <!-- Cart Item Desc -->
                        <div class="cart-item-desc">
                          <span class="product-remove"><i class="fa fa-close" aria-hidden="true"></i></span>
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

                <h2>我的購物車</h2>
                <ul class="summary-table">
                    <li><span>商品總計:</span> <span>$274元</span></li>
                    <li><span>運費:</span> <span>80元</span></li>
                    <li><span>總計:</span> <span>$232.00</span></li>
                </ul>
                    <a href="checkout.html" class="btn essence-btn">結  帳</a>
            </div>
        </div>
    </div>
    <!-- ##### Right Side Cart End ##### -->
	<div class="container">
		<div class="row">
		<h2>追蹤清單</h2>
		</div>
		<div class="row">
<%@ include file="page1.file" %>   
		</div>
		<c:forEach var="product_favVO" items="${list}">
		<div class="row alert alert-primary">
		<jsp:useBean id="productSvc" scope="page" class="com.product.model.ProductService" />
		<c:forEach var="productVO" items="${productSvc.all}">
			<c:if test="${product_favVO.prodno==productVO.prodno}">
			<div class="col-2"><img src="<%= request.getContextPath()%>/product/product.pic?prodno=${product_favVO.prodno}"></div>
			</c:if>
			</c:forEach>
			<div class="col-10">
				<div class="row" style="float:right">
					<form method="post" action="<%=request.getContextPath()%>/back-end/product/product_fav.html">
						<input type="submit" value="X" style="border:none; background-color:#cce5ff; outline:none">
						<input type="hidden" name="action" value="delete">
						<input type="hidden" name="prodno" value="${product_favVO.prodno}">
						<input type="hidden" name="stuno" value="${product_favVO.stuno}">
					</form>
				</div>
				<div class="row" style="height:60px">
				<h4>
				<c:forEach var="productVO" items="${productSvc.all}">
					<c:if test="${product_favVO.prodno==productVO.prodno}">
						${productVO.prodname}
					</c:if>
				</c:forEach>
		</h4></div>
				<div class="row">商品價格:
				<c:forEach var="productVO" items="${productSvc.all}">
					<c:if test="${product_favVO.prodno==productVO.prodno}">
						${productVO.prodprice}
					</c:if>
				</c:forEach>
				</div>
				
				<div class="row">
				<c:forEach var="productVO" items="${productSvc.all}">
					<c:if test="${product_favVO.prodno==productVO.prodno}">
						${productVO.proddesc}
					</c:if>
				</c:forEach>
				</div>
				<div class="row"></div>
				<div class="row">
					<div class="col-9"></div>
					<div class="col-3">
					<a href="#" class="essence-btn">加入購物車</a>
					</div>
					
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
<%@ include file="page2.file" %>   


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
    <script src="<%=request.getContextPath()%>/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="<%=request.getContextPath()%>/js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="<%=request.getContextPath()%>/js/plugins.js"></script>
    <!-- Classy Nav js -->
    <script src="<%=request.getContextPath()%>/js/classy-nav.min.js"></script>
    <!-- Active js -->
    <script src="<%=request.getContextPath()%>/js/active.js"></script>

</body>

</html>