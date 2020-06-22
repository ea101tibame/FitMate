<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.student.model.*"%>

<%
	StuVO StuVO = (StuVO) request.getAttribute("StuVO");
%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>學員註冊 - addStudent.jsp</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.15-rc1/jquery.twzipcode.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/custom-css/addStudent.css">


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
</head>
<body bgcolor='white'>
	<table id="table-1">
		<tr>
			<td>
				<h3>新增學員 - addStudent.jsp</h3>
			</td>
			<td>
				<h4>
					<a href="index_ForVisitor.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>學員註冊:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/student/student.do" name="form1" enctype="multipart/form-data">
		<table>
			<tr>
				<td>上傳個人頭像:</td>
				<td>
					<input type="FILE" id="pic" name="stupic" size="45" value="<%=(StuVO == null) ? "" : StuVO.getStupic()%>" placeholder="請上傳圖片" />
				</td>
				<td>
					<img id="previewPic" src="<%=request.getContextPath()%>/images/noData/nopic2.jpg" style="width: 140px; height: 140px;">
					<br>
				</td>
			</tr>
			<tr>
				<td>性別:</td>
				<td>
					<input type="radio" name="stusex" size="45" value="男" checked="true" />
					男
				</td>
				<td>
					<input type="radio" name="stusex" size="45" value="女" />
					女
				</td>
			</tr>
			<tr>
				<td>姓名:</td>
				<td>
					<input type="TEXT" name="stuname" size="45" value="${param.stuname}" placeholder="請輸入姓名" />
					<p>${errorMsgs.stuname}</p>
				</td>
			</tr>
			<tr>
				<td>電話:</td>
				<td>
					<input type="TEXT" name="stutel" size="45" value="${param.stutel}" placeholder="請輸入電話" />
					<p>${errorMsgs.stutel}</p>
				</td>
			</tr>
			<tr>
				<td>信箱:</td>
				<td>
					<input type="TEXT" name="stumail" size="45" value="${param.stumail}" placeholder="請輸入信箱" />
					<p>${errorMsgs.stumail}</p>
				</td>
			</tr>

			<tr>
			<tr>
				<td>生日:</td>
				<td>
					<input type="text" name="stubir" id="f_date1" placeholder="請輸入生日">
				</td>
			</tr>

			<tr>

				<td>地址:</td>
				<td>
					<div id="zipcode3">
						<div class="f3" data-role="county" style="width:100px"></div>
						<div class="f4" data-role="district" style="width:150px"></div>
					</div>
					<input name="stuadd" type="text" class="f13 address form-control" style="width:500px">

					</div>
		</table>

		<br>
		<input type="hidden" name="action" value="insert">
		<input type="submit" value="送出新增">
	</FORM>

</body>

<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<%
	java.sql.Date stubir = null;
	try {
		stubir = StuVO.getStubir();
	} catch (Exception e) {
		stubir = new java.sql.Date(System.currentTimeMillis());
	}
%>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>

<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>

<script>
	$.datetimepicker.setLocale('zh');
	$('#f_date1').datetimepicker({
		theme : 'dark', //theme: 'dark',
		timepicker : false, //timepicker:true,
		step : 1, //step: 60 (這是timepicker的預設間隔60分鐘)
		format : 'Y-m-d', //format:'Y-m-d H:i:s',
		value : new Date(),
		maxDate : '+1970-01-01' // 去除今日(不含)之後
	});

	$("#pic").change(function() {
		readURL(this, $("#previewPic"));
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

	$("#zipcode3").twzipcode({
		"zipcodeIntoDistrict" : true,
		"css" : [ "city form-control", "town form-control" ],
		"countyName" : "city", // 指定城市 select name
		"districtName" : "town" // 指定地區 select name
	});
</script>
</html>