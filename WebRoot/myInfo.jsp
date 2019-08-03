<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
        <title>我的信息</title>
        <link rel="Shortcut Icon" href="images/ico128.png">
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"> 
        <meta name="keywords" content="carousel, jquery, responsive, fluid, elastic, resize, thumbnail, slider" />
		<meta name="author" content="Codrops" />
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/elastislide.css" />
		<link rel="stylesheet" type="text/css" href="css/custom.css" />
		<link rel="stylesheet" type="text/css" href="css/personal.css" />
		<script src="javascript/modernizr.custom.17475.js"></script>
        <script src="javascript/jquery-3.2.1.min.js"></script> 
		<script language=JavaScript>		
		</script>
    </head>
    <body>
		<div class="container demo-3">
            <div class="main">
				<header class="clearfix">	
					<h1>碟碟不朽 <span>个人信息</span></h1>
					<nav class="codrops-demos">
						<a href="#" class="current-demo">我的信息</a>
					</nav>
				</header>


				<div class="fixed-bar">
					<!-- 专辑浏览 -->
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
                <div id="comment">
                    <form id="commentform" method="post" action="save_myInfo.form" >      
                        <div id="input" >
                            <label class="username" for="username"></label>
                            <span id="contentname">昵称：</span>
                            <input  name="username" type="text" class="msginput" value="${user.username}" disabled="true"/>
                            <input type="hidden" name="user_name" value=${user.username}>
                        </div>
                        <div id="input" > 
                            <span id="contentname">邮箱：</span>
                            <input  name="email" type="text" class="msginput"  value="${user.mailaddress}" disabled="true"/>                      
                        </div> 
                        <div id="input" >
                            <label class="phone" for="phone"></label> 
                            <span id="contentname">联系方式：</span>
                            <input  name="phone" type="text" class="msginput"  value="${phone}"/>
                        </div>
                         <div id="input" >
                            <label class="name" for="name"></label> 
                            <span id="contentname">收货人姓名：</span>
                            <input  name="name" type="text" class="msginput" value="${name}"/>
                        </div> 
                        <div id="input" >
                            <label class="postalCode" for="postalCode"></label> 
                            <span id="contentname">邮编：</span>
                            <input  name="postalCode" type="text" class="msginput"  value="${postalCode}"/>
                        </div> 
                        <div id="addArea">
                            <span id="contentname">收货地址：</span>         
                            <textarea class="msginput" name="address"  placeholder="建议您如实填写详细收货地址，例如街道名称，门牌号码，楼层和房间号等信息" style="height:80px">${normalAddress}</textarea><br/>
                        </div>
                        <input id="asd" type="submit" value="保存" class="msgsubmit" />
                    </form>
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
