<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%
	pageContext.setAttribute("context", request.getContextPath());
	pageContext.setAttribute("role", session.getAttribute("role"));
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
</head>
<body>
	<header class="header_area">
		<div class="classy-nav-container breakpoint-off d-flex align-items-center justify-content-between">
			<nav class="classy-navbar" id="essenceNav">
				<a class="nav-brand" href="${context}/front-end/index.jsp">
					<img src="${context}/images/core-img/logo.png" alt="">
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
										<a href="lessonAlL-page.html">課程總覽</a>
									</li>
									<li>
										<a href="">瑜珈</a>
									</li>
									<li>
										<a href="">肌力訓練</a>
									</li>
									<li>
										<a href="">溜冰/滑板</a>
									</li>
									<li>
										<a href="">有氧課程</a>
									</li>
									<li>
										<a href="">海上/海下運動</a>
									</li>
									<li>
										<a href="">登山健行</a>
									</li>
									<li>
										<a href="">重量訓練</a>
									</li>
									<li>
										<a href="">球類運動</a>
									</li>
									<li>
										<a href="">武術</a>
									</li>
									<li>
										<a href="">其他</a>
									</li>
								</ul>
							</li>
							<li>
								<a href="${context}/front-end/activity.jsp">揪團</a>
							</li>
							<li>
								<a href="${context}/front-end/blog.jsp">討論區</a>
							</li>
							<c:if test="${role == 'coach'}">
								<li>
									<a href="#">教練專區</a>
									<ul class="dropdown">
									    <li><a href="student.html">個人資料</a></li>
										<li><a href="student.html">查看課表</a></li>
										<li><a href="student.html">建立課程</a></li>
										<li><a href="student.html">更新課程</a></li>
										<li><a href="student.html">點數兌換</a></li>
									</ul>
								</li>
							</c:if>
						    <c:if test="${role == 'student'}">
								<li>
									<a href="#">學員專區</a>
									<ul class="dropdown">
										 <li><a href="student.html">個人資料</a></li>
                                    	 <li><a href="student.html">查看課表</a></li>
                                     	 <li><a href="student.html">購買清單</a></li>
                                         <li><a href="student.html">錢包管理</a></li>
									</ul>
								</li>
							</c:if>
						</ul>
					</div>
				</div>
			</nav>
			<div class="header-meta d-flex clearfix justify-content-end">
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
				<div class="user-login-info">
					<a href="#">
						<img src="${context}/images/core-img/email.svg" alt="">
					</a>
				</div>
			</div>
		</div>
	</header>
	<div class="box">
		<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content login-modal-content">
					<div class="cont">
						<div class="form sign-in">
							<form action="${context}/front/loginForStudent.do" method="post">
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
								<button type="button" class="fb-btn" href="${context}/front-end/addStudent.jsp">註冊學員</button>
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
									<button type="button" class="fb-btn" href="${context}/front-end/addCoach.jsp">註冊教練</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
				var context = "${context}";
		</script>
		<script src="${context}/js/jquery/jquery-2.2.4.min.js"></script>
		<script src="${context}/js/popper.min.js"></script>
		<script src="${context}/js/bootstrap.min.js"></script>
		<script src="${context}/js/plugins.js"></script>
		<script src="${context}/js/classy-nav.min.js"></script>
		<script src="${context}/js/active.js"></script>
		<script src="${context}/js/index.js"></script>
	
</body>

</html>