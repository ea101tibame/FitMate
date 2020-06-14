<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.coach.model.*"%>
<%
  CoaVO coaVO = (CoaVO) request.getAttribute("coaVO");
%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta charset="UTF-8">
<title>員工資料新增 - addCoach.jsp</title>

</head>
<body>
    <header class="header_area">
        <div class="classy-nav-container breakpoint-off d-flex align-items-center justify-content-between">
            <!-- Classy Menu -->
            <nav class="classy-navbar" id="essenceNav">
                <!-- Logo -->
                <a class="nav-brand" href="index.html"><img src="<%=request.getContextPath()%>/img/index-core-image/logo.png" alt=""></a>
                <!-- Navbar Toggler -->
                <div class="classy-navbar-toggler">
                    <span class="navbarToggler"><span></span><span></span><span></span></span>
                </div>
                <!-- Menu -->
                <div class="classy-menu">
                    <!-- close btn -->
                    <div class="classycloseIcon">
                        <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                    </div>
                    <!-- Nav Start -->
                    <div class="classynav">
                        <ul>
                            <li><a href="index.html">首頁</a></li>
                            <li><a href="blog.html">消息</a></li>
                           
                            </li>
                           
                
                            <li><a href="#">教練</a>
                                <ul class="dropdown">
                                    <li><a href="index.html">個人資料</a></li>
                                    <li><a href=".html">查看課表</a></li>
                                     <li><a href=".html">建立課程</a></li>
                                    <li><a href=".html">修改課程</a></li>
                                    <li><a href=".html">點數兌換</a></li>

                                </ul>
                            </li>
                            <li><a href="blog.html">討論區</a></li>
                            
                        </ul>
                    </div>
                    <!-- Nav End -->
                </div>
            </nav>

            <!-- Header Meta Data -->
            <div class="header-meta d-flex clearfix justify-content-end">
                <!-- Search Area -->
            
                <!-- User Login Info -->
                <div class="user-login-info">
                    <a href="#"><img src="<%=request.getContextPath()%>/img/index-core-image/user.svg" alt=""></a>
                </div>
                 <div class="user-login-info">
                    <a href="#"><img src="<%=request.getContextPath()%>/img/index-core-image/email.svg" alt=""></a>
                </div>
                

            </div>

        </div>
    </header>
    <!-- ##### Header Area End ##### -->

    

    <!-- ##### Blog Wrapper Area Start ##### -->
    <div class="single-blog-wrapper">

        <!-- Single Blog Post Thumb -->
        <div class="single-blog-post-thumb">
            <img src="<%=request.getContextPath()%>/img/index-bg-image/COA1920.png" alt="">
        </div>
        <div class="container">
            <div class="regular-page-content-wrapper section-padding-80">

                    
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
                                          <span style="color: rgb(166, 168, 170); font: bold 8pt Arial;">140x140</span>
                                        </div>
                                      </div>
                                    </div>
                                    <div class="col d-flex flex-column flex-sm-row justify-content-between mb-3">
                                      <div class="text-center text-sm-left mb-2 mb-sm-0">
                                        <h4 class="pt-sm-2 pb-1 mb-0 text-nowrap">John Smith</h4>
                                        <p class="mb-0">@johnny.s</p>
                                        <div class="text-muted"><small>Last seen 2 hours ago</small></div>
                                        <div class="mt-2">
                                          <button class="btn btn-primary" type="button">
                                            <i class="fa fa-fw fa-camera"></i>
                                            <span>Change Photo</span>
                                          </button>
                                        </div>
                                      </div>
                                      <div class="text-center text-sm-right">
                                        <span class="badge badge-secondary">administrator</span>
                                        <div class="text-muted"><small>Joined 09 Dec 2017</small></div>
                                      </div>
                                    </div>
                                  </div>
                                  <ul class="nav nav-tabs">
                                    <li class="nav-item"><a href="" class="active nav-link">Settings</a></li>
                                  </ul>
                                  <div class="tab-content pt-3">
                                    <div class="tab-pane active">
                                      <form name="addCoachForm" action="<%=request.getContextPath()%>/coach/coach.do" method="POST" class="form" novalidate="">
                                        <input type="hidden" name="action" value="insert">
                                        <div class="row">
                                          <div class="col">
                                            <div class="row">
                                              <div class="col">
                                                <div class="form-group">
                                                  <label>Full Name</label>
                                                  <input class="form-control" type="text" name="AShanPig" placeholder="John Smith" value="John Smith">
                                                </div>
                                              </div>
                                              <div class="col">
                                                <div class="form-group">
                                                  <label>Username</label>
                                                  <input class="form-control" type="text" name="username" placeholder="johnny.s" value="johnny.s">
                                                </div>
                                              </div>
                                            </div>
                                            <div class="row">
                                              <div class="col">
                                                <div class="form-group">
                                                  <label>Email</label>
                                                  <input class="form-control" type="text" placeholder="user@example.com">
                                                </div>
                                              </div>
                                            </div>
                                            <div class="row">
                                              <div class="col mb-3">
                                                <div class="form-group">
                                                  <label>About</label>
                                                  <textarea class="form-control" rows="5" placeholder="My Bio"></textarea>
                                                </div>
                                              </div>
                                            </div>
                                          </div>
                                        </div>
                                        <div class="row">
                                          <div class="col-12 col-sm-6 mb-3">
                                            <div class="mb-2"><b>更換密碼</b></div>
                                            <div class="row">
                                              <div class="col">
                                                <div class="form-group">
                                                  <label>舊密碼</label>
                                                  <input class="form-control" type="password" placeholder="••••••">
                                                </div>
                                              </div>
                                            </div>
                                            <div class="row">
                                              <div class="col">
                                                <div class="form-group">
                                                  <label>新密碼</label>
                                                  <input class="form-control" type="password" placeholder="••••••">
                                                </div>
                                              </div>
                                            </div>
                                            <div class="row">
                                              <div class="col">
                                                <div class="form-group">
                                                  <label>確認 <span class="d-none d-xl-inline">密碼</span></label>
                                                  <input class="form-control" type="password" placeholder="••••••"></div>
                                              </div>
                                            </div>
                                          </div>
                                          <div class="col-12 col-sm-5 offset-sm-1 mb-3">
                                            <div class="mb-2"><b>姓別</b></div>
                                            <div class="row">
                                              <div class="col">
                                                <label>Email Notifications</label>
                                                <div class="custom-controls-stacked px-2">
                                                  <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="notifications-blog" checked="">
                                                    <label class="custom-control-label" for="notifications-blog">男</label>
                                                  </div>
                                                  <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="notifications-news" checked="">
                                                    <label class="custom-control-label" for="notifications-news">女</label>
                                                  </div>
                                    
                                                </div>
                                              </div>
                                            </div>
                                          </div>
                                        </div>
                                        <div class="row">
                                          <div class="col d-flex justify-content-end">
                                            <input type="button" class="btn btn-primary" id="save-btn" value="Save Changes">
                                          </div>
                                        </div>
                                      </form>

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
    </div>
    <!-- ##### Blog Wrapper Area End ##### -->

     <!-- ##### Footer Area Start ##### -->
    <footer class="footer_area clearfix">
        <div class="container">
           

    <div class="row ">
                <div class="col-md-12 text-center">
                    <p>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
    Copyright &copy;<script>document.write(new Date().getFullYear());</script> by EA101G5 <i class="fa fa-heart-o" aria-hidden="true"></i> by FitMate</a>
    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </p>
                </div>
            </div>

        </div>
    </footer>
    <!-- ##### Footer Area End ##### -->

</body>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/core-style.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/custom-css/coach_form.css" />
    
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

	<!-- jQuery (Necessary for All JavaScript Plugins) -->
	<script src="<%=request.getContextPath()%>/js/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script src="<%=request.getContextPath()%>/js/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	<!-- Plugins js -->
	<script src="<%=request.getContextPath()%>/js/plugins.js"></script>
	<!-- Classy Nav js -->
	<script src="<%=request.getContextPath()%>/js/classy-nav.min.js"></script>
	<!-- Active js -->
	<script src="<%=request.getContextPath()%>/js/coach-form.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
        
</script>
</html>