<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true"%>
<%@ page import="org.slf4j.Logger,org.slf4j.LoggerFactory"%>
<%
	response.setStatus(200);
%>

<%
	Throwable ex = null;
	if (exception != null)
		ex = exception;
	if (request.getAttribute("javax.servlet.error.exception") != null)
		ex = (Throwable) request
				.getAttribute("javax.servlet.error.exception");
	if (ex == null)
		ex = new Throwable("未知错误...");
	//记录日志
	Logger logger = LoggerFactory.getLogger("500.jsp");
	logger.error(ex.getMessage(), ex);
%>
<%
	request.setAttribute("ctx", request.getContextPath());
%>
<html>
<head>
<title>401 - 权限不足</title>
</head>

<body>
	您的权限不足以访问这个地址。应该是网址有问题。
	<a href='${ctx }'>回首页</a>
</body>
</html>
