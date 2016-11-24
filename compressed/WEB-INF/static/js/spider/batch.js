




$(function(){
	
	var totalPageNum=$("#totalPage").val();
 	var curPage=$("#currentPage").val();
 	var size=$("#pageSize").val();
 	var ctx=$("#ctx").html();
 	var name = $("#lastName").val();
 	var url=ctx+"/spider/batchSpiderList?name=" + name + "&page=";
 	if (totalPageNum > 1)
 	{initPage(url,totalPageNum,parseInt(curPage),4);}
 	else
 	{$('.pagination').hide();}
	
	$("#addBatch").click(function(){
		var ctx=$("#ctx").html();
		var name = $("#newBatch").val();
		var time = $("#time").val();
		var url=ctx+"/spider/addBatch";
		$.ajax({
			 type: "POST",
	          url: url,
	          data: {name:name,time:time},
	          dataType : "json",
	          async:false,
	          error: function () {
	        	  alert("添加失败");
	          },
	          success: function (result) {
	        	  alert("添加成功");
	        	  newUrl = ctx + "/spider/batchSpiderList?name=&page=";
	        	  if(totalPageNum != 0)
	        		  newUrl = newUrl  + (totalPageNum - 1);
	        	  window.location.replace(newUrl); 
	          }
		 });
	});
	
});


var addBatchStep = function(id){
	var ctx = $("#ctx").html();
	var spiderId = $("#spider" + id).val();
	var curPage=$("#currentPage").val();
	var stepId = $("#stepId" + id).val();
	var name = $("#lastName").val();
	var url = ctx + "/spider/addBatchStep";
	$.ajax({
		 type: "POST",
         url: url,
         data: {stepId:stepId,spiderId:spiderId,batchId:id},
         dataType : "json",
         async:false,
         error: function () {
       	  alert("添加失败");
         },
         success: function (result) {
       	  alert("添加成功");
       	  newUrl = ctx + "/spider/batchSpiderList?name=" + name + "&page=" + curPage;
       	  window.location.replace(newUrl); 
	           
         }
	 });
}

function addTimer(id){
	var ctx = $("#ctx").html();
	var curPage=$("#currentPage").val();
	var name = $("#lastName").val();
	var time = $("#time" + id).val();
	var url = ctx + "/spider/addTimer";
	$.ajax({
		 type: "POST",
        url: url,
        data: {time:time,batchId:id},
        dataType : "json",
        async:false,
        error: function () {
      	  alert("添加失败");
        },
        success: function (result) {
      	  alert("添加成功");
      	  newUrl = ctx + "/spider/batchSpiderList?name=" + name + "&page=" + curPage;
      	  window.location.replace(newUrl); 
	           
        }
	 });
}

function deleteBatch(id){
	var ctx = $("#ctx").html();
	var url = ctx + "/spider/deleteBatch";
	$.ajax({
		 type: "POST",
       url: url,
       data: {bid:id},
       dataType : "json",
       async:false,
       error: function () {
     	  alert("删除失败");
       },
       success: function (result) {
     	  alert("删除成功");
     	  newUrl = ctx + "/spider/batchSpiderList?name=&page=";
     	  window.location.replace(newUrl); 
	           
       }
	 });
}

function startSpider(id){
	var ctx = $("#ctx").html();
	var curPage=$("#currentPage").val();
	var name = $("#lastName").val();
	var url = ctx + "/spider/startSpider";
	$.ajax({
		 type: "POST",
       url: url,
       data: {batchId:id},
       dataType : "json",
       async:false,
       error: function () {
     	  alert("启动失败");
       },
       success: function (result) {
     	  alert("启动成功");
     	  newUrl = ctx + "/spider/batchSpiderList?name=" + name + "&page=" + curPage;
     	  window.location.replace(newUrl); 
	           
       }
	 });
}

function deleteBatchStep(id){
	var ctx = $("#ctx").html();
	var curPage=$("#currentPage").val();
	var name = $("#lastName").val();
	var url = ctx + "/spider/deleteBatchStep";
	$.ajax({
		 type: "POST",
       url: url,
       data: {stepId:id},
       dataType : "json",
       async:false,
       error: function () {
     	  alert("删除失败");
       },
       success: function (result) {
     	  alert("删除成功");
     	  newUrl = ctx + "/spider/batchSpiderList?name=" + name + "&page=" + curPage;
     	  window.location.replace(newUrl); 
	           
       }
	 });
}

function cancelTimer(id){
	var ctx = $("#ctx").html();
	var curPage=$("#currentPage").val();
	var name = $("#lastName").val();
	var url = ctx + "/spider/cancelTimer";
	$.ajax({
		 type: "POST",
       url: url,
       data: {batchId:id},
       dataType : "json",
       async:false,
       error: function () {
     	  alert("取消定时失败");
       },
       success: function (result) {
     	  alert("取消定时成功");
     	  newUrl = ctx + "/spider/batchSpiderList?name=" + name + "&page=" + curPage;
     	  window.location.replace(newUrl); 
	           
       }
	 });
}

$(document).ready(function (){
	$('.form_date').click(function(){
		$('.dropdown-menu').css("width","300px");
		$('.table-condensed').css("width","300px");;
		
	});
	$('.datetimepicker').css("width","300px");
	$('.table-condensed').css("width","300px");
	$(".form_date").datetimepicker({format: 'yyyy-mm-dd hh:ii',todayBtn:  1,autoclose: 1,});
	
	
});