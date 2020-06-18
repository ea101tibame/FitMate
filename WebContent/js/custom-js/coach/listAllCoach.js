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
		columns : [ {
			field : 'coano',
			title : '編號'
		}, {
			field : 'coaname',
			title : '姓名',
		}, {
			field : 'coapsw',
			title : '密碼',
			width : '10%',
			align : 'center',
		}, {
			field : 'coamail',
			title : '信箱'
		}, {
			field : 'coatel',
			title : '電話',
		}, {
			field : 'coaacc',
			title : '匯款帳戶'
		}, {
			field : 'coapoint',
			title : '點數'
		}, {
			field : 'coasta',
			title : '狀態',
			editable : {
				type : 'select',
				title : '狀態',
				source : [ {
					text : "授權",
					value : "授權"
				}, {
					text : "未授權",
					value : "未授權"
				} ]
			}
		}, {
			field : 'coapic',
			title : '照片',
			formatter : function(value, row, index) {
				return '<img src="data:image/png;base64,' + arrayBufferToBase64(row.coapic) + '" width="80px;" height="80px;"/>'
			}
		}, {
			field : 'coasex',
			title : '性別'
		},
		// {
		// field : 'coaintro',
		// title : '自我介紹'
		// },
		{
			field : 'coasctotal',
			title : '總評價分數'
		}, {
			field : 'coascqty',
			title : '總評價人數'
		} ],
		onEditableSave : function(field, row, oldValue, $el) {
			$.ajax({
				type : "post",
				url : context + "/coach/coach.do",
				data : "action=BackendUpdate&coano="+row.coano+"&coasta=" + row.coasta,
				success : function(data, status) {
					if (data.error_code == "0") {
						alert('提交資料成功');
					}
				},
				error : function() {
					alert('編輯失敗');
				},
				complete : function() {
				}
			});
		}
	})
});
