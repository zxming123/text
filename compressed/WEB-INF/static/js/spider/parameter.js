
$(function(){
	$("#addPara").click(function(){
		var ctx=$("#ctx").html();
		var name = $("#paraname").val();
		var value = $("#paravalue").val();
		var sid = $("#sid").val();
		var url=ctx+"/spider/addSpiderParameter";
		$.ajax({
			 type: "POST",
	          url: url,
	          data: {sid:sid,name:name,value:value},
	          dataType : "json",
	          async:false,
	          error: function () {
	        	  alert("添加失败");
	          },
	          success: function (result) {
	        	  alert("添加成功");
		          newUrl = ctx + "/spider/newSpider?sid=" + sid;
		          window.location.replace(newUrl);
	          }
		 });
	});
	
});

function deleteParameter(id){
	var ctx=$("#ctx").html();
	var sid = $("#sid").val();
	var url=ctx+"/spider/deleteSpiderParameter";
	$.ajax({
		 type: "POST",
         url: url,
         data: {pid:id},
         dataType : "json",
         async:false,
         error: function () {
       	  alert("删除失败");
         },
         success: function (result) {
       	  alert("删除成功");
	          newUrl = ctx + "/spider/newSpider?sid=" + sid;
	          window.location.replace(newUrl);
         }
	 });
}