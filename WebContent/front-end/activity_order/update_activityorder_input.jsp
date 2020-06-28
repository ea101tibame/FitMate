<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.activity_order.model.*"%>

<%
	Activity_orderVO activity_orderVO = (Activity_orderVO) request.getAttribute("activity_orderVO");
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
<title>���ʭq��ק� - update_activityorder_input.jsp</title>
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

table {
	font-family: �L�n������;
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
							<li><a href="index.html">����</a></li>
							<li><a href="blog.html">����</a></li>
							<li><a href="#">�ӫ�</a>
								<div class="megamenu">
									<ul class="single-mega cn-col-4">
										<li class="title">�A��</li>
										<li><a href="shop.html">�k�h�A��</a></li>
										<li><a href="shop.html">�k�h�A��</a></li>
										<li><a href="shop.html">T-shirts</a></li>
										<li><a href="shop.html">Jackets</a></li>
										<li><a href="shop.html">Trench</a></li>
									</ul>

									<ul class="single-mega cn-col-4">
										<li class="title">��������</li>
										<li><a href="shop.html">�������~</a></li>
										<li><a href="shop.html">�����t��</a></li>
										<li><a href="shop.html">T-shirts</a></li>
										<li><a href="shop.html">Jackets</a></li>
										<li><a href="shop.html">Trench</a></li>
									</ul>

									<ul class="single-mega cn-col-4">
										<li class="title">�P�P�M��</li>
										<li><a href="shop.html">���˸`</a></li>
										<li><a href="shop.html">���˸`</a></li>
										<li><a href="shop.html">T-shirts</a></li>
										<li><a href="shop.html">Jackets</a></li>
										<li><a href="shop.html">Trench</a></li>
									</ul>

								</div></li>
							<li><a href="#">�ҵ{</a>
								<ul class="dropdown">
									<li><a href="index.html">�ҵ{�`��</a></li>
									<li><a href="shop.html">����</a></li>
									<li><a href="single-uct-details.html">�٤O�V�m</a></li>
									<li><a href="checkout.html">�ȦB/�ƪO</a></li>
									<li><a href="blog.html">����ҵ{</a></li>
									<li><a href="single-blog.html">���W/���U�B��</a></li>
									<li><a href="regular-page.html">�n�s����</a></li>
									<li><a href="contact.html">���q�V�m</a></li>
									<li><a href="contact.html">�y���B��</a></li>
									<li><a href="contact.html">�Z�N</a></li>
									<li><a href="contact.html">��L</a></li>
								</ul></li>
							<li><a href="contact.html">����</a></li>
							<li><a href="#">�ǭ�</a>
								<ul class="dropdown">
									<li><a href="index.html">�ӤH���</a></li>
									<li><a href=".html">�d�ݽҪ�</a></li>
									<li><a href=".html">�ʶR�M��</a></li>
									<li><a href=".html">���]�޲z</a></li>
									<li><a href=".html">�ӤH�H�c</a></li>

								</ul></li>
							<li><a href="blog.html">�Q�װ�</a></li>

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
	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<div class="container col-12">
		<div class="row justify-content-center">
			<div class="col-12 col-md-12">
				<div class="regular-page-content-wrapper section-padding-60">
					<FORM METHOD="post" ACTION="activityorder.do" name="form1">
						<!-- ���}�l -->
						<div class="regular-page-text">
							<h2 class="text-black">���нm����</h2>
							<table class="table table-dark table-hover">
								<tr>
									<td class="text-left justify-content-left">���ʭq��s��:<font color=red><b>*</b></font></td>
									<td class="align-middle">${activity_orderVO.aord_no}</td>
								</tr>
								<tr>
									<td class="text-left justify-content-left">���ʽs��:</td>
									<td class="align-middle">${activity_orderVO.actno}</td>
								</tr>
								<tr>
									<td class="text-left justify-content-left">�ǭ��s��:</td>
									<td class="align-middle">${activity_orderVO.stuno}</td>
								</tr>
								<tr>
									<td class="text-left justify-content-left">�нm������:</td>
									<td class="align-middle"><input type="text" name="aord_sc" size="45"
										value="${activity_orderVO.aord_sc}" placeholder="�п�J�нm������" /></td>
								</tr>

							</table>
						</div>
						<input type="hidden" name="aord_no"
							value="${activity_orderVO.aord_no}"> <input type="hidden"
							name="action" value="update"> <input type="submit"
							value="�e�X�ק�">
					</FORM>
					<!-- ��浲�� -->
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
	<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
	<!-- Popper js -->
	<script
		src="${pageContext.request.contextPath}/js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Bootstrap js -->
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<!-- Plugins js -->
	<script src="${pageContext.request.contextPath}/js/plugins.js"></script>
	<!-- Classy Nav js -->
	<script src="${pageContext.request.contextPath}/js/classy-nav.min.js"></script>
	<!-- Active js -->
	<script src="${pageContext.request.contextPath}/js/active.js"></script>


</body>

</html>