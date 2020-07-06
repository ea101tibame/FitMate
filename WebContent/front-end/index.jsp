<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>

<style>
.marquee{
background-color:#E6E6F2;
}

</style>

</head>
<body>
<marquee class="marquee" onMouseOver="this.stop()" onMouseOut="this.start()" scrollamount="15">
<b>FITMATE有限公司&nbsp;&nbsp;&nbsp;顧問:吳永志 吳冠宏 郭惠民&nbsp;&nbsp;&nbsp;董事長 aka&nbsp;JQuery達人:方品貴&nbsp;&nbsp;&nbsp;執行長:官庭昱&nbsp;&nbsp;&nbsp;藝術總監:黃聖珊  黃羽均&nbsp;&nbsp;&nbsp;系統架構師 aka女子力滿點:魏韶毅&nbsp;&nbsp;&nbsp;行銷經理:謝志琳&nbsp;&nbsp;&nbsp;業務經理:官民建 </b></marquee>
	<%@ include file="/front-end/header.jsp" %>
		
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
							<a href="${pageContext.request.contextPath}/front-end/activity/listAll_activity.jsp">揪團活動</a>
						</div>
					</div>
				</div>
				<div class="col-12 col-sm-6 col-md-4">
					<div class="single_catagory_area d-flex align-items-center justify-content-center bg-img" style="background-image: url(${context}/images/bg-img/bg-3.jpg);">
						<div class="catagory-content">
							<a href="${pageContext.request.contextPath}/front-end/product/product.jsp">購物商城</a>
						</div>
					</div>
				</div>
				<div class="col-12 col-sm-6 col-md-4">
					<div class="single_catagory_area d-flex align-items-center justify-content-center bg-img" style="background-image: url(${context}/images/bg-img/bg-4.jpg);">
						<div class="catagory-content">
							<a href="${pageContext.request.contextPath}/front-end/lesson/listAll_lesson.jsp">教練課程</a>
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
								<a href="${pageContext.request.contextPath}/front-end/coach/listAllCoach_ForStudent.jsp" class="btn essence-btn">尋找教練</a>
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
						<h2>熱門教練</h2>
					
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-12" >
					<div class="popular-products-slides owl-carousel" >
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
	
		<%@ include file="/front-end/footer.jsp" %>
</body>

</html>