document.querySelector('.img__btn').addEventListener('click', function() {
	document.querySelector('.cont').classList.toggle('s--signup');
});

$(document).ready(function() {

	$("#logout-btn").click(function() {
		$.ajax({
			type : "post",
			url : context + "/logout.do",
			success : function(data, status) {
				alert('登出成功');
				window.location.href = context + "/front-end/index.jsp";
			},
			error : function() {
				alert('登出失敗');
			},
			complete : function() {
			}
		});
	})
	
	$("#sign-up-coach").click(function(){
		window.location.href=context + "/front-end/coach/addCoach.jsp";
	});
	
	$("#sign-up-student").click(function(){
		window.location.href=context + "/front-end/student/addStudent.jsp";
	});
	
	$("#logo").click(function(){
		window.location.href=context + "/front-end/index.jsp";
	});
	
});
