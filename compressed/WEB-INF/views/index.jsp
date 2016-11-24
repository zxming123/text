<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
   	<%@include file="common/c_common.jsp" %>
   	<%@include file="common/c_session.jsp" %>
   	<link rel="stylesheet" type="text/css" href="${ctx}/static/css/adminIndex.css">
   	<title>数据管理后台系统-主页</title>
</head>
 
<body>
   <!-- start of left nav-->
		<%@include file="common/c_leftbar.jsp" %>
   <!-- end of left nav -->
   
   <!-- start of main content -->
   <div class="container-fluid">
		<div class="row">
			<div class="main_content">
				<ol class="breadcrumb">
				  <li><a href="#">主页</a></li>
				  <li class="active">Home</li>
				</ol>
				<div class="col-md-12">
					<div style="text-align: center">
						<div class="module_box" style="margin-top:100px">
							<div class="module_circle" style="background-color:#efefef;">
								<img alt="爬虫启动" src="${ctx }/static/image/python.png" width=100>
							</div>
							<span class="module_title">爬虫启动</span>
						</div>
						<div class="module_box" >
							<div class="module_circle_img" style="background-image:url(${ctx }/static/image/setting.png);">
							</div>
							<span class="module_title">爬虫管理</span>
						</div>
						<div class="module_box" >
							<div class="module_circle">
								<img alt="批量爬虫" src="${ctx }/static/image/shop.png" width=98>
							</div>
							<span class="module_title">批量爬虫</span>
						</div>
						<div class="module_box" >
							<div class="module_circle" style="background-color:#efefef;">
								<img alt="定时爬虫" src="${ctx }/static/image/mail.png" width=98>
							</div>
							<span class="module_title">定时爬虫</span>
						</div>
					</div>
					
					
					<div style="text-align: center">
						<div class="module_box" >
							<div class="module_circle_img" style="background-image:url(${ctx }/static/image/shop.png);">
							</div>
							<span class="module_title">数据处理</span>
						</div>
						<div class="module_box" >
							<div class="module_circle_img" style="background-image:url(${ctx }/static/image/app.png);">
							</div>
							<span class="module_title">来源去向</span>
						</div>
						<div class="module_box" >
							<div class="module_circle_img" style="background-image:url(${ctx }/static/image/light.png);">
							</div>
							<span class="module_title">映射配置</span>
						</div>
						<div class="module_box" >
							<div class="module_circle_img" style="background-image:url(${ctx }/static/image/bookmark.png);">
							</div>
							<span class="module_title">定时处理</span>
						</div>
						
					</div>
				
					
				</div>
				
			</div>
		</div>
	</div>
   
</body>
<script type="text/javascript" src="${ctx}/static/js/common.js"></script>
</html>
