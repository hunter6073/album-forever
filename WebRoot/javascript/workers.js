$(document).ready(function(){
	var b = $("#error").attr("value");
	if(b!="")
	{
		alert(b);
		
	}

$("input[name='age']").blur(function(){
	var b  = $(this).val();
	 var reg = /^[0-9]*$/;
	 if(!reg.test(b)||b>80)
	 {
		 alert("输入有误");
		 $(this).val("");
	 }
});
$("input[name='role']").blur(function(){
	var role  = $(this).val();
     if(role!="")
     {
    	 if(role!="员工"&&role!="经理")
    	 {
    		 alert("输入有误，请输入员工或经理");
    		 $(this).val("");
    	 }
     }
	
});
$("input[name='sex']").blur(function(){
	var sex  = $(this).val();

    	 if(sex!="男"&&sex!="女")
    	 {
    		 alert("输入有误，请输入正确性别");
    		 $(this).val("");
    	 }

	
});
var role1 = $("#rol").attr("value")
{

  if(role1=="员工")
  {
	  $("#insert").remove();
	  $(".bttn_delete,.bttn,.del,.delalbum").remove();
	
	  
  }
}

$(".bttn").click(function(){
	var a = $(this).parents("tr").children("td").children("input").removeAttr("disabled");
	$(this).hide();
	$(this).siblings(".bttn_delete").hide();
	var t = $(this).parents("tr").children("td").children(".bttn").parent();
	var inputbutton="<input type=\"submit\" value=\"提交\" />";   
	t.append(inputbutton);  
});


$("#insert").click(function(){
	var a = $(this).parents("tr").children("td").children("input").removeAttr("disabled");
	$(this).hide();
	$("form").attr("action","workerinsert.form");
	var t = $(this).parent();
	var inputbutton="<input type=\"submit\" value=\"提交\" /></input>";   
	t.append(inputbutton);  
	
});

$(".bttn_delete").click(function(){
	var a = $(this).parents("tr").children("td").children("input").removeAttr("disabled");
	$("form").attr("action","deleteworker.form");

});

$(".del").click(function(){
	var a = $(this).parents("tr").children("td").children(".id").attr("value");
	window.location.href="deletereceipt.form?r_id="+a;

});
$(".search1").click(function(){
	var a = $(this).parents("tr").children("td").children(".id").attr("value");
	window.location.href="receiptsearch.form?value="+a;

});

$(".album_info_insert").click(function(){
	$(".ptime").remove();
	$("img").attr("src","");
   $(this).siblings("table").find("input").removeAttr("disabled");
   $(this).siblings("table").find("input").removeAttr("value");
   $(this).siblings("table").find("select").removeAttr("disabled");
   $(this).siblings("textarea").removeAttr("disabled");
   $(this).siblings("textarea").text("");
   var a = $(this).parent();
   $(this).siblings(".album_info_edit").remove();
   $(this).remove();
   var inputbutton="<input type=\"submit\" value=\"提交\" style=\"float:right;\" id=\"sub\" /></input>";   
   a.append(inputbutton);
   $("form").attr("action","insertalbum.form");
});

$(".album_info_edit").click(function(){
	   $(this).siblings("table").find("input").removeAttr("disabled");
	   $(this).siblings("table").find("select").removeAttr("disabled");
	   $(this).siblings("textarea").removeAttr("disabled");
	   var a = $(this).parent();
	   $(this).siblings(".album_info_insert").remove();
	   $(this).remove();
	   var inputbutton="<input type=\"submit\" value=\"提交\" style=\"float:right;\" id=\"sub\" /></input>";   
	   a.append(inputbutton);
	   $("form").attr("action","updatealbum.form");
	});

$(".showalbuminfo").click(function(){
	var a = $(this).parents("tr").children("td").children(".id").attr("value");
	window.location.href="itemsearch.form?value="+a;
});

$(".delalbum").click(function(){
	var a = $(this).parents("tr").children("td").children(".id").attr("value");
	window.location.href="itemdelete.form?value="+a;
	});

});