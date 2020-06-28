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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/custom-css/student/addStudent.css">

</head>
<body>
<%@ include file="/front-end/header.jsp"%>

<div class="single-blog-wrapper" style="background-color: black;">
        <div class="single-blog-post-thumb">
            <img src="<%=request.getContextPath()%>/images//bg-img/STU1920.png" alt="">
        </div>
     <FORM  class="form" METHOD="post" ACTION="<%=request.getContextPath()%>/student/student.do" name="form1" enctype="multipart/form-data">
        <div class="container">
            <div class="regular-page-content-wrapper section-padding-80">
               	<span class="oi oi-pencil" style="background-color: white;"></span><h3 style="color: white;">註冊成為學員:</h3>
               	<%-- 錯誤表列 --%>
					<c:if test="${not empty errorMsgs}">
						<font style="color: red">請修正以下錯誤:</font>
						<ul>
							<c:forEach var="message" items="${errorMsgs}">
								<li style="color: red">${message}</li>
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
                                        	<span><img id="previewPic" src="<%=request.getContextPath()%>/images/noData/nopic2.jpg" style="width: 140px; height: 140px; border-radius: .25rem;"></span>
                                        </div>
                                      </div>
                                    </div>
                                    <div class="col d-flex flex-column flex-sm-row justify-content-between mb-3">
                                      <div class="text-center text-sm-left mb-2 mb-sm-0">
                                        <h4 id="title" class="pt-sm-2 pb-1 mb-0 text-nowrap"></h4>
                                        <p class="mb-0"></p>
                                        <div class="text-muted"><small></small></div>
                                        <div class="mt-2">
                                          <i class="fa fa-fw fa-camera"></i><input type="FILE" id="pic" name="stupic" size="45" value="<%=(StuVO == null) ? "" : StuVO.getStupic()%>" placeholder="上傳圖片" />
                                        </div>
                                      </div>
                                      <div class="text-center text-sm-right">
                                        <span class="badge badge-secondary">FITMATE學員資格申請</span>
                                        <div class="text-muted"><small></small></div>
                                      </div>
                                    </div>
                                  </div>
                                  <ul class="nav nav-tabs">
                                    <li class="nav-item"><a href="" class="active nav-link">設定</a></li>
                                  </ul>
                                  <div class="tab-content pt-3">
                                    <div class="tab-pane active">
									 <table id="student-table">
                                        <div class="row">
                                          <div class="col">
                                            <div class="row">
                                              <div class="col">
                                                <div class="form-group">
                                                  <label>姓名</label>
                                                  <input class="form-control" type="TEXT" id="stuname" name="stuname" size="45" value="${param.stuname}" placeholder="請輸入姓名" />
													<p>${errorMsgs.stuname}</p>
                                                </div>
                                              </div>
                                              <div class="col">
                                                <div class="form-group">
                                                  <label>電話</label>
                                                  <input class="form-control" type="TEXT" name="stutel" size="45" value="${param.stutel}" placeholder="請輸入電話" />
													<p>${errorMsgs.stutel}</p>
                                                </div>
                                              </div>
                                            </div>
                                            <div class="row">
                                              <div class="col">
                                                <div class="form-group">
                                                  <label>信箱</label>
                                                  <input class="form-control" type="TEXT" name="stumail" size="45" value="${param.stumail}" placeholder="請輸入信箱" />
													<p>${errorMsgs.stumail}</p>
                                                </div>
                                              </div>
                                            </div>
                                            <div class="row">
                                              <div class="col mb-3">
                                                <div class="form-group">
                                                  <label>地址</label>
                                                  <div id="zipcode3">
													<div class="f3" data-role="county" style="width:100px"></div>
													<div class="f4" data-role="district" style="width:150px"></div>
												  </div>
													<input name="stuadd" type="text" class="f13 address form-control" style="width:500px">
			                                    </div>
                                              </div>
                                            </div>
                                          </div>
                                        </div>
                                        <div class="row">
                                          <div class="col-12 col-sm-6 mb-3">
                                            <div class="mb-2"><b></b></div>
                                            <div class="row">
                                              <div class="col">
                                                <div class="form-group">
                                                  <label>生日</label>
                                                  <input class="form-control" type="text" name="stubir" id="f_date1" placeholder="請輸入生日">
                                                </div>
                                              </div>
                                            </div>
                                            <div class="row">
                                              <div class="col">
                                                <div class="form-group">
                                                  <label></label>
                                                  <!-- <input class="form-control" type="password" placeholder="••••••"> -->
                                                </div>
                                              </div>
                                            </div>
                                            <div class="row">
                                              <div class="col">
                                                <div class="form-group">
                                                  <label><span class="d-none d-xl-inline"></span></label>
                                                  <!-- <input class="form-control" type="password" placeholder="••••••"> -->
                                                </div> 
                                              </div>
                                            </div>
                                          </div>
                                          <div class="col-12 col-sm-5 offset-sm-1 mb-3">
                                            <div class="mb-2"><b>性別</b></div>
                                            <div class="row">
                                              <div class="col">
                                                <label></label>
                                                <div class="custom-controls-stacked px-2">
                                                  <div class="custom-control custom-checkbox">
                                                    <input type="radio" name="stusex" size="45" value="男" checked="true" />
                                                    <label>男</label>
                                                  </div>
                                                  <div class="custom-control custom-checkbox">
                                                    <input type="radio" name="stusex" size="45" value="女" />
                                                    <label>女</label>
                                                  </div>
                                    
                                                </div>
                                              </div>
                                            </div>
                                          </div>
                                        </div>
                                        <div class="row">
                                          <div class="col d-flex justify-content-end">
                                          <input type="hidden" name="action" value="insert">
										  <input class="btn btn-primary" type="submit" value="送出新增">
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
	
	$("#stuname").keyup(function(){
		$("#title").html($(this).val());
	});
	
</script>
</html>