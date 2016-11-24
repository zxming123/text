$(function(){
		 	var totalPageNum=$("#totalPage").val();
	 	 	var curPage=$("#currentPage").val();
	 	 	var size=$("#pageSize").val();
	 	 	var ctx=$("#ctx").html();
	 	 	var web = $("#wid").val();
	 	 	var spider = $("#sid").val();
	 	 	var state = $("#state").val();
	 	 	var url=ctx+"/spider/spiderInfoList?web=" + web + "&spider=" + spider + "&state=" + state + "&page=";
	 	 	if (totalPageNum > 1)
	 	 	{initPage(url,totalPageNum,parseInt(curPage),10);}
	 	 	else
	 	 	{$('.pagination').hide();}
	 	 	
	 	 	
	 	 	
	 	 	$("#web").change(function(){
	 			var ctx=$("#ctx").html();
	 			var web = $("#web").val();
	 			$("#spider").empty();
	 			$("#spider").append("<option value=\"0\">全部</option>")
	 			
	 			var url = ctx + "/spider/getSpiderByWeb";
	 			
	 			$.ajax({
	 				 type: "POST",
	 		          url: url,
	 		          data: {web:web},
	 		          dataType : "json",
	 		          async:false,
	 		          error: function (XMLHttpRequest, textStatus, errorThrown) {
	 		        	  
	 		        	 alert(XMLHttpRequest.status);
	 		        	alert(XMLHttpRequest.readyState);
	 		        	alert(textStatus);
	 		          },
	 		          success: function (result) {
	 		        	  for(x in result.spiders){
	 		        		  $("#spider").append("<option value = \"" + result.spiders[x].id + "\">" + result.spiders[x].nickName + "</option>");
	 		        	  }
	 		        	  
	 		        	  
	 			           
	 		          }
	 			 });
	 			
	 		});
		 });

function getLogResult(url){
		window.open (url,'log','height=600,width=800,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,status=no');
	}


