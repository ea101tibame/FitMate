<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.lesson.model.*"%>
<%@ page import="test.expertise.model.*"%>
<%@ page import="text.coach.model.*"%>
<%@ page import="com.lessonTime.model.*"%>

<%
String lessno = (String)request.getAttribute("lessno_seq");
LessonService lSvc = new LessonService();
LessonVO lessonVO = lSvc.getOneByPK(lessno);

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
	href="${pageContext.request.contextPath}/images/core-img/FIT.ico">

<!-- Core Style CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/css/core-style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/custom-css/regular-page.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/custom-css/lesson/addLesson.css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<style>
	.title{
	font-size:20px;
	}

	.btn-info {
    margin-left: 20px;
    margin-top: 20px;
    }
    
    #show{
    margin-top: 25px;
    margin-left: 30px;
    font-size:18px;
    }
</style>

</head>

<body>
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
							<li><a href="#">教練</a>
								<ul class="dropdown">
									<li><a href="index.html">個人資料</a></li>
									<li><a href="coachTimeTable.jsp">查看課表</a></li>
									<li><a href="addLesson.jsp">建立課程</a></li>
									<li><a href="selectLesson.jsp">查看課程</a></li>
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
				src="${pageContext.request.contextPath}/images/bg-img/COA1920.png"
				alt="">
		</div>
		<%-- 錯誤表列 --%>
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
					<div class="regular-page-content-wrapper section-padding-80">
					
						<form method="post"
							action="<%=request.getContextPath()%>/lesson/lessonTime.do">
							<div class="regular-page-text">
								<h2>建立時段</h2>
								<!--表單開始-->

								<div class="row">
									<div class="col-md-12 mb-3">
										<label class="title">課程名稱>>><%=lessonVO.getLessname() %></label>
										<br>
										<label  class="title">課程堂數>>>共<%=lessonVO.getLesstimes() %>堂</label>
										<br>
										<label  class="title">請新增<%=lessonVO.getLesstimes() %>時段</label>
										<br>
									</div>
									 
									<% for(int i=0;i<lessonVO.getLesstimes();i++){ %>
									<!-- 截止之後的時間 才可以選-->
									<div class="col-md-6 mb-3">
										<label >選擇授課日期</label>
										<input type="text" class="form-control"  name="ltime_date" >

									</div>
									<div class="col-md-6 mb-3">
										<label for="country">時段</label>

										<select class="custom-select d-block " name="ltime_ss" >
											<option value="">請選擇</option>
											<option value="早上">早上</option>
											<option value="下午">下午</option>
											<option value="晚上">晚上</option>
										</select>
									</div>
									
									<% }%>
									<button type="button" class="btn btn-info" onclick="get()">檢查時段</button>
									<br>
									<div id="show"></div>
									<script>

									function get(){
										var date='';
										var time='';
										$(".form-control").each(function(){
									    	date=date+ $(this).val()+',';
									    	
										});
										$(".custom-select").each(function(){
											time=time+ $(this).val()+',';
										});
										
										var strdate= new Array(); 
										strdate=date.split(",");
										var strtime= new Array();
										strtime = time.split(",,");
										var jsonArr=[];
																			
										for(var i=0;i<strdate.length;i++){			
											var datepush = strdate[i];
											var timepush = strtime[i];
											console.log("datepush="+datepush);
											console.log("timepush="+timepush);
											var dateAndTime = datepush+timepush;
											console.log("dateAndTime="+dateAndTime);
											var jsonObj = {
	 												"dateAndTime" :dateAndTime,
	 											};
											jsonArr.push(jsonObj);
											console.log("jsonArr="+jsonArr)
										}
										var jarr = JSON.stringify( jsonArr );
										console.log(jarr);
										
										$.ajax({
											type 		: 'POST', 
											url 		: '<%=request.getContextPath()%>/lesson/checkTime', 
											data 		: {
															jarr:jarr,
															lessno:<%=lessonVO.getLessno() %>
														}, 
											
											dataType 	: 'json',
											contentType: 'application/x-www-form-urlencoded; charset=utf-8',
											encode 		: true,
											
											beforeSend:function(XMLHttpRequest){
												$("#show").text("時段檢查中...");
											},
											success:function(data){
												console.log("data="+data);
 											
												if(data=="Success!"){
													swal("Check "+data, "時段確認 OK", "success");
													$("#show").text(data);
													$("#show").css("color","red");
													$("#send").show();
							                    }else{
							                    	swal("請重新選擇時段", data, "error");
							                    	$("#show").text(data);
													$("#show").css("color","red");
							                    }
												
											},
											error:function(err){
												console.log("error="+JSON.stringify(err));
												
											},
								            });
										
									
										}

									</script>
								</div>
							</div>		
							<hr class="mb-4">
							<input type="hidden" name="lessname" value="<%=lessonVO.getLessname() %>">
							<input type="hidden" name="lesstimes" value="<%=lessonVO.getLesstimes() %>">
							<input type="hidden" name="lessend" value="<%=lessonVO.getLessend() %>">
							<input type="hidden" name="lessno" value="<%=lessno%>">
							<input type="hidden" name="action" value="insert">							
							<button class="btn btn-primary btn-lg btn-block" type="submit" id="send">此堂課程 時段建立</button>
					
			
						</form>
						<!--表單結束-->
					</div>
				</div>
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
		src="${pageContext.request.contextPath}/js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<!-- Plugins js -->
	<script src="${pageContext.request.contextPath}/js/plugins.js"></script>
	<!-- Classy Nav js -->
	<script src="${pageContext.request.contextPath}/js/classy-nav.min.js"></script>
	<!-- Active js -->
	
	<script src="${pageContext.request.contextPath}/js/active.js"></script>
	<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
	<script>
$(document).ready(function(){

	$("#send").hide();

	});


</script>
<script>

$(function() {
	//somedate1為報名截止日 之前的都不可以選
	
	 var somedate1 = new Date("<%=lessonVO.getLessend()%>");
    $( ".form-control" ).datepicker({
    dateFormat:'yy-mm-dd',
      defaultDate: "+1w",
      changeMonth: true,
      timepicker: false,
      numberOfMonths: 3,
      beforeShowDay: function(date) {
    	  if (  date.getYear() <  somedate1.getYear() || 
	           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
	           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
          ) {
               return [false, ""]
          }
          return [true, ""];
      	}});
    
  });

</script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>

</html>