<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.coach.model.*"%>
<%@ page import="com.expertise.model.*"%>
<%@ page import="com.expertise_own.model.*"%>
<%@ page import="java.util.*"%>

<!-- TODO 依專長搜尋教練(下拉) & 依教練姓名搜尋專長(輸入)  -->
<!-- TODO 超過5筆就換頁  -->
<!-- TODO 按下詳情導到 listOneCoach_ForStudent -->
<!-- TODO 圖片顥示 -->
<%
	CoaService coaSvc = new CoaService();
	List<CoaVO> coaVOs = coaSvc.getAll();
	pageContext.setAttribute("coaVOs", coaVOs);

	System.out.println("list size: " + coaVOs.size());
	for (int i = 0; i < coaVOs.size(); i++) {
		System.out.println("coaname: " + coaVOs.get(i).getCoaname());
	}
%>

<!DOCTYPE html>
<html>

<head>

<title>學員-所有教練資料 - listAllCoach.jsp</title>

</head>

<body>

	<h2>查詢:</h2>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<ul>
		<li><a href='listAllCoach_ForStudent.jsp'>顯示全部教練</a><br><br></li>

		<li>
			<FORM METHOD="post" ACTION="coach.do">
				<b>輸入教練姓名 (如：林書豪):</b> <input type="text" name="coaname"> <input
					type="hidden" name="action" value="getOne_For_Display"> <input
					type="submit" value="送出">
			</FORM>
		</li>

		<jsp:useBean id="CoaSvc" scope="page"
			class="com.coach.model.CoaService" />

		<li>
			<FORM METHOD="post" ACTION="coach.do">
				<b>選擇教練專長:</b> <select size="1" name="expdesc">
					<c:forEach var="expVO" items="${expSvc.getAll}">
						<option value="${expVO.expdesc}">${expVO.expdesc}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>
	</ul>

	<table class="table">

		<tr>
			<th scope="col">編號</th>
			<th scope="col">姓名</th>
			<th scope="col">性別</th>
			<th scope="col">專長</th>
			<th scope="col">自我介紹</th>
			<th scope="col">照片</th>
			<th scope="col">詳細資訊</th>
		</tr>

		<c:forEach var="coaVO" items="${coaVOs}">
			<tr>
				<td>${coaVO.coano}</td>
				<td>${coaVO.coaname}</td>
				<td>${coaVO.coasex}</td>
				<td>${expVO.expdesc}</td>
				<td>${coaVO.coaintro}</td>
				<td>
					<td><img
						src="<%=request.getContextPath()%>/coach/coapic.do?coano=${coaVO.coano}"
						alt="教練圖片" style="width: 180px; height: 180px;"></td>
					<td>${coaVO.coano}</td>
				</td>

				<td>
					<form METHOD="post"
						action="<%=request.getContextPath()%>/coach/coach.do"
						style="margin-bottom: 0px;">
						<input type="submit" class="btn btn-outline-primary" value="詳情">
						<input type="hidden" name="action" value="getOne_For_Update">
						<input type="hidden" name="coano" value="${coaVO.coano}">
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>