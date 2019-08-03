$(document).ready(function() {

	$("#send_email").click(function() {

		var send_order = $("#ver_email").val();
		// alert("click!");
			$.ajax( {
				type : "POST",
				url : "send_email.form",
				dataType : "text",
				data : {
					ajax_order : send_order
				},
				success : function(ajaxMsg) {
					if (ajaxMsg) {
						settime(60);
						alert(ajaxMsg);
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
				}
			});
		});

	$("#verify_code").focus(function() {
		$("#verify_code_tip").css('display', 'none');
		$("#verify_code_warn").css('display', 'none');
		$("#verify_code").removeClass("wrong");
		// $("#verify_code").removeClass("pass");
		});

	$("#verify_code").blur(function() {
		var user_code = $("#verify_code").val();

		if (user_code != "") {
			$.ajax( {
				type : "POST",
				url : "verify_code.form",
				dataType : "text",
				data : {
					ajax_code : user_code
				},
				success : function(ajaxMsg) {
					if (ajaxMsg) {
						if (ajaxMsg == "success") {
							$("#verify_code_tip").css('display', 'block');
							$("#verify_code_warn").css('display', 'none');
						} else {
							$("#verify_code_tip").css('display', 'none');
							$("#verify_code_warn").css('display', 'block');
							$("#verify_code").addClass("wrong");
						}
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					/* alert(XMLHttpRequest.status); */
				}
			});
		}
	});

});

function settime(wait_second) {
	// alert("1");
	if (wait_second == 0) {
		// alert("2");
		$("#send_email").attr("disabled", false);
		$("#send_email").val("发送邮件");
	} else {
		// alert("3");
		$("#send_email").attr("disabled", true);
		// alert("4");
		$("#send_email").val("重新发送(" + wait_second + ")");
		// alert("5");
		wait_second--;
		setTimeout(function() {
			settime(wait_second)
		}, 1000);
	}
};