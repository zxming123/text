$(function(){
			$("#add_ziduan").click(function(){
				var html="<tr>"+
					  		
					  		"<td id=\"zdname\"><input type=\"text\" class=\"form-control \" id=\"cname\" placeholder=\"\" name=\"cname\" </td>"+
					  		"<td id=\"zdtype\"><select class=\"form-control \" name=\"type\"><option value=\"int\">int</option><option value=\"double\">double</option><option value=\"string\">string</option><option value=\"date\">date</option></select></td>"+
					
					  		"<td id=\"ifnull\"><select class=\"form-control \" id=\"isnull\" name=\"isnull\" ><option value=\"0\">可空</option><option value=\"1\">不可</option></select></td>"+
					  		"<td>"+
					  			"<button  class=\"btn btn-warning remove_ziduan\"><span class=\"glyphicon glyphicon-trash \"></span>&nbsp;删除</button>"+"&nbsp"+
					  			"<button class=\"btn btn-primary add_ziduan \"  ><span class=\"glyphicon glyphicon-edit\"></span>&nbsp;保存</button>"+
					  		"</td>"+
					  		"<td style=\"display:none\"><input  value=\"0\" name=\"fid\"></div></td>"+
					  	"</tr>";
				$("#ziduan_tbody").append(html);
				
				//addChange();
		});
			$("#ziduan_tbody").on("click",".remove_ziduan",function(){
				//parent.remove();
				try{
					
					var parent=$(this).parent().parent();	
					var fid=$(parent).find("input[name='fid']").val();
					
					parent.remove();
					$.ajax({
						 	type: "POST",
				            url: ctx+'/source/delete/ziduan',
				            data: {id:fid},
				            dataType : "json",
				            error: function () {
				            },
				            success: function (result) {
				            	console.log(result);
				            	var state = result.state;
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
		
			$("#ziduan_tbody").on("click",".add_ziduan",function(){
				
				try{
					
					var parent=$(this).parent().parent();
					var cname=$(parent).find("input[name='cname']").val();
					var type=$(parent).find("select[name='type']").val();
					var tid = $("#tide").val();
			
					var isnull=$(parent).find("select[name='isnull']").val();			
					var expand=$("#tbname").val();
				
					var data={};
					var bid=1;
					data["tid"]=tid;
					data["cname"]=cname;
					data["type"]=type;
					data["isnull"]=isnull;
					data["expand"]=expand;
				
					if(cname==""){
						alert("请输入字段名！");
					}
					else{
						
							$.ajax({
							 	type: "POST",
					            url: ctx+'/source/save/ziduan',
					            data:data,
					            dataType : "json",
					            error: function () {
					            },
					            success: function (result) {
					            	console.log(result);
					            	var state = result.state;
					            	var myfid = result.af.fid;
					            	
					            	if(state==1){
					            		alert("保存成功!") ;
					            		$(parent).find("input[name='fid']").val(myfid);
					            		;
					            		
					            	}
					            	else{
					            		alert("保存失败！") ;
					            	}
//					            	window.location.replace(ctx+"/source/all");
					            }
						 });
						
						
					}
					
					
				}catch(err){
					
				}
				return false;
		});
			
			$(".select_input").each(function(){
				var org=($(this).attr("orgvalue"));
				if(org!=null){
					var target=$(this).find("[value=\""+org+"\"]");
					target.attr("selected","true");
				}
				//alert($(this).find("option:selected").val());
			});
})