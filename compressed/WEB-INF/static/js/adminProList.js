$(function(){
	$("#plat_ul").show();
		 	var totalPageNum=Math.ceil(parseInt($("#total").html())/25);
	 	 	var curPage=$("#page").html();
	 	 	var size=4;
	 	 	var ctx=$("#ctx").html();
	 	 	var url=ctx+"/admin/product/list?page=";
	 	 	if(GetArgsFromHref("keyword")!="")
	 	 	{
	 	 		document.getElementById("keyword").value=decodeURI(GetArgsFromHref("keyword"));
	 	 		url=ctx+"/admin/product/list?keyword="+GetArgsFromHref("keyword")+"&page=";
	 	 	}
	 	 	if ($("#total").html()!='0')
	 	 	{initPage(url,totalPageNum,parseInt(curPage),size);}
	 	 	else
	 	 	{$('.pagination').hide();}
		 });
function search(){
		var ctx=$("#ctx").html();
		 var tmp=ctx+"/admin/product/list?keyword="+$("#keyword").val()+"&page=0";
		 window.location.href=tmp;
	}
	 