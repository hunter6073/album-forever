$(document).ready(function(){
$("#m_manage").click(function(){
	$("#rightContent").attr("src","itemmanage.form");
});
$("#u_manage").click(function(){
	$("#rightContent").attr("src","userinfomanage.form");
});
$("#r_manage").click(function(){
	$("#rightContent").attr("src","receiptmanage.form");
});
$("#e_manage").click(function(){
	$("#rightContent").attr("src","workermanage.form");
});
$("#c_manage").click(function(){
	$("#rightContent").attr("src","chartmanage.form");
});


$("p").hover(function(){
	 $(this).css("cursor","pointer");
});
});