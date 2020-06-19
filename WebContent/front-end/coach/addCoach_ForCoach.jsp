<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.coach.model.*"%>
<%@ page import="com.expertise.model.*"%>
<%@ page import="com.expertise_own.model.*"%>

<!DOCTYPE html>

<!-- TODO 證照/獎狀的圖片預覽  -->
<!-- TODO 錯誤訊息顯示  -->
<!-- TODO 新增資料入資料庫 -->
<!-- TODO 新增成功後Alert"新增成功"並導到listOneCoach_ForCoach -->

<%
	CoaVO coaVO = (CoaVO) request.getAttribute("coaVO");
	ExpOwnVO expownVO = (ExpOwnVO) request.getAttribute("expownVO");
	ExpVO expVO = (ExpVO) request.getAttribute("expVO");
%>


<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>註冊成為教練 - addCoach.jsp</title>

<style>
table#table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

<style>
table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>
</head>
<body bgcolor='white'>
	<table id="table-1">
		<tr>
			<td>
				<h3>註冊成為教練 - addCoach.jsp</h3>
			</td>
			<td>
				<h4>
					<a href="selectCoach_page.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>註冊成為教練:</h3>

	<%-- 錯誤表列
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if> --%>

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

	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/coach/coach.do" name="form1" enctype="multipart/form-data">
		<table>
			<tr>
				<td>上傳個人頭像:</td>
				<td>
					<input type="FILE" id="pic" name="coapic" size="45" value="<%=(coaVO == null) ? "" : coaVO.getCoapic()%>" placeholder="請上傳圖片" />
				</td>
				<td>
					<img id="previewPic" src="<%=request.getContextPath()%>/images/coach-img/user.jpg" style="width: 140px; height: 140px;">
					<br>
				</td>
			</tr>
			<tr>
				<td>性別:</td>
				<td>
					<input type="radio" name="coasex" size="45" value="男" checked="true" />
					男
				</td>
				<td>
					<input type="radio" name="coasex" size="45" value="女" />
					女
				</td>
			</tr>
			<tr>
				<td>姓名:</td>
				<td>
					<input type="TEXT" name="coaname" size="45" value="${param.coaname}" placeholder="請輸入姓名" />
					<p>${errorMsgs.coaname}</p>
				</td>
			</tr>
			<tr>
				<td>電話:</td>
				<td>
					<input type="TEXT" name="coatel" size="45" value="${param.coatel}" placeholder="請輸入電話" />
					<p>${errorMsgs.coatel}</p>
				</td>
			</tr>

			<tr>
				<td>密碼:</td>
				<td>
					<input type="TEXT" name="coapsw" size="45" value="${param.coapsw}" placeholder="請輸入密碼" />
					<p>${errorMsgs.coapsw}</p>
				</td>
			</tr>
			<tr>
				<td>信箱:</td>
				<td>
					<input type="TEXT" name="coamail" size="45" value="${param.coamail}" placeholder="請輸入信箱" />
					<p>${errorMsgs.coamail}</p>
				</td>
			</tr>

			<tr>
				<td>帳戶:</td>
				<td>
					<input type="TEXT" name="coaacc" size="45" value="${param.coaacc}" placeholder="請輸入帳戶" />
					<p>${errorMsgs.coaacc}</p>
				</td>
			</tr>

			<tr>
				<td>自我介紹:</td>
				<td>
					<input type="TEXT" name="coaintro" size="45" value="${param.coaintro}" placeholder="請輸入自我介紹" />
					<p>${errorMsgs.coaintro}</p>
				</td>
			</tr>
			<jsp:useBean id="expSvc" scope="page" class="com.expertise.model.ExpService" />
			<tr>
				<td>專長:</td>
				<td>
					<select size="1" name="expno">
						<c:forEach var="ExpVO" items="${expSvc.all}">
							<option value="${ExpVO.expno}" ${(ExpVO.expno==ExpVO.expno)? 'selected':''}>${ExpVO.expdesc}
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>專業證照/比賽獎狀:</td>
				<td>
					<input type="FILE" id="picExp" name="expown" size="45" value="<%=(expownVO == null) ? "" : expownVO.getExpown()%>" placeholder="請上證照/獎狀" />
				</td>
			</tr>
		</table>
		<img id="previewPicExp" src="<%=request.getContextPath()%>/images/noData/nopic.png" style="width: 480px; height: 480px;">
		<br>
		<input type="hidden" name="action" value="insert" />
		<input type="submit" value="送出新增" />
	</FORM>

</body>

<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script>
	$("#pic").change(function() {
		readURL(this, $("#previewPic"));
	});
	$("#picExp").change(function() {
		readURL(this, $("#previewPicExp"));
	});
	function readURL(input, previewElement) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				previewElement.attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>

</html>