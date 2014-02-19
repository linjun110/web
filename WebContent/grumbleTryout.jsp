<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="struts"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<script type="text/javascript" src="js/jquery-2.0.2.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery.grumble.min.js"></script>

	<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="css/grumble.min.css">
</head>
<script type="text/javascript">
$(document).ready(function(){
	$("#takeAction").click(function(){
		$('#grumble-anchor').grumble({
			text: 'Bubble-tastic!', 
			angle: 80, 
			distance: 50, 
			type: 'alt-',
			showAfter: 500,
			hideAfter: 2000,
			//hideAfter: false,
			//hasHideButton: true,
			buttonHideText: 'Pop!',
			onShow: function(){
				console.log('triggered when show animation completes');
			},
			onBeginHide: function(){
				console.log('triggered when hide animation begins');
			},
			onHide: function () { 
				console.log('triggered when hide animation completes');
			}
		});
	});
});
</script>
<%@ include file="page-load-handler-stack.jsp" %>
<body>
	<%@ include file="header.jsp" %>
	<div class="container">

		<!-- multicolume -->
		<div class="row">
			<div class="col-lg-12">
				<h2>grumble tryout</h2>
				<div id = "grumble-anchor" style="width:100px;">
					grumble-anchor
				</div>
				<p>
					<button type="button" id = "takeAction" class="btn btn-danger">Take Action</button>
				</p>
			</div>
		</div>
		
		<!-- footer -->
		<%@ include file="footer.jsp" %>
</body>
</html>



