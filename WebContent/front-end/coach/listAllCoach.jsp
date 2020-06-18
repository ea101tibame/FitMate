<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.coach.model.*"%>
<%@ page import="com.expertise.model.*"%>
<%@ page import="com.expertise_own.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>

<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
	CoaService coaSvc = new CoaService();
	List<CoaVO> coaVOs = coaSvc.getAll();
	pageContext.setAttribute("coaVOs", coaVOs);

	System.out.println("list size: " + coaVOs.size());
	for (int i = 0; i < coaVOs.size(); i++) {
		System.out.println("coaname: " + coaVOs.get(i).getCoaname());
	}
%>

<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>所有教練資料 - listAllCoach.jsp</title>
<link rel="icon" href="<%=request.getContextPath()%>/img/index-core-iamge/favicon.ico">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/core-style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/custom-css/ListAllCoach.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css'>
<link rel="stylesheet" href="custom-css/CoaProfile.css">

</head>
<body>
	<!-- ##### Header Area Start ##### -->
	<header class="header_area">
		<div class="classy-nav-container breakpoint-off d-flex align-items-center justify-content-between">
			<!-- Classy Menu -->
			<nav class="classy-navbar" id="essenceNav">
				<!-- Logo -->
				<a class="nav-brand" href="index.html">
					<img src="img/core-img/logo.png" alt="">
				</a>
				<!-- Navbar Toggler -->
				<div class="classy-navbar-toggler">
					<span class="navbarToggler">
						<span></span>
						<span></span>
						<span></span>
					</span>
				</div>
				<!-- Menu -->
				<div class="classy-menu">
					<!-- close btn -->
					<div class="classycloseIcon">
						<div class="cross-wrap">
							<span class="top"></span>
							<span class="bottom"></span>
						</div>
					</div>
					<!-- Nav Start -->
					<div class="classynav">
						<ul>
							<li>
								<a href="index.html">首頁</a>
							</li>
							<li>
								<a href="blog.html">消息</a>
							</li>
							<li>
								<a href="#">商城</a>
								<div class="megamenu">
									<ul class="single-mega cn-col-4">
										<li class="title">服飾</li>
										<li>
											<a href="shop.html">男士服飾</a>
										</li>
										<li>
											<a href="shop.html">女士服飾</a>
										</li>
										<li>
											<a href="shop.html">T-shirts</a>
										</li>
										<li>
											<a href="shop.html">Jackets</a>
										</li>
										<li>
											<a href="shop.html">Trench</a>
										</li>
									</ul>

									<ul class="single-mega cn-col-4">
										<li class="title">健身相關</li>
										<li>
											<a href="shop.html">健身食品</a>
										</li>
										<li>
											<a href="shop.html">健身配件</a>
										</li>
										<li>
											<a href="shop.html">T-shirts</a>
										</li>
										<li>
											<a href="shop.html">Jackets</a>
										</li>
										<li>
											<a href="shop.html">Trench</a>
										</li>
									</ul>

									<ul class="single-mega cn-col-4">
										<li class="title">促銷專案</li>
										<li>
											<a href="shop.html">母親節</a>
										</li>
										<li>
											<a href="shop.html">父親節</a>
										</li>
										<li>
											<a href="shop.html">T-shirts</a>
										</li>
										<li>
											<a href="shop.html">Jackets</a>
										</li>
										<li>
											<a href="shop.html">Trench</a>
										</li>
									</ul>

								</div>
							</li>
							<li>
								<a href="#">課程</a>
								<ul class="dropdown">
									<li>
										<a href="index.html">課程總覽</a>
									</li>
									<li>
										<a href="shop.html">瑜珈</a>
									</li>
									<li>
										<a href="single-product-details.html">肌力訓練</a>
									</li>
									<li>
										<a href="checkout.html">溜冰/滑板</a>
									</li>
									<li>
										<a href="blog.html">有氧課程</a>
									</li>
									<li>
										<a href="single-blog.html">海上/海下運動</a>
									</li>
									<li>
										<a href="regular-page.html">登山健行</a>
									</li>
									<li>
										<a href="contact.html">重量訓練</a>
									</li>
									<li>
										<a href="contact.html">球類運動</a>
									</li>
									<li>
										<a href="contact.html">武術</a>
									</li>
									<li>
										<a href="contact.html">其他</a>
									</li>
								</ul>
							</li>
							<li>
								<a href="contact.html">揪團</a>
							</li>
							<li>
								<a href="#">學員</a>
								<ul class="dropdown">
									<li>
										<a href="index.html">個人資料</a>
									</li>
									<li>
										<a href=".html">查看課表</a>
									</li>
									<li>
										<a href=".html">購買清單</a>
									</li>
									<li>
										<a href=".html">錢包管理</a>
									</li>
									<li>
										<a href=".html">個人信箱</a>
									</li>

								</ul>
							</li>
							<li>
								<a href="blog.html">討論區</a>
							</li>

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
					<a href="#">
						<img src="img/core-img/user.svg" alt="">
					</a>
				</div>
				<div class="user-login-info">
					<a href="#">
						<img src="img/core-img/email.svg" alt="">
					</a>
				</div>


			</div>

		</div>
	</header>


	<!-- ##### Blog Wrapper Area Start ##### -->
	<div class="single-blog-wrapper">

		<!-- Single Blog Post Thumb -->
		<div class="single-blog-post-thumb">
			<img src="img/bg-img/coach1920.png" alt="">
		</div>

		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12 col-md-8">
					<div class="regular-page-content-wrapper section-padding-80">
						<div class="regular-page-text">
							<h2>搜尋教練</h2>


							<div class="dropdown">
								<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">依專長搜尋</button>
								<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
									<button class="dropdown-item" type="button">瑜珈</button>
									<button class="dropdown-item" type="button">肌力訓練</button>
									<button class="dropdown-item" type="button">溜冰/滑板</button>
									<button class="dropdown-item" type="button">有氧課程</button>
									<button class="dropdown-item" type="button">海上/海下運動</button>
									<button class="dropdown-item" type="button">登山健行</button>
									<button class="dropdown-item" type="button">重量訓練</button>
									<button class="dropdown-item" type="button">球類運動</button>
									<button class="dropdown-item" type="button">武術</button>
									<button class="dropdown-item" type="button">其他運動</button>
								</div>
							</div>
							<br>
							<table class="table">
								<thead class="thead-dark">
									<tr>
										<th scope="col">編號</th>
										<th scope="col">姓名</th>
										<th scope="col">性別</th>
										<th scope="col">專長</th>
										<th scope="col">照片</th>
										<th scope="col">詳細資訊</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="coaVO" items="${coaVOs}">
										<tr>
											<td>${coaVO.coano}</td>
											<td>${coaVO.coaname}</td>
											<td>${coaVO.coasex}</td>
											<td>null</td>
											<td>
												<img src="<%=request.getContextPath()%>/coach/picServletJDBC.do?coano=${coaVO.coano}" alt="教練照片">
											</td>
											<td>
												<form METHOD="post" action="<%=request.getContextPath()%>/coach/coach.do" style="margin-bottom: 0px;">
													<input type="submit" class="btn btn-outline-primary" value="詳情">
													<input type="hidden" name="action" value="getOne_For_Update">
													<input type="hidden" name="coano" value="${coaVO.coano}">
												</form>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
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
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						by EA101G5
						<i class="fa fa-heart-o" aria-hidden="true"></i>
						by FitMate
						</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>

		</div>
	</footer>
	<!-- ##### Footer Area End ##### -->

</body>

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
<script src="<%=request.getContextPath()%>/js/ListOneCoach.js"></script>

<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>
</html>