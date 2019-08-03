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
        <title>我的音乐</title>
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
    $("#album").click(function(){
    $("#d1").css("display","block");
    $("#d2").css("display","none");
    $(".albumli").show();
    $(".commentli").hide();
    });
    $("#evaluate").click(function(){
    $("#d1").css("display","none");
    $("#d2").css("display","block");
    $(".albumli").hide();
    $(".commentli").show();
    });
       
    $("img").click(function(){
	var a=$(this).attr("alt");
	var b="."+a;
	$(b).siblings().hide();		
	$(b).show();
	$(".xin1").attr("src","images/shixin.png");
	$(".xin2").attr("src","images/kongxin.png");
	$(".xin3").attr("src","images/kongxin.png");
	$(".xin4").attr("src","images/kongxin.png");
	$(".xin5").attr("src","images/kongxin.png");
	$(".rating").attr("value","1");
	});
	$(".xin1").click(function(){
	$(".xin1").attr("src","images/shixin.png");
	$(".xin2").attr("src","images/kongxin.png");
	$(".xin3").attr("src","images/kongxin.png");
	$(".xin4").attr("src","images/kongxin.png");
	$(".xin5").attr("src","images/kongxin.png");
	$(".rating").attr("value","1");
	});
	$(".xin2").click(function(){
	$(".xin1").attr("src","images/shixin.png");
	$(".xin2").attr("src","images/shixin.png");
	$(".xin3").attr("src","images/kongxin.png");
	$(".xin4").attr("src","images/kongxin.png");
	$(".xin5").attr("src","images/kongxin.png");
	$(".rating").attr("value","2");
	});
	$(".xin3").click(function(){
	$(".xin1").attr("src","images/shixin.png");
	$(".xin2").attr("src","images/shixin.png");
	$(".xin3").attr("src","images/shixin.png");
	$(".xin4").attr("src","images/kongxin.png");
	$(".xin5").attr("src","images/kongxin.png");
	$(".rating").attr("value","3");
	});
	$(".xin4").click(function(){
	$(".xin1").attr("src","images/shixin.png");
	$(".xin2").attr("src","images/shixin.png");
	$(".xin3").attr("src","images/shixin.png");
	$(".xin4").attr("src","images/shixin.png");
	$(".xin5").attr("src","images/kongxin.png");
	$(".rating").attr("value","4");
	});
	$(".xin5").click(function(){
	$(".xin1").attr("src","images/shixin.png");
	$(".xin2").attr("src","images/shixin.png");
	$(".xin3").attr("src","images/shixin.png");
	$(".xin4").attr("src","images/shixin.png");
	$(".xin5").attr("src","images/shixin.png");	
	$(".rating").attr("value","5");
	});
	$(".btn").click(function(){
	var str=$(this).siblings("#text").val();
	var str_lenth;
    str_lenth=str.replace(/[\u0391-\uFFE5]/g,"aa").length;  //先把中文替换成两个字节的英文，在计算长度
    if(str_lenth<15){
    alert("您已输入"+str_lenth+"字符，至少15字符，请补充评价！");
    return;
    }	
	if($(".rating").attr("value")==1){
	var r=confirm("您给了一星评价，确认提交评价么？");
	if (r==true)
  { 
  $(this).parents("#wrapper").siblings().remove(); 
  $(".btn").parent().children("textarea").after("<button id=\"btntest\"></button>");  
  $(".btn").remove();
  $("#btntest").click(); 
  }
else
  {
  }
	}
	else{
  $(this).parents("#wrapper").siblings().remove(); 
  $(".btn").parent().children("textarea").after("<button id=\"btntest\"></button>");  
  $(".btn").remove();
  $("#btntest").click();
	}
	});
  });
