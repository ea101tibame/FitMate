<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- TODO 加上判定權限的javacode後就出現讀不到表格的狀況 -->


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>include</title>
<style>
@import
	url("https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css")
	; /*匯入左邊滑動>的圖型*/
</style>
<style>
* {
	margin: 0;
	padding: 0;
	list-style: none;
	font-family: 微軟正黑體;
	box-sizing: border-box;
}

html, body {
	width: 100%;
	height: 100%;
}

/*登入、logo*/
.login {
	position: relative;
	list-style: none;
	font-family: 微軟正黑體;
}

#loginbtn { /*登入按鈕*/
	background-color: #FFCC80;
	color: #000;
	left: 93%;
	border: none;
	position: absolute;
	/* width: 75px; */
	margin-top: 2% !important;
	/* right: 3%; */
	right: 0;
	top: 0;
	z-index: 999;
	display: block;
}

#logoutbtn {
	background-color: #FFCC80;
	color: #000;
	left: 93%;
	border: none;
	position: absolute;
	/* width: 75px; */
	margin-top: 2% !important;
	/* right: 3%; */
	right: 0;
	top: 0;
	z-index: 999;
	display: none;
}

#loginbtn:hover, #logoutbtn:hover { /*滑鼠畫到登入按鈕時的狀態*/
	background-color: #F8b300;
	color: #000;
}

/*左邊選單設定*/
#titleh3 { /*左邊FitMate管理後台*/
	margin-bottom: 40px;
}

.side-menu { /*左邊滑出來的區塊*/
	position: fixed;
	float: left;
	height: 100%;
	padding-top: 50px;
	text-align: center;
	line-height: 50px;
	letter-spacing: 1px;
	box-sizing: border-box;
	background-color: #F8b300;
	display: flex;
	flex-direction: column;
	box-shadow: 5px 0px 10px hsla(240, 40%, 15%, .6);
	transform: translateX(-100%);
	transition: .3s;
	z-index: 1;
}

ul.menu {
	width: 200px;
	margin: auto;
}

#side-menu-switch:checked+.side-menu { /*按了按鈕之後側邊欄位會長出來*/
	transform: translateX(0);
}

#side-menu-switch { /*收合按鈕checkbox隱藏*/
	position: absolute;
	opacity: 0;
	z-index: -1;
}

.side-menu label { /*收合按鈕樣式*/
	position: absolute;
	width: 40px;
	height: 80px;
	background-color: #000;
	color: #fff;
	right: -40px;
	top: 0;
	bottom: 0;
	margin: auto;
	line-height: 80px;
	text-align: center;
	font-size: 30px;
	border-radius: 0 10px 10px 0;
}

.navbar .sub-menu { /*子連結*/
	display: none;
}

.navbar li:hover>.sub-menu { /*滑鼠移到父連結長出子連結*/
	display: block;
	background-color: #FFE0B2;
	width: 80%;
	height: auto;
	margin: auto;
}

.navbar .menu a { /*左邊menu連結樣式*/
	color: #000;
	display: block;
	font-size: 20px;
	font-family: 微軟正黑體;
	text-decoration: none;
	text-align: center;
}

