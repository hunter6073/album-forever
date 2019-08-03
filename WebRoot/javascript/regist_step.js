//注册页面小标签更替
$(document).ready(
		function() {
			$("#btn_regist").click(function() {
				var email = $("#username").val();
				var nickname = $("#nickname").val();
				var pwd = $("#password").val();
				var repwd = $("#repassword").val();

				if (email == "") {
					$("#username_tip").css('display', 'none');
					$("#username_warn").css('display', 'block');
					$("#username").addClass("wrong");
					// $("#username").removeClass("pass");
				}
				if (nickname == "") {
					$("#nickname_tip").css('display', 'none');
					$("#nickname_warn").css('display', 'block');
					$("#nickname").addClass("wrong");
				}
				if (pwd == "") {
					$("#password_tip").css('display', 'none');
					$("#password_warn").css('display', 'block');
					$("#password").addClass("wrong");
				}
				if (repwd == "") {
					$("#repassword_tip").css('display', 'none');
					$("#repassword_warn").css('display', 'block');
					$("#repassword").addClass("wrong");
				}

				if ($("#username_warn").css("display") == 'none'
						&& $("#nickname_warn").css("display") == 'none'
						&& $("#password_warn").css("display") == 'none'
						&& $("#repassword_warn").css("display") == 'none'
						&& $("#clause_warn").css("display") == 'none') {
					$("#regist_body1").css('display', 'none');
					$("#regist_body2").css('display', 'block');
					$(".step_1").removeClass("current_step");
					$(".step_2").addClass("current_step");

					var email = $("#username").val();
					$("#ver_email").val(email);
				} else {

				}
			});

			$("#send_email_pre").click(function() {
				$("#regist_body1").css('display', 'block');
				$("#regist_body2").css('display', 'none');
				$(".step_2").removeClass("current_step");
				$(".step_1").addClass("current_step");
			});

			$("#send_email_next").click(function() {
				var recode = $("#verify_code").val();
				if (recode == "") {
					$("#verify_code_tip").css('display', 'none');
					$("#verify_code_warn").css('display', 'block');
					$("#verify_code").addClass("wrong");
				}else{
					if ($("#verify_code_warn").css("display") == 'none') {
						$("#regist_body2").css('display', 'none');
						$("#regist_body3").css('display', 'block');
						$(".step_2").removeClass("current_step");
						$(".step_3").addClass("current_step");
	
						var email = $("#username").val();
						var nickname = $("#nickname").val();
	
						$("#user_email").text(email);
						$("#user_nickname").text(nickname);
					}
				}
			});

//			$("#success_btn").click(function() {
//				$("#regist_form").submit();
//				
//				//window.location.href = "login.jsp";
//			});
		});