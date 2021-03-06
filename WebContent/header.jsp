<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="struts"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!-- http://v3.bootcss.com/css/ -->
<nav class="navbar navbar-default" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <a class="navbar-brand" href="home.jsp">Secret System</a>
  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav">
      <li id="nav-home"><a href="home.jsp">Home</a></li>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Home Styles<b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li><a href="homeStyle1.jsp">homeStyle1</a></li>
        </ul>
      </li>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Features <b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li><a href="bootstrapWysiwygTryout.jsp">bootstrap-wysiwyg tryout</a></li>
          <li class="divider"></li>
          <li><a href="messengerTryout.jsp">弹框提示</a></li>
        </ul>
      </li>

      <li><a href="dbTryout.jsp">数据库表格操作</a></li>
      <li id="nav-manage-user" ><a href="manageUser.jsp">系统用户管理</a></li>
    </ul>
    <form class="navbar-form navbar-left" role="search">
      <div class="form-group">
        <input type="text" class="form-control" placeholder="Search">
      </div>
      <button type="submit" class="btn btn-default">Submit</button>
    </form>
    <ul class="nav navbar-nav navbar-right">
		<struts:if test="#session.account==null">
			<li><a href="login.jsp">登陆</a></li>
		</struts:if>
		<struts:else>
			<li><a><struts:property value="#session.account" /></a></li>
			<li><a><struts:property value="#session.loginTime" /></a></li>
			<li><a href="<struts:url action="logout" />">注销</a></li>
		</struts:else>
    </ul>
  </div>
</nav>

