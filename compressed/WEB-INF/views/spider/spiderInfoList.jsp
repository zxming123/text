<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
	<%@include file="../common/c_common.jsp" %>
	   	<%@include file="../common/c_session.jsp" %>
	<script src="${ctx}/static/js/adminPage.js"></script>
	<script src="${ctx}/static/js/spider/spiderInfo.js"></script>
   	
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
				  <li class="active">爬虫任务列表</li>
				</ol>
			</div>
			
			
			
			<div class="main_content">
				<form method="get" action="${ctx }/spider/spiderInfoList" enctype="multipart/form-data">
					<table class="table table-striped table-bordered ">
					
						<tr>
						<td>
						<select class="form-control select_input" id="web" name="web" orgvalue = "${web.id}">
										<option value = "0">全部</option>
										<c:forEach var="web" items="${webs}">
											<option value="${web.id}">${web.nickName}</option>
										</c:forEach>
							</select>
						</td>
						
						<td>
						<select class="form-control select_input" id="spider" name="spider" orgvalue = "${spider.id}">
										<option value = "0">全部</option>
										<c:forEach var="item" items="${webs}">
											<c:if test="${item.id == web.id}">
											<c:forEach var="spider" items="${item.spiders}">
												<option value="${spider.id}">${spider.nickName}</option>
											</c:forEach>
											</c:if>
										</c:forEach>
							</select>
							
							
						</td>
						<td>
						<select class="form-control select_input" id="state" name="state" orgvalue = "${state}">
								<option value="0">全部</option>
								<option value="1">pending</option>
								<option value="2">running</option>
								<option value="3">finished</option>
						</select>
						</td>
						<td>
						<button type="submit" class="btn" style="width:130px">查询</button>
						</td>
						</tr>
						
					</table>
				</form>
				<input type="hidden" id="totalPage" name="totalPage" value="${totalPage}" />
				<input type="hidden" id="currentPage" name="currentPage" value="${currentPage}" />
				<input type="hidden" id="pageSize" name="pageSize" value="${pageSize}" />
				<input type="hidden" id="wid" name="wid" value="${web.id}" />
				<input type="hidden" id="sid" name="sid" value="${spider.id}" />
				<input type="hidden" id="state" name="state" value="${state}" />
				<table class="table table-striped table-bordered ">
				
					<thead>
				        <tr>
					          <th>来源</th>
					  
					          <th>爬虫名称</th>
					          
					          <th>爬虫id</th>
					          
					          <th>创建时间</th>
					          
					          <th>结束时间</th>
					          
					          <th>状态</th>
					          
					          <th>日志</th>
					         
				        </tr>
				      </thead>
	  					<tbody>
	  					<c:forEach var="item" items="${webJobs}">
		  					<tr>
		  						<td>${item.spider.source.nickName}</td>
		  						
		  						<td>${item.spider.nickName}</td>
		  						
		  						<td>${item.jobId}</td>
		  						
		  						<td>${item.createTime}</td>
		  						
		  						<td>${item.finishTime}</td>
		  						
		  						<td>${item.state}</td>
		  						
		  						<td>
		  						<button class="btn" onclick="getLogResult('${item.logUrl}')" >查看日志</button>
		  						</td>
		  					</tr>
					     </c:forEach>
					        
		      		</tbody>
			</table>
			</div>
			<div class="main_content">
			
			<nav style="margin:0 auto;text-align:center;">
					  <ul class="pagination">
					  	<li>
					  		<a href="${ctx}/spider/spiderInfoList?web=${web.id}&spider=${spider.id}&state=${state}&page=0" aria-label="First" onclick="" id="firstPage" >
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