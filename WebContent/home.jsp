<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="struts"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!-- http://www.bootcss.com/ -->
<html>
<head>
	<script type="text/javascript" src="js/jquery-2.0.2.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/util.js"></script>
	<script type="text/javascript" src="js/show_home.js"></script>
</head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

<%@ include file="page-load-handler-stack.jsp" %>

<body>
	<%@ include file="header.jsp" %>

	<div class="container">

		<div class="row">
			<div class="col-md-4">
				<div class="thumbnail">
					<img src="./images/cat-1.jpg" alt="...">
					<div class="caption">
						<h3>Kitty</h3>
						<p>Am I cute?</p>
						<p><a href="#" class="btn btn-warning" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="thumbnail">
					<img src="./images/cat-2.jpg" alt="...">
					<div class="caption">
						<h3>Kitty</h3>
						<p>Don't wake me up</p>
						<p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="thumbnail">
					<img src="./images/cat-3.jpg" alt="...">
					<div class="caption">
						<h3>Kitty</h3>
						<p>Thinking of fish?</p>
						<p><a href="#" class="btn btn-danger" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-success">
					<div class="panel-heading">
						<h3>Family</h3>
					</div>
					<div class="panel-body">
						<div class="col-lg-6">
							<div class="thumbnail">
								<img src="./images/cat-4.jpg" alt="...">
								<div class="caption">
									<p>Bit fat bad cat</p>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="thumbnail">
								<img src="./images/cat-5.jpg" alt="...">
								<div class="caption">
									<p>Show how we loved</p>
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



