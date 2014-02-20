<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="struts"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!-- http://www.bootcss.com/p/bootstrap-wysiwyg/ -->
<html>
<head>
	<script type="text/javascript" src="js/jquery-2.0.2.min.js"></script>
	<script type="text/javascript" src="js/jquery.hotkeys.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/bootstrap-wysiwyg.js"></script>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
	<!--
	<link href="http://twitter.github.com/bootstrap/assets/js/google-code-prettify/prettify.css" rel="stylesheet">
	<link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.no-icons.min.css" rel="stylesheet">
	<link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link href="http://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
	-->
	<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.min.css" />
	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />

	<script type="text/javascript">
		$(document).ready(function(){
			$(function(){
				function initToolbarBootstrapBindings() {
					var fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier', 
			            'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
			            'Times New Roman', 'Verdana'],
					fontTarget = $('[title=Font]').siblings('.dropdown-menu');
					$.each(fonts, function (idx, fontName) {
						fontTarget.append($('<li><a data-edit="fontName ' + fontName +'" style="font-family:\''+ fontName +'\'">'+fontName + '</a></li>'));
					});
					$('a[title]').tooltip({container:'body'});
					$('.dropdown-menu input').click(function() {return false;})
					.change(function () {$(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');})
					.keydown('esc', function () {this.value='';$(this).change();});

					$('[data-role=magic-overlay]').each(function () { 
						var overlay = $(this), target = $(overlay.data('target')); 
						overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
					});
					$('#voiceBtn').hide();
					// if ("onwebkitspeechchange"  in document.createElement("input")) {
					//   var editorOffset = $('#editor').offset();
					//   $('#voiceBtn').css('position','absolute').offset({top: editorOffset.top, left: editorOffset.left+$('#editor').innerWidth()-35});
					// } else {
					//   $('#voiceBtn').hide();
					// }
				};
				initToolbarBootstrapBindings();  
		    	$('#editor').wysiwyg();
				window.prettyPrint && prettyPrint();
			});

			//init events
			$("#show_text").click(function(){
				$("#editor-result").html("");
				$("#editor-result").html($("#editor").html());
			});
			
		});
	</script>

	<%@ include file="page-load-handler-stack.jsp" %>
	<style>
		#editor-result{
			max-height: 250px;
			overflow: scroll;
			outline: none;
		}
		#editor {
			max-height: 250px;
			height: 250px;
			background-color: white;
			border-collapse: separate; 
			border: 1px solid rgb(204, 204, 204); 
			padding: 4px; 
			box-sizing: content-box; 
			-webkit-box-shadow: rgba(0, 0, 0, 0.0745098) 0px 1px 1px 0px inset; 
			box-shadow: rgba(0, 0, 0, 0.0745098) 0px 1px 1px 0px inset;
			border-top-right-radius: 3px; border-bottom-right-radius: 3px;
			border-bottom-left-radius: 3px; border-top-left-radius: 3px;
			overflow: scroll;
			outline: none;
		}
		#voiceBtn {
		  width: 20px;
		  color: transparent;
		  background-color: transparent;
		  transform: scale(2.0, 2.0);
		  -webkit-transform: scale(2.0, 2.0);
		  -moz-transform: scale(2.0, 2.0);
		  border: transparent;
		  cursor: pointer;
		  box-shadow: none;
		  -webkit-box-shadow: none;
		}

		div[data-role="editor-toolbar"] {
		  -webkit-user-select: none;
		  -moz-user-select: none;
		  -ms-user-select: none;
		  user-select: none;
		}

		.dropdown-menu a {
		  cursor: pointer;
		}
	</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h3><a href="http://www.bootcss.com/p/bootstrap-wysiwyg/" target="_blank">bootstrap-wysiwyg主页</a></h3>
			</div>
		</div>
	</div>
	<div class="container">

		<!-- multicolume -->
		<div class="row">
			<div class="col-lg-12">
				<h2>Result</h2>
				<div class="panel panel-default">
					<div id = "editor-result">
					</div>
				</div>

				<div class="btn-toolbar" data-role="editor-toolbar" data-target="#editor">
					<div class="btn-group">
						<a class="btn dropdown-toggle" data-toggle="dropdown" title="Font"><i class="icon-font"></i><b class="caret"></b></a>
						<ul class="dropdown-menu">
						</ul>
					</div>
					<div class="btn-group">
						<a class="btn dropdown-toggle" data-toggle="dropdown" title="Font Size"><i class="icon-text-height"></i>&nbsp;<b class="caret"></b></a>
						<ul class="dropdown-menu">
						<li><a data-edit="fontSize 5"><font size="5">Huge</font></a></li>
						<li><a data-edit="fontSize 3"><font size="3">Normal</font></a></li>
						<li><a data-edit="fontSize 1"><font size="1">Small</font></a></li>
						</ul>
					</div>
					<div class="btn-group">
						<a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i class="icon-bold"></i></a>
						<a class="btn" data-edit="italic" title="Italic (Ctrl/Cmd+I)"><i class="icon-italic"></i></a>
						<a class="btn" data-edit="strikethrough" title="Strikethrough"><i class="icon-strikethrough"></i></a>
						<a class="btn" data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i class="icon-underline"></i></a>
					</div>
					<div class="btn-group">
						<a class="btn" data-edit="insertunorderedlist" title="Bullet list"><i class="icon-list-ul"></i></a>
						<a class="btn" data-edit="insertorderedlist" title="Number list"><i class="icon-list-ol"></i></a>
						<a class="btn" data-edit="outdent" title="Reduce indent (Shift+Tab)"><i class="icon-indent-left"></i></a>
						<a class="btn" data-edit="indent" title="Indent (Tab)"><i class="icon-indent-right"></i></a>
					</div>
					<div class="btn-group">
						<a class="btn" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)"><i class="icon-align-left"></i></a>
						<a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i class="icon-align-center"></i></a>
						<a class="btn" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i class="icon-align-right"></i></a>
						<a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i class="icon-align-justify"></i></a>
					</div>
					<div class="btn-group">
						<a class="btn dropdown-toggle" data-toggle="dropdown" title="Hyperlink"><i class="icon-link"></i></a>
						<div class="dropdown-menu input-append">
						<input class="span2" placeholder="URL" type="text" data-edit="createLink"/>
						<button class="btn" type="button">Add</button>
						</div>
						<a class="btn" data-edit="unlink" title="Remove Hyperlink"><i class="icon-cut"></i></a>

					</div>

					<div class="btn-group">
						<a class="btn" title="Insert picture (or just drag & drop)" id="pictureBtn"><i class="icon-picture"></i></a>
						<input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" />
					</div>
					<div class="btn-group">
						<a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i class="icon-undo"></i></a>
						<a class="btn" data-edit="redo" title="Redo (Ctrl/Cmd+Y)"><i class="icon-repeat"></i></a>
					</div>
					<input type="text" data-edit="inserttext" id="voiceBtn" x-webkit-speech="">
				</div>

				<div id = "editor">
				</div>
				<div class="control-group">
					<label class="control-label"></label>
					<!-- Button -->
					<div class="controls">
					<button id="show_text" class="btn btn-success">Show</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- footer -->
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>




