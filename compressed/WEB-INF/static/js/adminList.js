var ctx = $("#ctx").html();

var roleMap = {};
function getAdminRole() {
	$.ajax({
		type : "GET",
		url : ctx + '/admin/roles',
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType : "json",
		error : function(error) {
			console.log(error);
		},
		success : function(result) {
			roleMap = result;
		}
	});
}