<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="struts"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!-- http://www.bootcss.com/ -->
<html>
<head>
	<script type="text/javascript" src="js/jquery-2.0.2.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

</head>

<STYLE TYPE="text/css">
.navbar{
	margin-bottom: 0px;	/* 使最顶部的导航与紧下面的100%图片没有缝隙 */
}
</STYLE>
<%@ include file="page-load-handler-stack.jsp" %>

<body>
	<%@ include file="header.jsp" %>

	<div class="jumbotron">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h2 class="text-center">Welcome To Secret System</h2>
				</div>	
			</div>
		</div>
	</div>

	<div class="container"> <!-- 轮播 -->
		<div class="row">
			<div class="col-lg-6 col-lg-offset-3">
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
								SLIDE 1
							</div>
						</div>
						<div class="item">
							<img src="./images/cat-4.jpg" alt="...">
							<div class="carousel-caption">
								SLIDE 2
							</div>
						</div>
						<div class="item">
							<img src="./images/cat-5.jpg" alt="...">
							<div class="carousel-caption">
								SLIDE 3
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
	</div>

	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-success">
					<div class="panel-heading">
						<h3>Family</h3>
					</div>
					<div class="panel-body">
						<div class="col-lg-4">
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
						<div class="col-lg-4">
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
	</div>

	<div class="container">
		<!-- footer -->
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>



