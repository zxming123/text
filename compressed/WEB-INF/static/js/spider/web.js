
$(function(){
	var totalPageNum=$("#totalPage").val();
 	var curPage=$("#currentPage").val();
 	var size=$("#pageSize").val();
 	var ctx=$("#ctx").html();
 	var name = $("#lastName").val();
 	var url=ctx+"/spider/webList?name=" + name + "&page=";
 	if (totalPageNum > 1)
 	{initPage(url,totalPageNum,parseInt(curPage),4);}
 	else
 	{$('.pagination').hide();}
	
	$("#addWeb").click(function(){
		var ctx=$("#ctx").html();
		var name = $("#newWeb").val();
		var url=ctx+"/spider/addWeb";
		$.ajax({
			 type: "POST",
	          url: url,
	          data: {web:name},
	          dataType : "json",
	          async:false,
	          error: function () {
	        	  alert("添加失败");
	          },
	          success: function (result) {
	        	  alert("添加成功");
	        	  newUrl = ctx + "/spider/webList?name=" + name + "&page=";
	        	  window.location.replace(newUrl);
		           
	          }
		 });
	});
	
	$("#addAllWeb").click(function(){
		var ctx=$("#ctx").html();
		var url=ctx+"/spider/getAllSource";
		$.ajax({
			 type: "POST",
	          url: url,
	          data: {},
	          dataType : "json",
	          async:false,
	          error: function () {
	        	  alert("添加失败");
	          },
	          success: function (result) {
	        	  alert("添加成功");
	        	  newUrl = ctx + "/spider/webList?name=&page=";
	        	  window.location.replace(newUrl); 
	          }
		 });
	});
	
});