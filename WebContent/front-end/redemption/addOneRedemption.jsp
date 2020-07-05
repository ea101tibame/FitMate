<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.redemption.model.*"%>
<%@ page import="com.coach.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%	
	String coano = (String)session.getAttribute("coano");
	CoaService coaSvc = new CoaService(); 
	CoaVO coaVO = coaSvc.getOneCoa(coano);
	pageContext.setAttribute("coaVO", coaVO);
%>
<html>
<head>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>申請點數兌換</title>
</head>
<body>
	 
	 	<h3>申請點數兌換</h3>
	 	<a href="<%=request.getContextPath()%>/front-end/redemption/redemption_index.jsp">返回我的點數</a>
	 	
	 	<c:if test="${not empty errorMsgs}">
			<a>看看你的錯:</a>
			<br>
			<a><c:forEach var="message" items="${errorMsgs}">${message}</c:forEach></a>
		</c:if>
			
		<form action="<%=request.getContextPath()%>/redemption/redemption.do" method="post">
			<table>
				<tr>
					<td>請輸入欲兌換點數</td>
					<td><input type="number" name="redprice" id="price"></td>
				</tr>
				<tr>
					<td>目前擁有點數:<font color=red>${coaVO.coapoint}</font></td>
				</tr>
			</table>
			<input type="submit" value="送出申請" id="commit">
			<input type="hidden" value="insert" name="action">
			<input type="hidden" name="coano" value="${coaVO.coano}">
		</form>
<script>
	$(document).ready(function(){
		$('input:submit').on('click',function(e){
			e.preventDefault();
			swal({
				title:'注意',
				text:'您確定要將這些點數兌換為現金嗎?',
				icon:'warning',
				buttons:true,
				dangerMode:true
			}).then(function(isConfirm){
				if(isConfirm){
					if('${coaVO.coapoint}' < $('#price').val()){
						swal('錯誤','申請點數超過目前持有點數','error');
					} else {
						swal('您已經完成兌換申請作業','FitMate審核通過後將以email通知您','success');
						setTimeout(function(){
							$('input:submit').parent('form').submit();
						},2000);
					} 
				} else {
					swal('取消','已取消兌換申請作業','error');
				}
			});
		});
	});
</script>
</body>
</html>