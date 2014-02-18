<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="struts"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<script type="text/javascript" src="js/jquery-2.0.2.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/justified-nav.css" />

<%@ include file="page-load-handler-stack.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	$(".nav li").removeClass("active");
	$("#nav-home").addClass("active");
});
</script>
<body>
	<%@ include file="header.jsp" %>
	<div class="container">

		<!-- multicolume -->
		<div class="row">
			<div class="col-lg-12">
				<h2>Welcome To Secret System</h2>
			</div>
		</div>
		<!-- footer -->
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>
<script type="text/javascript" src="js/main.js"></script>



