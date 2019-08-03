<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
	<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"><![endif]-->
	<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"><![endif]-->
	<!--[if IE 8]><html class="no-js lt-ie9"><![endif]-->
	<!--[if gt IE 8]><!--><html class="no-js"><!--<![endif]-->
    <head>
        <title>购买的歌手</title>
        <link rel="Shortcut Icon" href="images/ico128.png">
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"> 
        <meta name="keywords" content="carousel, jquery, responsive, fluid, elastic, resize, thumbnail, slider" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css/custom.css" />
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/elastislide.css" />
		<script src="javascript/modernizr.custom.17475.js"></script>
		  <script src="javascript/jquery-3.2.1.min.js"></script>

		<script>
		$(document).ready(function(){	
		//滚动列表
		$("nav a").click(function(){ 
		var c=$(this).attr("class");
		if(c!="current-demo"){
		$(this).siblings().removeClass("current-demo");
		$(this).addClass("current-demo");
		}});
		$("#single").click(function(){
		$("#d1").css("display","block");
		$("#d2").css("display","none");
		});
		$("#album").click(function(){
		$("#d1").css("display","none");
		$("#d2").css("display","block");
		});
		$("img").click(function(){
		var a=$(this).attr("alt");
		var b="."+a;		
		$(b).siblings().css("display","none");
		$(b).css("display","block");
		});
		var a=$("img").attr("alt");
		var b="."+a;
		$(b).css("display","block");
		});
		
		</script>
    </head>
    <body>
		<div class="container demo-2">
            <div class="main clearfix">
				<header class="clearfix">	
					<h1>碟碟不朽 <span>我的追星</span></h1>
					<nav class="codrops-demos">
						<a class="current-demo" id="single">单曲</a>
						<a id="album">专辑</a>
					</nav>
				</header>
				<div class="column">
					<!-- Elastislide Carousel -->
					<ul id="carousel" class="elastislide-list">
					<c:forEach var="singer" items="${singerList}">
             		<li><img style="height:150px;width:150px;" src="${singer.image}" alt="${singer.name}" /></li>
					</c:forEach>					
					</ul>
					<!-- End Elastislide Carousel -->
				</div>

				<div class="column">
				<div id="d1" style="overflow-y:scroll; height:530px;">				
					<p><strong>单曲</strong></p>					
					<ul type="none" style="line-height:30px">
					<c:forEach var="song" items="${songList}">
             		<li style="display:none;" class="${song.singer}">${song.songname}&nbsp;&nbsp;&nbsp;&nbsp;<a href="${song.song}" style="text-decoration:underline;">下载</a><br/>
             		<audio src="${song.song}" controls="controls">
             		Your browser does not support the audio element.
             		</audio></li>
					</c:forEach>

					</ul>
				</div>
				<div id="d2" style="display:none">				
					<p><strong>专辑</strong></p>					
					<ul type="none" style="line-height:30px">
					<c:forEach var="album" items="${albumList}">
             		<li style="display:none;" class="${album.singer}">${album.albumName}</li>
					</c:forEach>
					</ul>
				</div>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="javascript/jquerypp.custom.js"></script>
		<script type="text/javascript" src="javascript/jquery.elastislide.js"></script>
		<script type="text/javascript">
			
			$( '#carousel' ).elastislide( {
				orientation : 'vertical',
				speed : 100
			} );
			
		</script>
    </body>
</html>
