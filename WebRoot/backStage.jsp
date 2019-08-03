<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <link rel="Shortcut Icon" href="images/ico128.png">
    <title>碟碟不朽后台管理系统</title>
    
    <link rel="stylesheet" type="text/css" href="css/backStage.css">
    	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
		<script src="javascript/backstage.js" type="text/javascript"></script>

	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<div id="header">
  		<div id="image">
  			<img src="images/logo.jpg"/>
  		</div>
  		<div id="userInfo">
  			<a href="admin_logout.form">${employee.username},注销登录</a>
  		</div>
  	</div>
    <div id="body">
    	<div id="leftList">
    		<ul>
    			<li><p id="m_manage">商品管理</p></li>
    			<li><p id="u_manage">用户信息查询</p></li>
    			<li><p id="r_manage">订单管理</p></li>
    			<li><p id="e_manage">工作人员管理</p></li>
    			<li><p id="c_manage">数据报表管理</p></li>
    		</ul>
    	</div>
    	<iframe id="rightContent" src="itemmanage.form">
    	</iframe>
    </div>
    <div id="footer">
    	<div><span footerContent>Copyright © 1998 - 2017 Tencent. All Rights Reserved.<br/>碟碟不朽商城版权所有 碟碟不朽网络文化经营许可证</span></div>
    </div>
  </body>
</html>
