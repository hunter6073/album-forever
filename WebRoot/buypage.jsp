<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!--购买界面 -->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<link rel="Shortcut Icon" href="images/ico128.png">
		<base href="<%=basePath%>">
		<title>喋喋不朽</title>
		<link href="css/buypage.css" rel="stylesheet" type="text/css">
		<link href="css/songlist.css" rel="stylesheet" type="text/css">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<style type="text/css">
		div.tal {
			background: -webkit-gradient(linear, 0 0, 0 bottom, from(#fff),to(#CDD8E3) );
				}
		</style>
<!-- 添加js、jQuery支持 -->
		<script src="javascript/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="javascript/buypage.js" charset="utf-8"></script>

	</head>

	<body>
		<%@include file="new_head.jsp" %>

		
<!--middle all-->
		<div class="tal">

			<div class="goods">

				<div class="sp1">
					<img class="zjm5" alt="专辑" src="${infor.albumimage}">
				</div>

				<div class="sp2">
					<div class="albuminformation">
						<h1 class="name">${infor.albumname}</h1>
						
						<ul class="type">
							<li id="songsinger">歌手：${infor.singer} </li>
							<li id="songstyle">流派：${infor.style}</li>
							<li id="songlanguage">语种:${infor.language}</li>
							<li id="songtime">发行时间：${infor.publishtime}</li>						
						</ul>
					</div>
					
					<div class="albumprice">
						<label id="price_1">良心价</label>
						<label id="price_2">¥${infor.price}</label>
						<label class="instore" id="instore">库存量：${infor.storage}</label>
					</div>
<!-- car.do -->		<form action="buynow.do">
					<input id="disalbumid" name="albumid" value="${infor.albumid}">
					<div class="mount">			
						<table id="tab">
							<tr>
								<td>
									<span hidden>单价:</span><span hidden class="price">${infor.price}</span>
									<label id="count">
										数量
									</label>
									<input class="numberMinus" id="numberMinus" type="button"
										value="-" height="20px" />
									
									<input class="numberInput" id="numberInput" name="inputcount" type="text"
										value="1" height="20px" />

										<script type="text/javascript">
							
											var text  = document.getElementById("numberInput");
											var texts = document.getElementById("hinstore");
												text.onkeyup = function() {
												this.value = this.value.replace(/\D/g, '');
												if (text.value > ${infor.storage}) {
													text.value = ${infor.storage};
													}
												if(this.value == '')this.value=1;
												}
												text.onblur=function(){
												this.value = this.value.replace(/\D/g, '');
												if (text.value > ${infor.storage}) {
													text.value = ${infor.storage};
													}
												if(this.value == '')this.value=1;
												}
									

										</script>

										<input hidden id="hinstore" class="hinstore" type="text" value="${infor.storage}">	
										
									<input class="numberPlus" id="numberPlus" type="button"
										height="20px" value="+" />
									<label id="reserve">
										库存不足，请重新选择
									</label>
								</td>
							</tr>
						</table>
							<p id="p_totalprice">
					        <label id="label_totalprice">总价：</label>            
							<label id="totalprice"></label>
							</p>
						</div>	
					<div class="albumbuy">
						<button id="buyin" class="buyer" formaction="car.form">加入购物车</button>
					</div>	
					</form>			
				</div>
				
			</div>
		
<!-- 歌单区 -->	
			<div class="songarea">		
				<div class="songlist" id="songlist">
					<!-- normal -->
					<div class="songnormal" id="songnormal">
						<div class="songlistbox">
							<div class="songlists">
								<!--<ul class="songlistheader">
									<li class="songbar"><a id="a_wish" href="wish.do?album=${infor.albumid}">收藏</a></li>
									<li class="songbar">歌曲</li>
									<li class="songbar" id="time">时长</li>
								</ul>
								
								
								--><table id="songlisttable">
								<tr id="tr_bar">
								<td>
									
									<div class="song_infors">
									<a id="a_wish" style="cursor:pointer" class="${infor.albumid}">
									${wisher}
									</a>
									</div>
									<div class="song_infors" >歌曲 </div>
									<!--  <div class="song_infors" id="timeinfors">时长</div>-->
								</td>
								</tr>
								<c:forEach var="songs" items="${songs}">
									<%!
									int i=1;
									%>
									<tr class="songlisttr">
										<td class="songlisttd">
											<div class="song_infors"><span><%=i%>.</span></div>
											<div class="song_infors" id="songsinglename"><span>${songs.songname}</span></div>
											<!-- <div class="song_infors" id="timeinfor"><span>03:22</span></div> -->
											<%
											i ++;
											 %>
										</td>
									</tr>
									</c:forEach>
									<%
									i=1;
									 %>
									
								</table>
								
								
							</div>
						</div>
						<div class="songlyric">
							<div class="songinfo">
								<h4>专辑简介</h4>
							</div>
							<div class="lyric">
								<p id="intro_p" align="left" style="text-align:left;">${infor.intro}</p>
							</div>
						</div>
					</div>
					<!-- clear -->
					<div class="songclear" id="songclear">
						
					</div>
				</div>
			
				<div hidden class="songplayer" id="songplayer">
					<p>这是播放区</p>
				</div>	
			</div>
			
<!-- 评论区 -->
			<div class="shangpingpl">
				<h3 class="tit">
					商品评论（					
					<span id="comment_total_num_title">${commentnumber}</span>					
					 ）		
				</h3>
							

<!-- 评论分类 -->
				<div class="comment_body">
					<div class="comment_tabs">
						<ul class="plfl">
							<li id="li1" class="co_li">全部（${commentnumber}）</li>
							<li id="li2" class="co_li">好评（${goodnum}）</li>
							<li id="li3" class="co_li">中评（${midnum}）</li>
							<li id="li4" class="co_li">差评（${badnum}）</li>
							<li id="li5"></li>
						</ul>
										
						</div>
					</div>
			
<!-- 评论信息-->				
					<div id="lis" class="comment_list">
					
					<c:forEach var="cmts" items="${lis}">

						<div class="c1">
						<ul>
						<li id="a">${cmts.username}</li>
						<li id="b">&nbsp;&nbsp;${cmts.comment}</li>
						<li id="c">${cmts.ctime}</li>
						</ul>
						</div>							
					
					</c:forEach>					
					</div>
					
					<div id="good" class="comment_list">
					
					<c:forEach var="cmts" items="${good}">

						<div class="c1">
						<ul>
						<li id="a">${cmts.username}</li>
						<li id="b">&nbsp;&nbsp;${cmts.comment}</li>
						<li id="c">${cmts.ctime}</li>
						</ul>
						</div>		
					</c:forEach>
						
					</div>
					
					<div id="mid" class="comment_list">
					
					<c:forEach var="cmts" items="${mid}">

						<div class="c1">
						<ul>
						<li id="a">${cmts.username}</li>
						<li id="b">&nbsp;&nbsp;${cmts.comment}</li>
						<li id="c">${cmts.ctime}</li>
						</ul>
						</div>							
					
					</c:forEach>
						
					</div>
					
					<div id="bad" class="comment_list">
					
					<c:forEach var="cmts" items="${bad}">

						<div class="c1">
						<ul>
						<li id="a">${cmts.username}</li>
						<li id="b">&nbsp;&nbsp;${cmts.comment}</li>
						<li id="c">${cmts.ctime}</li>
						</ul>
						</div>							
					
					</c:forEach>						
					</div>					
				
</div>

<!-- 商品推荐 -->
			<div class="otheralbums">
				<div class="intal">
						<h3 class="otheralbumstital">
							此歌手的其他专辑
						</h3>
						
						<c:forEach var="other" items="${others}">
						<div class="test000">
							<ul class="test111">
								<li class="test222">
									<div>
										<div class="test999">
											<img id="image" src="${other.albumimage}"
											style="border-radius : 100%;">
										</div>
										<div class="test888">
										<h4 class="playlist__title" align="left">
											<span class="playlist__title_txt">
												<a id="a_othername" href="distinctitem.form?album=${other.albumid}">
													${other.albumname}</a> 
											</span>
										</h4>
										
										<p align="left" style="text-align:left;">
											&nbsp;&nbsp;&nbsp;&nbsp;
											${other.intro} </p>
										
										<div class="playlist__author" align="right" style="text-align:right;">
											发行时间：${other.publishtime}
										</div>
											
										</div>
									</div>
								</li>
							</ul>
						</div>
						</c:forEach>	
						</div>
			</div>

</div>


		<div id="returnTop">
			<img alt="up" src="images/iiup.png" width="20px" height="20px">
		</div>
	<%@include file="tail_black.jsp" %>
	</body>
</html>
