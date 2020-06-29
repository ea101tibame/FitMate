<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.activity.model.*"%>
<%@ page import="com.expertise.model.*"%>
<%  
	
	ActivityService activitySvc = new ActivityService();
	List<ActivityVO> list = activitySvc.getAllActivity();
	pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->


<!-- Title  -->
<title>查詢活動詳請 - listAllActivityForGuest.jsp</title>
<!-- Favicon  -->
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Core Style CSS -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/css/core-style.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/custom-css/regular-page.css">

<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap"
	rel="stylesheet">

<style>
.card-img-top {
	height: 300px;
	width: 100%;
}

.gosubmit {
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
	height: 300px;
	width: 100%;
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
									<li><a href="single-uct-details.html">肌力訓練</a></li>
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

	<!-- ##### Blog Wrapper Area Start ##### -->
	<div class="single-blog-wrapper">

		<!-- Single Blog Post Thumb -->
		<div class="single-blog-post-thumb">
			<img
				src="${pageContext.request.contextPath}/images/bg-img/actDetail1920.png"
				alt="">
		</div>
		<%-- 錯誤訊息表列 --%>
		<c:if test="${not empty errorMsgs}">
			<font style="color: red">請修正以下錯誤:</font>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>

		<div class="container col-12">
			<div class="row justify-content-center">
				<div class="col-12 col-md-12">
					<div class="regular-page-content-wrapper section-padding-80">
						<div class="regular-page-text">
							<h3>
								${activityVO.actname} <span
									class="badge badge-pill badge-danger">${activityVO.actsta}</span>
							</h3>


							<table border="1"
								class="table table-dark align-items-center align-middle">
								<tr>
									<td rowspan="10" style="width: 480px;"><img
										src="<%=request.getContextPath()%>/activity/activitypic.do?actno=${activityVO.actno}"
										alt="活動圖片" class="rounded float-right img-thumbnail"></td>
									<td style="width: 130px">活動名稱</td>
									<td style="width: 130px">${activityVO.actname}</td>
								</tr>

								<tr>
									<td>活動類型</td>
									<jsp:useBean id="actSvc" scope="page"
										class="com.activity.model.ActivityService" />
									<jsp:useBean id="expSvc" scope="page"
										class="com.expertise.model.ExpService" />

									<td><c:forEach var="expVO" items="${expSvc.all}">
											<c:if test="${activityVO.acttype==expVO.expno}">${expVO.expdesc}</c:if>
										</c:forEach></td>
								</tr>
								<tr>
									<td>活動狀態</td>
									<td>${activityVO.actsta}</td>
								</tr>
								<tr>
									<td>活動地點</td>
									<td>${activityVO.actloc}</td>
								</tr>
								<tr>
									<td>最小成團人數</td>
									<td>${activityVO.actmin}</td>

								</tr>
								<tr>
									<td>最大上限人數</td>
									<td>${activityVO.actmax}</td>
								</tr>
								<tr>
									<td>目前報名人數</td>
									<td>${activityVO.actcur}</td>
								</tr>

								<tr>
									<td>活動報名日期</td>
									<td><fmt:formatDate value="${activityVO.actstart}"
											pattern="yyyy-MM-dd" />~ <fmt:formatDate
											value="${activityVO.actend}" pattern="yyyy-MM-dd" /></td>
								</tr>
								<tr>
									<td>活動點數</td>
									<td>${activityVO.actprice}</td>
								</tr>
								<tr>
									<td colspan="2">
										<div class="row align-items-center">

											<button type="button" class="btn btn-primary">查看教練介紹</button>
											&nbsp;
											<div>
												<FORM METHOD="post"
													ACTION="<%=request.getContextPath()%>/activity_fav/activityfav.do"
													style="margin-bottom: 0px;">
													<input type="hidden" value="${activityVO.actno}"
														name="actno"> <input type="hidden" value="${activityVO.stuno}"
														name="stuno"> <input type="hidden" name="action"
														value="insert">
													<!-- 							<button type="button" class="btn btn-warning">追蹤活動</button>&nbsp; -->
													<input type="submit" value="追蹤活動"
														class="btn btn-warning">&nbsp;
												</FORM>
											</div>
											&nbsp;
											<div>
												<FORM METHOD="post"
													ACTION="<%=request.getContextPath()%>/activity_order/activityorder.do"
													style="margin-bottom: 0px;">
													<input type="hidden" value="${activityVO.actno}" name="actno"> 
													<input type="hidden" value="S003" name="stuno"> 
													<input type="hidden" name="action" value="insert">
													<!--  							<button type="button" class="btn btn-danger">報名活動</button>&nbsp; -->
													<input type="submit" value="立即報名" class="btn btn-danger">
												</FORM>
											</div>
										</div>
									</td>
								</tr>
							</table>



						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



</body>
</html>