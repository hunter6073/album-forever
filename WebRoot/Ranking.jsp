<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="Shortcut Icon" href="images/ico128.png">
<meta charset="utf-8">
<title>碟碟不朽排行榜</title>
<link href="css/RankingCSS.css" type="text/css" rel="stylesheet" />
 <script src="javascript/jquery-3.2.1.min.js"></script>
<script  type="text/javascript">
$(document).ready(function(){
$("#ranking_head").css("color","RGB(98, 172, 219)");
});
</script>

</head>

<body >



<%@ include file="new_head.jsp"%>



<div class="main" id="">
<div class="ranking_bg"></div>
<ul class="list">
	<li>  
	<a href="rankByPage.form?page=1&sign=sold" class="ranking_type" style="color:${ColorS }">   	
    	<span class="icon">Z</span> 
    		
        <div class="text">
            <h2 style="color:${ColorS }">销量排行</h2>
            <h3></h3>
        </div>
     </a> 
    </li>
    <li>
    <a href="rankByPage.form?page=1&sign=wish" class="ranking_type" style="color:${ColorW }">
    	<span class="icon">N</span>
        <div class="text">
        	<h2 style="color:${ColorW }">收藏排行</h2>
            <h3></h3>
        </div>
    </a>
    </li>
    <li>
    <a href="rankByPage.form?page=1&sign=publishtime" class="ranking_type" style="color:${ColorP }">
    	<span class="icon">L</span>
        <div class="text">
        	<h2 style="color:${ColorP }">新歌排行</h2>
            <h3></h3>
        </div>
	</a>
    </li>
    <li>
    	<a href="rankByPage.form?page=1&sign=discount" class="ranking_type" style="color:${ColorD }">
    	<span class="icon">F</span>
        <div class="text">
        	<h2 style="color:${ColorD }">折扣排行</h2>
            <h3> </h3>
        </div>
        </a>
    </li>    
</ul>
 <div class="mod_toplist">
            
            
            
