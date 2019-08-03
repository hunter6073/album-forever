$(document).ready(function(){
  $("#login").click(function(){
	  $.ajax( {
			type : "POST",
			url : "user_logout.form",
			dataType : "text",
			data : "111",
			success : function(ajaxMsg) {
				if (ajaxMsg) {
				window.location.reload();	
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(XMLHttpRequest.status);
			}
		});
  });
  $(".logo").click(function(){
	  window.location.href="ddbx.form";
	  
  });
});