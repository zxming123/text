<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<nav class="nav-side">
	<div class="side-scroll">
		<div class="nav_top">
			<img alt="" src="${ctx }/static/image/m_logo.png" width=180>
			<!-- 
			<a href="#" class="title">
				<span class="glyphicon glyphicon-home"></span>
				数据管理系统
			</a>
			 -->
			<div class="welcome">管理员&nbsp; ${sessionScope.username}&nbsp; <a href="${ctx }/admin/logout">退出</a></div>
		</div>
		<div class="nav-menu-vertical" >
			<ul class="dropmenu">
				<li>
					<a class="dropmenu" href="#">用户管理</a>
					<ul>
						<li>
							<a class="submenu" href="#">
								<i class="icon-file-alt"></i>
								<span class="hidden-tablet">管理员查询</span>
							</a>
						</li>
					</ul>	
				</li>
			</ul>
			
			<p class="caption">
				<span class="caption-text">爬虫管理</span>
			</p>
			<ul>
				<li>
					<a href="${ctx }/spider/spiderInfoList">爬虫任务</a>
				</li>
				<li>
					<a href="${ctx }/spider/webList">来源网站</a>
				</li>
				<li>
					<a href="${ctx }/spider/batchSpiderList">批量爬虫列表</a>
				</li>
			</ul>
			
			<p class="caption">
				<span class="caption-text">数据管理</span>
			</p>
			<ul>
				<li>
					<a href="${ctx }/source/list">来源去向表管理</a>
				</li>
				<li>
					<a href="${ctx }/config/map_list">数据处理映射</a>
				</li>
<!-- 				<li> -->
<!-- 					<a href="../data/datamanage">数据处理</a> -->
<!-- 				</li> -->
				<li>
					<a href="${ctx }/source/task/logs">数据处理记录</a>
				</li>
				
			</ul>
			
			<p class="caption">
				<span class="caption-text">脚本管理</span>
			</p>
			<ul>
				<li>
					<a href="${ctx }/python/codeList">脚本列表</a>
				</li>
			</ul>
			<!-- 
			<p class="caption" style="position:absolute;bottom:65px;">
				<img alt="" src="${ctx }/static/image/m_logo.png" width=180>
			</p>
			 -->
			 <p class="caption copyright">
				Copyright&nbsp;&copy;&nbsp;2015-2017&nbsp;数据管理后台系统
			</p>
		</div>
		
	</div>
</nav>

