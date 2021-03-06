<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="struts"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<script type="text/javascript" src="js/jquery-2.0.2.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

	<script type="text/javascript" src="js/alertify.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/alertify.core.css" />
	<link rel="stylesheet" type="text/css" href="css/alertify.default.css" />

	<script type="text/javascript" src="js/util.js"></script>
	<script type="text/javascript" src="js/show_user_manage.js"></script>

</head>

<%@ include file="page-load-handler-stack.jsp" %>
<style>
	th,td{
		text-align: center;
	}
</style>
<body>
	<%@ include file="header.jsp" %>
	<div class="container">

		<!-- multicolume -->
		<div class="row">
			<div class="col-lg-6">
				<h2>User表</h2>
				<div class="panel panel-default">
					<table class="table">
						<thead>
							<th>ID</th>
							<th>Name</th>
							<th></th>
						</thead>
						<tbody id="users">
						</tbody>
					</table>
				</div>
				<p>
					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addUser">Add</button>
					<button type="button" id = "deleteAll" class="btn btn-danger">Delete All</button>
				</p>

				<div class="panel panel-success"> <!-- 参考网站链接 -->
					<div class="panel-heading">
						<h3>参考网站链接</h3>
					</div>
					<div class="panel-body">
						<div class="col-lg-12">	<!-- 列 -->

							<div class="panel-group" id="accordion"> <!-- 折叠 -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
												常用
											</a>
										</h4>
									</div>
									<div id="collapseOne" class="panel-collapse collapse">
										<div class="panel-body">
											<h4><a href="https://www.google.com.hk" target="_blank">Google</a></h4>
											<h4><a href="http://www.w3schools.com/" target="_blank">W3shools</a></h4>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
												Bootstrap
											</a>
										</h4>
									</div>
									<div id="collapseTwo" class="panel-collapse collapse in">
										<div class="panel-body">
											<h4><a href="http://www.bootcss.com/" target="_blank">bootstrap主页</a></h4>
											<h4><a href="http://v3.bootcss.com/getting-started/" target="_blank">bootstrap起步</a></h4>
											<h4><a href="http://v3.bootcss.com/css/" target="_blank">bootstrap css</a></h4>
											<h4><a href="http://v3.bootcss.com/components/" target="_blank">bootstrap组件</a></h4>
											<h4><a href="http://v3.bootcss.com/javascript/" target="_blank">bootstrap插件</a></h4>
										</div>
									</div>
								</div>
							</div>
						</div>	<!-- end of 列 -->
					</div>
				</div> <!-- end of 参考网站链接 -->
			</div> <!-- end of col-lg-6 -->

			<div class="col-lg-6 pull-right">
				<div class="thumbnail">
					<img src="./images/cat-1.jpg" alt="...">
					<div class="caption">
						<h3>Kitty:</h3>
						<p>亲，您在本页面对用户所进行的操作可能会影响到登陆喵～，请万分小心喵～</p>
						<p><a href="javascript:void(0)" class="btn btn-warning" role="button">Yellow</a> <a href="javascript:void(0)" class="btn btn-default" role="button">White</a></p>
					</div>
				</div>
			</div>
		</div>

		<!-- footer -->
		<%@ include file="footer.jsp" %>

		<!-- Add User Modal -->
		<div class="modal fade" id="addUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title">Add new user</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" role="form">
							<div class="form-group">
								<label for="name" class="col-sm-2 control-label">Name</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="add_name" placeholder="Name">
								</div>
							</div>
							<div class="form-group">
								<label for="password" class="col-sm-2 control-label">Password</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" id="add_password" placeholder="Password">
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" id="add_user_save" class="btn btn-primary">Save</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->
		</div><!-- /.modal -->

		<!-- Edit User Modal -->
		<div class="modal fade" id="editUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title">Edit user</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" role="form">
							<div class="form-group" style="display:none;">
								<label for="name" class="col-sm-2 control-label">Id</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="edit_id" placeholder="Id">
								</div>
							</div>
							<div class="form-group">
								<label for="name" class="col-sm-2 control-label">Name</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="edit_name" placeholder="Name">
								</div>
							</div>
							<div class="form-group">
								<label for="password" class="col-sm-2 control-label">Password</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" id="edit_password" placeholder="Password">
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" id="edit_user_save" class="btn btn-primary">Save</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
	</div>
</body>
</html>



