<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.coach.model.*"%>
<%@ page import="com.expertise.model.*"%>
<%@ page import="com.expertise_own.model.*"%>

<!DOCTYPE html>
<!-- TODO 新增成功後 sweetalert 出不來 -->
<!-- TODO 資料輸入錯誤後跳回原頁面圖片不會保留(大頭照和證照) -->


<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->


<title>註冊成為教練 - addCoach.jsp</title>

<!-- FIT.ico  -->
<link rel="icon" href="<%=request.getContextPath()%>/images/core-img/FIT.ico">

<!-- Core Style CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/css/core-style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/custom-css/coach/coach_form.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">



</head>


<body>
	<%@ include file="/front-end/header.jsp"%>

	<div class="single-blog-wrapper">

		<div class="single-blog-post-thumb">
			<img src="<%=request.getContextPath()%>/images//bg-img/COA1920.png" alt="">
		</div>
		<FORM class="form" METHOD="post" ACTION="<%=request.getContextPath()%>/coach/coach.do" name="form1" enctype="multipart/form-data">
			<div class="container">
				<div class="regular-page-content-wrapper section-padding-80">
					<h3>註冊成為教練:</h3>
					<%-- 錯誤表列 --%>
					<c:if test="${not empty errorMsgs}">
						<font style="color: red">請修正以下錯誤:</font>
						<ul>
							<c:forEach var="message" items="${errorMsgs}">
								<%-- <li style="color: red">${message.key}</li> --%>
								<li style="color: red">${message.value}</li>
							</c:forEach>
						</ul>
					</c:if>
					<div class="container">
						<div class="row flex-lg-nowrap">
							<div class="col">
								<div class="row">
									<div class="col mb-3">
										<div class="card">
											<div class="card-body">
												<div class="e-profile">
													<div class="row">
														<div class="col-12 col-sm-auto mb-3">
															<div class="mx-auto" style="width: 140px;">
																<div class="d-flex justify-content-center align-items-center rounded" style="height: 140px; background-color: rgb(233, 236, 239);">
																	<span>
																		<img id="previewPic" src="<%=request.getContextPath()%>/images/noData/nopic2.jpg" style="width: 140px; height: 140px; border-radius: .25rem;">
																	</span>
																</div>
															</div>
														</div>
														<div class="col d-flex flex-column flex-sm-row justify-content-between mb-3">
															<div class="text-center text-sm-left mb-2 mb-sm-0">
																<h4 id="title" class="pt-sm-2 pb-1 mb-0 text-nowrap"></h4>
																<p class="mb-0"></p>
																<div class="text-muted">
																	<small></small>
																</div>
																<div class="mt-2">
																	<i class="fa fa-fw fa-camera"></i>
																	<input type="FILE" id="pic" name="coapic" size="45" value="" placeholder="上傳照片" />
																</div>
															</div>
															<div class="text-center text-sm-right">
																<span class="badge badge-secondary">FITMATE專業教練申請</span>
																<div class="text-muted">
																	<small></small>
																</div>
															</div>
														</div>
													</div>
													<ul class="nav nav-tabs">
														<li class="nav-item">
															<a href="" class="active nav-link">設定</a>
														</li>
													</ul>
													<div class="tab-content pt-3">
														<div class="tab-pane active">
															<table id="coach-table">
																<div class="row">
																	<div class="col">
																		<div class="row">
																			<div class="col">
																				<div class="form-group">
																					<label>姓名</label>
																					<input class="form-control" type="TEXT" id="coaname" name="coaname" size="45" value="${param.coaname}" placeholder="請輸入姓名" />
																					<p style="font-color: red;">${errorMsgs.coaname}</p>
																				</div>
																			</div>
																			<div class="col">
																				<div class="form-group">
																					<label>電話</label>
																					<input class="form-control" type="TEXT" name="coatel" size="45" value="${param.coatel}" placeholder="請輸入電話" />
																					<p style="font-color: red;">${errorMsgs.coatel}</p>
																				</div>
																			</div>
																		</div>
																		<div class="row">
																			<div class="col">
																				<div class="form-group">
																					<label>信箱</label>
																					<input class="form-control" type="TEXT" name="coamail" size="45" value="${param.coamail}" placeholder="請輸入信箱" />
																					<p style="font-color: red;">${errorMsgs.coamail}</p>
																				</div>
																			</div>
																		</div>
																		<div class="row">
																			<div class="col mb-3">
																				<div class="form-group">
																					<label>自我介紹</label>
																					<textarea class="form-control" name="coaintro" rows="5" placeholder="請輸入自我介紹">${param.coaintro}</textarea>
																					<p>${errorMsgs.coaintro}</p>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-12 col-sm-6 mb-3">
																		<div class="row">
																			<div class="col">
																				<div class="form-group">
																					<label>匯款帳戶</label>
																					<input class="form-control" type="TEXT" name="coaacc" size="45" value="${param.coaacc}" placeholder="請輸入帳戶" />
																					<p style="font-color: red;">${errorMsgs.coaacc}</p>
																				</div>
																			</div>
																		</div>
																		<div class="row">
																			<div class="col">
																				<div class="form-group"></div>
																			</div>
																		</div>
																		<div class="row">
																			<div class="col">
																				<div class="form-group">
																					<label>
																						<span class="d-none d-xl-inline"></span>
																					</label>
																					<button type="button" class="btn btn-success" id="add-exp">新增專長</button>
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="col-12 col-sm-5 offset-sm-1 mb-3">
																		<div class="mb-2">
																			<b>性別</b>
																		</div>
																		<div class="row">
																			<div class="col">
																				<div class="custom-controls-stacked px-2">
																					<div class="custom-control custom-checkbox">
																						<input type="radio" name="coasex" size="45" value="男" checked="true" />
																						<label>男</label>
																					</div>
																					<div class="custom-control custom-checkbox">
																						<input type="radio" name="coasex" size="45" value="女" />
																						<label>女</label>
																					</div>

																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col d-flex justify-content-end">
																		<jsp:useBean id="expSvc" scope="page" class="com.expertise.model.ExpService" />
																		<input type="hidden" name="action" value="insert" />
																		<input class="btn btn-primary" type="submit" value="送出新增" id="addCoach" />
																	</div>
																</div>
															</table>

														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
		</form>
	</div>

	<%@ include file="/front-end/footer.jsp"%>

