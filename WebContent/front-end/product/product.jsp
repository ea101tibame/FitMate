<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.product.model.*"%>
<%@ page import="com.product_fav.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><%--JSTLI18N標籤庫--%>

<%
	ProductService prodSvc = new ProductService();
	List<ProductVO> list = prodSvc.getAll();
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
	href="<%=request.getContextPath()%>/images/core-img/heart.svg">

<!-- Core Style CSS -->

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/css/core-style.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/custom-css/product/product.css">

<style>
.single-product-wrapper .product-img .product-favourite button {
	position: absolute;
	height: 25px;
	width: 45px;
	font-size: 14px;
	color: #ccc;
	top: 20px;
	right: 20px;
	z-index: 10;
	line-height: 25px;
	background-color: #ffffff;
	box-shadow: 0 0 3px rgba(0, 0, 0, 0.15);
	text-align: center;
	opacity: 0;
	visibility: hidden;
}

.single-product-wrapper .product-img .product-favourite button.active {
	opacity: 1;
	visibility: visible;
}

.single-product-wrapper:hover .product-img .product-favourite button {
	opacity: 1;
	visibility: visible;
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
					src="<%=request.getContextPath()%>/images/core-img/logo.png" alt=""></a>
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
					<a
						href="<%=request.getContextPath()%>/front-end/product/product_fav.jsp"><img
						src="<%=request.getContextPath()%>/images/core-img/heart.svg"
						alt=""></a>
				</div>
				<div class="user-login-info">
					<a href="#"><img
						src="<%=request.getContextPath()%>/images/core-img/user.svg"
						alt=""></a>
				</div>

				<!-- Cart Area -->
				<div class="cart-area">
					<a href="#" id="essenceCartBtn"><img
						src="<%=request.getContextPath()%>/images/core-img/bag.svg" alt="">
						<span>3</span></a>
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
			<a href="#" id="rightSideCart"><img
				src="<%=request.getContextPath()%>/images/core-img/bag.svg" alt="">
				<span>3</span></a>
		</div>

		<div class="cart-content d-flex">

			<!-- Cart List Area -->
			<div class="cart-list">
				<!-- Single Cart Item -->
				<div class="single-cart-item">
					<a href="#" class="product-image"> <img
						src="<%=request.getContextPath()%>/images/product/P003.PNG"
						class="cart-thumb" id="cartimg" alt=""> <!-- Cart Item Desc -->
						<div class="cart-item-desc">
							<span class="product-remove"><i class="fa fa-close"
								aria-hidden="true"></i></span> <span class="badge">Mango</span>
							<h6>Button Through Strap Mini Dress</h6>
							<p class="size">Size: S</p>
							<p class="color">Color: Red</p>
							<p class="price">$45.00</p>
						</div>
					</a>
				</div>

				<!-- Single Cart Item -->
				<div class="single-cart-item">
					<a href="#" class="product-image"> <img
						src="<%=request.getContextPath()%>/images/product/P003.PNG"
						class="cart-thumb" alt=""> <!-- Cart Item Desc -->
						<div class="cart-item-desc">
							<span class="product-remove"><i class="fa fa-close"
								aria-hidden="true"></i></span> <span class="badge">Mango</span>
							<h6>Button Through Strap Mini Dress</h6>
							<p class="size">Size: S</p>
							<p class="color">Color: Red</p>
							<p class="price">$45.00</p>
						</div>
					</a>
				</div>

				<!-- Single Cart Item -->
				<div class="single-cart-item">
					<a href="#" class="product-image"> <img
						src="<%=request.getContextPath()%>/images/product/P003.PNG"
						class="cart-thumb" alt=""> <!-- Cart Item Desc -->
						<div class="cart-item-desc">
							<span class="product-remove"><i class="fa fa-close"
								aria-hidden="true"></i></span> <span class="badge">Mango</span>
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
				<div class="checkout-btn mt-100">
					<a href="checkout.html" class="btn essence-btn">結 帳</a>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Right Side Cart End ##### -->

	<!-- ##### Breadcumb Area Start ##### -->
	<div class="breadcumb_area bg-img"
		style="background-image: url(<%=request.getContextPath()%>/images/product/breadcumb.jpg);">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-12">
					<div class="page-title text-center">
						<h2>FitMate購物商城</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Breadcumb Area End ##### -->

	<!-- ##### Shop Grid Area Start ##### -->
	<section class="shop_grid_area section-padding-80">
		<div class="container">
			<div class="row">
				<div class="col-12 col-md-4 col-lg-3">
					<div class="shop_sidebar_area">

						<!-- ##### Single Widget ##### -->
						<div class="widget catagory mb-50">
							<!-- Widget Title -->
							<h6 class="widget-title mb-30 pclass-title">商品分類</h6>

							<!--  Catagories  -->
							<div class="catagories-menu">
								<ul id="menu-content2" class="menu-content collapse show">
									<!-- Single Item -->
									<li data-toggle="collapse" data-target="#clothing"><a
										href="#">服飾</a>
										<ul class="sub-menu collapse show" id="clothing">
											<li><a href="#">所有服飾</a></li>
											<li><a href="#">男士服飾</a></li>
											<li><a href="#">女士服飾</a></li>

										</ul></li>
									<!-- Single Item -->
									<li data-toggle="collapse" data-target="#shoes"
										class="collapsed"><a href="#">健身相關</a>
										<ul class="sub-menu collapse" id="shoes">
											<li><a href="#">所有健身相關</a></li>
											<li><a href="#">健身食品</a></li>
											<li><a href="#">健身配件</a></li>
										</ul></li>
									<!-- Single Item -->
									<li data-toggle="collapse" data-target="#accessories"
										class="collapsed"><a href="#">促銷專案</a>
										<ul class="sub-menu collapse" id="accessories">
											<li><a href="#">父親節促銷</a></li>
											<li><a href="#">滿千免運</a></li>
										</ul></li>
								</ul>
							</div>
						</div>

						<!-- ##### Single Widget ##### -->
						<div class="widget brands mb-50">
							<!-- Widget Title 2 -->
							<!-- 左邊欄位預留加功能 -->
						</div>
					</div>
				</div>

				<div class="col-12 col-md-8 col-lg-9">
					<div class="shop_grid_product_area">
						<div class="row">
							<div class="col-12">
								<div
									class="product-topbar d-flex align-items-center justify-content-between">
									<!-- Total Products -->
									<div class="total-products">
										<p>
											<span>186</span> 件商品
										</p>
									</div>
									<!-- Sorting -->
									<div class="product-sorting d-flex">
										<p>排序方式</p>
										<form action="#" method="get">
											<select name="select" id="sortByselect">
												<option value="value">最新上架</option>
												<option value="value">價格：由高到低</option>
												<option value="value">價格：由低到高</option>
											</select> <input type="submit" class="d-none" value="">
										</form>
									</div>
								</div>
							</div>
						</div>

						<%@ include file="page1.file"%>
						<div class="row col-12">
							<c:forEach var="productVO" items="${list}" begin="<%=pageIndex%>"
								end="<%=pageIndex+rowsPerPage-1%>">

								<!-- Single Product -->

								<div class="col-12 col-sm-3 col-lg-4">
									<div class="single-product-wrapper">
										<!-- Product Image -->
										<div class="product-img">
											<img
												src="<%= request.getContextPath()%>/product/product.pic?prodno=${productVO.prodno}"
												alt="">

											<!-- Product Badge -->
											<div class="product-badge offer-badge">
												<span>限時優惠</span>
											</div>
											<!-- Favourite -->
											<form
												action="<%=request.getContextPath()%>/back-end/product/product_fav.html"
												method="post">
												<div class="product-favourite">
													<jsp:useBean id="product_favSvc" scope="page"
														class="com.product_fav.model.Product_favService" />
													<!-- 	                                            <a href="#" class="favme fa fa-heart" type="submit">   </a> -->
													<button class="favme fa fa-heart" type="submit"
														<c:if test="${stuno==S002 && productVO.prodno==product_favVO.prodno}">value="Disabled" disabled</c:if>></button>

													<input type="hidden" name="prodno"
														value="${productVO.prodno}"> <input type="hidden"
														name="stuno" value="S002"> <input type="hidden"
														name="action" value="insert">
												</div>
											</form>
										</div>

										<!-- Product Description -->
										<div class="product-description">
											<h6>
												<form method="post"
													action="${pageContext.request.contextPath}/Shopping.html">
													<input type="submit" value="${productVO.prodname}"
														class="btn btn-outline-success my-2 my-sm-0"> <input
														type="hidden" name="action" value="getOne_For_Display">
													<input type="hidden" name="prodno"
														value="${productVO.prodno}">
												</form>
											</h6>

											<p class="product-price">
												<span class="old-price">舊價格</span>${productVO.prodprice}</p>
											<!-- Hover Content -->
											<div class="hover-content">
												<!-- Add to Cart -->
												<div class="add-to-cart-btn">
													<a href="#" class="btn essence-btn">Add to Cart</a>
												</div>
											</div>
										</div>
									</div>
								</div>

							</c:forEach>
						</div>
						<%@ include file="page2.file"%>



					</div>
				</div>
			</div>

			<!-- ##### Shop Grid Area End ##### -->

			<!-- ##### Footer Area Start ##### -->
			<footer class="footer_area clearfix container-fluid">
				<div class="container-fluid">
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
				src="<%=request.getContextPath()%>/js/jquery/jquery-2.2.4.min.js"></script>
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