.menu img { /*menu裡面的小圖*/
	width: 20px;
	height: 20px;
}
/*客服聊天開始*/
.floating-chat {
	z-index: 999;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
	position: fixed;
	bottom: 10px;
	right: 10px;
	width: 40px;
	height: 40px;
	transform: translateY(70px);
	transition: all 250ms ease-out;
	border-radius: 50%;
	opacity: 0;
	background: -moz-linear-gradient(-45deg, #183850 0, #183850 25%, #192C46 50%,
		#22254C 75%, #22254C 100%);
	background: -webkit-linear-gradient(-45deg, #183850 0, #183850 25%, #192C46 50%,
		#22254C 75%, #22254C 100%);
	background-repeat: no-repeat;
	background-attachment: fixed;
}

.floating-chat.enter:hover {
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px
		rgba(0, 0, 0, 0.23);
	opacity: 1;
}

.floating-chat.enter {
	transform: translateY(0);
	opacity: 0.6;
	box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.12), 0px 1px 2px
		rgba(0, 0, 0, 0.14);
}

.floating-chat.expand {
	width: 250px;
	max-height: 400px;
	height: 400px;
	border-radius: 5px;
	cursor: auto;
	opacity: 1;
}

.floating-chat :focus {
	outline: 0;
	box-shadow: 0 0 3pt 2pt rgba(14, 200, 121, 0.3);
}

.floating-chat button {
	background: transparent;
	border: 0;
	color: white;
	text-transform: uppercase;
	border-radius: 3px;
	cursor: pointer;
}

.floating-chat .chat {
	display: flex;
	flex-direction: column;
	position: absolute;
	opacity: 0;
	width: 1px;
	height: 1px;
	border-radius: 50%;
	transition: all 250ms ease-out;
	margin: auto;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
}

.floating-chat .chat.enter {
	opacity: 1;
	border-radius: 0;
	margin: 10px;
	width: auto;
	height: auto;
}

.floating-chat .chat .header {
	flex-shrink: 0;
	padding-bottom: 10px;
	display: flex;
	background: transparent;
}

.floating-chat .chat .header .title {
	flex-grow: 1;
	flex-shrink: 1;
	padding: 0 5px;
}

.floating-chat .chat .header button {
	flex-shrink: 0;
}

.floating-chat .chat .messages {
	padding: 10px;
	margin: 0;
	list-style: none;
	overflow-y: scroll;
	overflow-x: hidden;
	flex-grow: 1;
	border-radius: 4px;
	background: transparent;
}

.floating-chat .chat .messages::-webkit-scrollbar {
	width: 5px;
}

.floating-chat .chat .messages::-webkit-scrollbar-track {
	border-radius: 5px;
	background-color: rgba(25, 147, 147, 0.1);
}

.floating-chat .chat .messages::-webkit-scrollbar-thumb {
	border-radius: 5px;
	background-color: rgba(25, 147, 147, 0.2);
}

.floating-chat .chat .messages li {
	position: relative;
	clear: both;
	display: inline-block;
	padding: 14px;
	margin: 0 0 20px 0;
	font: 12px/16px 'Noto Sans', sans-serif;
	border-radius: 10px;
	background-color: rgba(25, 147, 147, 0.2);
	word-wrap: break-word;
	max-width: 81%;
}

.floating-chat .chat .messages li:before {
	position: absolute;
	top: 0;
	width: 25px;
	height: 25px;
	border-radius: 25px;
	content: '';
	background-size: cover;
}

.floating-chat .chat .messages li:after {
	position: absolute;
	top: 10px;
	content: '';
	width: 0;
	height: 0;
	border-top: 10px solid rgba(25, 147, 147, 0.2);
}

.floating-chat .chat .messages li.other {
	animation: show-chat-even 0.15s 1 ease-in;
	-moz-animation: show-chat-even 0.15s 1 ease-in;
	-webkit-animation: show-chat-even 0.15s 1 ease-in;
	float: left;
	margin-left: 45px;
	color: #0EC879;
}

.floating-chat .chat .messages li.other:before {
	left: -45px;
	background-image: url(<%=request.getContextPath()%>/images/backend_public/gakki.jpg);
}

.floating-chat .chat .messages li.other:after {
	border-left: 10px solid transparent;
	left: -10px;
}

.floating-chat .chat .messages li.self {
	animation: show-chat-odd 0.15s 1 ease-in;
	-moz-animation: show-chat-odd 0.15s 1 ease-in;
	-webkit-animation: show-chat-odd 0.15s 1 ease-in;
	float: right;
	margin-right: 45px;
	color: #0AD5C1;
}

.floating-chat .chat .messages li.self:before {
	right: -45px;
	background-image: url(<%=request.getContextPath()%>/images/backend_public/emppic.jpg);
}

.floating-chat .chat .messages li.self:after {
	border-right: 10px solid transparent;
	right: -10px;
}

.floating-chat .chat .footer {
	flex-shrink: 0;
	display: flex;
	padding-top: 10px;
	max-height: 90px;
	background: transparent;
}

.floating-chat .chat .footer .text-box {
	border-radius: 3px;
	background: rgba(25, 147, 147, 0.2);
	min-height: 100%;
	width: 100%;
	margin-right: 5px;
	color: #0EC879;
	overflow-y: auto;
	padding: 2px 5px;
}

.floating-chat .chat .footer .text-box::-webkit-scrollbar {
	width: 5px;
}

.floating-chat .chat .footer .text-box::-webkit-scrollbar-track {
	border-radius: 5px;
	background-color: rgba(25, 147, 147, 0.1);
}

.floating-chat .chat .footer .text-box::-webkit-scrollbar-thumb {
	border-radius: 5px;
	background-color: rgba(25, 147, 147, 0.2);
}

@
keyframes show-chat-even { 0% {
	margin-left: -480px;
}

100%
{
margin-left








:




 




0;
}
}
@
-moz-keyframes show-chat-even { 0% {
	margin-left: -480px;
}

100%
{
margin-left








:




 




0;
}
}
@
-webkit-keyframes show-chat-even { 0% {
	margin-left: -480px;
}

100%
{
margin-left








:




 




0;
}
}
@
keyframes show-chat-odd { 0% {
	margin-right: -480px;
}

100%
{
margin-right








:




 




0;
}
}
@
-moz-keyframes show-chat-odd { 0% {
	margin-right: -480px;
}

100%
{
margin-right








:




 




0;
}
}
@
-webkit-keyframes show-chat-odd { 0% {
	margin-right: -480px;
}

100%
{
margin-right








:




 




0;
}
}
#login_view {
	width: 500px;
	margin: 5px;
}

