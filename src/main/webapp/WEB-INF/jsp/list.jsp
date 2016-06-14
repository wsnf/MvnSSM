<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = getServletContext().getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="80%" align="center">
		<tr>
			<td>编号</td>
			<td>名称</td>
			<td>密码</td>
		</tr>
		<c:forEach items="${empList }" var="emp">
			<tr>
				<td>${emp.id }</td>
				<td>${emp.uname }</td>
				<td>${emp.pwd }</td>
				<td><a href="<%=path %>/delete.do?id=${emp.id}">删除</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>