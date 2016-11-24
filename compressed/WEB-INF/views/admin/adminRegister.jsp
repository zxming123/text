<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%request.setAttribute("ctx", request.getContextPath());%>
<!DOCTYPE html>
<html>
  <head>
  		<base href="<%=basePath%>">
    	<title>注册-数据管理后台系统</title> 
		<meta charset="utf-8">
		<link rel="stylesheet" href="static/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="static/css/adminRegister.css" rel="stylesheet">
		<script src="static/js/jquery/jquery-1.11.1.min.js"></script>
  </head>
  
  <body>
		
		<!-- start: Header -->
		<div id="top" class="navbar">
			<div class="container-fluid" style="background-color:#003366;">
				<a href="${ctx }/admin/index">
					<img alt="" src="/showmethedata/static/image/m_logo.png" width="180">
				</a>
			</div>
		</div>
		<!-- start: Header -->
		
			<div class="container-fluid-full">
				<div class="row-fluid">
					<regist-edit>
						<div class="title">
					      <h2 class="title-big">注册管理员帐号</h2>          
					    </div>
					    <form id="registForm" method="post" action="${ctx }/admin/register">
					    	<br>
					    	<input class="regist_input" type="text" name="username" placeholder="请输入用户名" style="margin-top:50px;">
					    	<input class="regist_input" type="password" name="password" placeholder="请输入密码">
					    	<input class="regist_input" type="password" name="a_password" placeholder="请再次输入密码">
					    	<div style="text-align:center;margin-bottom:20px;margin-top:10px;">
								<button id="submit" type="submit" class="btn btn-primary" style="width:130px">注册</button>
								<button id="reset" type="reset" class="btn btn-danger" style="width:130px">重置</button>
							</div>
					    </form>
					    <span id="rspCode" hidden>${rspCode }</span>
					</regist-edit>
				</div>
				<!--/fluid-row-->
			</div>
			
		
		
		
		<div class="clearfix"></div>
		<footer style="position:fixed;bottom:0px;width:100% !important;background-color:#003366;padding:10px;">
			<p>
				<span style="text-align:left;float:left;color:#fff;font-family: '微软雅黑'">Copyright&nbsp;&copy;&nbsp;2015-2017&nbsp;数据管理后台系统</span>
			</p>
		</footer>
		<!-- start: JavaScript-->
			<script src="static/js/adminRegister.js"></script>
		<!-- end: JavaScript-->
	</body>
</html>
