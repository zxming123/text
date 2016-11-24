<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<%@ page import="org.slf4j.Logger,org.slf4j.LoggerFactory" %>
<!-- 
	response.setStatus(200);
-->

<%
	Throwable ex = null;
	if (exception != null)
		ex = exception;
	if (request.getAttribute("javax.servlet.error.exception") != null)
		ex = (Throwable) request.getAttribute("javax.servlet.error.exception");
	if (ex == null)
		ex = new Throwable("未知错误...");
	//记录日志
	Logger logger = LoggerFactory.getLogger("500.jsp");
	logger.error(ex.getMessage(), ex);
%>

<html>
<head>
	<title>500 - 系统内部错误</title>
</head>

<body>
	<!-- 页首导航栏 -->
	
	<!-- 主体部分 -->
	<div style="min-height: 300px;">
	   	<p style="margin-top: 50px; font-size: 30px;" align="center">
	  		服务器坏了！我也不知道为什么！估计是程序员下班了！捉急啊o(>﹏<)o！
		</p>
	    <p style="margin-top: 50px;" align="center"><a href="javascript:history.go(-1);">返回上一页</a></p>
	</div>
	
	<!--  footer引入区-->
</body>
</html>
