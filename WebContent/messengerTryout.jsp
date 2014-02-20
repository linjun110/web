<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="struts"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<script type="text/javascript" src="js/jquery-2.0.2.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

	<!-- -->
	<script type="text/javascript" src="js/jquery.grumble.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/grumble.min.css">

	<!-- messenger组件 http://www.bootcss.com/p/messenger/ -->
	<script type="text/javascript" src="js/messenger.js"></script>
	<link rel="stylesheet" type="text/css" href="css/messenger.css" />
	<link rel="stylesheet" type="text/css" href="css/messenger-theme-air.css" />
	<link rel="stylesheet" type="text/css" href="css/messenger-theme-block.css" />
	<link rel="stylesheet" type="text/css" href="css/messenger-theme-flat.css" />
	<link rel="stylesheet" type="text/css" href="css/messenger-theme-future.css" />
	<link rel="stylesheet" type="text/css" href="css/messenger-theme-ice.css" />
	<!-- end of messenger组件 -->

</head>
<script type="text/javascript">
$(document).ready(function(){
	$("#grumble-trigger").click(function(){
		$('#grumble-target').grumble({
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

	$._messengerDefaults = {
		extraClasses: 'messenger-fixed messenger-theme-future messenger-on-bottom messenger-on-right'
	}
	$.globalMessenger().post( "Your request has succeded!");


	$('#popovers-target').popover({
		title: "",
		content: "Why click me?",
		placement: "bottom"
	});

});
</script>
<%@ include file="page-load-handler-stack.jsp" %>
<body>
	<%@ include file="header.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h3><a href="http://www.bootcss.com/p/grumblejs/" target="_blank">grumble主页</a></h3>
				<div id = "grumble-target" style="width:100px;">
					grumble-target
				</div>
				<p>
					<button type="button" id = "grumble-trigger" class="btn btn-danger">grumble-trigger</button>
				</p>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h3><a href="http://www.bootcss.com/p/messenger/"  target="_blank">messenger主页</a></h3>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h3><a href="http://v3.bootcss.com/javascript/#popovers-usage" target="_blank">popovers使用</a></h3>
				<div id="popovers-target">popovers-target</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<%@ include file="footer.jsp" %>
</body>
</html>



