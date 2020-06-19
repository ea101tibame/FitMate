<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.employee.model.*"%>
<%@page import="java.sql.Date"%>

<%
	EmployeeVO empVO = (EmployeeVO)request.getAttribute("empVO");
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
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>修改員工資料</title>
<style>

#previewPic{
	height:180px;
	width:150px;
}

</style>
</head>
<body>
	<div id="div1">
		<h3>修改員工資料</h3>
		<img alt="" src="images/logo1.png" width="100" height="32" border="0">
		<a href="showAllEmployee.jsp">返回員工列表</a>
		<a href="employee_select_page.jsp">返回首頁</a>
	</div>
	<c:if test="${not empty errorMsgs}">
		<a>看看你的錯:</a><br>
		<a><c:forEach var="message" items="${errorMsgs}">${errorMsgs}</c:forEach></a>
	</c:if>
	
	<form action="employee.do" method="post" enctype="multipart/form-data">
	<table>
		
		<tr>
			<td>員工編號:<font color=red><b>*</b></font></td>
			<td>${empVO.empno}</td>
		</tr>
		<tr>
			<td>員工姓名:</td>
			<td><input type="text" name="ename"  value="${empVO.ename}"></td>
		</tr>
		<tr>
			<td>員工帳號:</td>
			<td><input type="hidden" name="eacc" value="${empVO.eacc}">${empVO.eacc}</td>
		</tr>
		<tr>
			<td><input type="hidden" name="epsw"  value="${empVO.epsw}"></td>
		</tr>
		<tr>
			<td>雇用日期:<font color=red><b>*</b></font></td>
			<td><input type="date" name="edate" value="${empVO.edate}"></td>		
		</tr>
		<tr>
			<td>員工圖片:</td>
			<td><input type="file" id="txt_pic" name="epic"><br></td>
        	<td><img id="previewPic" src="<%=request.getContextPath()%>/employee/employeePic.do?empno=${empVO.empno}"><br></td>
		</tr>
		<tr>
			<td>員工權限:<font color=red><b>*</b></font></td>
			<td><select size="1" name="esta">
				<option value="系統管理員">系統管理員
				<option value="一般管理員">一般管理員
			</select></td>
		</tr>
	</table><br>
	<input type="submit" value="修改送出" onclick="javascript:return bye();">	
	<input type="hidden" value="alter" name="action">
	<input type="hidden" name="empno" value="${empVO.empno}">
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

function bye(){
	var msg = '確定送出修改資料嗎?';
	if(confirm(msg)==true){
		return true ;
	} else {
		return false ;
	}
}

// $('.tip').hide();

// function checkPsw(){
// 	var psw1 = document.getElementById("txt_psw").value;
// 	var psw2 = document.getElementById("txt_repsw").value;
// 	if(psw1!=psw2||psw2!=""){
// 		$('.tip').show();
// 		$('#confirm').hide();
// 	} else {
// 		$('.tip').hide();
// 		$('#confirm').show();
// 	}
// }

// function checkPsw2(){
// 	var psw1 = document.getElementById("txt_psw").value;
// 	var psw2 = document.getElementById("txt_repsw").value;
// 	if(psw1!=psw2){
// 		$('.tip').show();
// 		$('#confirm').hide();
// 	} else {
// 		$('.tip').hide();
// 		$('#confirm').show();
// 	}
// }

</script>

</body>
</html>