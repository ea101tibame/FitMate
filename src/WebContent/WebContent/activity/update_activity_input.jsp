<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.activity.model.*"%>

<%
ActivityVO activityVO = (ActivityVO) request.getAttribute("activityVO"); //ActivityServlet.java(Concroller), 存入req的actVO物件
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>活動資料修改 - update_activity_input.jsp</title>
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
				<h3>活動資料修改 - update_activity_input.jsp</h3>
				<h4>
					<a href="selectActivity_page.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>活動修改:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="activity.do" name="form1" enctype="multipart/form-data">
		<table>
			<tr>
				<td>活動編號:<font color=red><b>*</b></font></td>
				<td>${activityVO.actno}</td>
			</tr>
			<tr>
				<td>活動名稱:</td>
				<td><input type="TEXT" name="actname" size="45" 
					value="${activityVO.actname}"
					placeholder="請輸入活動名稱" /></td>
			</tr>
			<tr>
				<td>活動地點:</td>
				<td><input type="TEXT" name="actloc" size="45" 
					value="${activityVO.actloc}"
					placeholder="請輸入活動地點" /></td>
			</tr>
			<tr>
				<td>活動日期:</td>
				<td><input type="TEXT" name="actdate" id="f_date1"
					placeholder="請輸入活動日期"></td>
			</tr>
			<tr>
				<td>活動時段:</td>
				<td><input type="TEXT" name="actss" size="45" 
					value="${activityVO.actss}"
					placeholder="請選擇活動時段" /></td>
			</tr>
			<tr>
				<td>活動開始報名日期:</td>
				<td><input type="TEXT" name="actstart" id="f_date2"
					placeholder="請輸入開始報名日期"></td>
			</tr>
			<tr>
				<td>活動截止報名日期:</td>
				<td><input type="TEXT" name="actend" id="f_date3"
					placeholder="請輸入截止報名日期"></td>
			</tr>
			<tr>
				<td>活動類型:</td>
				<td><input type="TEXT" name="acttype" size="45" 
					value="${activityVO.acttype}"
					placeholder="請選擇活動類型" /></td>
			</tr>
			<tr>
				<td>活動點數:</td>
				<td><input type="TEXT" name="actprice" size="45" 
					value="${activityVO.actprice}"
					placeholder="請輸入活動點數" /></td>
			</tr>
			<tr>
				<td>活動最小成團人數:</td>
				<td><input type="TEXT" name="actmin" size="45" 
					value="${activityVO.actmin}"
					placeholder="請輸入活動最小成團人數" /></td>
			</tr>
			<tr>
				<td>活動最大上限人數:</td>
				<td><input type="TEXT" name="actmax" size="45" 
					value="${activityVO.actmax}"
					placeholder="請輸入活動最大上限人數" /></td>
			</tr>
			<tr>
				<td>活動目前報名人數:</td>
				<td><input type="TEXT" name="actcur" size="45" 
					value="${activityVO.actcur}"
					placeholder="請輸入活動目前報名人數" /></td>
			</tr>
			<tr>
				<td>活動描述:</td>
				<td><input type="TEXT" name="actdesc" size="45" 
					value="${activityVO.actdesc}"
					placeholder="請輸入活動描述" /></td>
			</tr>
			<tr>
				<td>活動狀態:</td>
				<td><input checked type="RADIO" name="actsta"
					value="${activityVO.actsta}"
					${(activityVO.actsta=="未上架") ? 'checked':''}>未上架 <input
					type="RADIO" name="actsta" value="${activityVO.actsta}"
					${(activityVO.actsta=="上架中") ? 'checked':''}>上架中</td>
			</tr>
			<tr>
				<td>活動圖片:</td>
				<td><input type="FILE" id="pic" name="actpic" size="45"
					value="<%=(activityVO == null) ? "" : activityVO.getActpic()%>"
					placeholder="請上傳圖片" />
				</td>
			</tr>
			<tr>
				<td>學員編號:</td>
				<td><input type="TEXT" name="stuno" size="45" 
					value="${activityVO.stuno}"
					placeholder="請輸入您的學員編號" /></td>
			</tr>
			<tr>
				<td>教練編號:</td>
				<td><input type="TEXT" name="coano" size="45" 
					value="${activityVO.coano}"
					placeholder="請輸入您預約的教練編號" /></td>
			</tr>

		</table>
		<br> 
		<input type="hidden" name="actno" value="${activityVO.actno}">
		<img id="previewPic" src="<%=request.getContextPath()%>/image/NOPIC.PNG" style="width:480px;height:480px;"> 
		<br><input type="hidden" name="action" value="update"> 
		<input type="submit" value="送出修改">
	</FORM>
</body>

<script
  src="https://code.jquery.com/jquery-1.12.4.js"
  integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
  crossorigin="anonymous"></script>
<script>
$("#pic").change(function(){
	readURL(this);
});

function readURL(input){
	if(input.files&&input.files[0]){
		var reader = new FileReader();
		reader.onload = function(e){
			$("#previewPic").attr('src',e.target.result);	
		}
		reader.readAsDataURL(input.files[0]);
	}
}        
</script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>
</html>