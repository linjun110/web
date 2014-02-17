<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="struts"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<script type="text/javascript" src="js/jquery-2.0.2.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/justified-nav.css" />
<link rel="stylesheet" type="text/css" href="css/signin.css" />
<style>
</style>
<head>
    <title>Secret System</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">    
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
</head>
<body>
    <div class="container">
        <!-- body -->
        <form class="form-signin" role="form" method="POST" action="login.jsp">
            <h2 class="form-signin-heading">Secret System</h2>
            <input type="text" class="form-control" placeholder="Account" required autofocus name="account">
            <input type="password" class="form-control" placeholder="Password" required name="password">
            <label class="checkbox" style="display:none;">
                <input type="checkbox" value="remember-me">Remember me
            </label>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
        </form>     
    </div>
</body>
</html>

<script>
$(document).ready(function(){

});
</script>


