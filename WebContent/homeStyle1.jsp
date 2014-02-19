<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="struts"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!-- http://www.bootcss.com/ -->
<html>
<head>
	<script type="text/javascript" src="js/jquery-2.0.2.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

<%@ include file="page-load-handler-stack.jsp" %>

<body>
	<%@ include file="header.jsp" %>

	<div class="jumbotron">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="text-center">Welcome To Secret System</h1>
				</div>	
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-success">
					<div class="panel-heading">
						<h3>Panel heading without title</h3>
					</div>
					<div class="panel-body">
						<div class="col-lg-6">
							<div class="list-group">
								<a href="#" class="list-group-item active">
									Top
								</a>
								<a href="#" class="list-group-item">Dapibus ac facilisis in</a>
								<a href="#" class="list-group-item">Morbi leo risus</a>
								<a href="#" class="list-group-item">Porta ac consectetur ac</a>
								<a href="#" class="list-group-item">Vestibulum at eros</a>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="thumbnail">
								<img src="./images/cat-4.jpg" alt="...">
								<div class="caption">
									<p>Bit fat bad cat</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- footer -->
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>



