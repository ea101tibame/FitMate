<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.product.model.*"%>
<%@ page import="com.product_order.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Product_orderVO product_orderVO = (Product_orderVO) request.getAttribute("product_orderVO");
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
* {
	font-family: 微軟正黑體;
}

.single_product_details_area {
	margin-left: 20%;
}

table {
	font-size: 20px;
}

#adj {
	font-size: 20px;
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
					<a href="#"><img
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
						<h2>確認結帳</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
		<c:if test="${not empty errorMsgs}">
	請修正以下錯誤
	<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li>${message}</li>
				</c:forEach>
			</ul>
		</c:if>
	<!-- 結帳分上下開始 -->
	<div class="container">

		<h3>第一步：確認商品明細：</h3>
		<!--商品明細開始 -->
		<table class="table table-striped align-items-center">
			<tr>
				<th>商品編號</th>
				<th>商品名稱</th>
				<th>商品價格</th>
				<th>數量</th>
			</tr>
			<form action="#" method="post" action="<%=request.getContextPath()%>/product/product_order.html">
			<%
				@SuppressWarnings("unchecked")
				Vector<ProductVO> buylist = (Vector<ProductVO>) session.getAttribute("shoppingcart");
				String amount = (String) request.getAttribute("amount");
			%>
			<%
				for (int i = 0; i < buylist.size(); i++) {
					ProductVO order = buylist.get(i);
					String prodno = order.getProdno();
					String prodname = order.getProdname();
					Integer prodprice = order.getProdprice();
					Integer qty = order.getQty();
			%>
			<tr>
				<td><%=prodno%></td>
				<td><%=prodname%></td>
				<td><%=prodprice%></td>
				<td><%=qty%></td>
			</tr>
			<%
				}
			%>
			<tr>
			
				<td colspan="2"><a href="#" id="adj">返回上頁:調整商品項目</a></td>
				<td colspan="2" style="text-align: right;">運費:80 <font
					size="+2">總金額：${amount}</font>
				</td>
			</tr>
		</table>
		<!-- 商品明細結束 -->

		<h3>第二步：確認商品明細：</h3>
		
			<div class="row">
				<div class="col-md-12 mb-3">
					<label for="stuno"><h4>學員編號：</h4><span></span></label> <input
						type="text" class="form-control" id="stuno" value="<%=(product_orderVO == null) ? "" : product_orderVO.getStuno()%>"
						name="recipient">
				</div>
			
				<div class="col-md-12 mb-3">
					<label for="recipient"><h4>收件人：</h4><span></span></label> <input
						type="text" class="form-control" id="recipient" value="<%=(product_orderVO == null) ? "" : product_orderVO.getRecipient()%>"
						name="recipient">
				</div>

				<div class="col-12 mb-3">
					<label for="phonenumber"><h4>收件人電話號碼</h4></label>
					<input type="text" class="form-control" id="phonenumber" value="<%=(product_orderVO == null) ? "" : product_orderVO.getPhonenumber()%>">
				</div>

				<div class="col-12 mb-3">
					<label for="pordadd"><h4>收件地址</h4> <span></span></label> <input
						type="text" class="form-control mb-3" id="pordadd" value="<%=(product_orderVO == null) ? "" : product_orderVO.getPordadd()%>">

				</div>

				<div class="align-items-center">
				<input type=hidden value="insert" name="action">
				<input type="submit" value="送出訂單">
				</div>
				

			</div>
		</form>



	</div>


	<!-- 結帳分上下結束 -->

	<!-- ##### Footer Area Start ##### -->
	<footer class="footer_area clearfix">
		<div class="container">


			<div class="row cokl">
				<div class="col-12 col-md-12 text-center">
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