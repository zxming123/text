<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
	<%@include file="../common/c_common.jsp" %>
	   	<%@include file="../common/c_session.jsp" %>
   <link href="${ctx}/static/css/adminProList.css" rel='stylesheet' type='text/css' />
	<script src="${ctx}/static/js/adminPage.js"></script>
	<script src="${ctx}/static/js/adminProList.js"></script>
	<script src="${ctx}/static/js/maplist.js"></script>
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
				  <li class="active">数据处理映射</li>
				</ol>
			</div>
			<div class="main_content sourcelist">
			
				<p class = "sourcelistitle">数据处理映射</p>
				
				<div id ="lian" style="display:none">${ctx }</div>
				
				<p class = "newbiao"><a href="${ctx }/config/map">新配置一个映射关系</a></p>
				<table class="table table-striped table-bordered ">
				
					<thead>
				        <tr>
					          <th  width="25%">来源表名</th>
					  
					          <th width="25%">去向表名</th>
					          <th width="25%">映射类型</th>
					          <th width="25%">操作</th>

					         
				        </tr>
				      </thead>
	  					<tbody>
	  					<c:forEach var="item" items="${map_list}">
		  					<tr>
		  				
							  <td> ${item.connectionInfoByFromId.tbname}</td>
					    
					          <td> ${item.connectionInfoByToId.tbname}</td>
					          <td> <c:if test="${item.type==1}"> 替换 </c:if>
					          		<c:if test="${item.type==0}"> 新增 </c:if>
					          </td>
					           <td width="100">
					           <a href="${ctx }/config/map?mid=${item.mid}">映射信息修改</a>&nbsp;&nbsp;&nbsp;
					           <a class="start" var="${item.mid}"}>启动数据处理</a>&nbsp;&nbsp;&nbsp;
					           <a class="process" var="${item.mid}"}>查看处理进度</a>
					           </td>
					          
						     </tr>
					     </c:forEach>

					        
		      		</tbody>
			</table>
			</div>
			
		</div>
	</div>
   
</body>
<script type="text/javascript" src="${ctx}/static/js/common.js"></script>
</html>
