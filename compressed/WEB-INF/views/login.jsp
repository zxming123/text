<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>数据管理后台</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta charset="utf-8">
	<meta name="description" content="Admin">
	<meta name="keyword" content="Admin">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    
    <style type="text/css">
		body { background: url(static/image/bg-login.jpg) !important; }
	</style>
    <link href="static/css/bootstrap_v2.min.css" rel="stylesheet">
    <style type= "text/css" >	
		
		#myModal form{
			margin-bottom:0px;
		}
		#myModal h3{
			color:#848484;
			text-align:center;
		}
		#myModal .controls{
			text-align:center;
		}
		#myModal input[type="text"], input[type="password"]{
			height: 50px;
			font-size: 20px;
  			line-height: 30px;
			width: 320px;
		}
		#myModal .modal-body{
			padding-bottom:0px;
		}
		#myModal .modal-footer{
			text-align:center
		}
		#myModal .modal-footer button{
	
			width: 330px;
			height:45px;
			font-size: 18px;
		}
		
		#myModal .modal-footer p{
			margin:10px 0 0 0;
		}
		
		a:HOVER {
			cursor: pointer;
		}
		
	</style>

  </head>
  
  <body onload="checkRes()">
    		 <!-- Modal -->
		    <div id="myModal" class="modal hide fade " tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			      <div class="modal-header">
			        <h3 id="myModalLabel">后台登陆</h3>
			      </div>
			      <div class="modal-body">
			        	<form id="login-form" action="admin/login.do" method="post" autocomplete="off">
			              <div class="control-group">
			                <div class="controls">
			                  <input id="username" type="text" name="username" placeholder="管理员账号" >
			                </div>
			              </div>
			              <div class="control-group">
			                <div class="controls">
			                	<input type="password" style="display:none">
			                  <input id="password" type="password" name="password"  placeholder="密码" />
			                </div>
			              </div>
			             
			            </form>
			      </div>
			      <div class="modal-footer">
			        <button id="login_btn" class="btn btn-primary">登录</button>
			        <br>
			        <div id="login_other">
			           <p><a href="admin/register.view">马上注册</a></p>
			        </div>
			      </div>
		    </div>
  </body>
  <script src="static/js/jquery/jquery-1.11.1.min.js"></script>
  <script src="static/js/bootstrap_v2.min.js"></script>
  <script tyle="text/script">
  	$(function(){
  		$("#login_btn").click(function(){
  			$("#login-form").submit();
  		});
  		
  		$(document).keyup(function (evnet) {
  			if (evnet.keyCode == '13') {
  				$("#login-form").submit();
  			}
  			
  		});
  	});

  </script>
  
  <script type="text/javascript">
  $(function(){
	  setTimeout(function(){
		  $("#username").val("");
		  $("#password").val("");
	  }, 100);
	
  });
  </script>

  
   <script type="text/javascript">
		$(function(){
			$('#myModal').css({
				"width":400,
				"margin-left":"-200px"
				});

			$('#myModal').modal({
				backdrop: false,
			  "keyboard":false
			});
			$('#myModal.modal.fade.in').css("top","20%");

		});
	</script>
	<script type="text/javascript" src="static/js/login.js"></script>
</html>
  
