//普通用户登录页面键入校验
//打开时检测是否有cookie，如果有则自动登录
$(document).ready(function() {
	if ($.cookie("EMAIL") != null && $.cookie("PASSWORD") != null) {
		var email = $.cookie("EMAIL");
		var password = $.cookie("PASSWORD");
		$("#cover").css('display', 'block');
		$("#coverShow").css('display', 'block');
		
		$.ajax( {
			type : "POST",
			url : "cookie_login.form",
			dataType : "text",
			data :{
				EMAIL : email,
				PASSWORD : password
			},
			success : function(ajaxMsg) {
				if(ajaxMsg){
					$("#cover").css('display', 'none');
					$("#coverShow").css('display', 'none');
					window.location.href = ajaxMsg;
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown){
				alert(XMLHttpRequest.status + textStatus);
			},
			complete: function(ajaxMsg){
				$("#cover").css('display', 'none');
				$("#coverShow").css('display', 'none');
			}
		});
	}

	$("#username").focus(function() {
		$("#username_warn").text("请输入邮箱");
		$("#notFound_warn").text("");
		$("#username_warn").removeClass("warn");
		$("#username_div").addClass("focus");
	});

	$("#username").blur(username);
	function username() {
		$("#username_div").removeClass("focus");
		var username = $("#username").val();

		if (username == "") {
			$("#username_warn").addClass("warn");
			$("#username_warn").text("登录邮箱不能为空");
		} else {
			$("#username_warn").removeClass("warn");
			$("#username_warn").text("");
		}
	}

	$("#password").focus(function() {
		$("#password_warn").text("请填写长度为6-20个字符的密码");
		$("#notFound_warn").text("");
		$("#password_warn").removeClass("warn");
		$("#password_div").addClass("focus");
	});

	$("#password").blur(password);
	function password() {
		$("#password_div").removeClass("focus");
		var username = $("#password").val();

		if (username == "") {
			$("#password_warn").addClass("warn");
			$("#password_warn").text("登录密码不能为空");
		} else {
			$("#password_warn").removeClass("warn");
			$("#password_warn").text("");
		}
	}

	$("#submitLoginBtn").click(function() {
		var username = $("#username").val();
		var password = $("#password").val();
		var slide_block = $("#labelTip").text();
		// alert(slide_block);
			if (username == "" && password == "") {
				$("#username_warn").addClass("warn");
				$("#password_warn").addClass("warn");
				$("#username_warn").text("登录邮箱不能为空");
				$("#password_warn").text("登录密码不能为空");
			} else if (username == "") {
				$("#username_warn").addClass("warn");
				$("#username_warn").text("登录邮箱不能为空");
			} else if (password == "") {
				$("#password_warn").addClass("warn");
				$("#password_warn").text("登录密码不能为空");
			} else {
				if (slide_block == "验证成功") {
					$("#login_form").submit();
				} else {
					// alert("pass");
					$("#labelTip").addClass("slide_warn");
				}
			}
		});

});