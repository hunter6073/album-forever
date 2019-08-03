//管理员登录校验
$(document).ready(function() {
	
	$("#admin_username").focus(function() {
		$("#admin_username_warn").text("请输入工号");
		$("#notFound_warn").text("");
		$("#admin_username_warn").removeClass("warn");
	});

	$("#admin_username").blur(username);
	function username() {
		var username = $("#admin_username").val();
		
		if(username==""){
			$("#admin_username_warn").addClass("warn");
			$("#admin_username_warn").text("工号不能为空");
		}else{
			$("#admin_username_warn").removeClass("warn");
			$("#admin_username_warn").text("");
		}
	}
	
	$("#admin_password").focus(function() {
		$("#admin_password_warn").text("请填写长度为6-20个字符的密码");
		$("#notFound_warn").text("");
		$("#admin_password_warn").removeClass("warn");
	});

	$("#admin_password").blur(password);
	function password() {
		var username = $("#admin_password").val();
		
		if(username==""){
			$("#admin_password_warn").addClass("warn");
			$("#admin_password_warn").text("登录密码不能为空");
		}else{
			$("#admin_password_warn").removeClass("warn");
			$("#admin_password_warn").text("");
		}
	}
	
	
	$("#submitLoginBtn").click(function() {
		var username = $("#admin_username").val();
		var password = $("#admin_password").val();
		if (username == "" && password == "") {
			$("#admin_username_warn").addClass("warn");
			$("#admin_password_warn").addClass("warn");
			$("#admin_username_warn").text("登录邮箱不能为空");
			$("#admin_password_warn").text("登录密码不能为空");
		} else if (username == "") {
			$("#admin_username_warn").addClass("warn");
			$("#admin_username_warn").text("登录邮箱不能为空");
		} else if (password == "") {
			$("#admin_password_warn").addClass("warn");
			$("#admin_password_warn").text("登录密码不能为空");
		} else {
			$("#admin_login_form").submit();
		}
	});

});