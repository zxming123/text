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
	<link href="${ctx}/static/css/jquery.cleditor.css" rel='stylesheet' type='text/css' />
	<link href="${ctx}/static/css/adminProEdit.css" rel='stylesheet' type='text/css' />
   	<title>来源去向表管理</title>
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
				  <li class="active">来源去向表管理</li>
				</ol>
			</div>
			<div class="main_content sourcelist">
				<div class="panel-group">						
							  
							  <div class="panel panel-default">
							    <div class="panel-heading" >
							      <h4 class="panel-title">
							        <a class="collapsed" data-toggle="collapse" href="#info_tb_2"  >
							         	添加来源/去向
							        </a>
							      </h4>
							    </div>
							    <div id="info_tb_2" class="panel-collapse collapse in" >
							      <div class="panel-body">
							        	<form action="${ctx }/source/change" method="post" enctype="multipart/form-data">
		        							 
		        							<input type="hidden" name="cid" value="${cinfo.cid }" />
										<table class="table info_edit_tb table-striped table-bordered">
									      <tbody>
									      		<caption class = "titleshujuku">数据库连接信息</caption>
												<tr>
										       	<td class="newform"><label >表名</label></td>
												<td class="input-group newform2"><input type="text" class="form-control " id="tbname" placeholder="" name="tbname" value=${cinfo.tbname}></td>
												</tr>
																						
												<tr>
										       	<td ><label >连接数据库IP</label></td>
												<td class="input-group newform2"><input type="text" class="form-control " id="ip" placeholder="" name="ip" value=${cinfo.ip}></td>
												</tr>
												
												<tr>
										       	<td ><label >连接数据库端口号</label></td>
												<td class="input-group newform2"><input type="text" class="form-control " id="port" placeholder="" name="port" value=${cinfo.port}></td>
												</tr>
												
												<tr>
										       	<td ><label >连接数据库名</label></td>
												<td class="input-group newform2"><input type="text" class="form-control " id="dbname" placeholder="" name="dbname" value=${cinfo.dbname}></td>
												</tr>
												
												<tr>
										       	<td ><label >用户名</label></td>
												<td class="input-group newform2"><input type="text" class="form-control " id="username" placeholder=""  name="username" value="${cinfo.username}" autocomplete="off"}></td>
												</tr>
												
												<c:if test="${cinfo.password == null}">
				 								<tr>
									       			<td ><label >密码</label></td>
													<td class="input-group newform2"><input type="text" class="form-control " id="password" placeholder="" name="password" value="${cinfo.password}" autocomplete="off" spellcheck="false"></td>
												</tr>
												</c:if>
												<c:if test="${cinfo.password != null}">
				 								<tr>
									       			<td ><label >密码</label></td>
													<td class="input-group newform2"><input type="password" class="form-control " id="password" placeholder="" name="password" value="${cinfo.password}" autocomplete="off" spellcheck="false"></td>
												</tr>
												</c:if>
												
												
																																			
												<tr>
										       	<td ><label >优先级</label></td>
												<td class="input-group newform2"><input type="text" class="form-control " id="priority" placeholder="" name="priority" value=${cinfo.priority}></td>
												</tr>
												<tr>
										       	<td ><label >数据表主键id</label></td>
												<td class="input-group newform2"><input type="text" class="form-control " id="key_name" placeholder="" name="key_name" value=${cinfo.keyName}></td>
												</tr>
												<tr>
										       	<td ><label >优先级表表名</label></td>
												<td class="input-group newform2"><input type="text" class="form-control " id="priority_tbname" placeholder="" name="priority_tbname" value=${cinfo.priorityTbname}></td>
												</tr>
												<tr>
										       	<td ><label >优先级表外键名称</label></td>
												<td class="input-group newform2"><input type="text" class="form-control " id="priority_foreign_name" placeholder="" name="priority_foreign_name" value=${cinfo.priorityForeignName}></td>
												</tr>
													
																			
											</tbody>
										</table>
										<div class="form-button-group  buttoncenter" style="display: block;margin-top: 15px;margin-bottom: 60px;">
				    						<button type="submit" class="btn tijiaonew btn-danger " >提交</button>
<%-- 				    					<button  class="btn btn-success col-md-3 col-sm-offset-1" onclick="location.href='${ctx }/platuser/bandingRemove.do';return false;" >删除绑定</button> --%>
<!-- 				    					<button type="reset" class="btn btn-primary  col-md-3 col-sm-offset-1" width=100 >重置</button> -->
				    					</div>
				    					</form>
										<table id="ziduan_table" class="table info_edit_tb table-striped table-bordered" style="margin-top:20px !important;">
							        	  <caption class = "titleshujuku">字段信息</caption>
							        	  <thead>
							        	  	<tr>
							        	  		<th width="25%">字段名称</th>
							        	  		<th width="25%">字段类型</th>
							        	  		
							        	  		<th width="25%">是否可空</th>
							        	  		<th width="25%">操作</th>
							        	  	</tr>
							        	  </thead>
									      <tbody id="ziduan_tbody">
									      		
									      		<c:forEach var="item" items="${flist}">
													<tr value="mama" >
														<td id="zdname"><input type="text" class="form-control " id="cname" placeholder="" name="cname" value=${item.cname}></td>
									        	  		<td id="zdtype"><select class="form-control select_input" name="type" orgvalue=${item.type}><option value="int">int</option><option value="double">double</option><option value="string">string</option><option value="date">date</option></select></td>
									        	  		
									        	  		<td id="ifnull"><select class="form-control select_input" id="isnull" name="isnull" orgvalue=${item.isnull}><option value="0">可空</option><option value="1">不可</option></select></td>
														<td>
															<button  class="btn btn-warning remove_ziduan">
									                  			<span class="glyphicon glyphicon-trash"></span>&nbsp;删除
									                  		</button>
									                  		<button class="btn btn-primary add_ziduan " >
									                  			<span class="glyphicon glyphicon-edit"></span>&nbsp;保存
									                  		</button>
									             		</td>
									             		<td style="display:none"><input  value=${item.fid} name="fid"></div></td>
													</tr>
												</c:forEach>
												
												
										  </tbody>
										</table>
										<input type="text" style="display:none" id="tide" value=${cinfo.cid}></div>
										<span id="add_ziduan" class="add_line_item_btn"><i class="glyphicon glyphicon-plus-sign"></i>增加条目</span>
										
										
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
