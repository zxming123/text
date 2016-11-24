<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
	<%@include file="../common/c_common.jsp" %>
	   	<%@include file="../common/c_session.jsp" %>

   <link href="${ctx}/static/css/form.css" rel='stylesheet' type='text/css' />
	<link href="${ctx}/static/css/eplatDangan.css" rel="stylesheet">
	<link href="${ctx}/static/css/jquery.cleditor.css" rel="stylesheet">
	<link href="${ctx}/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
	<script type="text/javascript" src="${ctx}/static/js/jquery/jquery.cleditor.min.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/bootstrap/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/bootstrap/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/datamanage.js"></script>
	<link href="${ctx}/static/css/datamanage.css" rel='stylesheet' type='text/css' />
	<title>数据处理</title>
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
				  <li class="active">数据处理</li>
				</ol>
			</div>
			<div class="main_content sourcelist">
			
				<p class = "sourcenew">数据处理</p>
						<div class="panel-group tabtitle">						
							  
							  <div class="panel panel-default">
							    <div class="panel-heading" >
							      <h4 class="panel-title">
							        <a class="collapsed" data-toggle="collapse" href="#info_tb_2"  >
							         	启动数据处理
							        </a>
							      </h4>
							    </div>
							    <div id="info_tb_2" class="panel-collapse collapse in" >
							      <div class="panel-body">
							        
							        <div>
							        	<ul class="list-group newbottom">   
										   <li class="select-group-item">
										   		<div class="select-item"><p>启动时间：</p></div>
										   		<div class="input-group  date form_datetime col-md-5"  data-link-field="dtp_input1">
                    								<input id ="starttime" class="form-control product" size="16" type="text" readonly>
								                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
													<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
								                </div>
																		   		
										   	</li>
										   <li class="select-group-item">
										   		<div class="select-item"><p>启动频率：</p></div>
										   		<ul id="pinlv" class="product-select">
															<li class="select-focus" var="0">仅运行一次</li>
															<li var="1">每天运行一次</li>
															<li var="2">每周运行一次</li>
															<li var="3">每月运行一次</li>
															<button class="btn btn-primary tijiaopinlv" id="timerun">提交</button>
																											
												</ul>
																						
									   		</li>								   										  
										 </ul>
							        </div>	
										
							      </div>
							    </div>
							  </div>							  							 											    					    	
					</div>
					<p ><a href="dealrecord" class="viewhis">查看数据处理记录</a></p>
<!-- 					<div id="product_NavPane" > -->
<!-- 			   		<ul id="product_Nav_tab" class="nav nav-tabs histab" role="tablist"> -->
<!-- 				      <li role="presentation" class="active"> -->
<!-- 				      	<a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true"> -->
<!-- 				      		历史记录 -->
<!-- 				      	</a> -->
<!-- 				      </li> -->
<!-- 				      <li role="presentation" class=""> -->
<!-- 				      	<a href="#nowdingshi" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile" aria-expanded="false"> -->
<!-- 				      		现有定时 -->
<!-- 				      	</a> -->
<!-- 				      </li> -->
				    
<!-- 				    </ul> -->
<!-- 				    <div id="product_Nav_tab_Content" class="tab-content"> -->
<!-- 				      <div role="tabpanel" class="tab-pane fade active in" id="home" aria-labelledby="home-tab"> -->
<!-- 				      	<div class="product_tab_content navcn1"> -->
<!-- 				      		123454 -->
<!-- 				      	</div> -->
							
<!-- 				      </div> -->
<!-- 				      <div role="tabpanel" class="tab-pane fade" id="nowdingshi" aria-labelledby="profile-tab"> -->
<!-- 				      		<div class="product_tab_content navcn1"> -->
<!-- 				      		zhangxiaoming -->
<!-- 				      	</div> -->
					      
<!-- 				      </div> -->
				     
<!-- 				    </div> -->
			   
<!-- 		   		</div> -->
			</div>
			
		</div>
	</div>
   
</body>
<script type="text/javascript" src="${ctx}/static/js/common.js"></script>
<script type="text/javascript">
    $('.form_datetime').datetimepicker({
        language:  'zh-CN',
        format: 'yyyy-mm-dd hh:ii:ss',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1
    });
    </script>
</html>
