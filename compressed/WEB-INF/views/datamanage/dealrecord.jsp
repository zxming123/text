<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
	<%@include file="../common/c_common.jsp" %>
	   	<%@include file="../common/c_session.jsp" %>
   <link href="${ctx}/static/css/adminProList.css" rel='stylesheet' type='text/css' />
   <link href="${ctx}/static/css/form.css" rel='stylesheet' type='text/css' />
	<script src="${ctx}/static/js/adminPage.js"></script>
	<script src="${ctx}/static/js/adminProList.js"></script>
	<link href="${ctx}/static/css/eplatDangan.css" rel="stylesheet">
	<script type="text/javascript" src="${ctx}/static/js/ziduanchange.js"></script>
	<link href="${ctx}/static/css/adminProEdit.css" rel='stylesheet' type='text/css' />
	<script type="text/javascript" src="${ctx}/static/js/adminProEdit.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/adminGudong.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/image_ctx.js"></script>
	<link href="${ctx}/static/css/adminProEdit.css" rel='stylesheet' type='text/css' />
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
				  <li class="active">数据处理记录</li>
				</ol>
			</div>
			<div class="main_content sourcelist">
			<p class = "sourcelistitle">数据处理记录</p>
		<div id="product_NavPane" class="tabtitle" >
			   		<ul id="product_Nav_tab" class="nav nav-tabs histab" role="tablist">
				      <li role="presentation" class="active">
				      	<a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">
				      		数据处理日志
				      	</a>
				      </li>
				      <li role="presentation" class="">
				      	<a href="#nowdingshi" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile" aria-expanded="false">
				      		现有定时
				      	</a>
				      </li>
				    
				    </ul>
				    <div id="product_Nav_tab_Content" class="tab-content">
				      <div role="tabpanel" class="tab-pane fade active in" id="home" aria-labelledby="home-tab">
				      	<div class="product_tab_content navcn1">
				      		<table class="table table-striped table-bordered ">
				
								<thead>
							        <tr>
								          <th>任务ID</th>	
								          <th>数据来源</th>
								          <th>数据去向</th>
								          <th>操作类型</th>
								           <th>启动类型</th>
								          <th>创建时间</th>
								          <th>运行状态</th>
								          <th>完成情况</th>
								        
								          <th>出错情况</th>
								          <th>操作</th>
								         
							        </tr>
							      </thead>
				  					<tbody>
				  					<c:forEach var="log" items="${tlist}" >
				  					<tr>
									  <td>${log.id}</td>
							    
							          <td>${log.mapRelations.connectionInfoByFromId.tbname}</td>
							          <td>${log.mapRelations.connectionInfoByToId.tbname}</td>
							          <td>${log.operType}</td>
							          
							          <td>${log.startType}</td>
							          
							          <td>
							          	${log.createTime}
							          </td>
							          <td>${log.status}</td>
							          
							          <td>${log.result}</td>
							          <td>${log.errorInfo}</td>
							          <td width="100"><a href="#">结束任务</a></td>
	
								     </tr>
								     
				  				
									
								</c:forEach>
								        
					      		</tbody>
						</table>
				      	</div>
							
				      </div>
				      <div role="tabpanel" class="tab-pane fade" id="nowdingshi" aria-labelledby="profile-tab">
				      		<div class="product_tab_content navcn1">
				      				<table class="table table-striped table-bordered ">

										<thead>
									        <tr>
										          <th>任务名称</th>	
										          <th>数据来源</th>
										          <th>数据去向</th>
										          <th>创建时间</th>
										          <th>执行频率</th>
										          <th>操作</th>
										         
									        </tr>
									      </thead>
						  					<tbody>
						  					
						  					<tr>
											  <td> 1</td>
									    
									          <td> 1</td>
									          <td>2</td>
									          <td> 1</td>
									          
									          <td>${pBasic.registeredCapital}</td>
									          
									         
									          <td width="100"><a href="#">删除定时</a></td>
			
										     </tr>
										     
					<%-- 	  				<c:forEach var="pBasic" items="${plist}" begin="0" varStatus="status"> --%>
											
					<%-- 					</c:forEach> --%>
										        
							      		</tbody>
								</table>
				      		
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
