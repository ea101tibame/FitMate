<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.coach.model.*"%>
<%
  CoaVO coaVO = (CoaVO) request.getAttribute("coaVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="UTF-8">
<title>教練資料新增 - addCoach.jsp</title>

<link rel="icon"
	href="<%=request.getContextPath()%>/css/index-core-image/favicon.ico">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/core-style.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/custom-css/coach_form.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap"
	rel="stylesheet">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
</head>
<body>
	<header class="header_area">
		<div
			class="classy-nav-container breakpoint-off d-flex align-items-center justify-content-between">
			<!-- Classy Menu -->
			<nav class="classy-navbar" id="essenceNav">
				<!-- Logo -->
				<a class="nav-brand" href="select_page.jsp"><img
					src="<%=request.getContextPath()%>/img/index-core-image/logo.png"
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

							</li>


							<li><a href="#">教練</a>
								<ul class="dropdown">
									<li><a href="index.html">個人資料</a></li>
									<li><a href=".html">查看課表</a></li>
									<li><a href=".html">建立課程</a></li>
									<li><a href=".html">修改課程</a></li>
									<li><a href=".html">點數兌換</a></li>

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
						src="<%=request.getContextPath()%>/img/index-core-image/user.svg"
						alt=""></a>
				</div>
				<div class="user-login-info">
					<a href="#"><img
						src="<%=request.getContextPath()%>/img/index-core-image/email.svg"
						alt=""></a>
				</div>


			</div>

		</div>
	</header>

	<div class="single-blog-wrapper">

		<!-- Single Blog Post Thumb -->
		<div class="single-blog-post-thumb">
			<img
				src="<%=request.getContextPath()%>/img/index-bg-image/COA1920.png"
				alt="">
		</div>
		<div class="container">
			<div class="regular-page-content-wrapper section-padding-80">


				<div class="container">
					<div class="regular-page-content-wrapper section-padding-80">

						<h2>註冊成為教練</h2>
						<%-- 錯誤表列 --%>
						<c:if test="${not empty errorMsgs}">
							<font style="color: red">請修正以下錯誤:</font>
							<ul>
								<c:forEach var="message" items="${errorMsgs}">
									<li style="color: red">${message.key}</li>
									<li style="color: red">${message.value}</li>
								</c:forEach>
							</ul>
						</c:if>
						<div class="container">
							<div class="row flex-lg-nowrap">
								<div class="col">
									<div class="row">
										<div class="col mb-3">
											<div class="card">
												<div class="card-body">
													<div class="e-profile">
														<div class="row">
															<div class="col-12 col-sm-auto mb-3">
																<div class="mx-auto" style="width: 140px;">
																	<div
																		class="d-flex justify-content-center align-items-center rounded"
																		style="height: 140px; background-color: rgb(233, 236, 239);">
																		<span
																			style="color: rgb(166, 168, 170); font: bold 8pt Arial;">140x140</span>
																	</div>
																</div>
															</div>
															<div
																class="col d-flex flex-column flex-sm-row justify-content-between mb-3">
																<div class="text-center text-sm-left mb-2 mb-sm-0">
																	<h4 class="pt-sm-2 pb-1 mb-0 text-nowrap"></h4>
																	<div class="text-muted"></div>
																	<div class="mt-2">
																		<i class="fa fa-fw fa-camera"></i> <input type="file">
																	</div>
																</div>
															</div>
														</div>
													</div>
													<ul class="nav nav-tabs">
														<li class="nav-item"><a href=""
															class="active nav-link">設定</a></li>
													</ul>
													<div class="tab-content pt-3">
														<div class="tab-pane active">
														<!-- 本文開始 -->
															<form method="post" action="" name="form1" class="form" novalidate="" enctype="multipart/form-data">
																<input type="hidden" name="action" value="insert">
																<div class="row">
																	<div class="col">
																		<div class="row">
																			<div class="col">
																				<div class="form-group">
																					<label>編號</label>
																					<fieldset disabled>
																						<input class="form-control" type="text"
																							name="coano" value="${param.coano}" />
																				</div>
																			</div>
																			<div class="col">
																				<div class="form-group">
																					<label>性別</label><br>
																					<div class="form-check form-check-inline">
																						<input class="form-check-input" type="radio"
																							name="coasex"
																							value="1" checked="true" /> <label
																							class="form-check-label" for="inlineRadio1">男</label>
																					</div>
																					<div class="form-check form-check-inline">
																						<input class="form-check-input" type="radio"
																							name="coasex" 
																							value="0" /> <label
																							class="form-check-label" for="inlineRadio2">女</label>
																					</div>
																				</div>
																			</div>
																		</div>
																		<div class="row">
																			<div class="col">
																				<div class="row">
																					<div class="col">
																						<div class="form-group">
																							<label>姓名</label> <input class="form-control"
																								type="text" name="coaname"
																								value="${param.coaname}" />
																							<p>${errorMsgs.coaname}</p>
																						</div>
																					</div>
																					<div class="col">
																						<div class="form-group">
																							<label>電話</label> <input class="form-control"
																								type="text" name="coatel"
																								value="${param.coatel}" />
																							<p>${errorMsgs.coatel}</p>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																		<div class="row">
																			<div class="col">
																				<div class="form-group">
																					<label>密碼</label> <input class="form-control"
																						type="password" name="coapsw" value="${param.coapsw}" />
																					<p>${errorMsgs.coapsw}</p>
																				</div>
																			</div>
																			<div class="col">
																				<div class="form-group">
																					<label>帳戶</label> <input class="form-control"
																						type="account" name="coaacc" value="${param.coaacc}" />
																					<p>${errorMsgs.coaacc}</p>
																				</div>
																			</div>
																		</div>
																		<div class="row">
																			<div class="col">
																				<div class="form-group">
																					<label>信箱</label> <input class="form-control"
																						type="text" name="coamail" value="${param.coamail}" />
																					<p>${errorMsgs.coamail}</p>
																				</div>
																			</div>
																		</div>
																		<div class="row">
																			<div class="col">
																				<div class="row">
																					<div class="col">
																						<div class="form-group">
																							<label for="inputExpertise">專長</label> <select
																								id="inputExpertise" class="form-control">
																								<option selected>瑜珈</option>
																								<option>肌力訓練</option>
																								<option>溜冰/滑板</option>
																								<option>有氧課程</option>
																								<option>海上/海下運動</option>
																								<option>登山健行</option>
																								<option>重量訓練</option>
																								<option>球類運動</option>
																								<option>武術</option>
																								<option>其他運動</option></select>
																						</div>
																					</div>
																				</div>
																			</div>

																			<div class="col-12 col-sm-auto mb-3">
																				<label>上傳證照: </label><br> <input type="file"
																					id="myFile" name="coapic" multiple> <label>圖片預覽:
																				</label>
																				<div id="preview"></div>
																				<br>
																				<button type="button" id="deletebtn">刪除</button>
																			</div>
																		</div>
																	</div>
																</div>
														</div>
														<input type="hidden" name="action" value="insert">
														<input class="btn btn-primary" type="submit"
															value="Submit">
														</form>

													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
</body>



<!-- jQuery (Necessary for All JavaScript Plugins) -->
<script src="<%=request.getContextPath()%>/js/jquery-2.2.4.min.js"></script>
<!-- Popper js -->
<script src="<%=request.getContextPath()%>/js/popper.min.js"></script>
<!-- Bootstrap js -->
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<!-- Plugins js -->
<script src="<%=request.getContextPath()%>/js/plugins.js"></script>
<!-- Classy Nav js -->
<script src="<%=request.getContextPath()%>/js/classy-nav.min.js"></script>
<!-- Active js -->
<script src="<%=request.getContextPath()%>/js/coach-form.js"></script>

<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>

<script>
        
</script>
</html>