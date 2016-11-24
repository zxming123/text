<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
	<%@include file="../common/c_common.jsp" %>
	   	<%@include file="../common/c_session.jsp" %>
   <link href="${ctx}/static/css/adminProList.css" rel='stylesheet' type='text/css' />
	<script src="${ctx}/static/js/adminPage.js"></script>
	<script src="${ctx}/static/js/adminProList.js"></script>
	<script src="${ctx}/static/js/spider/parameter.js"></script>
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
				  <li class="active">批量爬虫步骤</li>
				</ol>
			</div>
			
			<div class = "main_content">
			
			<form id="new_step_form" method="post" action="${ctx }/spider/saveBatchStep" enctype="multipart/form-data">
			<input type="hidden" id="stepId" name="stepId" value="${step.id}" />
			<table class="table table-striped table-bordered ">
			<tr><td><label>批处理名字</label><td><input class="form-control" value = "${step.batch.name}" readonly="readonly" /></td>
			<td><label>爬虫</label></td><td><input  class="form-control" value="${step.spider.name}" readonly="readonly" /></td>
			<td><label>步骤</label></td><td><input class="form-control" value = "${step.step}" readonly="readonly" /></td></tr>
			</table>
				<table class="table table-striped table-bordered ">
				<thead>
				<tr>
				<th>参数名</th>
				<th>参数类型</th>
				<th>参数默认值</th>
				</tr>
				</thead>
				
				<tbody>
				<c:forEach var = "item" items = "${step.values}">
				<tr>
				<td>${item.parameter.name}</td>
				<td>
				<select class="form-control select_input" orgvalue="${item.parameter.type}" readonly="readonly">
				<option value = "0">未定义</option>
				<option value = "1">整数</option>
				<option value = "2">字符串</option>
				<option value = "3">日期确定到天</option>
				<option value = "4">日期确定到月</option>
				</select>
				</td>
				<td><input class="form-control" name = "${item.id}" id = "${item.id}" value = "${item.defaultValue}"></td>
				</tr>
				</c:forEach>
				</tbody>
				</table>
				
			<div id="form-action" style="text-align:center;margin-bottom:20px;margin-top:10px;">
							<button type="submit" class="btn btn-primary" style="width:130px">保存</button>
							<button type="reset" class="btn btn-danger" style="width:130px">重置</button>
			</div>
			</form>
			
			<div class = "main_content">
			备注: 当参数类型为日期时，当天（或当月）为基点（0），-1代表前一天（前一月），1代表后一天（后一月），以此类推。
			</div>
			</div>
			
			
			
		</div>
	</div>
   
</body>
<script type="text/javascript" src="${ctx}/static/js/common.js"></script>
</html>
