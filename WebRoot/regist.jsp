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
		<title>新用户注册 - 碟碟不朽网</title>
		<link href="css/regist_css.css" rel="stylesheet" type="text/css">
		<link rel="Shortcut Icon" href="images/ico32.ico" type="image/x-icon"/>
		<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
		<script type="text/javascript" src="javascript/regist_check.js"></script>
		<script type="text/javascript" src="javascript/regist_step.js"></script>
		<script type="text/javascript" src="javascript/Ajax.js"></script>
		<script type="text/javascript" src="javascript/verify_email.js"></script>
	</head>
	<%
		String homePage = "ddbx.form";
		String loginPage = "login.jsp";
		String registPage = "regist.jsp";
	%>
	<body>
		<div class="head">
			<div class="head_content">
				<div class="head_operate">
					<p class="head_welcom">
						欢迎光临碟碟不朽网，请
						<a name="head_login" href="<%=loginPage%>" class="login_link">登录</a>
						<a name="head_regist" href="<%=registPage%>" class="login_link">免费注册</a>
					</p>
				</div>
				<div class="head_logo">
					<a href="<%=homePage%>" title="返回首页"> <img
							src="images/logo70h.png"> </a>
				</div>
			</div>
		</div>
		
		<form action="regist_form.form" name="regist_form" id="regist_form" method="post">
			<div id="bd">
				<div class="box_shadow">
					<div class="regist_box">
						<div class="regist_head">
							<div class="regist_step">
								<div class="step step_1 current_step"> 填写邮箱 </div>
								<div class="step step_2"> 验证邮箱 </div>
								<div class="step step_3"> 完成注册 </div>
							</div>
						</div>
						<div class="regist_body" id="regist_body1" style="display: block;">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tbody>
									<tr>
										<td class="t">
											登录邮箱
										</td>
										<td class="z_index2">
											<input name="username" id="username" autocomplete="off"
												maxlength="40" placeholder="请输入您的邮箱" tabindex="1"
												type="text" class="text">

											<span class="pass" id="username_tip" style="display: none;"><img src="images/pass.png"></span>
											<span class="warn" id="username_warn" style="display: none;">邮箱格式不正确</span>
										</td>
									</tr>
									<tr>
										<td class="t">
											设置昵称
										</td>
										<td class="z_index2">
											<input name="nickname" id="nickname" autocomplete="off"
												maxlength="40" placeholder="请输入您的昵称" tabindex="1"
												type="text" class="text">

											<span class="pass" id="nickname_tip" style="display: none;"><img src="images/pass.png"></span>
											<span class="warn" id="nickname_warn" style="display: none;">昵称由4-16位字母（大小写不限）、数字、下划线、汉字组成</span>
										</td>
									</tr>
									<tr>
										<td class="t">
											登录密码
										</td>
										<td>
											<input name="password" id="password" autocomplete="off"
												maxlength="20" placeholder="请输入您的密码" tabindex="2"
												type="password" class="text" maxlength="20">
											<span class="pass" id="password_tip" style="display: none;"><img src="images/pass.png"></span>
											<span class="warn" id="password_warn" style="display: none;">密码由6-20位字母（大小写不限）、数字、下划线组成</span>
										</td>
									</tr>
									<tr>
										<td class="t">
											确认密码
										</td>
										<td>
											<input name="repassword" id="repassword" autocomplete="off"
												maxlength="40" placeholder="请再次输入密码" tabindex="3"
												type="password" class="text" maxlength="20">
											<span class="pass" id="repassword_tip" style="display: none;"><img src="images/pass.png"></span>
											<span class="warn" id="repassword_warn" style="display: none;">两次密码不一致，请重新输入</span>
										</td>
									</tr>
									<tr>
										<td class="t">
											&nbsp;
										</td>
										<td class="clause">
											<span class="float_1">
												<input id="agreement" name="agreement" onmouseover="this.style.cursor='pointer';this.style.cursor='hand';" tabindex="5" type="checkbox" checked="checked" style="cursor: pointer;"> 我已阅读并同意
												<a target="_blank" href="" tabindex="6">《碟碟不朽交易条款》</a> 
											</span>
											<span class="warn" id="clause_warn" style="display: none;">您必须同意条款后，才能进行下一步</span>
										</td>
									</tr>
									<tr>
										<td class="t">
											&nbsp;
										</td>
										<td class="z_index2">
											<a class="btn_regist" id="btn_regist" tabindex="7">下一步</a>
											<span class="warn" id="name_same_warn" style="display: block;">${sameError}</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<div class="regist_body" id="regist_body2" style="display: none;">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tbody>
									<tr>
										<td class="t">
											激活码将发送至
										</td>
										<td class="z_index2">
											<input name="ver_email" id="ver_email" autocomplete="off"
												maxlength="40" tabindex="1" readonly="readonly" type="text" class="text">
										</td>
									</tr>
									<tr>
										<td class="t">
											&nbsp;
										</td>
										<td>
											<input type="button" class="input_button" id="send_email" value="发送验证码" name="send_email">
										</td>
									</tr>
									<tr>
										<td class="t">
											填写验证码
										</td>
										<td>
											<input name="verify_code" id="verify_code" autocomplete="off"
												maxlength="12" value placeholder="填写邮箱收到的验证码" tabindex="3"
												type="text" class="text">
											<span class="pass" id="verify_code_tip" style="display: none;"><img src="images/pass.png"></span>
											<span class="warn" id="verify_code_warn" style="display: none;">请核实邮箱中所收到的验证码</span>
										</td>
									</tr>					
									<tr>
										<td class="" style="text-align: right;">
											<input type="button" class="input_button" id="send_email_pre" value="上一步" name="send_email_pre">
										</td>
										<td class="" style="text-align: left;">
											<input type="button" class="input_button" id="send_email_next" value="下一步" name="send_email_next">
										</td>
									</tr>
									
								</tbody>
							</table>
						</div>
						
						<div class="regist_body" id="regist_body3" style="display: none;">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tbody>
									<tr>
										<td class="t">
											您的邮箱
										</td>
										<td class="z_index2">
											<p id="user_email"></p>
										</td>
									</tr>
									<tr>
										<td class="t">
											您的昵称
										</td>
										<td>
											<p id="user_nickname"></p>
										</td>
									</tr>					
									<tr>
										<td class="">
											&nbsp;
										</td>
										<td class="">
											<input type="submit" class="input_button" id="success_btn" value="完成注册" name="success_btn">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</form>
		
		
		
		<!--页尾 开始 -->
