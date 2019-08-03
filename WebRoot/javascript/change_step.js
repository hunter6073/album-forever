//页面小标签更替
$(document).ready(
		function() {
			$("#btn_regist").click(function() {
				var email = $("#username").val();

				if (email == "") {
					$("#username_tip").css('display', 'none');
					$("#username_warn").css('display', 'block');
					$("#username").addClass("wrong");
					// $("#username").removeClass("pass");
				}

				if ($("#username_warn").css("display") == 'none') {
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
				var recode = $("verify_code").val();
				var pwd = $("#password").val();
				var repwd = $("#repassword").val();
				
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

				if (recode == "") {
					$("#verify_code_tip").css('display', 'none');
					$("#verify_code_warn").css('display', 'block');
					$("#verify_code").addClass("wrong");
				}

				if ($("#verify_code_warn").css("display") == 'none'
					&& $("#password_warn").css("display") == 'none'
						&& $("#repassword_warn").css("display") == 'none') {
					$("#regist_body2").css('display', 'none');
					$("#regist_body3").css('display', 'block');
					$(".step_2").removeClass("current_step");
					$(".step_3").addClass("current_step");

					var email = $("#username").val();

					$("#user_email").text(email);
				}
			});

//			$("#success_btn").click(function() {
//				$("#lost_form").submit();
//			});
		});