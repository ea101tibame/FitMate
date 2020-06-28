<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.activity.model.*"%>
<%@ page import="com.expertise.model.*"%>

<%
	ActivityVO activityVO = (ActivityVO) request.getAttribute("activityVO");
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
<title>FitMate活動詳情 - listAllActivity.jsp</title>
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
	<div class="single-blog-wrapper"></div>

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
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-md-12">
				<div class="regular-page-content-wrapper section-padding-60">
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/activity.do" name="form1"
						enctype="multipart/form-data">
						<!-- 表單開始 -->
						<h3 class="text-black">建立活動</h3>
						<div class="regular-page-text">
							<div class="row">
								<div class="col-3">
									<label for="stuno">學員編號</label>
								</div>
								<div class="col-5">
									<input type="TEXT" name="stuno" id="stuno" size="36.5"
										placeholder="請輸入您的學員編號"
										value="<%=(activityVO == null) ? "" : activityVO.getStuno()%>"/>
								</div>
							</div>

							<div class="row">
								<div class="col-3">
									<label for="coano">教練編號</label>
								</div>
								<div class="col-5">
									<input type="TEXT" name="coano" id="coano" size="36.5"
										placeholder="請輸入您預約的教練編號"
										value="<%=(activityVO == null) ? "" : activityVO.getCoano()%>"/>
								</div>
							</div>

							<div class="row">
								<div class="col-3">
									<label for="actname">活動名稱</label>
								</div>
								<div class="col-5">
									<input type="TEXT" id="actname" name="actname" size="36.5"
										placeholder="請輸入活動名稱"
										value="<%=(activityVO == null) ? "" : activityVO.getActname()%>">
								</div>
							</div>

							<div class="row">
								<div class="col-3">
									<label for="acttype">活動類型</label>
								</div>
								<div class="col-5">
									<jsp:useBean id="expSvc" scope="page"
										class="com.expertise.model.ExpService" />
									<select name="acttype" class="custom-select d-block ">
										<option value="">請選擇</option>
										<c:forEach var="ExpVO" items="${expSvc.all}">
											<option value="${ExpVO.expno}"
												${(ExpVO.expno==ExpVO.expno)? 'selected':''}>${ExpVO.expdesc}</option>
										</c:forEach>
									</select>
								</div>
							</div>

							<div class="row">
								<div class="col-3">
									<label for="actloc">活動地點</label>
								</div>
								<div class="col-5">
									<input type="TEXT" name="actloc" size="36.5"
										placeholder="請輸入活動地點"
										value="<%=(activityVO == null) ? "" : activityVO.getActloc()%>" />
								</div>
							</div>


							<div class="row">
								<div class="col-3">
									<label for="actstart">活動開始報名日期</label>
								</div>
								<div class="col-5">
									<input type="TEXT" name="actstart" id="start_date" size="36.5"
										placeholder="請輸入開始報名日期"
										value="<%=(activityVO == null) ? "" : activityVO.getActstart()%>">
								</div>
							</div>

							<div class="row">
								<div class="col-3">
									<label for="actend">活動截止報名日期</label>
								</div>
								<div class="col-5">
									<input type="TEXT" name="actend" id="end_date" size="36.5"
										placeholder="請輸入截止報名日期"
										value="<%=(activityVO == null) ? "" : activityVO.getActend()%>">
								</div>
							</div>
							
							<div class="row">
								<div class="col-3">
									<label for="actdate">活動日期</label>
								</div>
								<div class="col-5">
									<input type="TEXT" name="actdate" id="actdate" size="36.5"
										placeholder="請輸入活動日期"
										value="<%=(activityVO == null) ? "" : activityVO.getActdate()%>">
								</div>
							</div>

							<div class="row">
								<div class="col-3">
									<label for="actss">活動時段</label>
								</div>
								<div class="col-5">
									<select name="actss" id="actss">
										<option value="">請選擇</option>
										<option value="早上">早上</option>
										<option value="下午">下午</option>
										<option value="晚上">晚上</option>
									</select>
								</div>
							</div>

							<div class="row">
								<div class="col-3">
									<label for="actmin">活動最小成團人數</label>
								</div>
								<div class="col-5">
									<input type="TEXT" name="actmin" id="actmin" size="36.5"
										placeholder="請輸入活動最小成團人數"
										value="<%=(activityVO == null) ? "" : activityVO.getActmin()%>">
								</div>
							</div>

							<div class="row">
								<div class="col-3">
									<label for="actmax">活動最大上限人數</label>
								</div>
								<div class="col-5">
									<input type="TEXT" name="actmax" id="actmax" size="36.5"
										placeholder="請輸入活動最大上限人數"
										value="<%=(activityVO == null) ? "" : activityVO.getActmax()%>">
								</div>
							</div>

							<div class="row">
								<div class="col-3">
									<label for="actprice">活動點數</label>
								</div>
								<div class="col-5">
									<input type="TEXT" name="actprice" id="actprice" size="36.5"
										placeholder="請輸入活動點數"
										value="<%=(activityVO == null) ? "" : activityVO.getActprice()%>">
								</div>
							</div>

							<div class="row">
								<div class="col-3">
									<label for="actdesc">活動描述</label>
								</div>
								<div class="col-5">
									<textarea name="actdesc" id="actdesc" cols="40" rows="4">
									</textarea>
								</div>
							</div>

							<div class="row">
								<div class="col-3">
									<label for="actdesc">活動圖片</label>
								</div>
								<div class="col-5">
									<input type="FILE" name="actpic" id="pic"
										value="<%=(activityVO == null) ? "" : activityVO.getActpic()%>">
								</div>
							</div>

							<div class="row">
								<div class="col-3">
									<label>圖片預覽 </label>
								</div>
								<div class="col-6">
									<img id="previewPic"
										src="<%=request.getContextPath()%>/image/NOPIC.PNG"
										style="width: 300px; height: 300px;"><br>
								</div>

							</div>
							<div class="row">
								<div class="col-7"></div>
