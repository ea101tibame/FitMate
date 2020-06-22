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
				location.reload();
			},
			error : function() {
				alert('登出失敗');
			},
			complete : function() {
			}
		});

	})
});
