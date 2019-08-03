<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 
  <head>
  <link rel="Shortcut Icon" href="images/ico128.png">
    <link href="css/SingerCSS.css" rel="stylesheet" type="text/css" />
    <title>歌手分类</title>
    <script src="javascript/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
    	$(document).ready(function(){
    	    $("#singer_head").css("color","RGB(98, 172, 219)");
    	
    	
    	
    		var reg = $("a.singer_tag_item_alltype").text();
    		var key = $("a.singer_tag_item_allword").text();
    		var pag = 1;
    				
    				
   			var reg_hidden = $("#region_hidden").attr("value");
    		var wor_hidden = $("#word_hidden").attr("value");
    				//alert("1"+reg_hidden+"2"+reg+key);
    				
    		$("div.singer_tag__list_area a.singer_tag_item_alltype").parent().children("a").attr("class","singer_tag__item");
    		$("#"+reg_hidden).attr("class","singer_tag_item_alltype");    		
			$("a.singer_tag_item_alltype").css('background-color','RGB(98,172,219)');
			$("a.singer_tag_item_alltype").css('color','white'); 
			
    				  
    		$("div.singer_tag__list_letter a.singer_tag_item_allword").parent().children("a").attr("class","singer_tag__item_a");		
    		$("#"+"_"+wor_hidden).attr("class","singer_tag_item_allword");
    		$("a.singer_tag_item_allword").css('background-color','RGB(98,172,219)');
    		$("a.singer_tag_item_allword").css('color','white');
    				
    				
    				
    		$("a").click(
    		function()
    		{
    			var a = $(this).attr("class");
    			
    			if(a=="singer_tag__item")
    			{
    				reg = $(this).text();
    				//alert(reg+"_"+key+"_"+pag);
    				window.location.href="listsinger.form?region="+reg+"&word="+key+"&page="+pag;
    			}
    			else if(a=="singer_tag__item_a")
    			{
    				reg = $("#region_hidden" ).attr("value");
    				//alert(reg);
					key =$(this).text();
					//alert(reg+"_"+key+pag);
    				window.location.href="listsinger.form?region="+reg+"&word="+key+"&page="+pag;	
    			}
    			else if(a=="js_pageindex"||a=="js_pageindex_now")
    			{
    				reg = $("#region_hidden").attr("value");
    				key =$("#word_hidden").attr("value");
    				pag =$(this).text(); 
    				//alert(reg+key+pag);
    				window.location.href="listsinger.form?region="+reg+"&word="+key+"&page="+pag;	
    			}
    			else if(a=="js_pageindex_last")
    			{
    				reg = $("#region_hidden").attr("value");
    				key =$("#word_hidden").attr("value");
    				pag =$("#page_hidden").attr("value")-1; 
    				//alert(reg+key+pag);
    				window.location.href="listsinger.form?region="+reg+"&word="+key+"&page="+pag;
    			}
    			else if(a=="js_pageindex_next")
    			{
    				reg = $("#region_hidden").attr("value");
    				key =$("#word_hidden").attr("value");
    				pag =$("#page_hidden").attr("value");
    				pag =parseInt(pag)+1; 
    				//alert(reg+key+pag);
    				window.location.href="listsinger.form?region="+reg+"&word="+key+"&page="+pag;
    			}
    		});
    	});

    </script>

  </head>
   
  <body>
  
  	<%@ include file="new_head.jsp"%>
  
  
  
    <div class="main">
    	<div class="mod_bg_picture" style="background-image:url(images/bg_singer.jpg)">
    	</div>
        <div class="mod_singer_tag">					<!-- 分类导航栏 -->
            <div class="singer_tag__list_area">		<!-- 歌手区分类 栏-->
                <a href="javascript:;" id = "全部" 		class="singer_tag_item_alltype" >全部</a>
                <a href="javascript:;" id = "华语男" 		class="singer_tag__item" >华语男</a>
                <a href="javascript:;" id = "华语女" 		class="singer_tag__item" >华语女</a>
                <a href="javascript:;" id = "华语组合" 	class="singer_tag__item" >华语组合</a>
                <a href="javascript:;" id = "韩国男" 		class="singer_tag__item" >韩国男</a>
                <a href="javascript:;" id = "韩国女" 		class="singer_tag__item" >韩国女</a>
                <a href="javascript:;" id = "韩国组合" 	class="singer_tag__item" >韩国组合</a>
                <a href="javascript:;" id = "日本女" 		class="singer_tag__item" >日本女</a>
                <a href="javascript:;" id = "日本男" 		class="singer_tag__item" >日本男</a>
                <a href="javascript:;" id = "演奏家" 		class="singer_tag__item" >演奏家</a>
                <a href="javascript:;" id = "指挥家" 		class="singer_tag__item" >指挥家</a>
                <a href="javascript:;" id = "作曲家" 		class="singer_tag__item" >作曲家</a>
                <a href="javascript:;" id = "其他" 		class="singer_tag__item" >其他</a>
                <hidden id="region_hidden" value="${region}"></hidden>
                <hidden id="word_hidden" value="${word}"></hidden>
                <hidden id="page_hidden" value="${pageNow}"></hidden>
            </div>
            <div class="singer_tag__list_letter">	<!-- 名字首字母分类-->
                <a href="javascript:;" id="_全部" class="singer_tag_item_allword" >全部</a>
                <a id="singer_tag__item_hidden"></a>
                <a href="javascript:;" id="_A"	class="singer_tag__item_a" >A</a>
                <a href="javascript:;" id="_B"	class="singer_tag__item_a" >B</a>
                <a href="javascript:;" id="_C"	class="singer_tag__item_a" >C</a>
                <a href="javascript:;" id="_D"	class="singer_tag__item_a" >D</a>
                <a href="javascript:;" id="_E"	class="singer_tag__item_a" >E</a>
                <a href="javascript:;" id="_F"	class="singer_tag__item_a" >F</a>
                <a href="javascript:;" id="_G"	class="singer_tag__item_a" >G</a>
                <a href="javascript:;" id="_H"	class="singer_tag__item_a" >H</a>
                <a href="javascript:;" id="_I"	class="singer_tag__item_a" >I</a>
                <a href="javascript:;" id="_J"	class="singer_tag__item_a" >J</a>
                <a href="javascript:;" id="_K"	class="singer_tag__item_a" >K</a>
                <a href="javascript:;" id="_L"	class="singer_tag__item_a" >L</a>
                <a href="javascript:;" id="_M"	class="singer_tag__item_a" >M</a>
                <a href="javascript:;" id="_N"	class="singer_tag__item_a" >N</a>
                <a href="javascript:;" id="_O"	class="singer_tag__item_a" >O</a>
                <a href="javascript:;" id="_P"	class="singer_tag__item_a" >P</a>
                <a href="javascript:;" id="_Q"	class="singer_tag__item_a" >Q</a>
                <a href="javascript:;" id="_R"	class="singer_tag__item_a" >R</a>
                <a href="javascript:;" id="_S"	class="singer_tag__item_a" >S</a>
                <a href="javascript:;" id="_T"	class="singer_tag__item_a" >T</a>
                <a href="javascript:;" id="_U"	class="singer_tag__item_a" >U</a>
                <a href="javascript:;" id="_V"	class="singer_tag__item_a" >V</a>
                <a href="javascript:;" id="_W"	class="singer_tag__item_a" >W</a>
                <a href="javascript:;" id="_X"	class="singer_tag__item_a" >X</a>
                <a href="javascript:;" id="_Y"	class="singer_tag__item_a" >Y</a>
                <a href="javascript:;" id="_Z"	class="singer_tag__item_a" >Z</a>
                <a href="javascript:;" id="_or"	class="singer_tag__item_a">or</a>
            </div>
        </div>
           	<div class="mod_singer_list" style="font-family:Verdana;">
            <ul class="singer_list__list js_avtar_list">
            <c:forEach var="singer" items="${singerlist}" varStatus="status">
            
            
            	<li class="singer_list__item">
                    <div class="singer_list__item_box">
                        <a href="listSingerInfo.form?singername=${singer.singer_name}" class="js_singer" title="${singer.singer_image}">
                            <img class="singer_list__pic" src="${singer.singer_image}" alt="${singer.singer_image}">
                        </a>
                        <h3 class="singer_list__title"><a href="listSingerInfo.form?singername=${singer.singer_name}" class="js_singer" title="${singer.singer_image}">${singer.singer_name}</a></h3>
                    </div>
                </li>
           	
            </c:forEach>
        		
            </ul>
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
