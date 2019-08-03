
function messages() {

	var b = document.getElementById("li2");
	

}

$(document).ready(function() {
	
	
	$(function(){ 
		$("#numberPlus").click(function(){ 
		var t=$(this).parent().find('input[class*=numberInput]'); 
		var s=$(this).parent().find('input[class*=hinstore]');
		
		t.val(parseInt(t.val())+1) 
		
		if(parseInt(t.val())<parseInt(s.val())){ 
			
			$("#reserve").css({"display":"none"});
			} 
		if(parseInt(t.val())>parseInt(s.val())){ 
			alert("难道你想让制造工人没日没夜的加班吗？");
			t.val(parseInt(s.val())); 
			$("#reserve").css({"display":"block"});
			} 
		setTotal(); 
		}) 
		$("#numberMinus").click(function(){ 
		var t=$(this).parent().find('input[class*=numberInput]'); 
		var s=$(this).parent().find('input[class*=hinstore]');
		t.val(parseInt(t.val())-1) 
		
		if(parseInt(t.val())>parseInt(s.val())){ 
			alert("难道你想让制造工人没日没夜的加班吗？");
			t.val(parseInt(s.val())); 
			$("#reserve").css({"display":"block"});
			}
		if(parseInt(t.val())<parseInt(s.val())){ 
			
			$("#reserve").css({"display":"none"});
			} 
		if(parseInt(t.val())<1){ 
			alert("难道你想给我们送货吗？");
		t.val(1); 
		} 
		setTotal(); 
		}) 
		function setTotal(){ 
		var s=0.0; 
		$("#tab td").each(function(){ 
		s+=parseFloat($(this).find('input[class*=numberInput]').val())*parseFloat($(this).find('span[class*=price]').text());
		}); 
		$("#totalprice").html(s); 
		} 
		setTotal(); 

		}) 
	

	
	$("#returnTop").click(function () {
        var speed=200;//滑动的速度
        $('body,html').animate({ scrollTop: 0 }, speed);
        return false;
 });
	
	
	
	
	$("hr").click(function() {
		$(this).hide();

	});
	
	
	$("#li1").click(function() {
		
		$("#lis").css({"display":"block"});
		$("#good").css({"display":"none"});
		$("#mid").css({"display":"none"});
		$("#bad").css({"display":"none"});
		
	})

	$("#li2").click(function() {
		
		$("#lis").css({"display":"none"});
		$("#good").css({"display":"block"});
		$("#mid").css({"display":"none"});
		$("#bad").css({"display":"none"});
		
	})

	$("#li3").click(function() {
		
		$("#lis").css({"display":"none"});
		$("#good").css({"display":"none"});
		$("#mid").css({"display":"block"});
		$("#bad").css({"display":"none"});
		
	})

	$("#li4").click(function() {
		
		$("#lis").css({"display":"none"});
		$("#good").css({"display":"none"});
		$("#mid").css({"display":"none"});
		$("#bad").css({"display":"block"});
		
	})
	
	
	$(".co_li").click(function() {
		var a = $(this);
		a.css( {
			"border-bottom" : "none",
			"border-left" : "1px solid black",
			"border-right" : "1px solid black",
			"border-top" : "1px solid black",
			
			"cursor":"Pointer",
		});		
		
		var b = $(this).siblings();
	
		b.css( {
			"border-bottom" : "1px solid black",
			"border-left" : "none",
			"border-right" : "none",
			"border-top" : "none",
			
		});
		
		var c = $(".comment_list");
		
		c.css({
			
		});
		
	})
	
	$("#a_wish").click(function(){
		var jump1 = $(this).attr("class");
		 $.ajax( {
				type : "POST",
				url : "wish.form",
				data : {'album':jump1},
				success : function(ajaxMsg) {
					if(ajaxMsg=="success")
					{
						alert("收藏成功");
						$("#a_wish").text("已收藏");
						
						
					}
					else
					{
						alert("已收藏，请到个人中心中查看");
					}
				
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
				}
				
			});
	
		
	});
	
	
	
	

});



