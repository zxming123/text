/**
 * 
 */

$(document).ready(function() {
	
});

function checkRes(){
	rspCode=GetArgsFromHref("rspCode")
	if(rspCode=="2"){
		alert("用户名不存在");
	}else if(rspCode=="3"){
		alert("用户名或密码错误，请重新输入");
	}else if(rspCode=="4"){
		alert("您已被禁用，请联系系统管理员");
	}
}

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