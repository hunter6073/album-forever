<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <link rel="Shortcut Icon" href="images/ico128.png">
    <title>专辑列表</title>
	<link rel="stylesheet" type="text/css" href="css/AlbumCSS.css">
	<script src="javascript/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){

  $("#album_head").css("color","RGB(98, 172, 219)");

	
	
	
		var language = $("a.tag__item_language").text();
		var style  = $("a.tag__item_style").text();
		var region = $("a.tag__item_region").text();
		var price = $("a.tag__item_price").children("span").text();
		var page = 1;
		
		var lan_hidden = $("#language_hidden").attr("value");
		var sty_hidden = $("#style_hidden").attr("value");
		var reg_hidden = $("#region_hidden").attr("value");
    	var pri_hidden = $("#price_hidden").attr("value");
    				//alert("1"+reg_hidden+"2"+reg+key);
    				
    		$("#div_language a.tag__item_language").parent().children("a").attr("class","tag__item_l");
    		$("#"+lan_hidden).attr("class","tag__item_language");    		
			$("a.tag__item_language").css('background-color','RGB(98,172,219)');
			$("a.tag__item_language").css('color','white'); 
			
			$("#div_style a.tag__item_style").parent().children("a").attr("class","tag__item_s");
    		$("#"+"s"+sty_hidden).attr("class","tag__item_style");    		
			$("a.tag__item_style").css('background-color','RGB(98,172,219)');
			$("a.tag__item_style").css('color','white');
			
			$("#div_region a.tag__item_region").parent().children("a").attr("class","tag__item_r");
    		$("#"+"r"+reg_hidden).attr("class","tag__item_region");    		
			$("a.tag__item_region").css('background-color','RGB(98,172,219)');
			$("a.tag__item_region").css('color','white');
			
			$("#div_price a.tag__item_price").parent().children("a").attr("class","tag__item_p");
    		$("#"+"p"+pri_hidden).attr("class","tag__item_price");    		
			$("a.tag__item_price").css('background-color','RGB(98,172,219)');
			$("a.tag__item_price").css('color','white');
		
		
		$("a").click(
		function()
		{
			var a = $(this).attr("class");
			
			if(a=="tag__item_l")
			{
				language = $(this).text();
				
				window.location.href="listalbum.form?language="+language+"&style="+style+"&region="+region+"&price="+price+"&page="+page;
			}
			else if(a=="tag__item_s")
			{
				language = $("#language_hidden").attr("value");
				style = $(this).text();
				
				window.location.href="listalbum.form?language="+language+"&style="+style+"&region="+region+"&price="+price+"&page="+page;
			}
			else if(a=="tag__item_r")
			{
				language = $("#language_hidden").attr("value");
				style = $("#style_hidden").attr("value");
				region = $(this).text();
				
				window.location.href="listalbum.form?language="+language+"&style="+style+"&region="+region+"&price="+price+"&page="+page;
			}
			else if(a=="tag__item_p")
			{
				language = $("#language_hidden").attr("value");
				style = $("#style_hidden").attr("value");
				region = $("#region_hidden").attr("value");
				price = $(this).children("span").text();
				
				window.location.href="listalbum.form?language="+language+"&style="+style+"&region="+region+"&price="+price+"&page="+page;
			}
			else if(a=="js_pageindex"||a=="js_pageindex_now")
    		{
    			language = $("#language_hidden").attr("value");
				style = $("#style_hidden").attr("value");
				region = $("#region_hidden").attr("value");
				price = $("#price_hidden").attr("value");
    			page =$(this).text(); 
    			
    			window.location.href="listalbum.form?language="+language+"&style="+style+"&region="+region+"&price="+price+"&page="+page;
    		}
    		else if(a=="js_pageindex_last")
    		{
    			language = $("#language_hidden").attr("value");
				style = $("#style_hidden").attr("value");
				region = $("#region_hidden").attr("value");
				price = $("#price_hidden").attr("value");
    			page =$("#page_hidden").attr("value");
    			page = Number(page)-1; 
    			
    			window.location.href="listalbum.form?language="+language+"&style="+style+"&region="+region+"&price="+price+"&page="+page;
    		}
    		else if(a=="js_pageindex_next")
    		{
    			language = $("#language_hidden").attr("value");
				style = $("#style_hidden").attr("value");
				region = $("#region_hidden").attr("value");
				price = $("#price_hidden").attr("value");
    			page =$("#page_hidden").attr("value");
    			page = Number(page)+1; 
    			window.location.href="listalbum.form?language="+language+"&style="+style+"&region="+region+"&price="+price+"&page="+page;
    		}
		});
		});
		
	</script>
	
  </head>
  
  <body>
  
