<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
	<%@include file="../common/c_common.jsp" %>
	   	<%@include file="../common/c_session.jsp" %>
   <link href="${ctx}/static/css/adminProList.css" rel='stylesheet' type='text/css' />
	<script src="${ctx}/static/js/adminPage.js"></script>
	<script src="${ctx}/static/js/adminProList.js"></script>
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
				<p class = "sourcelistitle">来源去向表</p>
				<p class = "newbiao"><a href="${ctx }/source/view">新建一张来源去向表</a></p>
				<table class="table table-striped table-bordered ">
				
					<thead>
				        <tr>
					          <th>表名</th>
					  
					          <th>数据库IP</th>
					          <th>数据库名</th>
					          <th>端口号</th>
<!-- 					          <th>扩展字段</th> -->
					          <th>优先级</th>
					          <th>数据表主键id</th>
					          <th>优先级表表名</th>
					          <th>优先级表外键名称</th>		
					          <th>操作</th>
					         
				        </tr>
				      </thead>
	  					<tbody>
	  					<c:forEach var="item" items="${clist}">
		  					<tr>
		  				
							  <td> ${item.tbname}</td>
					    
					          <td> ${item.ip}</td>
					          <td> ${item.dbname}</td>
					          <td> ${item.port}</td>
					          
<%-- 					          <td>${item.expand}</td> --%>
					          
					          <td>
					          	${item.priority }
					          </td>
					          <td>${item.keyName }</td>
					          
					          <td>${item.priorityTbname}</td>
					          <td>${item.priorityForeignName}</td>
					          <td width="100"><a href="${ctx }/source/view?id=${item.cid}">表信息修改</a>
	<%-- 				  		 	 <a href="../xinpi.view?pid=${pBasic.pid}">表信息删除</a> --%>
						     </tr>
					     </c:forEach>
<%-- 	  				<c:forEach var="pBasic" items="${plist}" begin="0" varStatus="status"> --%>
						
<%-- 					</c:forEach> --%>
					        
		      		</tbody>
			</table>
			</div>
			
		</div>
	</div>
   
</body>
<script type="text/javascript" src="${ctx}/static/js/common.js"></script>
</html>