</body>
<script src="<%=request.getContextPath()%>/js/custom-js/coach/addCoach.js"></script>
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script> -->
<script>
	
	var expNumber = 0;

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
	$("#add-exp").click(
			function() {
				expNumber += 1;
				$("#coach-table").after(
						"<table>" + "<td>專長:" + "<select size='1' name='expno"+expNumber+"'>" + "<c:forEach var='ExpVO' items='${expSvc.all}'>"
								+ "<option value='${ExpVO.expno}' ${(ExpVO.expno==ExpVO.expno)? 'selected':''}>${ExpVO.expdesc}" + "</c:forEach>" + "</select></td>" + "<tr>"
								+ "<td>" + "專業證照/比賽獎狀:" +
								"<input type='FILE' class='exp-preview' name='expown"+expNumber+"' size='45' placeholder='請上證照/獎狀' />" + "</td>" + "</tr>" + "<tr>" + "<td>"
								+ "<img id='previewPicExp' src='"+context+"/images/noData/nopic.jpg' style='width: 480px; height: 480px;'>" + "</td>" + "</tr>" + "<tr>" + "<td>"
								+ "<input type='button' value='刪除專長' class='delete-exp'>" + "</td>" + "</tr>" + "</table>" + "<br>");
				// bind click event for new element
				$(".exp-preview").change(function() {
					readURL(this, $(this).parent().parent().parent().find("img"));
				});
				
				

				$(".delete-exp").click(function() {
					$(this).parent().parent().parent().remove();
				});

			});
	$("#coaname").keyup(function() {
		$("#title").html($(this).val());
	});
	
	
</script>


</html>