<!-- 								<div class="col-1"> -->
<!-- 									<button type="button" id="deletebtn" class="btn outline-btn-primary btn-sm">刪除</button> -->
<!-- 								</div> -->
							</div>
						</div>
						<hr class="mb-4">
						<div class="row">
							<div class="col-1"></div>
							<div class="col-10">
								<input type="hidden" name="action" value="insert">
								<button class="btn btn-primary btn-lg btn-block" type="submit">送出新增</button>
							</div>
						</div>
					</FORM>
					<!-- 表單結束 -->

				</div>
			</div>
		</div>
	</div>
	<!-- ##### Blog Wrapper Area End ##### -->

	<!-- ##### Footer Area Start ##### -->
	<footer class="footer_area">
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
						FitMate
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>

		</div>
	</footer>
	<!-- ##### Footer Area End ##### -->
	<!-- jQuery (Necessary for All JavaScript Plugins) -->
	<script
		src="${pageContext.request.contextPath}/css/js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script src="${pageContext.request.contextPath}/css/js/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script
		src="${pageContext.request.contextPath}/css/js/bootstrap.min.js"></script>
	<!-- Plugins js -->
	<script src="${pageContext.request.contextPath}/css/js/plugins.js"></script>
	<!-- Classy Nav js -->
	<script
		src="${pageContext.request.contextPath}/css/js/classy-nav.min.js"></script>
	<!-- Active js -->
	<script src="${pageContext.request.contextPath}/css/js/addLesson.js"></script>
	<script src="${pageContext.request.contextPath}/css/js/active.js"></script>
	<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>

</body>


<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
	$("#pic").change(function() {
		readURL(this);
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#previewPic").attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>


<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
<script>
	$.datetimepicker.setLocale('zh');
	$(function() {
		$('#actdate').datetimepicker(
				{
					format : 'Y-m-d',
					onShow : function() {
						this.setOptions({
							minDate : $('#end_date').val() ? $('#end_date')
									.val() : true
						})
					},
					timepicker : false
				});
		
		$('#start_date').datetimepicker(
				{
					format : 'Y-m-d',
					onShow : function() {
						this.setOptions({
							minDate : $('#end_date').val() ? $('#end_date')
									.val() : true
						})
					},
					timepicker : false
				});

		$('#end_date').datetimepicker(
				{
					format : 'Y-m-d',
					onShow : function() {
						this.setOptions({
							minDate : $('#start_date').val() ? $('#start_date')
									.val() : true
						})
					},
					timepicker : false
				});
	});
</script>

</html>