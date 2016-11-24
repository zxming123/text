<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<c:if test="${empty sessionScope.username}">
		<c:redirect url="/admin/login"/>
</c:if>

