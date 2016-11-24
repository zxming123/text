

var ctx=$('#ctx').html();
function remove_pic(obj,item)
{
	var pid=$('input[name="pid"]').val();
	var ctx=$('#ctx').html();
	$.ajax({
		 type: "POST",
           url: ctx+'/admin/product/delImg',
           data: {
        	   pid:pid,
        	   type:item
           },
           dataType : "json",
           error: function () {
           },
           success: function (result) {
           	console.log(result);
           	$(obj).parent().find("img").hide();
           	$(obj).parent().find("br").hide();
           }
	 });
}

$(function(){
		var ctx=$('#ctx').html();
		var tempId_gudong=1;
		$("#add_gudong").click(function(){
				var html="<tr>"+
					  		"<td id=\"gdname\" tmpvalue=\""+tempId_gudong+"\"><input name=\"name\" placeholder=\"股东名称\"/></td>"+
					  		"<td id=\"gdtype\" ><input name=\"type\" placeholder=\"股东类型\"/></td>"+
					  		"<td id=\"gdcertificateType\" ><input name=\"certificate_type\" placeholder=\"证件类型\"/></td>"+
					  		"<td id=\"gdcertificate\" ><input name=\"certificate\" placeholder=\"证件号\"/></td>"+
					  		"<td id=\"gdoccupiesCompared\" ><input name=\"occupies_compared\" placeholder=\"股东占比\"/></td>"+
					  		"<td id=\"gdregisteredCapital\" ><input name=\"registered_capital\" placeholder=\"股东注册资本\"/></td>"+
					  		"<td id=\"gdposition\" ><input name=\"position\" placeholder=\"股东职位\"/></td>" +
					  		"<td>"+
					  			"<button class=\"btn btn-warning remove_item\"><span class=\"glyphicon glyphicon-trash\"></span>&nbsp;删除</button>"+
					  			"<button class=\"btn btn-primary add_item show\" style=\"margin-left:2px;\"><span class=\"glyphicon glyphicon-edit\"></span>&nbsp;保存</button>"+
					  			"<button class=\"btn btn-primary edit_item hide\" style=\"margin-left:2px;\"><span class=\"glyphicon glyphicon-edit\"></span>&nbsp;修改</button>"+
					  		"</td>"+
					  	"</tr>";
				$("#gudong_tbody").append(html);
				tempId_gudong++;
				//addChange();
		});
			
		$("#gudong_table").on("click",".remove_item",function(){
				//parent.remove();
				try{
					
					var parent=$(this).parent().parent();
					var gudong_id=$(parent).attr("value");
					if(gudong_id==null){
						parent.remove();
					}else{
						//ajax 删除高管
						parent.remove();
						 $.ajax({
							 type: "POST",
					            url: ctx+'/admin/product/delstockholder',
					            data: {sid:gudong_id},
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
		$("#gudong_table").on("click",".edit_item",function(){
			//edit
			var parent=$(this).parent().parent();
			var name=$(parent).find("#gdname").html();
			$(parent).find("#gdname").html("<input name=\"name\" placeholder=\"股东名称\" value=\""+name+"\">");
			var type=$(parent).find("#gdtype").html();
			$(parent).find("#gdtype").html("<input name=\"type\" placeholder=\"股东类型\"value=\""+type+"\">");
			var certificate=$(parent).find("#gdcertificate").html();
			$(parent).find("#gdcertificate").html("<input name=\"certificate\" placeholder=\"证件号\"value=\""+certificate+"\">");
			var certificate_type=$(parent).find("#gdcertificateType").html();
			$(parent).find("#gdcertificateType").html("<input name=\"certificate_type\" placeholder=\"证件类型\"value=\""+certificate_type+"\">");
			var occupies_compared=$(parent).find("#gdoccupiesCompared").html();
			$(parent).find("#gdoccupiesCompared").html("<input name=\"occupies_compared\" placeholder=\"股东占比\"value=\""+occupies_compared+"\">");
			var registered_capital=$(parent).find("#gdregisteredCapital").html();
			$(parent).find("#gdregisteredCapital").html("<input name=\"registered_capital\" placeholder=\"股东注册资本\"value=\""+registered_capital+"\">");
			var position=$(parent).find("#gdposition").html();
			$(parent).find("#gdposition").html("<input name=\"position\" placeholder=\"股东职位\"value=\""+position+"\">");
			$(parent).find(".add_item").removeClass("hide");
			$(parent).find(".edit_item").removeClass("show");
			$(parent).find(".add_item").removeClass("show");
			$(parent).find(".edit_item").removeClass("hide");
			$(parent).find(".add_item").addClass("show");
			$(parent).find(".edit_item").addClass("hide");	
			return false;
			
	});
		$("#gudong_table").on("click",".add_item",function(){
			var parent=$(this).parent().parent();
			var gudong_id=$(parent).attr("value");
			if(gudong_id!=null){
				//ajax 删除高管
				 $.ajax({
					 type: "POST",
			            url: ctx+'/admin/product/delstockholder',
			            data: {sid:gudong_id},
			            dataType : "json",
			            error: function () {
			            },
			            success: function (result) {
			            	console.log(result);
			            }
				 });
			}
				//parent.remove();
				try{
					
					var pid=$('input[name="pid"]').val();
					if(pid==null) return false;
					var parent=$(this).parent().parent();
					var name=$(parent).find("input[name='name']").val();
					var type=$(parent).find("input[name='type']").val();
					var certificate=$(parent).find("input[name='certificate']").val();
					var certificate_type=$(parent).find("input[name='certificate_type']").val();
					var occupies_compared=$(parent).find("input[name='occupies_compared']").val();
					var registered_capital=$(parent).find("input[name='registered_capital']").val();
					var position=$(parent).find("input[name='position']").val();
					
					var data={};
					data["pid"]=pid;
					data["name"]=name;
					data["type"]=type;
					data["certificate"]=certificate;
					data["certificate_type"]=certificate_type;
					data["occupies_compared"]=occupies_compared;
					data["registered_capital"]=registered_capital;
					data["position"]=position;
					
					$.ajax({ 
						
						type: "POST",
			            url: ctx+'/admin/product/addstockholder',
			            data: data,
			            dataType : "json",
			            error: function () {
			            },
						success: function (data) {
							console.log(data);
							var state = data.state;
							var stockholder=data.stockholder;
							if (state==1)
							{
								alert("保存失败");
							}
							else if (state==0)
							{
								$(parent).attr("value",stockholder.id);
								$(parent).find("input[name='name']").remove();
								$(parent).children().eq(0).html(stockholder.name);
								$(parent).find("input[name='type']").remove();
								$(parent).children().eq(1).html(stockholder.type);
								$(parent).find("input[name='certificate_type']").remove();
								$(parent).children().eq(2).html(stockholder.certificateType);
								$(parent).find("input[name='certificate']").remove();
								$(parent).children().eq(3).html(stockholder.certificate);
								$(parent).find("input[name='occupies_compared']").remove();
								$(parent).children().eq(4).html(stockholder.occupiesCompared);
								$(parent).find("input[name='registered_capital']").remove();
								$(parent).children().eq(5).html(stockholder.registeredCapital);
								$(parent).find("input[name='position']").remove();
								$(parent).children().eq(6).html(stockholder.position);
								$(parent).find(".add_item").removeClass("hide");
								$(parent).find(".edit_item").removeClass("show");
								$(parent).find(".add_item").removeClass("show");
								$(parent).find(".edit_item").removeClass("hide");
								$(parent).find(".add_item").addClass("hide");
								$(parent).find(".edit_item").addClass("show");	

							}
							
							else
							{
								alert("bug!!");
							}
						},
					});
				}catch(err){
					console.log(err);
				}
				return false;
		});
});
$(function(){
	var ctx=$('#ctx').html();
	var tempId_partner=1;
	$("#add_partner").click(function(){
		var html="<tr>"+
			  		"<td tmpvalue=\""+tempId_partner+"\"><input name=\"name\" placeholder=\"合作伙伴名称\"/></td>"+
			  		"<td><select name=\"type\" class=\"form-control select_input\" >"+
					"<option value=\"传统金融机构\">传统金融机构</option>\<option value=\"第三方支付\">第三方支付</option>\<option value=\"风险投资机构\">风险投资机构</option>\<option value=\"其他金融从业公司\">其他金融从业公司</option>\<option value=\"财经信息门户网站\">财经信息门户网站</option>\<option value=\"法律支持\">法律支持</option>\<option value=\"技术支持\">技术支持</option>\<option value=\"研究机构\">研究机构</option>\<option value=\"综合媒体\">综合媒体</option>\<option value=\"相关细分行业公司\">相关细分行业公司</option>\</select></td>"+
			  		"<td>"+
			  			"<button class=\"btn btn-warning remove_item\"><i class=\"glyphicon glyphicon-trash\"></i>&nbsp;删除</button>"+
			  			"<button class=\"btn btn-primary add_item\" style=\"margin-left:2px;\"><span class=\"glyphicon glyphicon-edit\"></span>&nbsp;保存</button>"+
			  		"</td>"+
			  	"</tr>";
		$("#partner_tbody").append(html);
		tempId_partner++;
		//addChange();
	});
	
	$("#partner_table").on("click",".remove_item",function(){
		//parent.remove();
		try{
			
			var parent=$(this).parent().parent();
			var partner_id=$(parent).attr("value");
			if(partner_id==null){
				parent.remove();
			}else{
				//ajax 删除高管
				parent.remove();
				 $.ajax({
					 type: "POST",
			            url: ctx+'/admin/product/delPartner',
			            data: {"id":partner_id},
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
	$("#partner_table").on("click",".edit_item",function(){
		 
		//edit
		var parent=$(this).parent().parent();
		var name=$(parent).find("#partner_name").html();
		$(parent).find("#partner_name").html("<input name=\"name\" placeholder=\"名称\" value=\""+name+"\">");
		var type=$(parent).find("#partner_style").html();
		$(parent).find("#partner_style").html("<select name=\"type\" class=\"form-control select_input\" >"+
					"<option value=\"传统金融机构\">传统金融机构</option>\<option value=\"第三方支付\">第三方支付</option>\<option value=\"风险投资机构\">风险投资机构</option>\<option value=\"其他金融从业公司\">其他金融从业公司</option>\<option value=\"财经信息门户网站\">财经信息门户网站</option>\<option value=\"法律支持\">法律支持</option>\<option value=\"技术支持\">技术支持</option>\<option value=\"研究机构\">研究机构</option>\<option value=\"综合媒体\">综合媒体</option>\<option value=\"相关细分行业公司\">相关细分行业公司</option>\</select>");
		
		$(parent).find(".edit_save_item").removeClass("hide");
		$(parent).find(".edit_item").removeClass("show");
		$(parent).find(".edit_save_item").removeClass("show");
		$(parent).find(".edit_item").removeClass("hide");
		$(parent).find(".edit_save_item").addClass("show");
		$(parent).find(".edit_item").addClass("hide");	
		return false;
	});
	$("#partner_table").on("click",".edit_save_item",function(){
		 
		
		try{
			
			var pid=$('input[name="pid"]').val();
			if(pid==null) return false;
			var parent=$(this).parent().parent();
			var partner_id=$(parent).attr("value");
			var name=$(parent).find("input[name='name']").val();
			var type=$(parent).find("select[name='type']").val();
		
			var data={};
			data["pid"]=pid;
			data["id"]=partner_id;
			data["name"]=name;
			data["type"]=type;
			$.ajax({ 
				
				type: "POST",
	            url: ctx+'/admin/product/updatePartner',
	            data: data,
	            dataType : "json",
	            error: function () {
	            },
				success: function (data) {
					 
					console.log(data);
					var state = data.state;
					var partner=data.partner;
					if (state==0)
					{
						alert("保存失败");
					}
					else if (state==1)
					{
						
						$(parent).find("input[name='name']").remove();
						$(parent).children().eq(0).html(partner.name);
						$(parent).find("select[name='type']").remove();
						$(parent).children().eq(1).html(partner.style);
						$('.add_item').hide();
						$(parent).find(".edit_save_item").removeClass("hide");
						$(parent).find(".edit_item").removeClass("show");
						$(parent).find(".edit_save_item").removeClass("show");
						$(parent).find(".edit_item").removeClass("hide");
						$(parent).find(".edit_save_item").addClass("hide");
						$(parent).find(".edit_item").addClass("show");	

					}
					else if (state==2)
					{
						
						alert("已经存在相同名称的合作伙伴！");

					}
					else
					{
						alert("bug!!");
					}
				},
			});
		}catch(err){
			console.log(err);
		}
		return false;
	});
	$("#partner_table").on("click",".add_item",function(){
		 
			
		try{
			
			var pid=$('input[name="pid"]').val();
			if(pid==null) return false;
			var parent=$(this).parent().parent();
			var name=$(parent).find("input[name='name']").val();
			var type=$(parent).find("select[name='type']").val();
		
			var data={};
			data["pid"]=pid;
			data["name"]=name;
			data["type"]=type;
			$.ajax({ 
				
				type: "POST",
	            url: ctx+'/admin/product/addPartner',
	            data: data,
	            dataType : "json",
	            error: function () {
	            },
				success: function (data) {
					 
					console.log(data);
					var state = data.state;
					var partner=data.partner;
					if (state==0)
					{
						alert("保存失败");
					}
					else if (state==1)
					{
						
						$(parent).find("input[name='name']").remove();
						$(parent).children().eq(0).html(partner.name);
						$(parent).find("select[name='type']").remove();
						$(parent).children().eq(1).html(partner.style);
						$('.add_item').hide();

					}
					else if (state==2)
					{
						
						alert("已经存在相同名称的合作伙伴！");

					}
					else
					{
						alert("bug!!");
					}
				},
			});
		}catch(err){
			console.log(err);
		}
		return false;
	});
});
$(function(){
	var ctx=$('#ctx').html();
	var tempId_association=1;
	$("#add_association").click(function(){
		var html="<tr>"+
			  		"<td tmpvalue=\""+tempId_association+"\"><input name=\"name\" placeholder=\"协会名称\"/></td>"+
			  		"<td>"+
			  			"<button class=\"btn btn-warning remove_item\"><i class=\"glyphicon glyphicon-trash\"></i>&nbsp;删除</button>"+
			  			"<button class=\"btn btn-primary add_item\" style=\"margin-left:2px;\"><i class=\"glyphicon glyphicon-edit\"></i>&nbsp;保存</button>"+
			  		"</td>"+
			  	"</tr>";
		$("#association_tbody").append(html);
		tempId_association++;
		//addChange();
	});
	
	$("#association_table").on("click",".remove_item",function(){
		//parent.remove();
		try{
			
			var parent=$(this).parent().parent();
			var association_id=$(parent).attr("value");
			if(association_id==null){
				parent.remove();
			}else{
				//ajax 删除高管
				parent.remove();
				 $.ajax({
					 type: "POST",
			            url: ctx+'/admin/product/delFinAss',
			            data: {id:association_id},
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
	$("#association_table").on("click",".add_item",function(){
		 
		//parent.remove();
		try{
			
			var pid=$('input[name="pid"]').val();
			if(pid==null) return false;
			var parent=$(this).parent().parent();
			var name=$(parent).find("input[name='name']").val();
		
			var data={};
			data["pid"]=pid;
			data["name"]=name;
			
			$.ajax({ 
				
				type: "POST",
	            url: ctx+'/admin/product/addFinAss',
	            data: data,
	            dataType : "json",
	            error: function () {
	            },
				success: function (data) {
					console.log(data);
					var state = data.state;
					var association=data.association;
					if (state==0)
					{
						alert("保存失败");
					}
					if (state==2)
					{
						alert("重复");
					}
					else if (state==1)
					{
						
						$(parent).find("input[name='name']").remove();
						$(parent).children().eq(0).html(association.name);
						$('.add_item').hide();

					}
					
					else
					{
						alert("bug!!");
					}
				},
			});
		}catch(err){
			console.log(err);
		}
		return false;
	});
});