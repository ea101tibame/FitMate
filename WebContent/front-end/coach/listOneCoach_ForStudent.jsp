<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.coach.model.*"%>
<%@ page import="com.expertise_own.model.*"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/custom-css/coach/listOneCoach_ForStudent.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Caesar+Dressing&family=Coming+Soon&family=Noto+Sans+TC:wght@700&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css" integrity="sha384-Bfad6CLCknfcloXFOyFnlgtENryhrpZCe29RTifKEixXQZ38WheV+i/6YWSzkz3V" crossorigin="anonymous">
<link rel="icon" href="<%=request.getContextPath()%>/images/core-img/FIT.ico">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/css/core-style.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">

<title>教練個人資料 - listOneCoach_ForStudent.jsp</title>

</head>
<body>

	<%@ include file="/front-end/header.jsp"%>

	<div class="single-blog-wrapper">

		<div class="single-blog-post-thumb">
			<img src="<%=request.getContextPath()%>/images/bg-img/coach1920.png" alt="">
		</div>

		<section id='second'>
			<div class="container">
				<div class='row'>
					<div class='col-md-8 offset-md-2 text-center'>
						<h3>跟著專業FitMate,一起運動去!!!</h3>
						<div class='row'>
							<div class='col-md-4'>
								<img src="data:image/png;base64,${coaVO.coapicStr}" class="card-img-top expown" style="width: 400px; height: 400px;" alt="證照或獎狀圖">
								<h5>
									<span>教練</span>
									<div>${coaVO.coaname}</div>
								</h5>
							</div>
							<div class='col-md-8 text-left'>
								<p class='lead'>
									無論你是一個人 還是多人揪團
									<br>
									FitMate 提供你想要的教練課程!!!
								</p>
								<div>
									<span>專長►►</span><c:forEach var="expOwnVO" items="${expOwnVOs}">
														<p>${expOwnVO.expdesc}</p>
															</c:forEach></div>
								<p>教練小檔案</p>
								<br>
								<div>
									<span>性別 ►►</span>
									${coaVO.coasex}
								</div>
								<br>
								<div>
									<span>信箱 ►► ${coaVO.coamail}
								</div>
								<br>
								<div>
									<span>自我介紹 ►► ${coaVO.coaintro}
								</div>
								<br>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section id='latest'>
			<div class='container'>
				<div class='row'>

					<!-- 在此放入課表 -->

				</div>
			</div>
		</section>
	</div>
<%@ include file="/front-end/footer.jsp"%>
</body>
</html>