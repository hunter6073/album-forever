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
		<title>后台登录 - 碟碟不朽网</title>
		<link href="css/admin_login_css.css" rel="stylesheet" type="text/css">
		<link rel="Shortcut Icon" href="images/ico128.png" />
		<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
		<script type="text/javascript" src="javascript/admin_check.js"></script>

	</head>
	<%
		String homePage = "ddbx.form";
	%>
	<body>
		<div class="body">

			<div class="logo_head">
				<a href="<%=homePage%>" target="_blank"
					style="width: 100%; height: 100%; display: block;"></a>
			</div>
			<div class="login_top">
				<p style="" class="admin_login">
					管理人员登录
				</p>
				<form id="admin_login_form" name="admin_login_form"
					action="admin_login_form.form" method="post">
					<div id="" class="admin_infro">
						<div class="admin_username" id="admin_username_div">
							<input class="admin_user" id="admin_username"
								name="admin_username" type="text" autocomplete="off"
								maxlength="40" value="" errordata="0" tabindex="1"
								placeholder="请输入工号">
						</div>
						<p id="admin_username_warn" class="tips">
						</p>

						<div class="admin_password" id="admin_password_div">
							<input class="admin_pass" id="admin_password"
								name="admin_password" type="password" maxlength="20"
								autocomplete="off" errordata="0" tabindex="2"
								placeholder="请输入您的登录密码">
						</div>
						<p class="tips" id="admin_password_warn">
						</p>
						<p class="btn">
							<a id="submitLoginBtn" tabindex="3" href="javascript:void(0);">登&nbsp;录</a>
							<!--  <input type="submit" id="submitLoginBtn" name="login_submit" value="登录">  -->
						</p>
						<p id="notFound_warn" class="warn">
							${userNotFound}
						</p>
					</div>
				</form>
			</div>

			<div class="login_bottom">
				<p id="bottom_text">
					发现问题? &nbsp;
					<a id="bottom_a" href="http://wpa.qq.com/msgrd?v=3&uin=869641892&site=qq&menu=yes" target="_blank">联系</a>&nbsp 管理员
				</p>
			</div>
		</div>

		<div class="copyright">
			<p>
				Copyright &copy; 2015.碟碟不朽    All rights reserved.
			</p>
		</div>
	</body>
</html>