<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="struts"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<script type="text/javascript" src="js/jquery-2.0.2.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/justified-nav.css" />

<%@ include file="page-load-handler-stack.jsp" %>

<body>
	<div>
		<struts:if test="#session.account==null">
			<a href="login.jsp">login</a>
		</struts:if>
		<struts:else>
			登录成功，欢迎你，<struts:property value="#session.account" />
			登录时间，<struts:property value="#session.loginTime" />
			<a href="<struts:url action="logout" />">logout</a>
		</struts:else>

		<a href="<struts:url action="service1" />">Service1</a>
	</div>
	<div class="container">
		<!-- nav style 1-->
		<div>
			<ul class="nav nav-justified">
				<li class="active"><a href="#">Home</a></li>
				<li><a href="#">Field1</a></li>
				<li><a href="#">Field1</a></li>
				<li><a href="#">Field1</a></li>
			</ul>
		</div>

		<!-- multicolume -->
		<div class="row">
			<div class="col-lg-12">
				<h2>User Information</h2>
				<div class="panel panel-default">
					<table class="table">
						<thead>
							<th>UID</th>
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
			</div>
		</div>
		
		<!-- footer -->
		<div class="footer">
			<p>@ linjun 2014</p>
		</div>

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
<script type="text/javascript" src="js/main.js"></script>



