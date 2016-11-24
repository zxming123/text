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
	<script type="text/javascript" src="${ctx}/static/js/ziduanchange_yingshe.js"></script>
	<link href="${ctx}/static/css/adminProEdit.css" rel='stylesheet' type='text/css' />
	<script type="text/javascript" src="${ctx}/static/js/adminProEdit.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/adminGudong.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/image_ctx.js"></script>
	<link href="${ctx}/static/css/jquery.cleditor.css" rel='stylesheet' type='text/css' />
	<link href="${ctx}/static/css/adminProEdit.css" rel='stylesheet' type='text/css' />
		<script type="text/javascript" src="${ctx}/static/js/mapsaveanddelete.js"></script>
		<title>数据处理映射</title>
   	
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
							         	添加表映射
							        </a>
							      </h4>
							    </div>
							    <div id="info_tb_2" class="panel-collapse collapse in" >
							      <div class="panel-body">
							        	<form action="${ctx }/config/save_map" method="post" enctype="multipart/form-data">
		        							 
		        							<input type="hidden" id = "mid" name="mid" value="${map.mid}" />
										<table class="table info_edit_tb table-striped table-bordered">
									      <tbody>
									      		<caption class = "titleshujuku">表映射关系</caption>
												<tr>
										       	<td class="newform"><label >来源表名</label></td>
												<td class="input-group newform2"><select type="text" class="form-control select_input" id="fromtbname" placeholder="" name="fromid" orgvalue=${map.connectionInfoByFromId.cid}>
													<c:forEach var="item" items="${connect_info_list}">
		  												<option value=${item.cid}>${item.tbname}</option>
					 						  	  	</c:forEach>
												</select></td>
												</tr>
																						
												<tr>
										       	<td ><label >去向表名</label></td>
												<td class="input-group newform2"><select type="text" class="form-control select_input" id="totbname" placeholder="" name="toid" orgvalue=${map.connectionInfoByToId.cid}>
													<c:forEach var="item2" items="${connect_info_list}">
		  												<option value=${item2.cid }>${item2.tbname}</option>
					 						  	  	</c:forEach>
												</select></td>
												</tr>
												
												<tr>
										       	<td ><label >操作类型</label></td>
												<td class="input-group newform2"><select type="text" class="form-control select_input" id="type" placeholder="" name="type" orgvalue=${map.type}><option value="0">新增</option><option value="1">替换</option></select></td>
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
							        	  		<th width="25%">来源字段</th>
							        	  		<th width="25%">转化关系</th>
							        	  		<th width="25%">去向字段</th>
							        	  		
							        	  		<th width="25%">操作</th>
							        	  	</tr>
							        	  </thead>
									      <tbody id="ziduan_tbody">
									      		
									      		<c:forEach var="item3" items="${map_fiels_list}">
													<tr value="mama" >
														
									        	  		<td id="fromziduan2"><select class="form-control select_input" name="fromziduan2" orgvalue=${item3.allFieldsByFromId.fid}>
									        	  			<c:forEach var="item4" items="${fiels_list_for_from}">
		  														<option value=${item4.fid }>${item4.cname}</option>
					 						  	  			</c:forEach>
									        	  		</select></td>
									        	  		<td id = "transform">
									        	  			<select class="form-control select_input"  name="transform" orgvalue=${item3.pretreatForfrom}>
										        	  			<option value = "0">不做处理</option>
										        	  			<option value = "1">平台名转为平台id</option>
										        	  			<option value = "2">201308转为date</option>
									        	  			</select>
									        	  		</td>
									        	  		<td id="toziduan"><select class="form-control select_input"  name="toziduan" orgvalue=${item3.allFieldsByToId.fid}>
									        	  			<c:forEach var="item5" items="${fiels_list_for_to}">
		  														<option value=${item5.fid }>${item5.cname}</option>
					 						  	  			</c:forEach>
									        	  		</select></td>
									        	  		
														<td>
															<button  class="btn btn-warning remove_ziduan1">
									                  			<span class="glyphicon glyphicon-trash"></span>&nbsp;删除
									                  		</button>
									                  		<button class="btn btn-primary add_ziduan1 " >
									                  			<span class="glyphicon glyphicon-edit"></span>&nbsp;保存
									                  		</button>
									             		</td>
									             		<td style="display:none"><input  value=${item3.id} name="id"></td>
													</tr>
												</c:forEach>
												
												
										  </tbody>
										</table>
										<input type="text" style="display:none" id="tide" value=${map.mid}></div>
										<span id="add_ziduan" class="add_line_item_btn"><i class="glyphicon glyphicon-plus-sign"></i>增加条目</span>
										
										<table id="ziduan_table2" class="table info_edit_tb table-striped table-bordered" style="margin-top:20px !important;">
							        	  <caption class = "titleshujuku">条件字段</caption>
							        	  <thead>
							        	  	<tr>
							        	  		<th width="16%">来源条件字段</th>
							        	  		<th width="16%">转化关系</th>
							        	  		<th width="16%">来源条件字段类型</th>
							        	  		<th width="16%">来源条件字段常量值</th>
							        	  		<th width="16%">去向条件字段</th>
							        	  		<th width="17%">操作</th>
							        	  		
							        	  	</tr>
							        	  </thead>
									      <tbody id="ziduan_tbody2">
									      		
									      		<c:forEach var="item6" items="${map_conditions_list}">
													<tr value="mama" >
														
									        	  		<td id="fromziduan"><select class="form-control select_input" name="fromziduan" orgvalue=${item6.allFieldsByFromId.fid}>
									        	  			<c:forEach var="item7" items="${fiels_list_for_from}">
		  														<option value=${item7.fid }>${item7.cname}</option>
					 						  	  			</c:forEach>
									        	  		</select></td>
									        	  		<td id = "transform">
									        	  			<select class="form-control select_input"  name="transform" orgvalue=${item6.pretreatForfrom}>
										        	  			<option value = "0">不做处理</option>
										        	  			<option value = "1">平台名转为平台id</option>
										        	  			<option value = "2">201308转为date</option>
									        	  			</select>
									        	  		</td>
									        	  		<td id="fromtype"><select class="form-control select_input" name="fromtype" orgvalue=${item6.fromType}>
									        	  			<option value="0">常量</option><option value="1">变量</option>
									        	  		</select></td>
									        	  		
									        	  		<td id="fromconstant"><input class="form-control " name="fromconstant" value=${item6.fromConstant}>
									        	  		</td>	
									        	  			        	  		
									        	  		<td id="toziduan"><select class="form-control select_input"  name="toziduan" orgvalue=${item6.allFieldsByToId.fid}>
									        	  			<c:forEach var="item5" items="${fiels_list_for_to}">
		  														<option value=${item5.fid }>${item5.cname}</option>
					 						  	  			</c:forEach>
									        	  		</select></td>
									        	  		
														<td>
															<button  class="btn btn-warning remove_ziduan2">
									                  			<span class="glyphicon glyphicon-trash"></span>&nbsp;删除
									                  		</button>
									                  		<button class="btn btn-primary add_ziduan2 " >
									                  			<span class="glyphicon glyphicon-edit"></span>&nbsp;保存
									                  		</button>
									             		</td>
									             		<td style="display:none"><input  value=${item6.id} name="id"></div></td>
													</tr>
												</c:forEach>
												
												
										  </tbody>
										</table>
										<span id="add_ziduan2" class="add_line_item_btn"><i class="glyphicon glyphicon-plus-sign"></i>增加条目</span>
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
