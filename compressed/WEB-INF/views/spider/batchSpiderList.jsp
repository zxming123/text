<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
	<%@include file="../common/c_common.jsp" %>
	   	<%@include file="../common/c_session.jsp" %>
   <link href="${ctx}/static/css/adminProList.css" rel='stylesheet' type='text/css' />
   <script type="text/javascript" src="${ctx }/static/js/bootstrap/bootstrap-datetimepicker.min.js"></script>
   <script src="${ctx}/static/js/spider/batch.js"></script>
	<script src="${ctx}/static/js/adminPage.js"></script>
	<link href="${ctx}/static/css/bootstrap-datetimepicker.min.css" rel='stylesheet' type='text/css' />
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
				  <li class="active">批量爬虫列表</li>
				</ol>
			</div>
			
			<div class="main_content">
				<table class="table table-striped table-bordered ">
				<tr>
				
				<td>
				<input id = "newBatch" name = "newBatch" class = "form-control" placeholder = "批量爬虫名字">
				</td>
				
				<td><input type="text" class="form-control form_date" id="time" placeholder="定时时间点" name="time" data-date-format="hh:mm:ss"></td>
				<td>
				<button id = "addBatch" class="btn">添加</button>
				</td>
				</tr>
				</table>
			</div>
			<div class="main_content">
				<form method="get" action="${ctx }/spider/batchSpiderList" enctype="multipart/form-data">
					<table class="table table-striped table-bordered ">
					<tr><td>查询</td>
					<td><input type="text" class="form-control" id="name" name = "name" placeholder="批量爬虫名字" value = "${name}"></td>
					<td><button type="submit" class="btn" style="width:130px">查询</button></td>
					</tr>
					
					</table>
				</form>
			</div>
			
			<div class="main_content">
				<input type="hidden" id="totalPage" name="totalPage" value="${totalPage}" />
				<input type="hidden" id="currentPage" name="currentPage" value="${currentPage}" />
				<input type="hidden" id="pageSize" name="pageSize" value="${pageSize}" />
				<input type="hidden" id="lastName" name="lastName" value="${name}" />
				<table class="table table-striped table-bordered ">
				
					<thead>
				        <tr>
					  
					          <th>名字</th>
					          
					          <th>爬虫步骤列表:以添加顺序为准</th>
					          <th>是否定时</th>
					          <th>定时类型</th>
					          <th>定时时间点</th>
					          <th>操作</th>
					         
				        </tr>
				      </thead>
	  					<tbody>
	  					<c:forEach var="item" items="${batchs}">
		  					<tr>
		  				
					    
					          <td> ${item.name}</td>
					          
					          <td>
					          
					          <table class="table table-striped table-bordered ">
					          	<thead>
					          	<tr>
					          	<th>爬虫名字</th>
					          	<th>步骤</th>
					          	<th>操作</th>
					          	</tr>
					          	</thead>
					          	<tbody>
					          	<c:forEach var="step" items="${item.steps}">
					          	<tr>
					          	<td>${step.spider.source.nickName}_${step.spider.nickName}</td>
					          	
					          	<td>${step.step}</td>
					          	<td>
					          	<button  class="btn" onclick="deleteBatchStep(${step.id})">删除</button>
					          	<a class="btn" href = "${ctx}/spider/newBatchSpiderStep?stepId=${step.id}" >查看详情</a></td>
					          	</tr>
					          	</c:forEach>
					          	<tr>
					          	<td>
									<select class="form-control select_input" id="spider${item.id}">
										<c:forEach var="web" items="${webs}">
											<c:forEach var="spider" items="${web.spiders}">
												<option value="${spider.id}">${spider.source.nickName}_${spider.nickName}</option>
											</c:forEach>
										</c:forEach>
									</select>
								</td>
								<td>
								<input id = "stepId${item.id}" class = "form-control" placeholder ="步骤">
								</td>
								<td>
								<button id = "addBatchStep" class="btn" onclick="addBatchStep(${item.id})">添加步骤</button></td>
					          	</tr>
					          	</tbody>
					          </table>
					          </td>
					          <td>
					          	<select class="form-control select_input" orgvalue = "${item.flag}" readonly="readonly">
										<option value = "1">已定时</option>
										<option value = "0">未定时</option>
									</select>
					          </td>
					          <td>${item.type}</td>
					          <td><input type="text" name = "time${item.id}"  id = "time${item.id}" class="form-control form_date" value = "${item.date}" data-date-format="hh:mm:ss"></td>
					          <td>
					          <button class="btn" onclick = "deleteBatch(${item.id})">删除</button>
					          <button class="btn" onclick = "startSpider(${item.id})">启动一个爬虫</button>
					          <c:if test="${item.flag == 1}">
					          <button class="btn" onclick = "cancelTimer(${item.id})">取消当前定时</button>
					          </c:if>
					          <c:if test="${item.flag == 0}">
					          <button  class="btn" onclick="addTimer(${item.id})">开启定时</button>
					          </c:if>
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
					  		<a href="${ctx}/spider/batchSpiderList?name=${name}&page=0" aria-label="First" onclick="" id="firstPage" >
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