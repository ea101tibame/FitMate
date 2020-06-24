
 function arrayBufferToBase64(buffer) {
	var binary = '';
	var bytes = new Uint8Array(buffer);
	var len = bytes.byteLength;
	for (var i = 0; i < len; i++) {
		binary += String.fromCharCode(bytes[i]);
	}
	return window.btoa(binary);
}

$(document).ready(function() {
	$("#table").bootstrapTable({
		method : "GET",
		url : context + "/coach/coach.do",
		pagination : true,
		pageSize : 10,
		pageList : [ 10, 25, 50, 100 ],
		search : true,
		columns : [ {
			field : 'coano',
			title : '編號',
			align : 'center',
			sortable : true
		}, {
			field : 'coaname',
			title : '姓名',
			align : 'center',
			sortable : true
		}, {
			field : 'coapic',
			title : '照片',
			formatter : function(value, row, index) {
				return '<img src="data:image/png;base64,' + arrayBufferToBase64(row.coapic) + '" width="100px;" height="100px;"/>'
			}
		}, {
			field : 'coasex',
			title : '性別',
			align : 'center',
			sortable : true
		}, {
			field : 'expdesc',
			title : '專長',
			align : 'center',
			sortable : true
		},{
			field : 'coasctotal',
			title : '總評價分數',
			align : 'center',
				sortable : true
		}, {
			field : 'coascqty',
			title : '總評價人數',
			align : 'center',
			sortable : true
		}, {
			title : '教練詳請',
			formatter : function(value, row, index) {
				return `<form METHOD="post"
						action="${context}/coach/coach.do"
						style="margin-bottom: 0px;">
						<input type="submit" class="btn btn-outline-primary" value="詳情">
						<input type="hidden" name="action" value="BackendGetOneForView">
						<input type="hidden" name="coano" value="${row.coano}">
					</form>`
			}
		} ],
	})
});
