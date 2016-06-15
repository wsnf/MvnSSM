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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" href="<%=path %>/css/bootstrap.min.css" />
        <link rel="stylesheet" href="<%=path %>/css/login.css" />
        <title>员工登录</title>
    </head>
    <body>
    	<div>
    		<div class="container">
    			<div id="login_box">
	    			<form action="<%=path %>/login.do" method="post" class="form-horizontal" name="loginForm" ng-app="">
	    				<div class="form-group">
	    					<h2 style="text-align: center;">员工登录</h2>
	    				</div><br />
	    				<div class="form-group">
	    					<label class="col-sm-2 control-label" for="uname"> 
	    						<span class="glyphicon glyphicon-user"></span>
	    					</label>
	    					<div class="col-sm-9">
	    						<input class="form-control" type="text" name="uname" placeholder="用户名" />
	    						
	    					</div>
	    				</div><br />
	    				<div class="form-group">
	    					<label class="col-sm-2 control-label" for="pwd">
								<span class="glyphicon glyphicon-lock"></span>
	    					</label>
	    					<div class="col-sm-9">
	    						<input class="form-control" type="password" name="pwd" placeholder="密码" />
	    					</div>
	    				</div><br />
	    				<div class="form-group">
	    					<div class="col-sm-offset-2 col-sm-3">
	    						<button type="submit" class="btn btn-primary form-control">登  录</button>
	    					</div>
	    					<div class="col-sm-offset-3 col-sm-3">
	    						<a type="button" class="btn btn-primary form-control" href="">注  册</a>
	    					</div>
	    				</div>
	    			</form>
    			</div>
    		</div>
    	</div>
    	
    	<script type="text/javascript" src="<%=path %>/js/angular-1.0.1.min.js" ></script>
    	
 	</body>
</html>