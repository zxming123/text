$(function(){

	$(".start").click(function(){
		try{
			var mid=($(this).attr("var"));
			var ctx=$("#lian").html();
		
			
			$.ajax({
				type: "POST",
	            url: ctx+'/config/data_process',
	            data:{mid:mid},
	            dataType : "json",
	            error: function () {
	            	alert("请求出错了！") ;
	            },
	            success: function (result) {
	            	
	            	var state = result.status;
	            	       	           	            	            	
	            	if(state==1){
	            		alert("处理成功!") ;
	            		
	            	}
	            	else if(state==0){
	            		alert("处理失败!") ;
	            		
	            	}
	            }	
				
			});
			
			alert("已启动....") ;
			
			
		}catch(err){
			
		}
		return false;		
});

	$(".process").click(function(){
		try{
			var mid=($(this).attr("var"));
			var ctx=$("#lian").html();
	
			
			$.ajax({
				type: "POST",
	            url: ctx+'/config/check_process_status',
	            data:{mid:mid},
	            dataType : "json",
	            error: function () {
	            	alert("请求出错了！") ;
	            },
	            success: function (result) {
	            	
	            	var state = result.process_status;
	                   	           	            	            	
	            	if(state==1){
	            		alert("已完成!") ;
	            		
	            	}
	            	else if(state==2){
	            		alert("中途失败!") ;
	            		
	            	}
	            	if(state==0){
	            		alert("正在运行中!") ;
	            		
	            	}
	            }	
				
			});
			
			
		}catch(err){
			
		}
		return false;		
});
	
	
})