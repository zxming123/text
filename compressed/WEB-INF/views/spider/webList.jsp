<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
	<%@include file="../common/c_common.jsp" %>
	   	<%@include file="../common/c_session.jsp" %>
   <link href="${ctx}/static/css/adminProList.css" rel='stylesheet' type='text/css' />
	<script src="${ctx}/static/js/adminPage.js"></script>
	<script src="${ctx}/static/js/spider/web.js"></script>
	<script type="text/javascript">


	$(function(){
		$(".select_input").each(function(){
			var org=($(this).attr("orgvalue"));
			if(org!=null){
				var target=$(this).find("[value=\""+org+"\"]");
				target.attr("selected","true");
			}
			//alert($(this).find("option:selected").val());
		})
	});
	</script>
   	
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
				  <li class="active">爬虫来源网站列表</li>
				</ol>
			</div>
			<div class="main_content">
			<input type="hidden" id="totalPage" name="totalPage" value="${totalPage}" />
				<input type="hidden" id="currentPage" name="currentPage" value="${currentPage}" />
				<input type="hidden" id="pageSize" name="pageSize" value="${pageSize}" />
				<input type="hidden" id="lastName" name="lastName" value="${name}" />
			<table class="table table-striped table-bordered ">
		<!--  	<tr><td><label>添加来源网站</label></td>
			<td><input id = "newWeb" class = "form-control" placeholder = "来源网站名字"></td>
			<td><button id = "addWeb" class="btn btn-primary">添加</button></td></tr>-->
			<tr><td><button id = "addAllWeb" class="btn">批量导入</button></td></tr>
			
		<!-- 	<tr>
			<td><label>添加爬虫</label></td>
			<td>
			<select id = "isBatch" class="form-control">
			</select>
			</td>
			<td>mingzi</td>
			<td>来源网站</td>
			<td><button id = "addSpider" class="btn btn-primary">添加</button></td>
			</tr>  -->
			</table>
			</div>
			
			<div class="main_content">
				<form method="get" action="${ctx }/spider/webList" enctype="multipart/form-data">
					<table class="table table-striped table-bordered ">
					<tr><td>查询</td>
					<td><input type="text" class="form-control" id="name" name = "name" placeholder="来源网站名字" value = "${name}"></td>
					<td><button type="submit" class="btn" style="width:130px">查询</button></td>
					</tr>
					
					</table>
				</form>
			</div>
			
			<div class="main_content webList">
				<table class="table table-striped table-bordered ">
				
					<thead>
				        <tr>
					  
					          <th>名字</th>
					          
					          <th>爬虫列表</th>
					          
					     <!--      <th>操作</th> -->
					         
				        </tr>
				      </thead>
	  					<tbody>
	  					<c:forEach var="item" items="${webs}">
		  					<tr>
		  				
					    
					          <td> ${item.name}_${item.nickName}</td>
					          
					          <td>
					          
					          <table class="table table-striped table-bordered ">
					          	<thead>
					          	<tr>
					          	<th>名字</th>
					          	<th>操作</th>
					          	</tr>
					          	</thead>
					          	<tbody>
					          	<c:forEach var="spider" items="${item.spiders}">
					          	<tr>
					          	<td>${spider.name}_${spider.nickName}</td>
					          	
					          	<td><!-- <a href = "${ctx}/spider/deleteSpider?sid=${spider.id}">删除</a> -->
					          	<a href = "${ctx}/spider/newSpider?sid=${spider.id}">查看详情</a></td>
					          	</tr>
					          	</c:forEach>
					          	</tbody>
					          </table>
					          </td>
					          
					      <!--     <td><a href = "${ctx}/spider/deleteWeb?wid=${item.id}">删除</a></td> -->
						     </tr>
					     </c:forEach>
					        
		      		</tbody>
			</table>
			</div>
			
			
			<div class="main_content">
			
			<nav style="margin:0 auto;text-align:center;">
					  <ul class="pagination">
					  	<li>
					  		<a href="${ctx}/spider/webList?name=${name}&page=0" aria-label="First" onclick="" id="firstPage" >
					  		<span aria-hidden="true">首页</span></a>
					  	</li>
					    <li>
					      <a href="javascript:void(0)" aria-label="Previous" id="pre" onclick="">
					        <span aria-hidden="true">«</span>
					      </a>
					    </li>
					    
					     	<li id="page_li_1"><a id="page1" href="javascript:void(0)" onclick="changePage()">1</a></li>
					    
					     	<li id="page_li_2"><a id="page2" href="javascript:void(0)" onclick="changePage()">2</a></li>
					    
					     	<li id="page_li_3"><a id="page3" href="javascript:void(0)" onclick="changePage()">3</a></li>
					    
					     	<li id="page_li_4"><a id="page4" href="javascript:void(0)" onclick="changePage()">4</a></li>
					    
					    <li>
					      <a href="javascript:void(0)" aria-label="Next" id="next" onclick="changePage()">
					        <span aria-hidden="true">»</span>
					      </a>
					    </li>
					    <li>
					    <a href="javascript:void(0)" aria-label="Last" id="lastPage" onclick="changePage(this)" >
					    	<span aria-hidden="true">末页</span></a>
					    </li>
					  </ul>
				 </nav>
			
			
			</div>
		</div>
	</div>
   
</body>
<script type="text/javascript" src="${ctx}/static/js/common.js"></script>
</html>
