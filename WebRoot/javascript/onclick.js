
function messages() {

	var b = document.getElementById("li2");
	

}

$(document).ready(function() {
	
	$("#returnTop").click(function () {
        var speed=200;//滑动的速度
        $('body,html').animate({ scrollTop: 0 }, speed);
        return false;
 });
	
	$("hr").click(function() {
		$(this).hide();

	});
	
	$(".co_li").click(function() {
		var a = $(this);
		a.css( {
			"border-bottom" : "none",
			"border-left" : "1px solid black",
			"border-right" : "1px solid black",
			"border-top" : "1px solid black",
			"background-color":"#c7c2c2",
			"cursor":"Pointer",
		});		
		
		var b = $(this).siblings();
	
		b.css( {
			"border-bottom" : "1px solid black",
			"border-left" : "none",
			"border-right" : "none",
			"border-top" : "none",
			"background-color":"#d0dae5"
		});
		
		var c = $(".comment_list");
		
		c.css({
			"background-color":"#c7c2c2"
		});
		
	})	

});
