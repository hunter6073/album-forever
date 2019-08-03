//修改、找回密码页面键入校验
//ajax请求后台校验
$(document).ready(function() {
	// check username
		$("#username").focus(function() {
			$("#username_tip").css('display', 'none');
			$("#username_warn").css('display', 'none');
			$("#username").removeClass("wrong");
			//$("#username").removeClass("pass");
		});

		$("#username").blur(username);
		function username() {
			var email = $("#username").val();
			var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
			if (email == "") {
			} else if (!reg.test(email)) {
				$("#username_tip").css('display', 'none');
				$("#username_warn").text("邮箱格式不正确");
				$("#username_warn").css('display', 'block');
				$("#username").addClass("wrong");
				//$("#username").removeClass("pass");
			} else if (reg.test(email)) {
				
				$.ajax( {
					type : "POST",
					url : "check_username.form",
					dataType : "text",
					data :{
						ajax_username : email
					},
					success : function(ajaxMsg) {
						if(ajaxMsg){
							$("#username_tip").css('display', 'none');
							$("#username_warn").text(ajaxMsg);
							$("#username_warn").css('display', 'block');
							$("#username").addClass("wrong");
							//$("#username").removeClass("pass");
						}
					},
					error : function(XMLHttpRequest, textStatus, errorThrown){
						alert(XMLHttpRequest.status);
					}
				});
				
				$("#username_tip").css('display', 'block');
				$("#username_warn").css('display', 'none');

			}
		}

		// check password
		$("#password").focus(function() {
			$("#password_tip").css('display', 'none');
			$("#password_warn").css('display', 'none');
			$("#password").removeClass("wrong");
			//$("#password").removeClass("pass");
		});

		$("#password").blur(password);
		function password() {
			var pwd = $("#password").val();
			var reg = /^[0-9a-zA-Z_]{6,20}$/;
			if (pwd == "") {
			} else if (!reg.test(pwd)) {
				$("#password_tip").css('display', 'none');
				$("#password_warn").css('display', 'block');
				$("#password").addClass("wrong");
				//$("#password").removeClass("pass");
			} else if (reg.test(pwd)) {
				$("#password_tip").css('display', 'block');
				$("#password_warn").css('display', 'none');
			}
		}

		// check repassword
		$("#repassword").focus(function() {
			$("#repassword_tip").css('display', 'none');
			$("#repassword_warn").css('display', 'none');
			$("#repassword").removeClass("wrong");
			//$("#repassword").removeClass("pass");
		});

		$("#repassword").blur(repassword);
		function repassword() {
			var pwd = $("#password").val();
			var repwd = $("#repassword").val();
			if (repwd == "") {
			} else if (pwd != repwd) {
				$("#repassword_tip").css('display', 'none');
				$("#repassword_warn").css('display', 'block');
				$("#repassword").addClass("wrong");
				//$("#repassword").removeClass("pass");
			} else if (pwd == repwd) {
				$("#repassword_tip").css('display', 'block');
				$("#repassword_warn").css('display', 'none');
			}
		}
		

	});