<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

response.setContentType("text/html;charset=utf-8");
request.setCharacterEncoding("utf-8");

 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	 <script src="javascript/jquery-3.2.1.min.js"></script>
     <script src="javascript/atest.js" type="text/javascript"></script>
    
    <title>new header</title>
    <link rel="Shortcut Icon" href="images/ico128.png">
<style>
div.top
	{
	width: 1920px;
	height: 734px;


}

body {
	padding: 0;
	margin: 0 auto;
}

div.top {
	height: 120px;

}

div.logo {
	height:60px;
	width: 210px;
	float: left;
	margin:0;
	margin-right:30px;
}

p.albumname {
	width: 200px;
	height: 20px;
	font-size: 15px;
	color: white;
	margin: 0 auto 0 auto;
	padding: 0;
	padding-top: 30px;
}

p.albumsinger {
	width: 200px;
	height: 10px;
	font-size: 20px;
	color: white;
	margin: 0 auto 0 auto;
}

div.list_search {
	width: 1100px;
	height: 90px;
	background-color: white;
	margin: 0 auto 0 auto;
}

input.searchbox {
	width: 200px;
	height: 30px;
	font-size: 15px;
	margin-top: 30px;
	margin-left: 15px;
}

div.titleblock,div.titleblock1 {
	width: 96px;
	height: 90px;
	float: left;
}

div.titleblock1 {
	background-color: RGB(98, 172, 219);
}

titleblock1 a.one {
	color: white;
}

a.one,a.two {
	display: block;
	font-size: 20px;
	font-family: Microsoft YaHei, 微软雅黑, Microsoft JhengHei, 华文细黑, STHeiti,
		MingLiu, Verdana, Arial, Helvetica, sans-serif;
	color: black;
	font-weight: normal;
	width: 95px;
	height: 50px;
	margin: 0;
    margin-top:30px;
	text-align: center;
	text-decoration: none;
}

hr {
	border: 1px;
	border-bottom: 1px grey;
	height: 0.5px;
	opacity: 0.5;
}

a.two {
	font-size: 15px;
	color: black;
	width: 70px;
	height: 25px;
	margin: 0 50px 0 50px;
	margin-top: 3px;
	text-align: center;
	text-decoration: none;
	float: left
}

a.one:hover,a.two:hover {
	color: RGB(98, 172, 219);
}

div.catagorize {
	width: 700px;
	height: 30px;
	margin: 0 auto 0 auto;
	test-align: center;
}

</style>
  </head>
  
  <body>
   	<!-- 顶层导航栏 -->
		<div class="top" id="top">
			<div class="list_search " id="list_search">                                  <!-- 第一条大导航栏，包括商标，首页，个人空间，搜索，登录，购物车 -->
				<div class="logo" style="cursor:pointer;"><img src="images/logo.png" width="210px" height="60px" style="margin-top:13px;"/></div>                                                 <!-- 商标图片 -->    
				<div class="titleblock1" id="frontpage">                                                <!-- 包含超链接元素的div -->   
					<a href="ddbx.form" class="one" style="color:white;">首页</a>
				</div>
				<div class="titleblock" id="myspace">
				
				<c:if test="${user==null}">
					<a href="login.jsp" class="one">个人空间</a>
				</c:if>
					<c:if test="${user!=null}">
					<a href="personal.jsp" class="one">个人空间</a>
				</c:if>
				
				
				</div>
				<div class="titleblock">
					<a href="ddbx.form#ranking" class="one">排行榜</a>
				</div>
				
			
			    
				
				
			
				<form style="float: left; margin: 0;" action="smartsearch.form" method="post">                                   <!-- 搜索框和按钮构成的表单 -->   
					<input type="text" class="searchbox" name="search" />
					  <input type="image" src="images/timg.jpg" width="31px"
						height="31px" align="center"  />
					
				</form>
				<div class="titleblock" style="width:190px;">
			
				<!-- 用户是否登录决定板块显示 -->
					
				<c:if test="${user==null}">
				<a href="login.jsp" class="one" >登录</a>
				</c:if>
				<c:if test="${user!=null}">
				<a  class="one" href="ddbx.form" style="width:190px; font-size:15px; text-align:left; padding-top:5px;padding-left:10px;" id="login">欢迎，${user.username},点击注销</a>
				</c:if>
			 
				</div>
				<div class="titleblock">
					<!-- 用户是否登录决定购物车跳转 -->
			
				<c:if test="${user!=null}">
				<a href="getCart.form?username=${user.username }" class="one" style="margin-top:15px;"><img alt="" src="images/cart_big.png" style="margin-top:10px"/></a>
				</c:if>
				
				</div>
				
				 <hr color="#E6E6E6" size="1px" style="clear:both;margin:0;"> 
			</div>
			<div class="catagorize">                                                     <!-- 第二条小导航栏，包括歌手，专辑，排行榜，每日推荐四个超链接 -->
				<a href="listsinger.form?region=全部&word=全部&page=1" class="two" id="singer_head">歌手</a>
   				<a href="listalbum.form?language=全部&style=全部&region=全部&price=全部&page=1" class="two" id="album_head">专辑</a>
   				<a href="rankByPage.form?page=1&sign=sold" class="two" id="ranking_head">排行榜</a>
				<a href="ddbx.form#recommendation" class="two">每日推荐</a>
			</div>
		</div>
  </body>
</html>
