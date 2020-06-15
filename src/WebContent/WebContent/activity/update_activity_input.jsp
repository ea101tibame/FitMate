<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.activity.model.*"%>

<%
ActivityVO activityVO = (ActivityVO) request.getAttribute("activityVO"); //ActivityServlet.java(Concroller), �s�Jreq��actVO����
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>���ʸ�ƭק� - update_activity_input.jsp</title>
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
				<h3>���ʸ�ƭק� - update_activity_input.jsp</h3>
				<h4>
					<a href="selectActivity_page.jsp">�^����</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>���ʭק�:</h3>

	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="activity.do" name="form1" enctype="multipart/form-data">
		<table>
			<tr>
				<td>���ʽs��:<font color=red><b>*</b></font></td>
				<td>${activityVO.actno}</td>
			</tr>
			<tr>
				<td>���ʦW��:</td>
				<td><input type="TEXT" name="actname" size="45" 
					value="${activityVO.actname}"
					placeholder="�п�J���ʦW��" /></td>
			</tr>
			<tr>
				<td>���ʦa�I:</td>
				<td><input type="TEXT" name="actloc" size="45" 
					value="${activityVO.actloc}"
					placeholder="�п�J���ʦa�I" /></td>
			</tr>
			<tr>
				<td>���ʤ��:</td>
				<td><input type="TEXT" name="actdate" id="f_date1"
					placeholder="�п�J���ʤ��"></td>
			</tr>
			<tr>
				<td>���ʮɬq:</td>
				<td><input type="TEXT" name="actss" size="45" 
					value="${activityVO.actss}"
					placeholder="�п�ܬ��ʮɬq" /></td>
			</tr>
			<tr>
				<td>���ʶ}�l���W���:</td>
				<td><input type="TEXT" name="actstart" id="f_date2"
					placeholder="�п�J�}�l���W���"></td>
			</tr>
			<tr>
				<td>���ʺI����W���:</td>
				<td><input type="TEXT" name="actend" id="f_date3"
					placeholder="�п�J�I����W���"></td>
			</tr>
			<tr>
				<td>��������:</td>
				<td><input type="TEXT" name="acttype" size="45" 
					value="${activityVO.acttype}"
					placeholder="�п�ܬ�������" /></td>
			</tr>
			<tr>
				<td>�����I��:</td>
				<td><input type="TEXT" name="actprice" size="45" 
					value="${activityVO.actprice}"
					placeholder="�п�J�����I��" /></td>
			</tr>
			<tr>
				<td>���ʳ̤p���ΤH��:</td>
				<td><input type="TEXT" name="actmin" size="45" 
					value="${activityVO.actmin}"
					placeholder="�п�J���ʳ̤p���ΤH��" /></td>
			</tr>
			<tr>
				<td>���ʳ̤j�W���H��:</td>
				<td><input type="TEXT" name="actmax" size="45" 
					value="${activityVO.actmax}"
					placeholder="�п�J���ʳ̤j�W���H��" /></td>
			</tr>
			<tr>
				<td>���ʥثe���W�H��:</td>
				<td><input type="TEXT" name="actcur" size="45" 
					value="${activityVO.actcur}"
					placeholder="�п�J���ʥثe���W�H��" /></td>
			</tr>
			<tr>
				<td>���ʴy�z:</td>
				<td><input type="TEXT" name="actdesc" size="45" 
					value="${activityVO.actdesc}"
					placeholder="�п�J���ʴy�z" /></td>
			</tr>
			<tr>
				<td>���ʪ��A:</td>
				<td><input checked type="RADIO" name="actsta"
					value="${activityVO.actsta}"
					${(activityVO.actsta=="���W�[") ? 'checked':''}>���W�[ <input
					type="RADIO" name="actsta" value="${activityVO.actsta}"
					${(activityVO.actsta=="�W�[��") ? 'checked':''}>�W�[��</td>
			</tr>
			<tr>
				<td>���ʹϤ�:</td>
				<td><input type="FILE" id="pic" name="actpic" size="45"
					value="<%=(activityVO == null) ? "" : activityVO.getActpic()%>"
					placeholder="�ФW�ǹϤ�" />
				</td>
			</tr>
			<tr>
				<td>�ǭ��s��:</td>
				<td><input type="TEXT" name="stuno" size="45" 
					value="${activityVO.stuno}"
					placeholder="�п�J�z���ǭ��s��" /></td>
			</tr>
			<tr>
				<td>�нm�s��:</td>
				<td><input type="TEXT" name="coano" size="45" 
					value="${activityVO.coano}"
					placeholder="�п�J�z�w�����нm�s��" /></td>
			</tr>

		</table>
		<br> 
		<input type="hidden" name="actno" value="${activityVO.actno}">
		<img id="previewPic" src="<%=request.getContextPath()%>/image/NOPIC.PNG" style="width:480px;height:480px;"> 
		<br><input type="hidden" name="action" value="update"> 
		<input type="submit" value="�e�X�ק�">
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