.logintext {
	margin: 5px;
	background-color: antiquewhite;
}
</style>
</head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Caesar+Dressing&family=Coming+Soon&family=Noto+Sans+TC:wght@700&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css" integrity="sha384-Bfad6CLCknfcloXFOyFnlgtENryhrpZCe29RTifKEixXQZ38WheV+i/6YWSzkz3V" crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
<link rel="icon" href="<%=request.getContextPath()%>/images/core-img/FIT.ico">
<body>
	<!-- checkbox用來收合的不要亂移動 開始 -->
	<input type="checkbox" name="" id="side-menu-switch">
	<!-- checkbox用來收合的不要亂移動 結束-->

	<!-- 左邊選單開始 -->

	<div class="side-menu">
		<h3 id="titleh3">FitMate管理後台</h3>
		<div class="navbar">
			<ul class="menu">
				<li>
					<a href="<%=request.getContextPath()%>/back-end/employee/employee_select_page.jsp">
						<img src="<%=request.getContextPath()%>/images/backend_public/employee.png" alt="">
						平台員工管理
					</a>
					<ul class="sub-menu">
						<li>
							<a href="#">管理員權限設定</a>
						</li>
					</ul>
				</li>

				<li>
					<a href="#">
						<img src="<%=request.getContextPath()%>/images/backend_public/shopping.png" alt="">
						商城管理
					</a>
					<ul class="sub-menu">
						<li>
							<a href="#">商品資料管理</a>
						</li>
						<li>
							<a href="#">商品訂單管理</a>
						</li>
					</ul>
				</li>

				<li>
					<a href="#">
						<img src="<%=request.getContextPath()%>/images/backend_public/coach.png" alt="">
						教練管理
					</a>
					<ul class="sub-menu">
						<li>
							<a href="#">教練權限管理</a>
						</li>
					</ul>
				</li>

				<li>
					<a href="<%=request.getContextPath()%>/back-end/information/information_select_page.jsp">
						<img src="<%=request.getContextPath()%>/images/backend_public/news.png" alt="">
						消息管理
					</a>
					<ul class="sub-menu">
						<li>
							<a href="#">促銷審核</a>
						</li>
					</ul>
				</li>

				<li>
					<a href="#">
						<img src="<%=request.getContextPath()%>/images/backend_public/talk.png" alt="">
						討論區管理
					</a>
					<ul class="sub-menu">
						<li>
							<a href="#">文章管理</a>
						</li>
						<li>
							<a href="#">檢舉管理</a>
						</li>
					</ul>
				</li>

				<li>
					<a href="#">
						<img src="<%=request.getContextPath()%>/images/backend_public/complain.png" alt="">
						客訴管理
					</a>
					<ul class="sub-menu">
						<li>
							<a href="#">客訴管理</a>
						</li>
					</ul>
				</li>

			</ul>
		</div>
		<!-- label用來收合的不要亂移動 開始 -->
		<label for="side-menu-switch">
			<i class="fa fa-angle-right"></i>
		</label>
		<!-- label用來收合的不要亂移動 結束 -->
	</div>
	<!-- 左邊選單結束 -->
