$(function(){
	
			$("#add_ziduan").click(function(){
				var mid=$("#mid").val();
				
				$.ajax({
				 	type: "POST",
		            url: ctx+'/config/fields_xiala_ajax',
		            data:{mid:mid},
		            dataType : "json",
		            error: function () {
		            },
		            success: function (result) {
		            	console.log(result);
		            	
		            	var html="<tr>"+
						"<td id=\"fromziduan\"><select class=\"form-control select_input\" name=\"fromziduan2\" orgvalue=\"\">";
		            	for (var i = 0; i < eval(result["fiels_list_for_from"]).length; i++) {  
		            		
		            		var product=eval(result["fiels_list_for_from"]);	                     	
	                     	var product2=product[i];
	                     	
	                      	html +="<option value="+product2.fid+">"+product2.cname+"</option>";
	                      
	                      	
		            	}
		            	html +="</select></td>"+"<td id=\"toziduan\"><select class=\"form-control select_input\"  name=\"toziduan\" orgvalue=\"\">";
		            	for (var i = 0; i < eval(result["fiels_list_for_to"]).length; i++) {  
	                      	var product=eval(result["fiels_list_for_to"]);
	                      	product=product[i];
	                      	html +="<option value="+product["fid"]+">"+product["cname"]+"</option>";
	                      	
		            	}
		            	html +="</select></td>"+
				  		"<td>"+
			  			"<button  class=\"btn btn-warning remove_ziduan1\"><span class=\"glyphicon glyphicon-trash \"></span>&nbsp;删除</button>"+"&nbsp"+
			  			"<button class=\"btn btn-primary add_ziduan1 \"  ><span class=\"glyphicon glyphicon-edit\"></span>&nbsp;保存</button>"+
			  			"</td>"+
			  			"<td style=\"display:none\"><input  value=\"\" name=\"id\"></div></td>"
			  			"</tr>";
		            	$("#ziduan_tbody").append(html);
		       
		            }
			 });
				
		

		});
			
			$("#add_ziduan2").click(function(){
				var mid=$("#mid").val();
				
				$.ajax({
				 	type: "POST",
		            url: ctx+'/config/fields_xiala_ajax',
		            data:{mid:mid},
		            dataType : "json",
		            error: function () {
		            },
		            success: function (result) {
		            	console.log(result);
		            	
		            	var html="<tr>"+
						"<td id=\"fromziduan\"><select class=\"form-control select_input\" name=\"fromziduan\" orgvalue=\"\">";
		            	for (var i = 0; i < eval(result["fiels_list_for_from"]).length; i++) {  
		            		
		            		var product=eval(result["fiels_list_for_from"]);	                     	
	                     	var product2=product[i];
	                     	
	                      	html +="<option value="+product2.fid+">"+product2.cname+"</option>";
	                      
	                      	
		            	}
		            	html +="</select></td>"+
		            	"<td id=\"fromtype\"><select class=\"form-control select_input\" name=\"fromtype\" orgvalue=\"\">"+
        	  			"<option value=\"0\">常量</option><option value=\"1\">变量</option>"+
        	  			"</select></td>"+
        	  			"<td id=\"fromconstant\"><input class=\"form-control \" name=\"fromconstant\" value=\"\"></td>"+
	        	  		
		            	
		            	
		            	"<td id=\"toziduan\"><select class=\"form-control select_input\"  name=\"toziduan\" orgvalue=\"\">";
		            	for (var i = 0; i < eval(result["fiels_list_for_to"]).length; i++) {  
	                      	var product=eval(result["fiels_list_for_to"]);
	                      	product=product[i];
	                      	html +="<option value="+product["fid"]+">"+product["cname"]+"</option>";
	                      	
		            	}
		            	html +="</select></td>"+
				  		"<td>"+
			  			"<button  class=\"btn btn-warning remove_ziduan2\"><span class=\"glyphicon glyphicon-trash \"></span>&nbsp;删除</button>"+"&nbsp"+
			  			"<button class=\"btn btn-primary add_ziduan2 \"  ><span class=\"glyphicon glyphicon-edit\"></span>&nbsp;保存</button>"+
			  			"</td>"+
			  			"<td style=\"display:none\"><input  value=\"\" name=\"id\"></div></td>"
			  			"</tr>";
		            	$("#ziduan_tbody2").append(html);
		            	
		       
		            }
			 });
				
		

		});
			
			$(".select_input").each(function(){
				var org=($(this).attr("orgvalue"));
				if(org!=null){
					var target=$(this).find("[value=\""+org+"\"]");
					target.attr("selected","true");
				}
				//alert($(this).find("option:selected").val());
			});
			
			
			
			
			$("#ziduan_tbody").on("click",".remove_ziduan1",function(){
				//parent.remove();
				try{
					
					var parent=$(this).parent().parent();	
					var id=$(parent).find("input[name='id']").val();
					
					parent.remove();
					$.ajax({
						 	type: "POST",
				            url: ctx+'/config/delete_map_field',
				            data: {id:id},
				            dataType : "json",
				            error: function () {
				            },
				            success: function (result) {
				            	console.log(result);
				            	var state = result.status;
				            	if(state==1){
				            		alert("删除成功!") ;
				            		
				            	}
				            	else{
				            		alert("删除失败！") ;
				            	}
				            }
					 });
					
				}catch(err){
					
				}
				return false;
		});
		
			$("#ziduan_tbody").on("click",".add_ziduan1",function(){
				
				try{
					
					var parent=$(this).parent().parent();
					var fromziduan=$(parent).find("select[name='fromziduan2']").val();			
					var mid = $("#tide").val();
			
					var toziduan=$(parent).find("select[name='toziduan']").val();			
					var id=$(parent).find("input[name='id']").val();
				
					var data={};
					var bid=1;
					data["mid"]=mid;
					data["fromid"]=fromziduan;
					data["toid"]=toziduan;
					data["id"]=id;					
							$.ajax({
							 	type: "POST",
					            url: ctx+'/config/save_map_field',
					            data:data,
					            dataType : "json",
					            error: function () {
					            },
					            success: function (result) {
					            	console.log(result);
					            	var state = result.status;
					            
					            	var myfid = result.map_fields.id;
					            	
					            	
					            	
					            	if(state==1){
					            		alert("保存成功!") ;
					            		$(parent).find("input[name='id']").val(myfid);
					            		;
					            		
					            	}
					            	else{
					            		alert("保存失败！") ;
					            	}
//					            	window.location.replace(ctx+"/source/all");
					            }
						 });
						
						
					
					
					
				}catch(err){
					
				}
				return false;
		});
			
			$("#ziduan_tbody2").on("click",".remove_ziduan2",function(){
				//parent.remove();
				try{
					
					var parent=$(this).parent().parent();	
					var id=$(parent).find("input[name='id']").val();
					
					parent.remove();
					$.ajax({
						 	type: "POST",
				            url: ctx+'/config/delete_map_conditions',
				            data: {id:id},
				            dataType : "json",
				            error: function () {
				            },
				            success: function (result) {
				            	console.log(result);
				            	var state = result.status;
				            	if(state==1){
				            		alert("删除成功!") ;
				            		
				            	}
				            	else{
				            		alert("删除失败！") ;
				            	}
				            }
					 });
					
				}catch(err){
					
				}
				return false;
		});
		
			$("#ziduan_tbody2").on("click",".add_ziduan2",function(){
				
				try{
					
					var parent=$(this).parent().parent();
					var fromziduan=$(parent).find("select[name='fromziduan']").val();			
					var mid = $("#tide").val();
					var id=$(parent).find("input[name='id']").val();
					var toziduan=$(parent).find("select[name='toziduan']").val();			
				
					var fromtype=$(parent).find("select[name='fromtype']").val();
					var fromconstant=$(parent).find("input[name='fromconstant']").val();
					
					var data={};
					var bid=1;
					data["mid"]=mid;
					data["id"]=id;
					data["fromid"]=fromziduan;
					data["toid"]=toziduan;
					data["constant"]=fromconstant;
					data["type"]=fromtype;
							$.ajax({
							 	type: "POST",
					            url: ctx+'/config/save_map_condition',
					            data:data,
					            dataType : "json",
					            error: function () {
					            },
					            success: function (result) {
					            	console.log(result);
					            	var state = result.status;
					            	var myfid = result.map_condition.id;
					            	
					            	if(state==1){
					            		alert("保存成功!") ;
					            		$(parent).find("input[name='id']").val(myfid);
					            		;
					            		
					            	}
					            	else{
					            		alert("保存失败！") ;
					            	}
//					            	window.location.replace(ctx+"/source/all");
					            }
						 });
				
				}catch(err){
					
				}
				return false;
		});
})