<div class="mod_songlist">
                <ul class="songlist__header">
                    <!--<li class="songlist__edit">
                        <input type="checkbox" class="songlist__checkbox_js_check_all">
                    </li>-->
                    
                    <li class="songlist__header_name" style="font-size:25px;">专辑</li>
                    <li class="songlist__header_singer" style="font-size:25px;">歌手</li>
                    <li class="songlist__header_time" style="font-size:25px;">发行时间</li>                    
                </ul>

	<ul class="songlist__list">
	<%
		int index =Integer.parseInt(request.getAttribute("pageNow").toString());
		int pagenow = index;
		int start = (pagenow-1)*10;
	 %>
	
	<c:forEach var="Album" items="${Albumlist}" varStatus="status">
	<li class="songlist__info" >	
	<div class="songlist__item">
			<div class="songlist__number"><%=++start %></div>
		<div class="songlist__songname">
			<span class="songlist__songname_txt" style="visibility: visible;">
			    <a href="distinctitem.form?album=${Album.album_albumid}" class="songlist__cover_album_name">
			    <img src="${Album.album_image}" alt="${Album.album_name}" class="songlist__pic" style="width:80px;height:80px;">
			    </a>
			    <a href="distinctitem.form?album=${Album.album_albumid}" class="js_song" title="${Album.album_name}">${Album.album_name}</a>			    
			</span>	
			
			<div class="mod_list_menu">
				<label id="list_menu__item_wish">￥${Album.album_price}</label>				
			</div>
			
			
		</div>
			<div class="songlist__artist">
				<a href="listSingerInfo.form?singername=${Album.album_singer}" title="${Album.album_singer}" class="singer_name">${Album.album_singer}</a>			
			</div>
			<div class="songlist__time">${Album.album_publishtime}</div>
	</div>
	</li>	
	</c:forEach>
	</ul>
	 <br style="clear:both;"/>
	 <div class="mod_page_nav_js_pager" >
   		 <div class="mod_page" style="width:400px;height:50px;margin:0 auto;">
   		 	<c:if test="${TotalPage>3}">   		 	
   		 	<c:if test="${pageNow<=1}">
   		 		   <a  class="js_pageindex_1" title="上一页" style="disabled:true;"><span class="icon_txt"><img class="little_icon" src="images/last_dis.png"></span></a>
   		 	</c:if>
   		 	<c:if test="${pageNow>1}">
   		 		   <a href="rankByPage.form?page=${pageNow-1}&sign=${album_sign}" class="js_pageindex_1" title="上一页" ><span class="icon_txt"><img class="little_icon" src="images/last.png"></span></a>
   		 	</c:if>
            <c:forEach varStatus = "status" begin="1" end="2">
            <c:if test="${ status.index<3&&status.index!=pageNow}">
            	<a  href="rankByPage.form?page=${status.index}&sign=${album_sign}" class="js_pageindex">${status.index}</a>
            </c:if>
            <c:if test="${status.index==pageNow}">
            	<a  href="rankByPage.form?page=${status.index}&sign=${album_sign}" class="js_pageindex" style="color:white;background-image:url(images/bg_page.png)">${status.index}</a>
            </c:if>
            </c:forEach>
            <c:if test="${pageNow>2&&pageNow<TotalPage}">
            	<c:if test="${pageNow>3}">
             	<img class="little_icon_shenglv" style="margin:0;" src="images/shenglue.png">
             	</c:if>
            	<a href="rankByPage.form?page=${pageNow}&sign=${album_sign}" class="js_pageindex" style="margin:0;color:white;background-image:url(images/bg_page.png)">${pageNow}</a>
            </c:if>
            <c:if test="${pageNow!=TotalPage-1}">
            <img class="little_icon_shenglv"style="margin:0;" src="images/shenglue.png"> 
            </c:if>
            <c:if test="${pageNow!=TotalPage}">
            <a href="rankByPage.form?page=${TotalPage}&sign=${album_sign}" class="js_pageindex"  title="尾页">${TotalPage}</a>
            </c:if>
            <c:if test="${pageNow==TotalPage}">
            <a href="rankByPage.form?page=${TotalPage}&sign=${album_sign}" class="js_pageindex"  title="尾页" style="color:white;background-image:url(images/bg_page.png)">${TotalPage}</a>
            </c:if>
			<c:if test="${pageNow==TotalPage}">
            <a  class="js_pageindex_1" title="下一页" style="disabled=true;"><span class="icon_txt"><img class="little_icon" src="images/next_dis.png"></span></a>
          	</c:if>
          	<c:if test="${pageNow!=TotalPage}">
            <a href="rankByPage.form?page=${pageNow+1}&sign=${album_sign}" class="js_pageindex_1" title="下一页"><span class="icon_txt"><img class="little_icon" src="images/next.png"></span></a>
          	</c:if>
          	</c:if>
          	<c:if test="${TotalPage<=3}">
          	 <!--<a href="listByPage.form?page=${pageNow-1}&style=${ListType}&sign=${singer_sign}" class="js_pageindex" title="上一页" ><span class="icon_txt"><img class="little_icon" src="images/last.png"></span></a>
          		<c:forEach varStatus = "status" begin="1" end="${TotalPage}">            
            	<a href="rankByPage.form?page=${status.index}&sign=${album_sign}" class="js_pageindex">${status.index}</a>
   		 		</c:forEach>-->
   		 		<c:forEach varStatus = "status" begin="1" end="${TotalPage}">            
            	<c:if test="${status.index!=pageNow}">
            	<a href="rankByPage.form?page=${status.index}&sign=${album_sign}" class="js_pageindex">${status.index}</a>
   		 		</c:if>
   		 		<c:if test="${status.index==pageNow}">
            	<a  href="rankByPage.form?page=${status.index}&sign=${album_sign}" class="js_pageindex" style="float:left;color:white;background-image:url(images/bg_page.png)">${status.index}</a>
            	</c:if>
            	</c:forEach>
   		 		<!--<a href="listByPage.form?page=${pageNow+1}&style=${ListType}&sign=${singer_sign}" class="js_pageindex" title="下一页"><span class="icon_txt"><img class="little_icon" src="images/next.png"></span></a>
   		 	--></c:if>
          	</div>
   		</div>
	
 </div>
 </div>
 <br style="clear:both;"/>
 </div>
 <%@ include file="tail_black.jsp"%>
</body>
</html>
