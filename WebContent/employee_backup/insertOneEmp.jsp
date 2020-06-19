<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.employee.model.*"%>

<%
	EmployeeVO empVO = (EmployeeVO) request.getAttribute("empVO");
%>

<%
	Date edate = null ;
	try{
		edate = empVO.getEdate();
	} catch (Exception e){
		edate = new Date(System.currentTimeMillis());
	}
%>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<title>新增員工</title>
<style>

#previewPic{
	height:180px;
	width:150px;
}

</style>
</head>

<body>
	<div id="div1">
		<h3>新增員工資料</h3>
		<a href="employee_select_page.jsp"><img alt="" src="images/logo1.png"
			width="100" height="100" border="0">返回首頁</a>
	</div>
	<c:if test="${not empty errorMsgs}">
		<a>看看你的錯:</a><br>
		<a><c:forEach var="message" items="${errorMsgs}">${errorMsgs}</c:forEach></a>
	</c:if>

<form action="employee.do" method="post" enctype="multipart/form-data">

	<div class="Data-Content">
        <label for="txt_name">員工姓名：</label>
        <input type="text" id="txt_name" name="ename" value="<%= (empVO==null)? "" : empVO.getEname()%>" /><br>
    	<label for="txt_acc">員工帳號：</label>
    	<input type="text" id="txt_acc" name="eacc" value="<%= (empVO==null)? "" : empVO.getEacc()%>" /><br>
        <label for="txt_psw">員工密碼：</label>
        <input type="password" id="txt_psw" name="epsw" onchange=checkPsw();><br>
        <label for="txt_repsw">密碼確認：</label>
        <input type="password" id="txt_repsw" onchange=checkPsw2();><br>
        <span class="tip" style="color: red;">請再次確認密碼</span><br>
        <label for="txt_date">雇用日期：</label>
        <input type="date" id="txt_date" name="edate" value="<%= (empVO==null)? "" : empVO.getEdate()%>"><br><br>
        <span>員工圖片:</span>
        <input type="file" id="txt_pic" name="epic"><br>
        <img id="previewPic" src="images/nopic.jpg"><br>
        <label for="txt_auth">員工權限：</label>
        <select  size="1" name="esta" id="txt_auth" >			
			<option value="系統管理員">系統管理員		
			<option value="一般管理員">一般管理員
        </select>
   	</div>
   	
   	<input type="hidden" name="action" value="insert">
   	<input type="submit" value="送出" id="confirm" onclick="javascript:return bye();">
       
</form>

<script>

$("#txt_pic").change(function(){
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

$('.tip').hide();

function checkPsw(){
	var psw1 = document.getElementById("txt_psw").value;
	var psw2 = document.getElementById("txt_repsw").value;
	if(psw1!=psw2||psw2!=""){
		$('.tip').show();
		$('#confirm').hide();
	} else {
		$('.tip').hide();
		$('#confirm').show();
	}
}

function checkPsw2(){
	var psw1 = document.getElementById("txt_psw").value;
	var psw2 = document.getElementById("txt_repsw").value;
	if(psw1!=psw2){
		$('.tip').show();
		$('#confirm').hide();
	} else {
		$('.tip').hide();
		$('#confirm').show();
	}
}

function bye(){
	var msg = '確定新增嗎?';
	if(confirm(msg)==true){
		return true ;
	} else {
		return false ;
	}
}


</script>
</body>
</html>