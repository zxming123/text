
function initPage(url,totalPageNum,curPage,size){
		
 		var temp=1;
 		
 		while(temp <= size){
 			var pre=temp-1;
 			if($(("#page_li_"+temp)).html()==null){
 				var html="<li id=\"page_li_"+temp+"\"><a id=\"page"+temp+"\" href=\"javascript:void(0)\" onclick=\"changePage()\">"+temp+"</a></li>"
 				$("#page_li_"+pre).after(html); 

 			}
 			
 			
 			temp++;
 		}
 	 	
 	 	$("#firstPage").attr("var",0);
 	 	$("#lastPage").attr("var",totalPageNum-1);
 	 	$("#firstPage").attr("href",url+"0");
 	 	$("#lastPage").attr("href",url+(totalPageNum-1));
 	 	if(curPage>0){
 	 		$("#pre").attr("var",curPage-1);
 	 		$("#pre").attr("href",url+(curPage-1));
 	 	}else {
 	 		$("#pre").attr("var",0);
 	 		$("#pre").attr("href",url+(0));
 	 	}
 	 	if(curPage<totalPageNum-1){
 	 		$("#next").attr("var",curPage+1);
 	 		$("#next").attr("href",url+(curPage+1));
 	 	}else{
 	 		$("#next").attr("var",totalPageNum-1);
 	 		$("#next").attr("href",url+(totalPageNum-1));
 	 	}
 	 	
 	 	
 	 	if(totalPageNum<=size){
 	 		var i=0;
 	 		var pos=1;
 	 		while(i<totalPageNum){
 	 			if(i!=curPage){
 	 				console.log(i+1);
 	 			}
 	 			else{
 	 				console.log("cur "+(i+1));
 	 				$("#page_li_"+(pos)).addClass("active");
 	 			}
 	 			$("#page"+(i+1)).attr("var",i);
 	 			$("#page"+(i+1)).attr("href",url+(i));
 	 			$("#page"+(i+1)).html(i+1);
 	 			i++;
 	 			pos++;
 	 		}
 	 		while(i<size){ //4
 	 			i++;
 	 			$("#page_li_"+(i)).css("display","none");
 	 		}
 	 		return;
 	 	}else{
 	 		var i=1;
 	 		while(i<=size){ //4
 	 			$("#page_li_"+(i)).removeAttr("style");
 	 			i++;
 	 		}
 	 	}
 	 	if(curPage-1>=0){
 	 		if(curPage+(size-2)>=totalPageNum){
 	 			//alert(curPage);
 	 			var i=totalPageNum;
 	 			var pos=size; //4
 	 			while(i>totalPageNum-size){
 	 				if((i-1)!=curPage){
 	 	 				console.log(i-1);
 	 	 			}
 	 	 			else{
 	 	 				console.log("cur "+(i-1));
 	 	 				$("#page_li_"+(pos)).addClass("active");
 	 	 			}
 	 				console.log(i);
 	 				$("#page"+(i-totalPageNum+size)).attr("var",i-1);
 	 				$("#page"+(i-totalPageNum+size)).attr("href",url+(i-1));
 	 	 			$("#page"+(i-totalPageNum+size)).html(i);
 	 				i--;
 	 				pos--;
 	 			}
 	 			return;
 	 		}
 	 		var i=-1;
 	 		var pos=1;
 	 		while(i<=size-2){
 	 			
 	 			console.log(curPage+i);
 	 			$("#page"+(i+2)).attr("var",curPage+i);
 	 			$("#page"+(i+2)).attr("href",url+(curPage+i));
	 	 		$("#page"+(i+2)).html(curPage+i+1);
 	 			i++;
 	 		}
 	 		
 	 		$("#page_li_2").addClass("active");
 	 		return;
 	 		
 	 	}
 	 	else{
 	 		var i=0;
 	 		while(i<=size-1){
 	 			console.log(curPage+i);
 	 			$("#page"+(i+1)).attr("var",curPage+i);
 	 			$("#page"+(i+1)).attr("href",url+(curPage+i));
	 	 		$("#page"+(i+1)).html(curPage+i+1);
 	 			i++;
 	 		}
 	 		$("#page_li_1").addClass("active");
 	 		
 	 	}
 	 	
 	}
 
 	//sArgName表示要获取哪个参数的值 
 	 function GetArgsFromHref(sArgName) 
 	 { 
 		 var sHref = window.location.href; 
 		//CuPlayer.com提示：测试数据 
 		//实际情况是用window.location.href得到URL 
 		var args = sHref.split("?"); 
 		var retval = ""; 
 		if(args[0] == sHref) /*参数为空*/ 
 		{
 			return retval; /*CuPlayer.com提示：无需做任何处理*/ 
 		} 
 		var str = args[1]; 
 		args = str.split("&"); 
 		for(var i = 0; i < args.length; i++ ) 
 		{ 
 		str = args[i]; 
 		var arg = str.split("="); 
 		if(arg.length <= 1) continue; 
 		if(arg[0] == sArgName) retval = arg[1]; 
 		} 
 		return retval; 
 	}