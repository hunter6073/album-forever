<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <link rel="Shortcut Icon" href="images/ico128.png">
    <title>歌手信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/SingerInfoCSS.css">

  </head>
  
  <body>
  
  
<%@ include file="new_head.jsp"%>
   


  <div class="main" >
  	
  		 <!-- 歌手信息 -->
     <div class="mod_data">
            <span class="data__cover">
		<img src="${SingerInfo.singer_image}"  alt="${SingerInfo.singer_name}" class="data__photo js_index">
            </span>
            <div class="data__cont">
                <div class="data__name">
		    <h1 class="data__name_txt_js_index" title="${SingerInfo.singer_name}">${SingerInfo.singer_name}</h1>
                </div>

                <div class="data__desc" id="singer_desc">
                
				<p class="data__desc" id="singer_desc_data" style="text-align:left; font-size:15px; float:left; width:500px;">${SingerInfo.singer_intro}</p>
                </div>
            </div>
        </div>
        
        
        
       <!-- 全部专辑列表 -->
	 <div class="mod_part_detail">
            <div class="part_detail__hd">
                <h2 class="part_detail__tit">歌手专辑</h2>
            </div>
            <div class="mod_playlist_mod_playlist--all">
            <ul class="playlist__list" id="album_list">
                <c:forEach var="Album" items="${AlbumList}">
                	
                	<li class="singer_list__item">
                    <div class="singer_list__item_box">
                        <div class="singer_image_box">
                        <a href="distinctitem.form?album=${Album.album_albumid}" class="singer_list__cover js_singer"  title="${Album.album_name}">
                            <img class="singer_list__pic" src="${Album.album_image}" alt="${Album.album_name}">
                        </a>
                        </div>
                        <h4 class="playlist__title"><a href="distinctitem.form?album=${Album.album_albumid}" class="js_play" title="${Album.album_name}">${Album.album_name}</a></h4>
                        <h4 class="singerlist__title"><a href="listSingerInfo.form?singername=${Album.album_singer}" class="js_singer" title="${Album.album_singer}">${Album.album_singer}</a></h4>
                        <span class="album_price"style="font-size:15px;float:right;margin-right:10px;">￥${Album.album_price}</span>
                    </div>
                	</li>
		
                </c:forEach>
            </ul>
            
    </div>
 </div>
  <br style="clear:both;"/>
        <div class="mod_page_nav_js_pager" >
   		 <div class="mod_page" style="width:300px;height:50px;margin:0 auto;">
   		 
   		 	<c:if test="${TotalPage>3}">
   		 	
   		 	<!--上一页-->
   		 	
   		 	<c:if test="${pageNow<=1}">
   		 		   <p  class="js_pageindex_last" title="上一页" style="disabled=true;margin:0 0 0 0px;float:left;"><span class="icon_txt"><img class="little_icon" src="images/last_dis.png"></span></p>
   		 	</c:if>
   		 	<c:if test="${pageNow>1}">
   		 		   <a href="listSingerInfo.form?page=${pageNow-1}&singername=${Album.album_singer}" class="js_pageindex_last" title="上一页" ><span class="icon_txt"><img class="little_icon" src="images/last.png"></span></a>
   		 	</c:if>
   		 	
   		 	
   		 	
   		 	<!-- 1 2 页 -->
            <c:forEach varStatus = "status" begin="1" end="2">
            <c:if test="${ status.index<3&&status.index!=pageNow}">
            	<a  href="listSingerInfo.form?page=${status.index }&singername=${SingerInfo.singer_name}" class="js_pageindex">${status.index}</a>
            </c:if>
            <c:if test="${status.index==pageNow}">
            	<a  href="listSingerInfo.form?page=${status.index }&singername=${SingerInfo.singer_name}" class="js_pageindex_now" style="color:white;background-image:url(images/bg_page.png)">${status.index}</a>
            </c:if>
            </c:forEach>
            
            <!-- 第2页之后的页码显示-->
            <c:if test="${pageNow>2&&pageNow<TotalPage}">
            	<c:if test="${pageNow>3}">
             	<img class="little_icon_shenglv" style="margin:0;" src="images/shenglue.png">
             	</c:if>
            	<a href="listSingerInfo.form?page=${pageNow }&singername=${SingerInfo.singer_name}" class="js_pageindex" style="margin:0;color:white;background-image:url(images/bg_page.png)">${pageNow}</a>
            </c:if>
            
            <!-- 第二页之后的省略号 -->
            <c:if test="${pageNow!=TotalPage-1}">
            <img class="little_icon_shenglv"style="margin:0;" src="images/shenglue.png"> 
            </c:if>
            <!-- 当前页不是最后一页 -->
            <c:if test="${pageNow!=TotalPage}">
            <a href="listSingerInfo.form?page=${TotalPage}&singername=${SingerInfo.singer_name}" class="js_pageindex"  title="尾页">${TotalPage}</a>
            </c:if>
            <!-- 当前页为最后一页的显示 -->
            <c:if test="${pageNow==TotalPage}">
            <a href="listSingerInfo.form?page=${TotalPage}&singername=${SingerInfo.singer_name}" class="js_pageindex"  title="尾页" style="color:white;background-image:url(images/bg_page.png)">${TotalPage}</a>
            </c:if>
            <!-- 当前页为最后一页时下一页不能用 -->
			<c:if test="${pageNow==TotalPage}">
            <p  href ="javascript:return false;" class="js_pageindex_next" title="下一页" style="disabled=true;margin:0 0 0 10px;float:left;"><span class="icon_txt"><img class="little_icon" src="images/next_dis.png"></span></p>
          	</c:if>
          	<!-- 当前页为最后一页时下一页能用 -->
          	<c:if test="${pageNow!=TotalPage}">
            <a href="listSingerInfo.form?page=${pageNow+1}&singername=${SingerInfo.singer_name}" class="js_pageindex_next" title="下一页"><span class="icon_txt"><img class="little_icon" src="images/next.png"></span></a>
          	</c:if>
          	</c:if>
          	
          	 <!-- 页数小于3页码显示-->
          	<c:if test="${TotalPage<=3}">
          	 <!--<a href="listByPage.form?page=${pageNow-1}&style=${ListType}&sign=${singer_sign}" class="js_pageindex" title="上一页" ><span class="icon_txt"><img class="little_icon" src="images/last.png"></span></a>
          		-->
          		<c:forEach varStatus = "status" begin="1" end="${TotalPage}">            
            	<c:if test="${status.index!=pageNow}">
            	<a href="listSingerInfo.form?page=${status.index}&singername=${SingerInfo.singer_name}" class="js_pageindex">${status.index}</a>
   		 		</c:if>
   		 		<c:if test="${status.index==pageNow}">
            	<a  href="listSingerInfo.form?page=${status.index}&singername=${SingerInfo.singer_name}" class="js_pageindex_now" style="color:white;background-image:url(images/bg_page.png)">${status.index}</a>
            	</c:if>
   		 		</c:forEach>
   		 		<!--<a href="listByPage.form?page=${pageNow+1}&style=${ListType}&sign=${singer_sign}" class="js_pageindex" title="下一页"><span class="icon_txt"><img class="little_icon" src="images/next.png"></span></a>
   		 	--></c:if>
          	</div>
   		</div>	
   		<br style="clear:both;"/>	
</div>
   <!-- 结尾信息 -->
<%@ include file="tail_black.jsp"%>
  </body>
</html>
