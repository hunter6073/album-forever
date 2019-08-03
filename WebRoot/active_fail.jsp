<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
		<title>解冻失败 - 碟碟不朽网</title>
		<link rel="Shortcut Icon" href="<%=basePath%>images/ico128.png" />

<script type="text/javascript">  
	    var time = 4;  
	  
	    function returnUrlByTime() {  
	        window.setTimeout('returnUrlByTime()', 1000);
	        if(time>0){  
	       		time = time - 1;  
	        	document.getElementById("layer").innerHTML = time;  
	        }
    	}  
		</script>  
	</head>

	<body onload="returnUrlByTime()">
		<div style="width:100%;height:100%;">
			<span style="font-size:25px;text-align:center;display:block;padding:100px 0 0 0;">用户不存在或用户非法访问！</span><br>
			<span style="text-align:center;display:block;"><span id="layer">3</span>秒后，跳转至登录页面......</span><br/>
			<span style="text-align:center;display:block;">仍未跳转,<a href="login.jsp">请点击此处跳转</a></span>
		</div>
		<%response.setHeader("Refresh","3;URL=login.jsp");%>
	</body>
	
	<style type="text/css">
		body,h1,h2,h3,p,ol,ul,dl,dd {
	margin: 0;
	padding: 0;
	font-size: 12px;
	-moz-user-select: none; /*火狐*/
	-webkit-user-select: none; /*webkit浏览器*/
	-ms-user-select: none; /*IE10*/
	-khtml-user-select: none; /*早期浏览器*/
	user-select: none;
}

a {
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

html {
	font-family: "Microsoft Yahei";
}

body {
	background: #ffffff;
	width: 100%;
}

	</style>
</html>