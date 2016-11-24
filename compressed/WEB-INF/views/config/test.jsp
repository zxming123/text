<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>  	
</head>
 <p>${name}</p>
<body>
   <tr>
      <th>表名</th>
      <th>数据库IP</th>
      <th>数据库名</th>
      <th>端口号</th>
      <th>优先级</th>
      <th>数据表主键id</th>
      <th>优先级表表名</th>
      <th>优先级表外键名称</th>		
      <th>操作</th>   
   </tr>
				
	<c:forEach var="item" items="${clist}">
		<br>
		<tr>
  	 	<td> ${item.tbname}</td>
        <td> ${item.ip}</td>
        <td> ${item.dbname}</td>
        <td> ${item.port}</td>
        <td> ${item.priority }</td>
        <td> ${item.keyName }</td>     
        <td> ${item.priorityTbname}</td>
        <td> ${item.priorityForeignName}</td>
    	</tr>
   </c:forEach>

					        
		
</body>

</html>
