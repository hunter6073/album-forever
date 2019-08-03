<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
 request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	    <link rel="Shortcut Icon" href="images/ico128.png">
		<title>碟碟不朽个人中心</title>
		<link rel="stylesheet" type="text/css" href="css/personal.css" />
		  <script src="javascript/jquery-3.2.1.min.js"></script> 
<script>
	$(document).ready(function() {
	$("#frontpage").attr("class","titleblock");	
	$("#frontpage").children().css("color","black");
	$("#frontpage").hover(function(){
	     $(this).children().css("color","RGB(98, 172, 219)");
	});
	$("#frontpage").mouseleave(function(){
	     $(this).children().css("color","black");
	});
	$("#myspace").attr("class","titleblock1");
	$("#myspace").children().css("color","white");
	
	
		$(".menu div").click(function() {
			$(".menu div").css("color", "#ffffff");
			$(this).css("color", "#6aa84f");
		})
		
		//动态改变iframe的链接
		var a=$("#user").attr("value");
			$("#info").click(
					function() {
					var str="loading_myInfo.form?nickName="+a;				
						$("#mainframe", parent.document.body).attr("src",
								str)
					});
			$("#album").click(
					function() {
					var str="loading_myMusic.form?nickName="+a;
						$("#mainframe", parent.document.body).attr("src",
								str)
					});
			$("#singer").click(
					function() {
						var str="loading_mySinger.form?nickName="+a;
						$("#mainframe", parent.document.body).attr("src",
								str)
					});
			$("#collect").click(
					function() {
						var str="loading_myCollect.form?nickName="+a;
						$("#mainframe", parent.document.body).attr("src",
								str)
					}); 
			$("#receipt").click(
					function() {
						var str="loading_myReceipt.form?nickName="+a;
						$("#mainframe", parent.document.body).attr("src",
								str)
					});  					
		});
</script>
	</head>
	<body>
		<%@include file="new_head.jsp" %>
		<div id=p_top>
			<div id="user_data">
				<div class="menu">
					<div id="info" style="color: #6aa84f;">
						我的信息 
						<input type="hidden" id="user" value=${user.username}>
					</div>
					<div id="cart">
						<a href="getCart.form?username=${user.username}"
							stlye="color='ffffff'">我的购物车</a>
					</div>
					<div id="album">
						我的专辑库
					</div>
					<div id="singer">
						购买的歌手
					</div>
					<div id="collect">
						我的收藏
					</div>
					<div id="receipt">
						订单管理
					</div>
				</div>
			</div>
		</div>
		<!-- 内容 -->
		<div id="p_main">
			<div id="my_cart">
				<iframe id="mainframe" width="1200px" height="900px"
					src="loading_myInfo.form?nickName=${user.username}"></iframe>
			</div>
		</div>
		<%@include file="tail_white.jsp" %>
	</body>
</html>
