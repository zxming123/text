$(function(){
	$(".product-select li").click(function(){
		$(this).parent().find(".select-focus").removeClass("select-focus");
		$(this).addClass("select-focus");
	});
	
	
	$("#timerun").click(function(){
		var id;
		var time = $("#starttime").val();
		var frequency = $("#pinlv .select-focus").attr("var");
		var data={};
		var bid=1;
		data["id"]=id;
		if(time==""){
			alert("请输入启动时间！");
		}
		else{
			$.ajax({
			 	type: "POST",
	            url: ctx+'/datamanage/timerun',
	            data:data,
	            dataType : "json",
	            error: function () {
	            },
	            success: function (result) {
	            	console.log(result);
	            	var state = result.state;
	            	alert(state) ;
//	            	window.location.replace(ctx+"/source/all");
	            }
		 });
		}
		
	});
	
});
