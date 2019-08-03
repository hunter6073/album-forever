<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<link rel="stylesheet" type="text/css" href="css/index.css" />
		<script src="javascript/jquery-3.2.1.min.js"></script>
		<script src="javascript/index.js" type="text/javascript"></script>
<link rel="Shortcut Icon" href="images/ico128.png">
		<title>碟碟不朽音乐商城</title>

	</head>

	<body>
	
	<%@include file="new_head.jsp" %>

		<!-- 新歌首发 -->
		<div class="firstbanner" id="firstbanner">                                       <!-- 新歌首发块 -->
			<div class="firstbannercontent">                                             <!-- “新歌首发“ 标题位置 -->
				<p class="bigtitle1">
					新歌首发
				</p>
			</div>
			<div class="countryclass">                                                   <!--按地区分类的超链接，不进行跳转，通过js改变现实的图片和链接。 -->   
				<a href="listalbum.form?language=全部&style=全部&region=大陆&page=1&price=全部" class="three" style="padding-left: 326px;">大陆</a>
				<a href="listalbum.form?language=全部&style=全部&region=港台&page=1&price=全部" class="three">港台</a>
				<a href="listalbum.form?language=全部&style=全部&region=韩国&page=1&price=全部" class="three">韩国</a>
				<a href="listalbum.form?language=全部&style=全部&region=欧美&page=1&price=全部" class="three">欧美</a>
				<a href="listalbum.form?language=全部&style=全部&region=日本&page=1&price=全部" class="three">日本</a>
				<a href="listalbum.form?language=全部&style=全部&region=全部&page=1&price=全部" class="three" style="float: right">全部>></a>
			</div>
			<div class="container"> 
			
			<!-- 新歌首发 -->
			<c:forEach var="albumItem" items="${newalbums}" varStatus="status">                                       
				<div class="album" id=${status.index}>                                                      <!--包装专辑的块 -->    
					<div class="front" >
				      <img class="aimg" src="${albumItem.img}" alt="${albumItem.albumid}"/>                                      <!--专辑封面 -->  
				      </div>                   
					<div class="info">                                                   <!--专辑信息，包括专辑名和歌手 -->  
						<p class="albumname">
							${albumItem.name}
						</p>
						<p class="albumsinger">
							${albumItem.singer}
						</p>
					</div>
				</div>
				
				</c:forEach>
				
			</div>

			<div class="container" style="height: 10px; width: 200px;">   
			            <!--四个小的div作为小按钮使用，切换显示的图片 -->  
			<c:forEach begin="0" end="3" varStatus="status">
		     
		    <div class="smallbutton" id="sb${status.index+1}"></div>
			
			</c:forEach>
			</div>
		</div>

		<!-- 精彩推荐 -->
		<div class="recommendation" id="recommendation">                                 <!--精彩推荐块，由三个div组成，用来进行滑动效果演示-->  
			<p class="bigtitle2">
				精彩推荐
			</p>
			<div class="longslide">                                                       
				<div class="leftrightarrow" id="leftarrow">                              <!--左右的箭头，用来点击引发滑动事件--> 
					<img src="images/leftarrow.png"/>
				</div>
				<div class="leftrightarrow" id="rightarrow" style="float: right;">
					<img src="images/rightarrow.png"/>
				</div>
				<div class="long" id="middle">
					<img src="images/long2.jpg" width="750" height="300" />
				</div>
				<div class="long"
					style="left: -380px; top:-270px; z-index: -1;"
					id="left">
					<img src="images/long1.jpg" width="600" height="250" style="margin-top:25px;"/>
				</div>
				<div class="long"
					style=" z-index: -1; left: 370px;top:-570px;"
					id="right">
					<img src="images/long3.jpg" width="600" height="250" style="margin-top:25px;"/>
				</div>
			</div>

		</div>


		<!-- 排行榜 -->
		<div class="ranking" id="ranking">                                                <!--排行榜块，包括四个排行榜，每个排行榜中保存着歌曲的链接--> 
			<p class="bigtitle3">
				排行榜
			</p>
			<div class="rankingbox">
				<!-- 折扣指数 -->
				<c:forEach var="ranks" items="${rankings}" varStatus="status">                                            
				<div class="inbox" id="ib${status.index}">                                                      <!--一个排行榜--> 
					<p class="title">
						巅峰榜
					</p>
					<p class="title1">
						${ranks.listname}
					</P>
					<ol class="one">                                                     <!--一个排行榜中的列表--> 
					<c:forEach var="list" items="${ranks.songlist}">                                                     
						<li class="st">
							<a href="distinctitem.form?album=${list.albumid}" class="listinfo">${list.name}<br />
								<span class="singer">${list.singer}</span>
							</a>
						</li>
					</c:forEach>
					</ol>
				</div>
				</c:forEach>
			</div>

		</div>


		<!-- 经典专辑 -->
		<div class="classicrecords" id="hotrecords">                                         <!-- 经典专辑板块,里面的专辑板块和新歌首发中的是一样的 -->
			<p class="bigtitle4">
				经典专辑
			</p>
			<div class="classicsongbox">
			                                       
				<div class="album">                                                      <!--包装专辑的块 -->    
					<div class="front" >
				      <img class="aimg" src="./images/albumcover/e.jpg" alt="003"/>                                      <!--专辑封面 -->  
				      </div>         <!--专辑封面 -->        
					<div class="info1" style="${albumItem.background}">                                                   <!--专辑信息，包括专辑名和歌手 -->  
						<p class="albumname">
							那个男孩
						</p>
						<p class="albumsinger">
							汪苏泷
						</p>
					</div>
				</div>
				
				<div class="album">                                                      <!--包装专辑的块 -->    
					<div class="front" >
				      <img class="aimg" src="./images/albumcover/chuangbiangushi.jpg" alt="011"/>                                      <!--专辑封面 -->  
				      </div>         <!--专辑封面 -->        
					<div class="info1" style="background-color: RGB(65, 65, 65);">                                                   <!--专辑信息，包括专辑名和歌手 -->  
						<p class="albumname">
							周杰伦的床边故事
						</p>
						<p class="albumsinger">
							周杰伦
						</p>
					</div>
				</div>
				
				
				
				<div class="album">                                                      <!--包装专辑的块 -->    
					<div class="front" >
				      <img class="aimg" src="./images/albumcover/qilixiang.jpg" alt="014"/>                                      <!--专辑封面 -->  
				      </div>         <!--专辑封面 -->        
					<div class="info1" style="${albumItem.background}">                                                   <!--专辑信息，包括专辑名和歌手 -->  
						<p class="albumname">
							七里香
						</p>
						<p class="albumsinger">
							周杰伦
						</p>
					</div>
				</div>
				
				
				
				<div class="album">                                                      <!--包装专辑的块 -->    
					<div class="front" >
				      <img class="aimg" src="./images/albumcover/h.jpg" alt="004"/>                                      <!--专辑封面 -->  
				      </div>         <!--专辑封面 -->        
					<div class="info1" style="background-color: RGB(65, 65, 65);">                                                   <!--专辑信息，包括专辑名和歌手 -->  
						<p class="albumname">
							分镜
						</p>
						<p class="albumsinger">
							潘辰
						</p>
					</div>
				</div>
				
			</div>
		</div>

		<!-- 结尾信息 -->
		<%@include file="tail_black.jsp" %>

	</body>
</html>