<style type="text/css">
.footer_nav_box {
	border-top: 1px solid #ebebeb;
	width: 100%;
	_width: expression(this.scrollWidth <960?"960px" :"auto");
	min-width: 960px;
	padding: 17px 0 50px;
}

.footer_nav_box a,.footer_nav_box {
	color: #8c8c8c;
	font-size: 12px;
	text-decoration: none;
}

.footer_nav_box a:hover {
	color: #f48570;
	text-decoration: underline;
}

.footer_nav_box .footer_nav {
	text-align: center;
	line-height: 20px;
	padding-bottom: 17px;
	padding-top: 25px;
}

.footer_nav_box .footer_nav span.sep {
	margin: 0 17px 0 19px;
}

.footer_nav_box .footer_copyright {
	line-height: 20px;
	text-align: center;
	width: 960px;
	margin: 0 auto;
}

.footer_nav_box .footer_copyright span.sep {
	margin: 0 17px 0 19px;
}

.footer_nav_box .footer_icon {
	padding: 10px 0 0 340px;
	width: 640px;
	margin: 0 auto;
	height: 77px;
}

.footer_nav_box .validator,.footer_nav_box .knet {
	float: left;
	display: inline;
	padding: 15px 5px 15px;
	width: 135px;
	height: 47px;
}

.footer_copyright {
	padding: 10px 0 0 0;
	margin: 0 auto;
	float: none;
	width: auto;
	text-align: center;
	color: #8c8c8c;
}

.footer_copyright span,.public_footer .footer_copyright a.footer_img {
	display: inline-block;
	float: none;
}

.footer_copyright a {
	padding: 0 4px;
	color: #8c8c8c;
	font-size: 12px;
	text-decoration: none;
}

.footer_copyright a:hover {
	color: #f48570;
	text-decoration: underline;
}

.footer_nav_box .footer_nav .footer_hot_search {
	display: inline-block; *
	display: inline;
	width: 50px;
	position: relative
}

.footer_nav_box .footer_nav .pos_a_box {
	position: absolute;
	left: -251px;
	top: 22px;
	background-color: #f48570;
	width: 300px;
	border-radius: 8px;
	text-align: center;
	height: 14px;
	line-height: 14px
}

.footer_nav_box .footer_nav .pos_a_box a,.footer_nav_box .footer_nav .pos_a_box a:hover,.footer_nav_box .footer_nav .pos_a_box span
	{
	padding: 0 2px;
	color: #fff;
	text-decoration: none
}

.footer_nav_box .footer_nav .pos_a_box i {
	display: block;
	width: 0;
	height: 0;
	line-height: 0;
	font-size: 0;
	border-width: 0 4px 4px;
	border-style: solid;
	border-color: #fff #fff #f48570 #fff;
	position: absolute;
	right: 20px;
	top: -4px
}
</style>


		<div class="footer_nav_box">
			<div class="footer_nav">
				<a href=""
					target="_blank" rel="nofollow">公司简介</a><span class="sep">|</span><a
					href="" target="_blank">Investor
					Relations</a><span class="sep">|</span><a
					href="" target="_blank">诚聘英才</a><span
					class="sep">|</span><a
					href=""
					target="_blank">手机APP</a><span class="sep">|</span><a
					href="" target="_blank">网站联盟</a><span
					class="sep">|</span><a
					href="" target="_blank">碟碟招商</a><span
					class="sep">|</span><a
					href=""
					target="_blank" rel="nofollow">机构销售</a><span class="sep">|</span><a
					href="" target="_blank">官方Blog</a>
			</div>
			<div class="footer_copyright">
				<span>Copyright (C) 碟碟不朽网 2004-2017, All Rights Reserved</span>
			</div>
			<div class="footer_copyright">
				<span><a href="" target="_blank"
					rel="nofollow">京ICP证041189号</a> </span><span class="sep">|</span><span>出版物经营许可证
					新出发京批字第直0673号</span><span class="sep">|</span><span>流通许可证：SP1101011010021855(1-1)</span>
				<br>
				<span>互联网信息服务资格证编号：(京)-非经营性-2012-0016</span><span class="sep">|</span><span>京公网安备110101000001号</span>
			</div>

		</div>

	</body>
</html>