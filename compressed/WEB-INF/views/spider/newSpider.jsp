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
				  <li class="active">爬虫详情</li>
				</ol>
			</div>
			
			<div class = "main_content">
			
			<form method="get" action="${ctx }/spider/saveSpider" enctype="multipart/form-data">
			<input type="hidden" id="sid" name="sid" value="${spider.id}" />
				<table class="table table-striped table-bordered ">
				<tbody>
				<tr>
				<td><label >爬虫名称</label></td>
				<td><input type="text" class="form-control" id="spider_name" name="spider_name" value= ${spider.name} readonly="readonly"></td>
				</tr>
				<tr>
				<td><label >爬虫别称</label></td>
				<td><input type="text" class="form-control" id="spider_Nname" name="spider_Nname" value= ${spider.nickName} ></td>
				</tr>
				<tr>
				<td><label >来源网站</label></td>
				<td><input type="text" class="form-control" id="web_name" name="web_name" value= ${spider.source.name} readonly="readonly"></td>
				</tr>
				<tr>
				<td><label >来源网站别称</label></td>
				<td><input type="text" class="form-control" id="web_Nname" name="web_Nname" value= ${spider.source.nickName}></td>
				</tr>
				<tr>
				<td><label >参数</label></td>
				<td>
				<table class="table table-striped table-bordered ">
				<thead>
				<tr>
				<th>参数名</th>
				<th>参数类型</th>
				<th>操作</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="para" items="${spider.parameters}">
				<tr>
				<td>${para.name}</td>
				<td>
				<select class="form-control select_input" orgvalue="${para.type}" readonly="readonly">
				<option value = "0">未定义</option>
				<option value = "1">整数</option>
				<option value = "2">字符串</option>
				<option value = "3">日期确定到天</option>
				<option value = "4">日期确定到月</option>
				</select>
				</td>
				<td>
				<button class="btn" onclick = "deleteParameter(${para.id})">删除</button>
				</td>
				<td></td>
				</tr>
				</c:forEach>
				</tbody>
				</table>
				</td>
				<td>
				添加参数
				<input id = "paraname" class = "form-control" placeholder = "参数名字">
				<select id = "paravalue" class="form-control select_input" orgvalue="${para.type}">
				<option value = "0">未定义</option>
				<option value = "1">整数</option>
				<option value = "2">字符串</option>
				<option value = "3">日期确定到天</option>
				<option value = "4">日期确定到月</option>
				</select>
				<button id = "addPara" class="btn">添加</button>
				</td>
				</tr>
				</tbody>
				</table>
				
				<button type="submit" class="btn btn-primary" style="width:130px">保存</button>
			</form>
			</div>
			
			
			
		</div>
	</div>
   
</body>
<script type="text/javascript" src="${ctx}/static/js/common.js"></script>
</html>
