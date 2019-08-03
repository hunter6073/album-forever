<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <link rel="Shortcut Icon" href="images/ico128.png">
  <meta http-equiv="content-type" content="text/html;charset=UTF-8">
   	<script src="javascript/jquery-3.2.1.min.js"></script>
    
    <title>查询页面</title>
    <style type="text/css">
    body,p,span,div,a {
	text-align: center;
	font-family: Microsoft JhengHei, Microsoft YaHei, 微软雅黑, 华文细黑, STHeiti,
		MingLiu, Verdana, Arial, Helvetica, sans-serif;
	-moz-user-select: none; /*火狐*/
	-webkit-user-select: none; /*webkit浏览器*/
	-ms-user-select: none; /*IE10*/
	-khtml-user-select: none; /*早期浏览器*/
	user-select: none;
}
    .main{
       width:100%;
    }
    .bg{
      width：100%;
      height:240px;
      background-image:url("images/bg_search.jpg");
    }
    .showsearch{
      width:1200px;
      margin:0 auto 0 auto;
      
    }
    .modules{
    width:1200px;
    margin:0;
    heigth:50px;
    align:left;
    margin-top:10px;
    }
    .mods{
    display: block;
	font-size: 17px;
	font-family: Microsoft YaHei, 微软雅黑, Microsoft JhengHei, 华文细黑, STHeiti,
		MingLiu, Verdana, Arial, Helvetica, sans-serif;
	width: 80px;
	height: 50px;
	margin: 0 40px 0 0;
	padding-top: 0px;
	text-align: left;
	text-decoration: none;
	float: left;
	height: 30px;
	cursor:pointer;
    }
    .mods:hover{
        color:blue;
    }
    .information{
    margin:0 auto;
    width:100%;
    height:500px;
    }
    hr{
   color:#E6E6E6;
   size:1px;
   clear:both;
   margin:0;
    }
    tr,tr.pink
    {
      width:100%;
      height:50px;
      
    }
    tr.pink{
    background-color:RGB(251,251,253);
    }
    img.singer_list__pic
	{
		border-radius:50%;
		border:none;
		width:150px;
		height:150px;
	}

	.ssinfo{
	float:left;
	margin:20px;
	}
	div.page{
	height:40px;
	margin:0 auto;
	}
	a.page,a.pageselected{
	display:block;
	width:50px;
	height:30px;
	float:left;
	text-align:middle;
	padding-top:10px;
	cursor:pointer;
	}
	a.pageselected{
	background-color:RGB(98,172,219);
	}
	
    </style>
    
    <script type="text/javascript" charset="UTF-8">
    $(document).ready(function(){
      var t = $("#storesearch").attr("value");
      var tx = $("#storepage").attr("value");
      var tm = "#"+$("#module").attr("value");
    
    
    
         $(".information").hide();
         $("div.page").hide();
         $(tm).show();
         $(tm+"page").show();
         
          var a = $(tm+"page a").length;
           b = a*50;
           $("div.page").css("width",b+"px");
           $(tm+"page a").attr("class","page");
           $(tm+"page #songpage"+tx).attr("class","pageselected");
           
      $("#songs").click(function(){
           $(".information").hide();
             $("div.page").hide();
           $("#song").show();
           $("#songpage").show();
           var a = $("#songpage a").length;
           b = a*50;
           $("div.page").css("width",b+"px");
           
      });   
        $("#singers").click(function(){
           $(".information").hide();
             $("div.page").hide();
           $("#singer").show();
           $("#singerpage").show();
           var a = $("#singerpage a").length;
           b = a*50;
           $("div.page").css("width",b+"px");
      });  
        $("#albums").click(function(){
           $(".information").hide();
             $("div.page").hide();
           $("#album").show();
            $("#albumpage").show();
             var a = $("#albumpage a").length;
           b = a*50;
           $("div.page").css("width",b+"px");
      });  
     $("#songpage .page").click(function(){
      var p = $(this).text();
      window.location.href="smartsearch.form?search="+t+"&page="+p; 
     
     });
     $("#albumpage .page").click(function(){
      var p = $(this).text();
      window.location.href="smartsearch.form?search="+t+"&module=album&page="+p; 
     
     });
     $("#singerpage .page").click(function(){
      var p = $(this).text();
      window.location.href="smartsearch.form?search="+t+"&module=singer&page="+p; 
     
     });
    
    });
    
    
    </script>
  </head>
  
  <body>
	<%@include file="new_head.jsp" %>
	
	
    <div class="main">
    <hidden id="storesearch" value="${search}"></hidden>
    <hidden id="storepage" value="${page}"></hidden>
    <hidden id="module" value="${module}"></hidden>
    <div class="bg"></div>
    <div class="showsearch">
    <div class="modules">
    <a class="mods" id="songs">歌曲</a>
    <a class="mods" id="albums">专辑</a>
    <a class="mods" id="singers">歌手</a>
    </div>
     <hr color="#E6E6E6" size="1px">
     
     
     
    <div class="information" id="song">
    <table align="center" width="100%">
    <tr class="pink">
    <td width="40%" align="left" >歌曲</td> <td width="25%" align="left">歌手 </td> <td width="25%" align="left">专辑</td> <td width="10%" align="left">风格</td>
    </tr>
    <c:forEach var="song" items="${ssong}">        
    <tr>
    <td><a href="distinctitem.form?album=${song.albumid}">${song.song}</a> </td>
    <td><a href="listSingerInfo.form?singername=${song.singer}">${song.singer}</a></td> 
    <td> <a href="distinctitem.form?album=${song.albumid}">${song.albumname}</a> </td>
    <td> <a href="listalbum.form?language=全部&style=${song.style}&region=全部&price=全部&page=1">${song.style}</a></td>
    </tr>
     </c:forEach>
    </table>
    <c:if test="${ssong==null}">
    <p>没有查询结果，请到专辑或歌手模块下寻找</p>
    </c:if>
    
    </div>
    
    
    <div class="information" id="singer">
    <div >
     <c:if test="${ssinger==null}">
    <p>没有查询结果，请到专辑或歌曲模块下寻找</p>
    </c:if>
    <c:forEach var="singer1" items="${ssinger}">   
    <div class="ssinfo">
    <a href="listSingerInfo.form?singername=${singer1.singer}" title="$(singer1.singer)" class="singerinfo">
    <img class="singer_list__pic"  src="${singer1.picture}" alt="${singer1.singer}">
    </a>
    <h3 class="singer_list__title"><a href="listSingerInfo.form?singername=${singer1.singer}" class="js_singer" title="${singer1.singer}">${singer1.singer}</a></h3>
    
    </div>
    </c:forEach>
    </div>
    
    </div>
    
    <div class="information" id="album">
    <table align="center" width="100%">
    <tr class="pink">
    <td width="50%" align="left" >专辑</td> <td width="40%" align="left">歌手</td> <td width="10%" align="left">发行时间</td>
    </tr>
  
    <c:forEach var="album" items="${salbum}"> 
    <tr>
    <td><a href="distinctitem.form?album=${album.albumid}">${album.albumname}</a> </td> <td><a href="listSingerInfo.form?singername=${album.singer}">${album.singer}</a></td> <td>${album.time}</td>
    </tr>
    </c:forEach>
    
   
    </table>
     <c:if test="${salbum==null}">
    <p>没有查询结果，请到歌曲或歌手模块下寻找</p>
    </c:if>
    </div>
    
    
    <div class="page" id="songpage">
     <c:forEach begin="${songstartpage}" end="${songpageend}" varStatus="status"> 
     <c:if test="${status.index==songstartpage&&fn:length(ssong)>0}">
     <a class="pageselected" id="songpage${status.index}">${status.index}</a>
     </c:if>
     <c:if test="${status.index>songstartpage&&status.index<songstartpage+8}">
     <a class="page" id="songpage${status.index}">${status.index}</a>
     </c:if>
    </c:forEach>
    <c:if test="${fn:length(ssong)>8}">
    <a class="page" id="songpage${fn:length(ssong)}">${fn:length(ssong)}</a>
    </c:if>
    </div>
    
     <div class="page" id="singerpage">
     <c:forEach  begin="${singerstartpage}" end="${singerpageend}" varStatus="status"> 
     <c:if test="${status.index==singerstartpage&&fn:length(ssinger)>0}">
     <a class="pageselected">${status.index}</a>
     </c:if>
     <c:if test="${status.index>singerstartpage&&status.index<singerstartpage+8}">
     <a class="page">${status.index}</a>
     </c:if>
    </c:forEach>
     <c:if test="${fn:length(ssinger)>8}">
    <a class="page" id="albumpage${fn:length(ssinger)}">${fn:length(ssinger)}</a>
    </c:if>
    </div>    
    
    <div class="page" id="albumpage">
  
     <c:forEach  begin="${albumstartpage}" end="${albumpageend}" varStatus="status"> 
     <c:if test="${status.index==albumstartpage&&fn:length(salbum)>0}">
     <a class="pageselected" id="albumpage${status.index}">${status.index}</a>
     </c:if>
     <c:if test="${status.index>albumstartpage&&status.index<albumstartpage+8}">
     <a class="page" id="albumpage${status.index}">${status.index}</a>
     </c:if>
    </c:forEach>
     <c:if test="${fn:length(salbum)>8}">
     <a class="page" id="albumpage${fn:length(salbum)}">${fn:length(salbum)}</a>
    </c:if>
    </div>
    </div>
   
   
    </div>





<%@include file="tail_white.jsp" %>
  </body>
</html>
