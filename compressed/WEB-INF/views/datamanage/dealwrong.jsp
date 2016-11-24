<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
	<%@include file="../common/c_common.jsp" %>
	   	<%@include file="../common/c_session.jsp" %>
  <link href="${ctx}/static/css/form.css" rel='stylesheet' type='text/css' />
	<link href="${ctx}/static/css/datamanage.css" rel='stylesheet' type='text/css' />
   	
</head>
 
<body>
   <!-- start of left nav-->
		<%@include file="../common/c_leftbar.jsp" %>
   <!-- end of left nav -->
   
   <!-- start of main content -->
   <div class="container-fluid">
		<div class="row">
			<div class="main_content">
				<ol class="breadcrumb">
				  <li><a href="../test/index">Home</a></li>
				  <li ><a href="../data/dealrecord">数据处理记录</a></li>
				  <li class="active">出错情况</li>
				</ol>
			</div>
			<div class="main_content sourcelist">
			<p class = "sourcenew">数据处理记录</p>
			<div class="panel-group tabtitle">						
							  
							  <div class="panel panel-default">
							    <div class="panel-heading" >
							      <h4 class="panel-title">
							        <a class="collapsed" data-toggle="collapse" href="#info_tb_2"  >
							         	出错情况
							        </a>
							      </h4>
							    </div>
							    <div id="info_tb_2" class="panel-collapse collapse in" >
							      <div class="panel-body">
							        <p>   错误123</p>
							        
							      </div>
							    </div>
							  </div>							  							 											    					    	
					</div>
		   		
			</div>
			
		</div>
	</div>
   
</body>
<script type="text/javascript" src="${ctx}/static/js/common.js"></script>
</html>
