<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
        <title>订单管理</title>
        <link rel="Shortcut Icon" href="images/ico128.png">
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"> 
        <meta name="keywords" content="carousel, jquery, responsive, fluid, elastic, resize, thumbnail, slider" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/elastislide.css" />
		<link rel="stylesheet" type="text/css" href="css/custom.css" />
		<link rel="stylesheet" type="text/css" href="css/personal.css" />
		<script src="javascript/modernizr.custom.17475.js"></script>
        <script src="javascript/jquery-3.2.1.min.js"></script> 
<script>
	$(document).ready(function() {
	var a=$("#user").attr("value");
	$(".pay").click(function(){
	var str="getPay.form?username="+a;	
	var receipt_id=str+"&receiptid=";
	receipt_id+=$(this).siblings(".receipt_id").text();
	top.window.open(receipt_id);	
	}); 
	$(".delete").click(function(){
	var str="delete.form?nickName="+a;
	var receipt_id=str+"&receiptid=";
	receipt_id+=$(this).siblings(".receipt_id").text();
	window.location.href=receipt_id;	
	}); 					
		});
</script>		
    </head>
    <body>
		<div class="container demo-3">
            <div class="main">
				<header class="clearfix">	
					<h1>碟碟不朽 <span>订单管理</span></h1>
					<nav class="codrops-demos">
						<a href="#" class="current-demo">未完成订单</a>
					</nav>
				</header>
				<div style="margin:0 auto;width:600px;height:450px;overflow-y:scroll;">
					<c:forEach varStatus="status" var="receipt" items="${receiptList}">				
             		<li style="none">订单编号：<span class="receipt_id">${receipt.receiptid}</span>&nbsp;&nbsp;&nbsp;订单总价：${receipt.total} <button class="pay">立即付款</button>&nbsp;&nbsp;<button class="delete">删除订单</button></li>
             		<c:forEach var="receipt_small" items="${receipt.receipt_album}">
             		<li>专辑名称：${receipt_small.albumname}专辑数量：${receipt_small.number}</li>       
					</c:forEach>
					</c:forEach>
					<input type="hidden" id="user" value=${user.username}>
				</div>					
				<div class="fixed-bar">
					<!-- 底部装饰 -->
					<ul id="carousel" class="elastislide-list">
						<li><a href="#"><img src="images/small1.jpg" alt="image01" /></a></li>
						<li><a href="#"><img src="images/small2.jpg" alt="image02" /></a></li>
						<li><a href="#"><img src="images/small3.jpg" alt="image03" /></a></li>
						<li><a href="#"><img src="images/small4.jpg" alt="image04" /></a></li>
						<li><a href="#"><img src="images/small5.jpg" alt="image05" /></a></li>
						<li><a href="#"><img src="images/small6.jpg" alt="image06" /></a></li>
						<li><a href="#"><img src="images/small7.jpg" alt="image07" /></a></li>
						<li><a href="#"><img src="images/small8.jpg" alt="image08" /></a></li>
						<li><a href="#"><img src="images/small9.jpg" alt="image09" /></a></li>
						<li><a href="#"><img src="images/small10.jpg" alt="image10" /></a></li>
						<li><a href="#"><img src="images/small11.jpg" alt="image11" /></a></li>
						<li><a href="#"><img src="images/small12.jpg" alt="image12" /></a></li>
						<li><a href="#"><img src="images/small13.jpg" alt="image13" /></a></li>
						<li><a href="#"><img src="images/small14.jpg" alt="image14" /></a></li>
						<li><a href="#"><img src="images/small15.jpg" alt="image15" /></a></li>
						<li><a href="#"><img src="images/small16.jpg" alt="image16" /></a></li>
						<li><a href="#"><img src="images/small17.jpg" alt="image17" /></a></li>
						<li><a href="#"><img src="images/small18.jpg" alt="image18" /></a></li>
						<li><a href="#"><img src="images/small19.jpg" alt="image19" /></a></li>
						<li><a href="#"><img src="images/small20.jpg" alt="image20" /></a></li>
					</ul>
					<!-- End Elastislide Carousel -->
				</div>
			</div>
		</div>		
		<script type="text/javascript" src="javascript/jquerypp.custom.js"></script>
		<script type="text/javascript" src="javascript/jquery.elastislide.js"></script>
		<script type="text/javascript">			
			$( '#carousel' ).elastislide( {
				minItems : 2
			} );
			
		</script>
    </body>
</html>
