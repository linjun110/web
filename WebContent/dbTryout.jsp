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
	<script type="text/javascript" src="js/show_db_manage.js"></script>
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
				<h2>testTable 表</h2>
				<div class="panel panel-default">
					<table class="table">
						<thead>
							<th>ID</th>
							<th>用户名</th>
							<th>密码</th>
							<th>操作</th>
						</thead>
						<tbody id="testTables">
						</tbody>
					</table>
				</div>
				<p>
					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#add_testTable">Add</button>
					<button type="button" id = "deleteAll" class="btn btn-danger">Delete All</button>
				</p>
			</div>
			<div class="col-md-6">
				<script type="text/javascript">
					$(document).ready(function(){
						<!-- http://v3.bootcss.com/javascript/#carousel -->
						$('.carousel').carousel({
							interval: 6000
						});
					});
				</script>
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner">
						<div class="item active">
							<img src="./images/cat-1.jpg" alt="...">
							<div class="carousel-caption">
								卖萌无罪，喵～
							</div>
						</div>
						<div class="item">
							<img src="./images/cat-4.jpg" alt="...">
							<div class="carousel-caption">
								卖萌无罪，喵～
							</div>
						</div>
						<div class="item">
							<img src="./images/cat-5.jpg" alt="...">
							<div class="carousel-caption">
								卖萌无罪，喵～
							</div>
						</div>
					</div>

					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left"></span>
					</a>
					<a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right"></span>
					</a>
				</div>

			</div>
		</div>
		
		<!-- footer -->
		<%@ include file="footer.jsp" %>

		<!-- Add testTable Modal -->
		<div class="modal fade" id="add_testTable" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title">Add new testTable</h4>
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
						<button type="button" id="add_testTable_save" class="btn btn-primary">Save</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->
		</div><!-- /.modal -->

		<!-- Edit testTable Modal -->
		<div class="modal fade" id="edit_testTable" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title">Edit testTable</h4>
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
						<button type="button" id="edit_testTable_save" class="btn btn-primary">Save</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
	</div>
</body>
</html>



