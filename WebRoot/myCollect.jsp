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
        <title>碟碟收藏</title>
        <link rel="Shortcut Icon" href="images/ico128.png">
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"> 
        <meta name="description" content="Elastislide - A Responsive Image Carousel" />
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
		
		
		//被点击的链接
		$("nav a").click(function(){ 
		var c=$(this).attr("class");
		if(c!="current-demo"){
		$(this).siblings().removeClass("current-demo");
		$(this).addClass("current-demo");} 
		});
		$(".clicker").click(function(){
		var src =$(this).attr("alt");
		
		$("#preview").attr("class",src);
	
	
		
		});
		$("div.image-preview img").click(function(){
		var src =$(this).attr("class");
		top.location.href="distinctitem.form?album="+src;
	
	
		
		});
		
		$("#s0").click();
		
		});
		</script>
    </head>
    <body>
		<div class="container demo-4">
            <div class="main">
				<header class="clearfix">	
					<h1>碟碟不朽 <span>我的收藏</span></h1>
					<nav class="codrops-demos">
						<a class="current-demo">专辑收藏</a>
						<!--<a herf="#">歌手收藏 </a>  -->
					</nav>
				</header>

				<div class="gallery">
					<!-- Elastislide Carousel -->
					<ul id="carousel" class="elastislide-list">
					<c:forEach var="album" items="${albumList}" varStatus="status">
             			<li data-preview="${album.albumImage}" ><img style="height:150px;" src="${album.albumImage}" alt="${album.albumId}" class="clicker" id="s${status.index}"></li>
					</c:forEach>
						</ul>
					<!-- End Elastislide Carousel -->

					<div class="image-preview">
						<img style="height:480px;" id="preview" src="images/large4.jpg" />
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="javascript/jquerypp.custom.js"></script>
		<script type="text/javascript" src="javascript/jquery.elastislide.js"></script>
		<script type="text/javascript">
			
			// example how to integrate with a previewer

			var current = 0,
				$preview = $( '#preview' ),
				$carouselEl = $( '#carousel' ),
				$carouselItems = $carouselEl.children(),
				carousel = $carouselEl.elastislide( {
					current : current,
					minItems : 4,
					onClick : function( el, pos, evt ) {

						changeImage( el, pos );
						evt.preventDefault();

					},
					onReady : function() {

						changeImage( $carouselItems.eq( current ), current );
						
					}
				} );

			function changeImage( el, pos ) {
				$preview.attr( 'src', el.data( 'preview' ) );
				$carouselItems.removeClass( 'current-img' );
				el.addClass( 'current-img' );
				carousel.setCurrent( pos );

			}

		</script>
    </body>
</html>