</script>

    </head>
    <body> 
		<div class="container demo-1">
            <div class="main">
				<header class="clearfix">	
					<h1>碟碟不朽 <span>我的专辑库</span></h1>
					<nav class="codrops-demos">
						<a class="current-demo" id="album">所有专辑</a>
						<a id="evaluate">待评价</a>
					</nav>
				</header>
				<!-- 内容展示 -->
				<div id="carouse">
				<ul id="carousel" class="elastislide-list">
				<c:forEach var="album" items="${albumList}">
             		<li class="albumli" style="width:163px;"><a href="loading_myMusic.form?nickName=${user.username}&albumId=${album.albumId}"><img src="${album.albumImage}"/></a></li>
				</c:forEach>
				<c:forEach var="comment" items="${commentList}">
             		<li class="commentli" style="width:163px;display:none;"><a><img src="${comment.albumimage}" alt="${comment.receiptid}${comment.albumid}"/></a></li>
				</c:forEach>					
				</ul>
				</div>
			</div>
            <div>
             <div id="d1">        
             <div class="border" style="width:940px;height:350px;padding-top:10px; border:white solid thin;margin:0 auto; box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1), 
             inset -2px 0 3px 2px rgba(255, 255, 255, 0.6), 
             inset 2px 0 3px 2px rgba(255, 255, 255, 0.6), 
             inset -10px 0 10px 1px rgba(155, 155, 155, 0.1), 
             inset 10px 0 10px 1px rgba(155, 155, 155, 0.1);"> 
             <div style="float:left;width:300px;height:300px;margin:15px 35px;">
             <img style="width:100%;height:100%;" src="${albumList0.albumImage}"/> 
             </div>            	
             <div style="float:left;width:450px;height:300px;margin:15px 45px;">
             	<table>
             	<tbody>
             		<tr><td class="table_index">专辑名称:&nbsp;</td><td class="table_content">${albumList0.albumName}</td></tr>	
             		<tr><td class="table_index">演唱歌手:&nbsp;</td><td class="table_content">${albumList0.singer}</td></tr>	
             		<tr><td class="table_index">专辑语种:&nbsp;</td><td class="table_content">${albumList0.language}</td></tr>	
             		<tr><td class="table_index">专辑地区:&nbsp;</td><td class="table_content">${albumList0.region}</td></tr>
             		<tr><td class="table_index">专辑风格:&nbsp;</td><td class="table_content">${albumList0.style}</td></tr>
             		<tr><td class="table_index">发行公司:&nbsp;</td><td class="table_content">${albumList0.publishcompany}</td></tr>
             		<tr><td class="table_index">发行时间:&nbsp;</td><td class="table_content">${albumList0.publishTime}</td></tr>
             		<tr><td class="table_index">专辑简介:&nbsp;</td><td class="table_content">${albumList0.intro}</td></tr>
             	</tbody>            						
				</table>                                                     
             </div>          
             </div>
             </div>
             </div>
             <div id="d2" style="display:none">                        
             <div class="border" style="width:940px;height:370px;padding-top:10px; border:white solid thin;margin:0 auto; box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1), 
             inset -2px 0 3px 2px rgba(255, 255, 255, 0.6), 
             inset 2px 0 3px 2px rgba(255, 255, 255, 0.6), 
             inset -10px 0 10px 1px rgba(155, 155, 155, 0.1), 
             inset 10px 0 10px 1px rgba(155, 155, 155, 0.1);">
             <c:forEach varStatus="status" var="comment" items="${commentList}">
             <c:if test="${status.index==0}">
             <div class="${comment.receiptid}${comment.albumid}" id="wrapper">
             <div style="height:300px;width:300px;margin:15px 35px;float:left"><img style="width:100%;height:100%;" src="${comment.albumimage}"/></div>
             <div class="inborder" style="height:560px;width:400px; margin:15px 45px;float:left;">
             <p style="float:left; margin:10px auto; width:100px;height:20px;">专辑：${comment.albumname}</p>
             <p style="float:left; clear:right;margin:10px auto;">歌手：${comment.singer}</p>
             <p style="clear:left; float:left;margin:10px auto;">购买时间：${comment.pdate}</p>
             <p style="clear:left; float:left;margin:10px auto;">购买数量：${comment.number}张</p>
             <p style="clear:both;padding-top:7px; height:20px; margin:0;margin-bottom:10px;">总付款：${comment.subtotal}元</p>			
             <div style="float：right;">
             <div style="float:left;">
             <img class="xin1" src="images/shixin.png">
             <img class="xin2" src="images/kongxin.png">
             <img class="xin3" src="images/kongxin.png">
             <img class="xin4" src="images/kongxin.png">
             <img class="xin5" src="images/kongxin.png">
             </div>
             <form action="save_comment.form" method="post">
             <input type="hidden" name="nickName" value=${user.username}> 
             <input type="hidden" name="albumid" value=${comment.albumid}>
              <input type="hidden" name="receiptid" value=${comment.receiptid}>
             <input type="hidden" class="rating" name="rating" value="1">                                  
             <div class="comment" style="width:400px;height:100px;position:relative;clear:both;">
             <textarea id="text" name="comment" style="width:380px;height:100px;" maxlength="100" placeholder="请输入评价（至少15字符，一个汉字为2字符）"></textarea>
             <button class="btn" type="button" style="width:100px;height:30px;float:right;margin:5px 19px;">评价</button> 
             </div>
             </form> 
             </div>
             </div>
             </div>
             </c:if>
             <c:if test="${status.index!=0}">
             <div class="${comment.receiptid}${comment.albumid}" style="display:none;" id="wrapper">
             <div style="height:300px;width:300px;margin:15px 35px;float:left"><img style="width:100%;height:100%;" src="${comment.albumimage}"/></div>
             <div class="inborder" style="height:560px;width:400px; margin:15px 45px;float:left;">
             <p style="float:left; margin:10px auto; width:100px;height:20px;">专辑：${comment.albumname}</p>
             <p style="float:left; clear:right;margin:10px auto;">歌手：${comment.singer}</p>
             <p style="clear:left; float:left;margin:10px auto;">购买时间：${comment.pdate}</p>
             <p style="clear:left; float:left;margin:10px auto;">购买数量：${comment.number}张</p>
             <p style="clear:both;padding-top:7px; height:20px; margin:0;margin-bottom:10px;">总付款：${comment.subtotal}元</p>			            
             <div style="float：right;">
             <div style="float:left;">
             <img class="xin1" src="images/shixin.png">
             <img class="xin2" src="images/kongxin.png">
             <img class="xin3" src="images/kongxin.png">
             <img class="xin4" src="images/kongxin.png">
             <img class="xin5" src="images/kongxin.png">
             </div> 
             <form action="save_comment.form" method="post"> 
             <input type="hidden" name="nickName" value=${user.username}> 
             <input type="hidden" name="albumid" value=${comment.albumid}>
             <input type="hidden" name="receiptid" value=${comment.receiptid}>
             <input type="hidden" class="rating" name="rating" value="1">            
             <div class="comment" style="width:400px;height:100px;position:relative;clear:both;">
             <textarea id="text" name="comment" style="width:380px;height:100px;" maxlength="100" placeholder="请输入评价（至少15字符，一个汉字为2字符）"></textarea> 
             <button class="btn" type="button" style="width:100px;height:30px;float:right;margin:5px 19px;">评价</button>
             </div>
             </form>
             </div>
             </div>
             </div>
             </c:if>
             </c:forEach>            
             </div>
             </div>             
             </div>
		<script type="text/javascript" src="javascript/jquerypp.custom.js"></script>
		<script type="text/javascript" src="javascript/jquery.elastislide.js"></script>
		<script type="text/javascript">
			
			$( '#carousel' ).elastislide();
						
		</script>
    </body>
</html>
