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

<title>教練個人資料詳情 - listOneCoach_ForStudent.jsp</title>

</head>
<body style="background: #f8b302;">

	<%@ include file="/front-end/header.jsp"%>

	<div class="single-blog-wrapper" style="font-size: 18px; color:white;">

		<div class="single-blog-post-thumb">
			<img src="<%=request.getContextPath()%>/images/bg-img/coach1920.png" alt="">
		</div>

		<div class="row" style="margin: 100px;">

			<div class="col">
				<div class="card" style="height: 500px; border-radius: 20px; background-color: black;">
					<div class="card-body">
						<div class="row">
							<div class="col">
								<h5 class="card-title" style="color: white; text-align:center; padding:5px;">跟著專業FitMate,一起運動去!!!</h5>
								<div class="card-body" style="width: 200; height: 400px; position: relative;">
									<img src="data:image/png;base64,${coaVO.coapicStr}" class="card-img-top expown" style="width: 400px; height: 400px; max-width: 100%; max-height: 100%; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); border-radius: 200px; margin: 0 auto;" alt="教練照片">
								</div>
								</div>
								<div class="col">
									<h5 class="card-title" style="color:#f8b302;">關於我</h5>
									<p class="card-text">
									<div>
										<span>姓名：</span>${coaVO.coaname}</div>
									<div>
										<span>性別：</span>${coaVO.coasex}</div>
									<div>
										<span>專長：</span>
										<c:forEach var="expOwnVO" items="${expOwnVOs}">
											<p style="color: SteelBlue	; font-weight: bolder; font-size: 18px;">${expOwnVO.expdesc}</p>
										</c:forEach>
									</div>
									<div>
										<span>自我介紹：</span>
										<br>${coaVO.coaintro}</div>
									<button type="button" class="btn btn-primary" style="margin-top: 10px">預約教練</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<%@ include file="/front-end/footer.jsp"%>
		</div>
</body>
</html>