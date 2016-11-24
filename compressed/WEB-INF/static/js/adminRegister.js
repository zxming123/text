$("#submit").click(function(){
	
	var username=$("input[name='username']").val();
	username=jQuery.trim(username);
	if(username==null||username==""){
		alert("请输入合法的用户名");
		return false;
	}
	var password=$("input[name='password']").val();
	if(password==null||password==""){
		alert("请输入密码");
		return false;
	}
	var a_password=$("input[name='a_password']").val();
	if(password!=a_password){
		alert("两次输入的密码不同，请重新输入");
		return false;
	}
});

$(function(){
	if(GetArgsFromHref("rspCode")=="1"){
		alert("用户名已存在，请重新输入");
	}else if(GetArgsFromHref("rspCode")=="6"){
		alert("注册失败，请稍后重试");
	}
});


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