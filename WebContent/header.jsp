<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="struts"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<struts:if test="#session.account==null">
	<a href="login.jsp">login</a>
</struts:if>
<struts:else>
	登录成功，欢迎你，<struts:property value="#session.account" />
	登录时间，<struts:property value="#session.loginTime" />
	<a href="<struts:url action="logout" />">logout</a>
</struts:else>
<div class="container">
	<!-- nav style 1-->
	<div>
		<ul class="nav nav-justified">
			<li id="nav-home"><a href="home.jsp">Home</a></li>
			<li><a href="#">Field1</a></li>
			<li><a href="#">Field1</a></li>
			<li id="nav-manageUser"><a href="manageUser.jsp">User Management</a></li>
		</ul>
	</div>
</div>