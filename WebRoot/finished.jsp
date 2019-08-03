<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>支付完成</title>
    <link rel="Shortcut Icon" href="images/ico128.png">
    
    <link rel="stylesheet" type="text/css" href="css/finished.css">
    
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

    <%@include file="new_head.jsp" %>

    <div id="body">
	    <div id="content">
	    	<c:if test="${payResult == 'true' }">
		    	<span id="span1">支付成功，共支付<label>&nbsp;${total }&nbsp;</label>元</span>
		    	<br/><br/>
		    	<span>订单编号：${receiptid }</span>
		    	<br/><br/><br/>
		    	<a href="ddbx.form" >返回首页</a>
		    	&nbsp;&nbsp;
		    	<input type=button onclick="window.open('personal.jsp')" value="查看已购买的专辑"/>
	    	</c:if>
	    	<c:if test="${payResult != 'true' }">
	    		<span id="span1">支付失败！<a href="">返回首页</a></span>
	    	</c:if>
	    </div>
    </div>
    <%@include file="tail_white.jsp" %> 
    
  </body>
</html>
