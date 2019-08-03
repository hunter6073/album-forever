<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <link rel="Shortcut Icon" href="images/ico128.png">
    <title>歌手详情</title>
    <link href="css/songlist.css" rel="stylesheet" type="text/css">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <div class="songarea">			
				<div class="songlist" id="songlist">
					<!-- normal -->
					<div class="songnormal" id="songnormal">
						<div class="songlistbox">
							<div class="songlists">
								<ul class="songlistheader">
									<li class="songbar"><a href="form.do?album="002">yi收藏</a></li>
									<li class="songbar">歌曲</li>
									<li class="songbar" id="time">时长</li>
								</ul>
								
								<table>
									<tr class="songlisttr">
										<td class="songlisttd">
											<div class="song_infors"><span>1.</span></div>
											<div class="song_infors" id="songsinglename"><span>Tell her</span></div>
											<div class="song_infors" id="timeinfor"><span>03:22</span></div>
										</td>
									</tr>
									<tr class="songlisttr">
										<td class="songlisttd">
											<div class="song_infors"><span>1.</span></div>
											<div class="song_infors" id="songsinglename"><span>Tell her</span></div>
											<div class="song_infors" id="timeinfor"><span>03:22</span></div>
										</td>
									</tr>
								</table>
								</div>
						</div>
						<div class="songlyric">
							<div class="songinfo">
								<p>这是简单信息</p>
							</div>
							<div class="lyric">
								<p>这是歌词</p>
							</div>
						</div>
					</div>
					<!-- clear -->
					<div class="songclear" id="songclear">
						
					</div>
				</div>
			
				<div class="songplayer" id="songplayer">
					<p>这是播放区</p>
				</div>	
			</div>
			
  </body>
</html>
