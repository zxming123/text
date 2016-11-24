  $(document).ready(function () { 
	  var ctx=$('#ctx').html();
	  $("#plat_ul").show();
	  $(".detailTextArea").cleditor();
	  $('.form_date').click(function(){
			$('.dropdown-menu').css("width","300px");
			$('.table-condensed').css("width","300px");;
			
	  });
	  $('.datetimepicker').css("width","300px");
	  $('.table-condensed').css("width","300px");
	  $(".form_date").datetimepicker({format: 'yyyy-mm-dd',autoclose:true,language: 'zh-CN',
		        weekStart: 1,
		        todayBtn:  1,
				autoclose: 1,
				todayHighlight: 1,
				startView: 2,
				minView: 2,
				forceParse: 0}).on('changeDate', function(ev){
			 //alert("fch");   
			});
	  $("#gaoguang_table").on("click",".remove_item",function(){
			//parent.remove();
			try{
				
				var parent=$(this).parent().parent();
				var ggid=$(parent).attr("value");
				if(ggid==null){
					parent.remove();
				}else{
					//ajax 删除高管
					parent.remove();
					 $.ajax({
						 type: "POST",
				            url: ctx+'/admin/product/delbus',
				            data: {id:ggid},
				            dataType : "json",
				            error: function () {
				            },
				            success: function (result) {
				            	console.log(result);
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
	$(".tagbutton").each(function(){
				var org=($(this).attr("tagvalue"));
				if(org == 1){
					$(this).addClass("btn-primary");
				}
			});
	$(".tagbutton").click(function(){
				var org=($(this).attr("tagvalue"));
				var name=($(this).attr("id"));
				var parent=$(this).parent().parent();
				var input = "input[name=\'" + name + "\']";
				if(org == 1){
					$(this).removeClass("btn-primary");
					$(this).attr("tagvalue","0");
					$(parent).find(input).val("0");
				}
				else{
					$(this).addClass("btn-primary");
					$(this).attr("tagvalue","1");
					$(parent).find(input).val("1");
				}
				
				//alert($(parent).find(input).val());
			});
	$("#safecert").click(function(){
				$("#safecert_info").empty();
				var type = $("#safecert").val();
				
				if(type == 0){ 
					$("#slist0").show();
					$("#slist1").hide();
					$("#slist2").hide();
					
				}
				else if(type == 1){
					$("#slist0").hide();
					$("#slist1").show();
					$("#slist2").hide();
				}
				else{
					$("#slist0").hide();
					$("#slist1").hide();
					$("#slist2").show();
				}
			});
	$("#addsafe").click(function(){
				var pid=$('input[name="pid"]').val();
				var type = $("#safecert").val();
	    		var select;
	    		if(type == 0){ 
	    			select=$("#slist0");
				}
				else if(type == 1){
					select=$("#slist1");
				}
				else{
					select=$("#slist2");
				}
				var cid=select.val();
				
	
				 $.ajax({
					 type: "POST",
			            url: ctx+'/admin/product/addSafeCert',
			            data: {"pid":pid,"cid":cid},
			            dataType : "json",
			            error: function () {
			            },
			            success: function (result) {
			            	
			            	var state = result.state;
			            	if(state == 1){
			            		sc=result.sc;
			            		if (sc.logo==null)sc.logo="";
			            		if (sc.score==null)sc.score="";
			            		var trhtml="<tr class='";
			            		if (result.sc.type==0)
			            		{trhtml+="warning";}
			            		else if (result.sc.type==1)
			            		{trhtml+="success";}
			            		else
			            		{trhtml+="danger";}
			            		trhtml+="'><td style='display:none' id='safe"+result.sc.id;
			            		trhtml+="'>"+result.srp.id+"</td><td>"+result.sc.name+"</td><td>";
			            		if (result.sc.type==0)
			            		{trhtml+="信用检测";}
			            		else if (result.sc.type==1)
			            		{trhtml+="技术检测";}
			            		else
			            		{trhtml+="工商网监网警";}
			            		trhtml+="</td><td>"+sc.logo+"</td><td>"+sc.score+"</td></tr>";
			            		console.log(trhtml);
			            		$('#srp').append(trhtml);
			            		
			            	}
			            	else if(state == 0){
			            		alert("添加失败");
			            	}else{
			            		alert("重复添加");
			            	}
			            }
				 });
				 return false;
		});
	$("#delsafe").click(function(){
		var type = $("#safecert").val();
		var select;
		if(type == 0){ 
			select=$("#slist0");
		}
		else if(type == 1){
			select=$("#slist1");
		}
		else{
			select=$("#slist2");
		}
		var cid=select.val();
		var id=$("#safe"+cid).html();
		if (id!=null)
		{
		 $.ajax({
			 type: "POST",
	            url: ctx+'/admin/product/delsafe',
	            data: {"id":id},
	            dataType : "json",
	            error: function () {
	            },
	            success: function (result) {
	            	
	            	var state = result.state;
	            	if(state == 0){
	            		$("#safe"+cid).parent().remove();
	            	}
	            	else{
	            		alert("删除失败");
	            	}
	            }
		 });}
		else 
		{
			alert("该平台没有这个安全认证！");
		}
		return false;
	});
  });


