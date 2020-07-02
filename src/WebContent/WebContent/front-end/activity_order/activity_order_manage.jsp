<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.activity_order.model.*"%>
<%@ page import="com.activity.model.*"%>

<%
	//     String stuno = (String)session.getAttribute("stuno");
	Activity_orderService activity_orderSvc = new Activity_orderService();
	List<Activity_orderVO> list = activity_orderSvc.findActivityBystuno("S005");
	pageContext.setAttribute("list", list);

	ActivityService activitySvc = new ActivityService();
	List<ActivityVO> activitylist = activitySvc.getAllActivity();
	pageContext.setAttribute("activitylist", activitylist);
	// 	System.out.println(list.size());
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->


<!-- Title  -->
<title>FitMate�ǭ����ʭq�� - listAllActivityOrderForStudent.jsp</title>
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

<!-- �P�Picon�� -->
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">

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

.nice-select {
	display: none;
}

select {
	display: inline-block !important;
}

.fa-goyellow{
	color:yellow;
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

	<%
		for (ActivityVO activityVO : activitylist)
			System.out.println(activityVO.getActname());
		for (Activity_orderVO activity_orderVO : list)
			System.out.println(activity_orderVO.getAord_no());
	%>

	<div class="container col-12">
		<div class="row justify-content-center">
			<div class="col-12 col-md-12">
				<div class="regular-page-content-wrapper section-padding-80">
					<div class="regular-page-text">
						<h3>FitMate�ǭ����ʭq��</h3>

						<%@ include file="page1.file"%>

						<c:forEach var="activity_orderVO" items="${list}"
							begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">

							<table border="1"
								class="table table-dark table align-items-center">

								<tr class="text-left align-items-left">
									<td>���ʭq��s��</td>
									<td class="align-middle">${activity_orderVO.aord_no}</td>
								</tr>
								<tr>
									<td>���ʽs��</td>
									<td class="align-middle">${activity_orderVO.actno}</td>
								</tr>
								<tr>
									<td>�ǭ��s��</td>
									<td class="align-middle">${activity_orderVO.stuno}</td>
								</tr>
								<tr>
									<td>���ʱнm����</td>
									<td class="star">
										<!-- �U��JS �|�P�_��J���P�� -->
										<div class="star">
											<input class="star-f" type="hidden"
												value=${activity_orderVO.aord_sc}> <a href="#"
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
								<tr>
									<td>���ʭq��ɶ�</td>
									<td class="align-middle"><fmt:formatDate
											value="${activity_orderVO.aord_time}"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
								</tr>
								

								<!-- 								<tr> -->
								<!-- 									<td class="align-middle"> -->
								<!-- 										<FORM METHOD="post" -->
								<%-- 											ACTION="<%=request.getContextPath()%>/activity_order/activityorder.do" --%>
								<!-- 											style="margin-bottom: 0px;"> -->
								<!-- 											<input type="submit" class="btn btn-primary" value="�ק�"> -->
								<!-- 											<input type="hidden" name="aord_no" -->
								<%-- 												value="${activity_orderVO.aord_no}"> <input --%>
								<!-- 												type="hidden" name="action" value="getOne_For_Update"> -->
								<!-- 										</FORM> -->
								<!-- 									</td> -->

								<!-- 								</tr> -->

							</table>
						</c:forEach>
						<%@ include file="page2.file"%>
						
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- ##### Blog Wrapper Area End ##### -->

	<c:if test="${not empty insert}">
		<script>
			swal("���W���\","", "success");
		</script>
	</c:if>

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



<script type="text/javascript">

//�������J�ɧP�_�O�_�����L�p�G�������L���STAR��CSS
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
	//�P�_�O�_�����L
    jQuery("i").click(function(){   	
    	if($(this).parent().parent().children().eq(0).val()!=="0"){
    		
    		//console.log($(this).parent().parent().children().eq(0).val());
    		
    	}else{
    	
    		if (confirm("�����u�൹�@��  [�T�w] �� [����] "))
    	�@�@�@ {�@alert("[�T�w] ���§A��������" );  �@
    	    		//console.log("0.0");
 
        	event.preventDefault();
        		
        	$(this).parent().prevAll().find("i").removeClass("fa-star-o");
        	$(this).parent().prevAll().find("i").addClass("fa-star fa-goyellow");
        	var pa =$(this).parent().prevAll();
        	$(this).removeClass("fa-star-o");
        	$(this).addClass("fa-star fa-goyellow");
        
       		var aord_sc = (pa.size());       	
       		console.log("pa.size()"+aord_sc);
        	var na = $(this).parent().nextAll().find("i").removeClass("fa-star fa-goyellow");    		
        				
        	$(this).parent().nextAll().find("i").addClass("fa-star-o");
        	
        	
        	$(this).parent().parent().children().eq(0).val();   	
     		
        	var starno=$(this).parent().parent().parent().parent().parent().children().eq(0).find(".align-middle").text();
    		

        	$.post("activity_order_sc.do",
        			
        			{
        				aord_no:starno, aord_sc:aord_sc
        			},function(data, status){
        				if(status == "success")
        					console.log(data);
        			}
        		        			
        			)
        		
    	 	}			
      	    else{�@
        		alert("[����]")} 			
        	}	
    	
    });
    		


</script>



</body>

</html>