<%if(session.getAttribute("empVO")!=null){ %>
	<div></div>
	<!-- 客服聊天區-->
	<div class="floating-chat">
		<i class="fa fa-comments" aria-hidden="true"></i>
		<div class="chat">
			<div class="header">
				<span class="title">客服中心</span>
				<button>
					<i class="fa fa-times" aria-hidden="true"></i>
				</button>

			</div>
			<ul class="messages">
				<li class="other">這裡是會員的文字</li>
				<li class="self">這裡是員工的文字</li>
			</ul>
			<div class="footer">
				<div class="text-box" contenteditable="true" disabled="true"></div>
				<button id="sendMessage">send</button>
			</div>
		</div>
	</div>
	<script src="<%=request.getContextPath()%>/js/backend.js"></script>
	<!-- 客服聊天區-->
<%} %>
	<!-- 登入按鈕開始 -->
	<div class="login">
		<!-- 用if判斷empVO是否為空值決定按鈕怎麼出現 -->
		<%
			if (session.getAttribute("empVO") == null) {
		%>
		<button class="btn btn-outline-success my-2 my-sm-0" type="submit" data-toggle="modal" data-target="#exampleModalCenter" id="loginbtn">登入</button>
		<%
			} else {
		%>
		<form action="<%=request.getContextPath()%>/employee/employee.do" method="post">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit" data-toggle="modal" data-target="#exampleModalCenter" id="loginbtn">登出</button>
			<input type="hidden" name="action" value="logout">
		</form>
		<%
			}
		%>
		&nbsp;
		<!--登入的彈出視窗(背景變暗層)-->
		<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">

				<form action="<%=request.getContextPath()%>/employee/employee.do" method="post" id="login_view">

					<div class="modal-content" id="modalcontent">
						<!-- 彈出視窗show層 (form表單驗證層)-->

						<div class="modal-header">
							<img alt="" src="<%=request.getContextPath()%>/images/employee/logo1.png" width="50" height="50" border="0">
							<h5 class="modal-title" id="exampleModalCenterTitle">管理員登入</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>

						<div class="modal-body">帳號:</div>
						<input type="text" name="eacc" class="logintext" id="account">

						<div class="modal-body">密碼:</div>
						<input type="password" name="epsw" class="logintext" id="password">

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal" id="cancel">取消</button>
							<button type="submit" class="btn btn-primary" name="action" value="logincheck" id="commit">登入</button>
						</div>

						<ul>
							<li>
								忘記密碼
								<a href="<%=request.getContextPath()%>/forgetPsw.jsp">點此</a>
							</li>
						</ul>

					</div>
				</form>

			</div>
		</div>
	</div>
	<!-- 登入按鈕結束 -->
	<script>
		var commit = document.getElementById('commit');
		var loginbtn = document.getElementById('loginbtn');
		var logoutbtn = document.getElementById('logoutbtn');

		//登入登出不跳轉測試成功(畫面跳轉即失效)
		commit.addEventListener('click', function(e) {
			loginbtn.style.display = 'none';
			logoutbtn.style.display = 'block';
		});

		logoutbtn.addEventListener('click', function() {
			loginbtn.style.display = 'block';
			logoutbtn.style.display = 'none';
		});
	</script>
</body>
</html>