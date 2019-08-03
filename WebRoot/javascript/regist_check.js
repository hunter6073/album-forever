//用户注册页面键入校验
//及提交重复性校验
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
					url : "regist_username.form",
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
						alert(XMLHttpRequest.status + textStatus);
					}
				});
				
				$("#username_tip").css('display', 'block');
				$("#username_warn").css('display', 'none');

			}
		}

		$("#nickname").focus(function() {
			$("#nickname_tip").css('display', 'none');
			$("#nickname_warn").css('display', 'none');
			$("#nickname").removeClass("wrong");
			//$("#nickname").removeClass("pass");
		});

		function checkLength(v)
		{
		    var t =v.replace(/[\u4e00-\u9fa5]/g,'');//替换中文
		    return (((v.length-t.length)*2+t.length<=16) && ((v.length-t.length)*2+t.length>=4));//判断长度
		}
		
		$("#nickname").blur(nickname);
		function nickname() {
			var nickname = $("#nickname").val();
//			var reg = /[\u4e00-\u9fa5_a-zA-Z0-9_]{4,16}/;
			if (nickname == "") {
			} else if (!checkLength(nickname)) {
				$("#nickname_tip").css('display', 'none');
				$("#nickname_warn").text("昵称由4-16位数字、汉字、字母组成");
				$("#nickname_warn").css('display', 'block');
				$("#nickname").addClass("wrong");
				//$("#nickname").removeClass("pass");
			} else if (checkLength(nickname)) {
				
				$.ajax( {
					type : "POST",
					url : "regist_nickname.form",
					dataType : "text",
					data :{
						ajax_nickname : nickname
					},
					success : function(ajaxMsg) {
						if(ajaxMsg){
							$("#nickname_tip").css('display', 'none');
							$("#nickname_warn").text(ajaxMsg);
							$("#nickname_warn").css('display', 'block');
							$("#nickname").addClass("wrong");
							//$("#nickname").removeClass("pass");
						}
					},
					error : function(XMLHttpRequest, textStatus, errorThrown){
						alert(XMLHttpRequest.status);
					}
				});
				
				$("#nickname_tip").css('display', 'block');
				$("#nickname_warn").css('display', 'none');
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

		// checkbox
		$("#agreement").click(function agreement() {
			if ($("#agreement").is(":checked")) {
				$("#clause_warn").css('display', 'none');
			} else {
				$("#clause_warn").css('display', 'block');
			}
		});

	});