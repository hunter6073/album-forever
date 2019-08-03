$(document).ready(function() {
	$("#btn_regist").click(function() {
		var email = $("#username").val();
		var nickname = $("#nickname").val();
		var pwd = $("#password").val();
		var repwd = $("#repassword").val();

	
		if (email == "") {
			$("#username_tip").css('display', 'none');
			$("#username_warn").css('display', 'block');
			$("#username").addClass("wrong");
			$("#username").removeClass("pass");
		}

		if ($("#username_warn").css("display") == 'none') {
			
			$("#regist_body1").css('display', 'none');
			$("#regist_body2").css('display', 'block');
			$(".step_1").removeClass("current_step");
			$(".step_2").addClass("current_step");

			var email = $("#username").val();
			$("#ver_email").val(email);
		}
	});

	$("#send_email_pre").click(function() {
		$("#regist_body1").css('display', 'block');
		$("#regist_body2").css('display', 'none');
		$(".step_2").removeClass("current_step");
		$(".step_1").addClass("current_step");
	});

	$("#send_email_next").click(function() {
		$("#regist_body2").css('display', 'none');
		$("#regist_body3").css('display', 'block');
		$(".step_2").removeClass("current_step");
		$(".step_3").addClass("current_step");

		var email = $("#username").val();
		var nickname = $("#nickname").val();

		$("#user_email").text(email);
		$("#user_nickname").text(nickname);
	});

	$("#success_btn").click(function() {
		window.location.href = "login.jsp";
	});
});