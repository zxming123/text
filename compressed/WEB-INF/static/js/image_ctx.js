/**
 * 
 */
$(document).ready(function() {
});

$(function(){
	try{
		changeImageSrc();
	}catch(err){}
});

function changeImageSrc(){

	var ctx=$("ctx").attr("value"); //获得上下文路径ctx 工程目录
	if(ctx==""||ctx==null) return;
	$("img").each(function(){
		var org_src = $(this).attr("src");	//获得image的原始url
		/**
		 * 原始的url不需要ctx 例如 ../../image ctx/image http://
		 */
		if(org_src.indexOf("http")!=-1||org_src.indexOf(ctx)!=-1||org_src.indexOf("../")!=-1){
			return true; //each 循环里的continue
		}else if(org_src.indexOf("../")!=-1){
			return true;
		}else{
			var src=ctx+"/"+org_src;
			$(this).attr("src",src);
		}
		
	}); 
}