<%@ include file="new_head.jsp"%>
   
  <div class="main" id="">
  	<div class="bg_pic" ></div>
     <div class="mod_tag" id="tag_list">

            <div id = "div_language" class="tag__list">
                <h4 class="tag__tit">语种
		
                <a href="javascript:;" id = "全部" class="tag__item_language" >全部</a>
		
                <a href="javascript:;" id = "国语" class="tag__item_l" >国语</a>
		
                <a href="javascript:;" id = "粤语" class="tag__item_l" >粤语</a>
		
                <a href="javascript:;" id = "英语" class="tag__item_l" >英语</a>
		
                <a href="javascript:;" id = "韩语" class="tag__item_l" >韩语</a>
		
                <a href="javascript:;" id = "日语" class="tag__item_l" >日语</a>
                
                <hidden id="language_hidden" value="${language}"></hidden>
                <hidden id="style_hidden" value="${style}"></hidden>
                <hidden id="region_hidden" value="${region}"></hidden>
                <hidden id="price_hidden" value="${price}"></hidden>
                <hidden id="page_hidden" value="${pageNow}"></hidden>
				</h4>
            </div>

            <div id = "div_style" class="tag__list">
                <h4 class="tag__tit">流派
		
                <a href="javascript:;" id = "s全部" class="tag__item_style">全部</a>
		
                <a href="javascript:;" id = "s流行"class="tag__item_s" >流行</a>
		
                <a href="javascript:;" id = "s古典"class="tag__item_s" >古典</a>
                
                <a href="javascript:;" id = "s摇滚"class="tag__item_s" >摇滚</a>
		
                <a href="javascript:;" id = "s原声"class="tag__item_s" >原声</a>
		
                <a href="javascript:;" id = "s民谣"class="tag__item_s" >民谣</a>
                
                </h4>

            </div>
            
              <div id = "div_region" class="tag__list">
                <h4 class="tag__tit">区域
                <a href="javascript:;" id = "r全部"class="tag__item_region" >全部</a>

                <a href="javascript:;" id = "r大陆"class="tag__item_r" >大陆</a>

                <a href="javascript:;" id = "r港台"class="tag__item_r" >港台</a>

                <a href="javascript:;" id = "r韩国"class="tag__item_r" >韩国</a>
                
                <a href="javascript:;" id = "r欧美"class="tag__item_r" >欧美</a>
                
                <a href="javascript:;" id = "r日本"class="tag__item_r" >日本</a>
				
				</h4>
            </div>

            <div id = "div_price" class="tag__list">
                <h4 class="tag__tit">价格
		
                <a href="javascript:;" id = "p全部" class="tag__item_price" ><span>全部</span></a>
		
                <a href="javascript:;" id = "p0" class="tag__item_p" ><span>0</span>~50</a>
		
                <a href="javascript:;" id = "p50" class="tag__item_p" ><span>50</span>~100</a>
                
                <a href="javascript:;" id = "p100" class="tag__item_p" ><span>100</span>~150</a>
                
                <a href="javascript:;" id = "p150" class="tag__item_p" ><span>150</span>~200</a>
                
                <a href="javascript:;" id = "p200" class="tag__item_p" >><span>200</span></a>
                
                </h4>
		
            </div>

          
	</div>
	 <div class="mod_part_detail">
            <div class="part_detail__hd">
                <h2 class="part_detail__tit">全部专辑</h2>
            </div>
            <div class="mod_playlist_mod_playlist--all">
                <ul class="playlist__list" id="album_list">
                
                <c:forEach var="Album" items="${albumlist}">
                
                	<li class="singer_list__item">
                    <div class="singer_list__item_box">
                       <div class="singer_image_box">
                        <a href="distinctitem.form?album=${Album.album_albumid}" class="singer_list__cover js_singer" title="专辑名">
                            <img class="singer_list__pic"  src="${Album.album_image}" alt="专辑名">
                        </a>
                       </div>
                        <h4 class="playlist__title"><a href="http://172.29.17.10:8088/Gou/shopcar.jsp" class="js_play" title="专辑名">${Album.album_name}</a></h4>
                        <h4 class="singerlist__title"><a href="listSingerInfo.form?singername=${Album.album_singer}" class="js_singer" title="歌手名">${Album.album_singer }</a></h4>
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
   		 		   <a href="javascript:;" class="js_pageindex_last" title="上一页" ><span class="icon_txt"><img class="little_icon" src="images/last.png"></span></a>
   		 	</c:if>
   		 	
   		 	
   		 	
   		 	<!-- 1 2 页 -->
            <c:forEach varStatus = "status" begin="1" end="2">
            <c:if test="${ status.index<3&&status.index!=pageNow}">
            	<a  href="javascript:;" class="js_pageindex">${status.index}</a>
            </c:if>
            <c:if test="${status.index==pageNow}">
            	<a  href="javascript:;" class="js_pageindex_now" style="color:white;background-image:url(images/bg_page.png)">${status.index}</a>
            </c:if>
            </c:forEach>
            
            <!-- 第2页之后的页码显示-->
            <c:if test="${pageNow>2&&pageNow<TotalPage}">
            	<c:if test="${pageNow>3}">
             	<img class="little_icon_shenglv" style="margin:0;" src="images/shenglue.png">
             	</c:if>
            	<a href="javascript:;" class="js_pageindex" style="margin:0;color:white;background-image:url(images/bg_page.png)">${pageNow}</a>
            </c:if>
            
            <!-- 第二页之后的省略号 -->
            <c:if test="${pageNow!=TotalPage-1}">
            <img class="little_icon_shenglv"style="margin:0;" src="images/shenglue.png"> 
            </c:if>
            <!-- 当前页不是最后一页 -->
            <c:if test="${pageNow!=TotalPage}">
            <a href="javascript:;" class="js_pageindex"  title="尾页">${TotalPage}</a>
            </c:if>
            <!-- 当前页为最后一页的显示 -->
            <c:if test="${pageNow==TotalPage}">
            <a href="javascript:;" class="js_pageindex"  title="尾页" style="color:white;background-image:url(images/bg_page.png)">${TotalPage}</a>
            </c:if>
            <!-- 当前页为最后一页时下一页不能用 -->
			<c:if test="${pageNow==TotalPage}">
            <p  href ="javascript:return false;" class="js_pageindex_next" title="下一页" style="disabled=true;margin:0 0 0 10px;float:left;"><span class="icon_txt"><img class="little_icon" src="images/next_dis.png"></span></p>
          	</c:if>
          	<!-- 当前页为最后一页时下一页能用 -->
          	<c:if test="${pageNow!=TotalPage}">
            <a href="javascript:;" class="js_pageindex_next" title="下一页"><span class="icon_txt"><img class="little_icon" src="images/next.png"></span></a>
          	</c:if>
          	</c:if>
          	
          	 <!-- 页数小于3页码显示-->
          	<c:if test="${TotalPage<=3}">
          	 <!--<a href="listByPage.form?page=${pageNow-1}&style=${ListType}&sign=${singer_sign}" class="js_pageindex" title="上一页" ><span class="icon_txt"><img class="little_icon" src="images/last.png"></span></a>
          		-->
          		<c:forEach varStatus = "status" begin="1" end="${TotalPage}">            
            	<c:if test="${status.index!=pageNow}">
            	<a href="javascript:;" class="js_pageindex">${status.index}</a>
   		 		</c:if>
   		 		<c:if test="${status.index==pageNow}">
            	<a  href="javascript:;" class="js_pageindex_now" style="color:white;background-image:url(images/bg_page.png)">${status.index}</a>
            	</c:if>
   		 		</c:forEach>
   		 		<!--<a href="listByPage.form?page=${pageNow+1}&style=${ListType}&sign=${singer_sign}" class="js_pageindex" title="下一页"><span class="icon_txt"><img class="little_icon" src="images/next.png"></span></a>
   		 	--></c:if>
          	</div>
   		</div>
    </div> 

   <!-- 结尾信息 -->
<%@ include file="tail_black.jsp"%>
  </body>
</html>
