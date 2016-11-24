<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%request.setAttribute("ctx", request.getContextPath());%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- start: Meta -->
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<link rel="shortcut icon" href="${ctx}/static/image/favicon.png">
<link rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css">
<script type="text/javascript" src="${ctx}/static/js/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/define_theme.css">

<ctx id="ctx" hidden>${ctx}</ctx>
<ip id="ip" hidden><%=request.getServerName()%>:<%=request.getLocalPort()%></ip>
