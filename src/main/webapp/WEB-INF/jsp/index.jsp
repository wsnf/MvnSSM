<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = getServletContext().getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
			 "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8" />
		<link rel="stylesheet" href="<%=path %>/css/bootstrap.min.css" />
		<title>员工自助报销系统</title>
	</head>
	<body>
		<nav class="nav navbar-default navbar-fixed-top" role="navigation">
			<div class="container-fluid">
				<div class="navbar-header">
					<img src="<%=path %>/image/hand-logo.png" />
				</div>
				
				<div class="collapse navbar-collapse">
					
					<ul class="nav navbar-nav" id="mytab">
						<li class="active"><a href="<%=path %>/expenseCtrl/queryPage.do?page=1" target="mainFrame">报销单 </a></li>
						<li><a href="#">link2</a> </li>
						<li><a href="#">link2</a> </li>
					</ul>
					
					<!--<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input class="form-control" type="text" placeholder="搜索"/>
						</div>
						<button type="submit" class="btn btn-default">搜索</button>
					</form>-->
					
					<ul class="nav navbar-nav navbar-right">
						<c:if test="${!empty emp}">
							<li><a href="#">${emp.uname }</a> </li>
						</c:if>
						<c:if test="${empty emp}">
							<li><a href="#" >登  录</a> </li>
						</c:if>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">dropdown<span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">Hello1</a> </li>
								<li><a href="#">Hello2</a> </li>
								<li><a href="#">Hello3</a> </li>
								<li><a href="#">Hello4</a></li>
							</ul>
						</li>
					</ul>
				</div>
				
				
			</div>
		</nav>
		
		<div style="height: 50px;"></div>
		<iframe src="<%=path %>/expenseCtrl/queryPage.do?page=1" name="mainFrame" id="framePage" frameborder="0"
			style="width: 100%;height: 620px;padding-top: 20px;">
			
		</iframe>
		
		<script type="text/javascript" src="<%=path %>/js/jquery-2.2.4.min.js" ></script>
		<script type="text/javascript" src="<%=path %>/js/bootstrap.min.js" ></script>
		<script>
			$("#mytab a").click(function(){
				$(this).tab("show");
			});
			  
		</script>
		
	</body>
</html>
