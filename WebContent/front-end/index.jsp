<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%
	pageContext.setAttribute("context", request.getContextPath());
	pageContext.setAttribute("role", session.getAttribute("role"));
	pageContext.setAttribute("successMsg", session.getAttribute("successMsg"));
%>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>FitMate</title>
<link rel="stylesheet" type="text/css" href="${context}/css/css/core-style.css">
<link rel="stylesheet" type="text/css" href="${context}/css/custom-css/index.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" type="text/css" href="${context}/css/custom-css/login.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">
<link href="https://cdn.bootcss.com/sweetalert/1.1.3/sweetalert.min.css" rel="stylesheet">
</head>
<body>
	<header class="header_area">
		<div class="classy-nav-container breakpoint-off d-flex align-items-center justify-content-between">
			<nav class="classy-navbar" id="essenceNav">
				<a class="nav-brand" href="${context}/front-end/index.jsp">
					<img src="${context}/images/core-img/logo.png" id="logo" alt="">
				</a>
				<div class="classy-navbar-toggler">
					<span class="navbarToggler">
						<span></span>
						<span></span>
						<span></span>
					</span>
				</div>
				<div class="classy-menu">
					<div class="classycloseIcon">
						<div class="cross-wrap">
							<span class="top"></span>
							<span class="bottom"></span>
						</div>
					</div>
					<div class="classynav">
						<ul>
							<li>
								<a href="${context}/front-end/index.jsp">首頁</a>
							</li>
							<li>
								<a href="${context}/front-end/blog.jsp">消息</a>
							</li>
							<li>
								<a href="#">商城</a>
								<ul class="dropdown">
									<li>
										<a href="${context}/front-end/product/product.jsp">商城總覽</a>
									</li>
									<li>
										<a href="${context}/front-end/product/PC001.jsp">男士服飾</a>
									</li>
									<li>
										<a href="${context}/front-end/product/PC002.jsp">女士服飾</a>
									</li>
									<li>
										<a href="${context}/front-end/product/PC003.jsp">健身食品</a>
									</li>
									<li>
										<a href="${context}/front-end/product/PC004.jsp">健身配件</a>
									</li>
									<li>
										<a href="${context}/front-end/product/PC005.jsp">促銷專案</a>
									</li>
								</ul>
							</li>
							<li>
								<a href="#">課程</a>
								<ul class="dropdown">
									<li>
										<a href="${context}/front-end/lesson/listAll_lesson.jsp">課程總覽</a>
									</li>
								</ul>
							</li>
							<li>
								<a href="#">揪團</a>
								<ul class="dropdown">
									<li>
										<a href="${context}/front-end/activity/listAll_activity.jsp">活動總覽</a>
									</li>
									<li>
										<a href="${context}/front-end/activity/activity_create.jsp">建立活動</a>
									</li>
								</ul>
							</li>
							<li>
								<a href="${context}/front-end/article/listAllArticle.jsp">討論區</a>
							</li>
							<c:if test="${role == 'coach'}">
								<li>
									<a href="#">教練專區</a>
									<ul class="dropdown">
										<li>
											<a href="${context}/front-end/coach/updateCoach.jsp">個人資料</a>
										</li>
										<li>
											<a href="${context}/front-end/lesson/coachTimeTable.jsp">查看課表</a>
										</li>
										<li>
											<a href="${context}/front-end/lesson/addLesson.jsp">建立課程</a>
										</li>
										<li>
											<a href="${context}/front-end/lesson/selectLesson.jsp">查詢與更新</a>
										</li>
										<li>
											<a href="${context}/front-end/redemption/redemption.jsp">點數兌換</a>
										</li>
									</ul>
								</li>
							</c:if>
							<c:if test="${role == 'student'}">
								<li>
									<a href="#">學員專區</a>
									<ul class="dropdown">
										<li>
											<a href="${context}/front-end/student/updateStudent.jsp">個人資料</a>
										</li>
										<li>
											<a href="${context}/front-end/lesson_order/lesson_order.jsp">課程報名紀錄</a>
										</li>
										<li>
											<a href="${context}/front-end/activity/activity_order.jsp">活動報名紀錄</a>
										</li>
										<li>
											<a href="${context}/front-end/product/product_order.jsp">購買商品清單</a>
										</li>
										<li>
											<a href="${context}/front-end/deposit/deposit.jsp">錢包管理</a>
										</li>
										<li>
											<a href="${context}/front-end/lesson_fav/lesson_fav.jsp">追蹤課程</a>
										</li>
										<li>
											<a href="${context}/front-end/activity_fav/activity_fav.jsp">追蹤活動</a>
										</li>
										<li>
											<a href="${context}/front-end/product/product_fav.jsp">追蹤商品</a>
										</li>
									</ul>
								</li>
							</c:if>
						</ul>
					</div>
				</div>
			</nav>
			<div class="header-meta d-flex clearfix justify-content-end">
				<c:if test="${role == 'coach'}">
					<div class="user-login-info">
						<div style="padding-top: 30px; width: 200px; font-size: 16px; font-family: Microsoft JhengHei; font-weight: bold;">
							<span style="color: blue;">${coaname}</span>
							&nbsp&nbsp歡迎登入！
						</div>
					</div>
				</c:if>
				<c:if test="${role == 'student'}">
					<div class="user-login-info">
						<div style="padding-top: 30px; width: 200px; font-size: 16px; font-family: Microsoft JhengHei; font-weight: bold;">
							<span style="color: blue;">${stuname}</span>
							&nbsp&nbsp歡迎登入！
						</div>
					</div>
				</c:if>
				<c:if test="${role != 'coach' && role != 'student'}">
					<div class="user-login-info" data-toggle="modal" data-target="#login-modal">
						<a>
							<img src="${context}/images/core-img/user.svg" alt="">
						</a>
					</div>
				</c:if>

				<c:if test="${role == 'coach' || role == 'student'}">
					<div class="user-login-info">
						<a>
							<img src="${context}/images/core-img/logout.svg" alt="" id="logout-btn">
						</a>
					</div>
				</c:if>

			</div>
		</div>
	</header>
	<section class="welcome_area bg-img background-overlay" style="background-image: url(${context}/images/bg-img/yoga.png);">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-12">
					<div class="hero-content">
						<h6>最新商品</h6>
						<h2>New Arrivals</h2>
						<a href="#" class="btn essence-btn">View Arrivals</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="top_catagory_area section-padding-80 clearfix">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12 col-sm-6 col-md-4">
					<div class="single_catagory_area d-flex align-items-center justify-content-center bg-img" style="background-image: url(${context}/images/bg-img/bg-2.jpg);">
						<div class="catagory-content">
							<a href="#">揪團運動</a>
						</div>
					</div>
				</div>
				<div class="col-12 col-sm-6 col-md-4">
					<div class="single_catagory_area d-flex align-items-center justify-content-center bg-img" style="background-image: url(${context}/images/bg-img/bg-3.jpg);">
						<div class="catagory-content">
							<a href="#">購物商城</a>
						</div>
					</div>
				</div>
				<div class="col-12 col-sm-6 col-md-4">
					<div class="single_catagory_area d-flex align-items-center justify-content-center bg-img" style="background-image: url(${context}/images/bg-img/bg-4.jpg);">
						<div class="catagory-content">
							<a href="#">專業教練課</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="cta-area">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="cta-content bg-img background-overlay" style="background-image: url(${context}/images/bg-img/bg-5.jpg);">
						<div class="h-100 d-flex align-items-center justify-content-end">
							<div class="cta--text">
								<h2>FIND YOUR FITMATE</h2>
								<a href="#" class="btn essence-btn">查看活動</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<section class="new_arrivals_area section-padding-80 clearfix">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section-heading text-center">
						<h2>熱門課程</h2>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="popular-products-slides owl-carousel">
						<div class="single-product-wrapper">
							<div class="product-img">
								<img src="${context}/images/lesson/kids-skateboard-checkered-lifestyle.jpg" alt="">
								<img class="hover-img" src="${context}/images/lesson/kids-skateboard-checkered-lifestyle.jpg" alt="">
								<div class="product-favourite">
									<a href="#" class="favme fa fa-heart"></a>
								</div>
							</div>
							<div class="product-description">
								<span>入門衝浪</span>
								<a href="${context}/front-end/lesson/lesson.jsp">
									<h6>我在烏石港等你一起衝!</h6>
								</a>
								<p class="product-price">$800</p>
								<div class="hover-content">
									<div class="add-to-cart-btn">
										<a href="#" class="btn essence-btn">查看詳情</a>
									</div>
								</div>
							</div>
						</div>
						<div class="single-product-wrapper">
							<div class="product-img">
								<img src="${context}/images/coach-img/C001.jpg" alt="">
								<img class="hover-img" src="${context}/images/coach-img/C001.jpg" alt="">
								<div class="product-favourite">
									<a href="#" class="favme fa fa-heart"></a>
								</div>
							</div>
							<div class="product-description">
								<span>空中瑜珈</span>
								<a href="single-product-details.html">
									<h6>超夯的爆汗課程 快揪團挑戰</h6>
								</a>
								<p class="product-price">$2000</p>
								<div class="hover-content">
									<div class="add-to-cart-btn">
										<a href="#" class="btn essence-btn">查看詳情</a>
									</div>
								</div>
							</div>
						</div>
						<div class="single-product-wrapper">
							<div class="product-img">
								<img src="${context}/images/coach-img/C004.jpg" alt="">
								<img class="hover-img" src="${context}/images/coach-img/C004.jpg" alt="">
								<div class="product-badge offer-badge">
									<span>HOT</span>
								</div>
								<div class="product-favourite">
									<a href="#" class="favme fa fa-heart"></a>
								</div>
							</div>
							<div class="product-description">
								<span>mango</span>
								<a href="${context}/front-end/lesson/lesson.jsp">
									<h6>TRX懸吊訓練</h6>
								</a>
								<p class="product-price">
									<span class="old-price">$75.00</span>
									$55.00
								</p>
								<div class="hover-content">
									<div class="add-to-cart-btn">
										<a href="#" class="btn essence-btn">Add to Cart</a>
									</div>
								</div>
							</div>
						</div>
						<div class="single-product-wrapper">
							<div class="product-img">
								<img src="${context}/images/coach-img/C005.jpg" alt="">
								<img class="hover-img" src="${context}/images/coach-img/C005.jpg" alt="">
								<div class="product-badge new-badge">
									<span>New</span>
								</div>
								<div class="product-favourite">
									<a href="#" class="favme fa fa-heart"></a>
								</div>
							</div>
							<div class="product-description">
								<span>mango</span>
								<a href="single-product-details.html">
									<h6>PETITE Belted Jumper Dress</h6>
								</a>
								<p class="product-price">$80.00</p>
								<div class="hover-content">
									<div class="add-to-cart-btn">
										<a href="#" class="btn essence-btn">Add to Cart</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<footer class="footer_area clearfix">
		<div class="container">
			<div class="row ">
				<div class="col-md-12 text-center">
					<p>
						Copyright &copy; 2020 by EA101G5
						<i class="fa fa-heart-o" aria-hidden="true"></i>
						by FitMate
						</a>
					</p>
				</div>
			</div>
		</div>
	</footer>
	<div class="box">
		<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content login-modal-content">
					<div class="cont">
						<div class="form sign-in">
							<form action="${context}/loginForStudent.do" method="post">
								<h2>學員專區</h2>
								<label>
									<span>信箱</span>
									<input type="email" name="stumail" />
								</label>
								<label>
									<span>密碼</span>
									<input type="password" name="stupsw" />
								</label>
								<p class="forgot-pass">忘記密碼?</p>
								<button type="submit" class="submit">登入</button>
								<button type="button" class="fb-btn" id="sign-up-student">註冊學員</button>
							</form>
						</div>
						<div class="sub-cont">
							<div class="img">
								<div class="img__text m--up">
									<h2>我是教練</h2>
									<p>優質健身媒合平台讓你快速提升業務量和業界知名度!</p>
								</div>
								<div class="img__text m--in">
									<h2>我是學員</h2>
									<p>還不快手刀加入我們! 購物、揪團和專業課程，所有願望一次滿足！</p>
								</div>
								<div class="img__btn">
									<span class="m--up">教練登入</span>
									<span class="m--in">學員登入</span>
								</div>
							</div>
							<div class="form sign-up">
								<form action="${context}/loginForCoach.do" method="post">
									<h2>教練專區</h2>
									<label>
										<span>信箱</span>
										<input type="email" name="coamail" />
									</label>
									<label>
										<span>密碼</span>
										<input type="password" name="coapsw" />
									</label>
									<p class="forgot-pass">忘記密碼?</p>
									<button type="submit" class="submit">登入</button>
									<button type="button" class="fb-btn" id="sign-up-coach">註冊教練</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="${context}/js/jquery/jquery-2.2.4.min.js"></script>
		<script src="${context}/js/popper.min.js"></script>
		<script src="${context}/js/bootstrap.min.js"></script>
		<script src="${context}/js/plugins.js"></script>
		<script src="${context}/js/classy-nav.min.js"></script>
		<script src="${context}/js/active.js"></script>
		<script src="${context}/js/index.js"></script>
		<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.min.js"></script>
		<script src="https://cdn.bootcss.com/sweetalert/1.1.3/sweetalert.min.js"></script>
		<script>
			var context = "${context}";
			var successMsg = "${successMsg}";
			alert(successMsg);
			if (successMsg !== "") {
				swal("干得好", successMsg, "success");
			}
		</script>
</body>

</html>