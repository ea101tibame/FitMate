<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="com.complaint.model.*"%>
<%@ page import="com.student.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.lesson_order.model.*"%>
<%@ page import="com.lesson.model.*"%>


<%
	Lesson_orderService lordSvc = new Lesson_orderService();
	List<Lesson_orderVO> list = lordSvc.getfindByStuno("S010");

	//Lesson_orderVO lesson_orderVO = (Lesson_orderVO) request.getAttribute("lesson_orderVO");

	//Lesson_orderVO lesson_orderVO = lordSvc.findByPrimaryKey("20200619-LO002");

	LessonService lessonSvc = new LessonService();
	//LessonVO lessonVO = (LessonVO) request.getAttribute("lessonVO");
	//LessonVO lessonVO = lessonSvc.getOneByPK(lesson_orderVO.getLessno());
	List<LessonVO> lessonlist = lessonSvc.getAllLesson();

	pageContext.setAttribute("list", list);
	pageContext.setAttribute("lessonlist", lessonlist);
%>

<html>

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
<link rel="icon" href="img/core-img/favicon.ico">


<!-- Core Style CSS -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/css/core-style.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/custom-css/regular-page.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap"
	rel="stylesheet">
<!-- 星星icon用 -->
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">

<script
	src="${pageContext.request.contextPath}/js/jquery/jquery-2.2.4.min.js"></script>



<style type="text/css">
.nice-select {
	display: none;
}

select {
	display: inline !important;
}

.fa-goyellow {
	color: yellow;
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
					src="${pageContext.request.contextPath}/img/core-img/logo.png"
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
						src="${pageContext.request.contextPath}/img/core-img/user.svg"
						alt=""></a>
				</div>
				<div class="user-login-info">
					<a href="#"><img
						src="${pageContext.request.contextPath}/img/core-img/email.svg"
						alt=""></a>
				</div>


			</div>

		</div>
	</header>
	<!-- ##### Header Area End ##### -->


	<!-- ##### Blog Wrapper Area Start ##### -->
	<div class="single-blog-wrapper">

		<!-- Single Blog Post Thumb -->
		<div class="single-blog-post-thumb"></div>

		<div class="container col-12">
			<div class="row justify-content-center">
				<div class="col-12 col-md-8">
					<div class="regular-page-content-wrapper section-padding-80">
						<div class="regular-page-text">
							<h1>我的課程訂單</h1>

							<%-- 錯誤表列 --%>
							<c:if test="${not empty errorMsgs}">
								<font style="color: red">請修正以下錯誤:</font>
								<ul>
									<c:forEach var="message" items="${errorMsgs}">
										<li style="color: red">${message}</li>
									</c:forEach>
								</ul>
							</c:if>


							<%
								for (LessonVO lessvo : lessonlist)
									System.out.println(lessvo.getLessname());

								for (Lesson_orderVO test : list)
									System.out.println(test.getLord_no());
							%>



							<table class="table col-12">
								<thead>
									<tr>
										<th scope="col">課程訂單編號</th>
										<th scope="col">課程編號</th>
										<th scope="col">課程名稱</th>
										<th scope="col">課程類型</th>
										<th scope="col">課程狀態</th>
										<th scope="col">開課時間</th>
										<th scope="col">課程點數</th>
										<th scope="col">訂單時間</th>
										<th>評比</th>
									</tr>
								</thead>


								<%@ include file="/pages/page1.file"%>

								<c:forEach var="lesson_orderVO" items="${list}"
									begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">



									<c:forEach var="lessonVO" items="${lessonlist}">
										<c:if test="${lesson_orderVO.lessno==lessonVO.lessno}">

											<tr>

												<td id="lord_no" scope="col">${lesson_orderVO.lord_no}</td>
												<td scope="col">${lessonVO.lessno}</td>
												<td scope="col">${lessonVO.lessname}</td>
												<td scope="col">${lessonVO.lesstype}</td>
												<td scope="col">${lessonVO.lesssta}</td>
												<td scope="col">${lessonVO.lessstart}</td>
												<td scope="col">${lessonVO.lessprice}</td>
												<td scope="col"><fmt:formatDate
														value="${lesson_orderVO.lord_time}"
														pattern="yyyy-MM-dd HH:mm:ss" /></td>
												<td class="star" width="150px">
													<!-- 下方 JS 會判斷輸入的星數 -->
													<div class="star">
														<input class="star-f" type="hidden"
															value=${lesson_orderVO.lord_sc} > <a href="#"
															class="star-count-1"> <i class="fa fa-lg fa-star-o"
															aria-hidden="true"></i>
														</a> <a href="#" class="star-count-2"> <i
															class="fa fa-lg fa-star-o " aria-hidden="true"></i>
														</a> <a href="#" class="star-count-3"> <i
															class="fa fa-lg fa-star-o  fa-ttt" aria-hidden="true"></i>
														</a> <a href="#" class="star-count-4"> <i
															class="fa fa-lg fa-star-o " aria-hidden="true"></i>
														</a> <a href="#" class="star-count-5"> <i
															class="fa  fa-lg fa-star-o" aria-hidden="true"></i>
														</a>

													</div>
												</td>



											</tr>



										</c:if>
									</c:forEach>
								</c:forEach>
							</table>


							<%@ include file="/pages/page2.file"%>

							<script type="text/javascript">

//網頁載入時判斷是否評分過如果有評分過顯示STAR的CSS
$(document).ready(function() {
		
$(".star").find('input').each(function(){
	//console.log($(this));	 
	
	if($(this).val()!=='0'){
		var count = parseInt($(this).val());
		//console.log(count);
		
		for(var i = 0; i<count ; i++){
			$(this).parent().find("i").eq(i).removeClass("fa-star-o");
			$(this).parent().find("i").eq(i).addClass("fa-star fa-goyellow");
		}

	}
});
});	
	//判斷是否評價過
    jQuery("i").click(function(){   	
    	if($(this).parent().parent().children().eq(0).val()!=="0"){
    		
    		//console.log($(this).parent().parent().children().eq(0).val());
    		
    	}else{
    	
    		if (confirm("評價只能給一次  [確定] 或 [取消] "))
    	　　　 {　alert("[確定] 謝謝你給的評價" );  　
    	    		//console.log("0.0");
 
        	event.preventDefault();
        		
        	$(this).parent().prevAll().find("i").removeClass("fa-star-o");
        	$(this).parent().prevAll().find("i").addClass("fa-star fa-goyellow");
        	var pa =$(this).parent().prevAll()
        	$(this).removeClass("fa-star-o");
        	$(this).addClass("fa-star fa-goyellow");
        
       		var lord_sc = (pa.size());       	
       		console.log(pa.size());
        	var na = $(this).parent().nextAll().find("i").removeClass("fa-star fa-goyellow");    		
        				
        	$(this).parent().nextAll().find("i").addClass("fa-star-o");
        	
        	
        	$(this).parent().parent().children().eq(0).val(lord_sc);   	
     		
        	var lessno=$(this).parent().parent().parent().parent().children().eq(0).text();
    	
   	
        	$.post("lesson_order_sc.do",
        			
        			{
        				lord_no:lessno, lord_sc:lord_sc
        			},function(data, status){
        				if(status == "success")
        					console.log(data);
        			}
        		        			
        			)
        		
    	 	}			
      	    else{　
        		alert("[取消]")} 			
        	}	
    	
    });
    		


</script>
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
						<script>document.write(new Date().getFullYear());</script>
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


</body>




</html>