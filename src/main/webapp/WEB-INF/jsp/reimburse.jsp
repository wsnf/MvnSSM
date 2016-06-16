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
		<meta charset="UTF-8">
		<link rel="stylesheet" href="<%=path %>/css/bootstrap.min.css" />
		<title>报销单</title>
	</head>
	<body>
		<div class="container">
			<div class="panel panel-default">
				<div class="panel-heading">我的报销单</div>
				<div class="panel-body">
					<a class="btn btn-default" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-plus"></span> 新增报修单 </a>
				</div>
				<!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="myModalLabel">新增报销单</h4>
				      </div>
				      <div class="modal-body">
				        <form  action="<%=path %>/expenseCtrl/addExpense.do" method="post" class="form-horizontal" name="addForm">
				        	<div class="form-group">
		    					<label class="col-sm-2 control-label" for="local"> 
		    						<span class="glyphicon glyphicon-map-marker"></span>
		    					</label>
		    					<div class="col-sm-9">
		    						<input class="form-control" type="text" name="local" placeholder="项目地点" />
		    					</div>
	    					</div>
	    					<div class="form-group">
		    					<label class="col-sm-2 control-label" for="payname"> 
		    						<span class="glyphicon glyphicon-edit"></span>
		    					</label>
		    					<div class="col-sm-9">
		    						<input class="form-control" type="text" name="payname" placeholder="费用名称" />
		    					</div>
	    					</div>
	    					<div class="form-group">
		    					<label class="col-sm-2 control-label" for="price"> 
		    						<span class="glyphicon glyphicon-usd"></span>
		    					</label>
		    					<div class="col-sm-9">
		    						<input class="form-control" type="number" name="price" placeholder="报销价格RMB" />
		    					</div>
	    					</div>
	    					<div class="form-group">
		    					<label class="col-sm-2 control-label" for="startDate"> 
		    						开始 <span class="glyphicon glyphicon-calendar"></span>
		    					</label>
		    					<div class="col-sm-9">
		    						<input class="form-control" type="date" name="startDate"/>
		    					</div>
	    					</div>
	    					<div class="form-group">
		    					<label class="col-sm-2 control-label" for="endDate"> 
		    						结束 <span class="glyphicon glyphicon-calendar"></span>
		    					</label>
		    					<div class="col-sm-9">
		    						<input class="form-control" type="date" name="endDate"/>
		    					</div>
	    					</div>
	    					<div class="form-group">
		    					<label class="col-sm-2 control-label" for="abstracts"> 
		    						<span class="glyphicon glyphicon-tag"></span>
		    					</label>
		    					<div class="col-sm-9">
		    						<input class="form-control" type="text" name="abstracts" placeholder="摘要" />
		    					</div>
	    					</div>
				        
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">关  闭</button>
				        <button type="submit" class="btn btn-primary">提  交</button>
				      </div>
				      </form>
				    </div>
				  </div>
				</div>
				
				<table class="table table-striped table-responsive" style="text-align: center;">
					<thead>
						<td>#</td>
						<td>地点</td>
						<td>费用名称</td>
						<td>报销价格</td>
						<td>开始日期</td>
						<td>结束日期</td>
						<td>摘要</td>
						<td>操作</td>
					</thead>
					<tbody>
						<c:forEach items="${expenseList }" var="expense">
							<tr>
								<td>${expense.id }</td>
								<td>${expense.local }</td>
								<td>${expense.payname }</td>
								<td>${expense.price }</td>
								<td>${expense.startDate }</td>
								<td>${expense.endDate }</td>
								<td>${expense.abstracts }</td>
								<td>
									<div class="btn btn-info" data-expense="${expense }"
									 onclick="edit(${expense.id },${expense.local },${expense.payname },${expense.price },${expense.startDate },${expense.endDate },${expense.abstracts })"
									 data-toggle="modal" data-target="#editModal">编辑</div>
									<a href="<%=path %>/expenseCtrl/delete.do?id=${expense.id }" class="btn btn-danger" onclick="return deleteConfirm();">删除</a>
								</td>
							</tr>
						</c:forEach>
						
					</tbody>	
				</table>
				<nav class="pull-right">
					<ul class="pagination pagination-lg">
						<li>
							<a class="btn" onclick="getPage('back',${currentPage});">
								<span>&laquo;</span>
							</a>
						</li>
						<li><a class="btn" onclick="getPage('nan',1);">1</a></li>
					    <li><a class="btn" onclick="getPage('nan',2);">2</a></li>
					    <li><a class="btn" onclick="getPage('nan',3);">3</a></li>
					    <li><a class="btn" onclick="getPage('nan',4);">4</a></li>
					    <li><a class="btn" onclick="getPage('nan',5);">5</a></li>
					    <li>
					      <a class="btn" onclick="getPage('next',${currentPage});" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					</ul>
				</nav>
			</div>
		</div>
		
		<script type="text/javascript" src="<%=path %>/js/jquery-2.2.4.min.js" ></script>
		<script type="text/javascript" src="<%=path %>/js/bootstrap.min.js" ></script>
		<script>
			function deleteConfirm(){
				if(confirm("此操作不可恢复，确认是否删除?"))
					return true;
				else
					return false;
			}
			function edit(id,local,payname,price,startdate,enddate,abstracts){
				$("#edit-local").val(local);
			}
			
			function getPage(operate,page){
				
				if(operate=='back'){
					page = page-1;
					if(page==0)
						page=1;
				}
				if(operate=='next'){
					page = page+1;
				}
				var path = "<%=path %>/expenseCtrl/queryPage.do?page="+page;
				window.location.href=path;
			}
		</script>
	</body>
</html>
