<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <link rel="Shortcut Icon" href="images/ico128.png">
    <base href="<%=basePath%>">
    
    <title>商品信息管理</title>
	
	<link rel="stylesheet" type="text/css" href="css/AlbumManagerCSS.css">	
         <script src="javascript/jquery-3.2.1.min.js"></script>
        <script src="javascript/workers.js" type="text/javascript"></script>
        <script type="text/javascript">
        
        $(document).ready(function(){
        var a = $("#styleh").attr("value");
        var b = $("#languageh").attr("value");
        var c = $("#regionh").attr("value");
         $("#style0").attr("value",a);
         $("#style0").text(a);
         $("#lan0").attr("value",b);
         $("#lan0").text(b);
           $("#region0").attr("value",c);
         $("#region0").text(c);
           if(a=="古典")
        {
         $("#style1").attr("value","民谣");
         $("#style1").text("民谣");
        }
        if(a=="原声")
        {
         $("#style2").attr("value","民谣");
         $("#style2").text("民谣");
        }
        if(a=="流行")
        {
         $("#style3").attr("value","民谣");
         $("#style3").text("民谣");
        }
        if(a=="摇滚")
        {
         $("#style4").attr("value","民谣");
         $("#style4").text("民谣");
        }
        if(b=="粤语")
        {
         $("#lan1").attr("value","国语");
         $("#lan1").text("国语");
        }
           if(b=="英语")
        {
        $("#lan2").attr("value","国语");
        $("#lan2").text("国语");
        }
           if(b=="韩语")
        {
         $("#lan3").attr("value","国语");
         $("#lan3").text("国语");
        }
           if(b=="日语")
        {
         $("#lan4").attr("value","国语");
         $("#lan4").text("国语");
        }
         if(c=="港台")
        {
         $("#region1").attr("value","大陆");
         $("#region1").text("大陆");
        }
         if(c=="韩国")
        {
         $("#region2").attr("value","大陆");
         $("#region2").text("大陆");
        }
         if(c=="欧美")
        {
         $("#region2").attr("value","大陆");
         $("#region2").text("大陆");
        }
         if(c=="日本")
        {
         $("#region2").attr("value","大陆");
         $("#region2").text("大陆");
        }
        
        $("#piclocation").blur(function(){
        $(".album_info_bgimg").attr("src",$(this).val());
        });
        
        $("#price").blur(function(){
        var price = $(this).val()
        var reg = /^[0-9]+.?[0-9]*$/;//用来验证数字，包括小数的正则
        if(!reg.test(price))
        {
        $(this).css("color","red");
        alert("请输入正确的数字格式！");
        $("#sub").attr("disabled","disabled");
        }
        else
        {
         $(this).css("color","blue");
        $("#sub").removeAttr("disabled");
        }
        });
        
         $("#discount").blur(function(){
         var num = $(this).val()
         var reg = /^[0-9]*$/;
        if(!reg.test(num)||num>10)
        {
        $(this).css("color","red");
        alert("请输入正确的数字格式！折扣最大为10");
        $("#sub").attr("disabled","disabled");
        }
        else
        {
         $(this).css("color","blue");
        $("#sub").removeAttr("disabled");
        }
        });
        
         $("#storage,#sold,#wished").blur(function(){
           var num = $(this).val()
         var reg = /^[0-9]*$/;
        if(!reg.test(num))
        {
        $(this).css("color","red");
        alert("请输入正确的数字格式！");
        $("#sub").attr("disabled","disabled");
        }
        else
        {
         $(this).css("color","blue");
        $("#sub").removeAttr("disabled");
        }
         
        });
      

        
        });
        
        </script>
  </head>
  
<body>
 <hidden id="rol" value="${employee.role}"></hidden>
<form action="itemsearch.form" id="search" method="post">
<div class="main">
<hidden id="error" value="${error}"></hidden>
    	<div class="search">
    		<div style="width:510px;height:40px;margin:0 auto;padding-bottom:5px; ">
    		
    	 <input type="text" name="value" placeholder="请输入您想查找的专辑名" style="width:450px;height:40px; color:black;float:left;border:solid 3px RGB(168, 191, 212); font-size:16px; margin-top:20px;" />
         <input type="submit" style="width:60px;height:40px;border:solid 3px RGB(168, 191, 212);float:left;background-color:RGB(168, 191, 212);color:white;font-size:12px;margin-top:20px;" value="搜索"/>
    		
    		</div>
    	</div>
    	<div class="album_info">
    		<h2 class="album_info_tag">商品详情</h2>
    		<div class="album_info_img">
				<img src="${album.picture}" class="album_info_bgimg" style="width:200px;height:200px;margin:20px 0 0 0px;float:left;" alt="库中无相应图片，请输入正确图片地址"/>
    		</div>   		
    		
    		<div class="album_info_content">

    			<table class="album_info_table">
    				<tr>
    					<td id ="album_info" >专辑编号：<input type="text" value="${album.albumid}" disabled="disabled" name="albumid"/></td>
    					<td id ="album_info" >价格：<input type="text" value="${album.price}" disabled="disabled" name="price" id="price"/></td>
    				</tr>
    				<tr>
    					<td id ="album_info" >专辑名：<input type="text" value="${album.albumname}" disabled="disabled" name="albumname"/></td>
    					<td id ="album_info" >库存：<input type="text" value="${album.storage}" disabled="disabled" name="storage" id="storage"/></td>
    				</tr>
    				<tr>
    					<td id ="album_info" >歌&nbsp;&nbsp;&nbsp;&nbsp;手：<input type="text" value="${album.singer}" disabled="disabled" name="singer"/></td>
    					<td id ="album_info" >销量：<input type="text" value="${album.sold}" disabled="disabled" name="sold" id="sold"/></td>
    				</tr>
    				<tr>
    					<td id ="album_info" >语&nbsp;&nbsp;&nbsp;&nbsp;种：	<input type="hidden" value="${album.language}" disabled="disabled" id="languageh"/>
    					<select name="language" disabled="disabled" id="language"> 
    					<option value="国语" id="lan0">国语</option> 
    					<option value="粤语" id="lan1">粤语</option> 
    					<option value="英语" id="lan2">英语</option> 
    					<option value="韩语" id="lan3">韩语</option>
    					 <option value="日语" id="lan">日语</option> 
    					 </select> 
    					
    					</td>
    					<td id ="album_info" >收藏：<input type="text" value="${album.wished}" disabled="disabled" name="wished" id="wished"/></td>
    				</tr>
    				<tr>
    					<td id ="album_info" >流&nbsp;&nbsp;&nbsp;&nbsp;派：<input type="hidden" value="${album.style}" disabled="disabled" id="styleh"/>
    					
    					<select name="style" disabled="disabled" id="style"> 
    					<option value="民谣" id="style0">民谣</option> 
    					<option value="古典" id="style1">古典</option> 
    					<option value="原声" id="style2">原声</option> 
    					<option value="流行" id="style3">流行</option>
    					 <option value="摇滚" id="style4">摇滚</option> 
    					 </select> 
    					</td>
    					
    					
    					
    					<td id ="album_info" >折扣：<input type="text" value="${album.discount}" disabled="disabled" name="discount" id="discount"/></td>
    				</tr>
    				<tr>
    					<td id ="album_info" >区域：<input type="hidden" value="${album.region}" disabled="disabled" id="regionh"/>
    					<select name="region" disabled="disabled" id="region"> 
    					<option value="大陆" id="region0">大陆</option> 
    					<option value="港台" id="region1">港台</option> 
    					<option value="韩国" id="region2">韩国</option> 
    					<option value="欧美" id="region3">欧美</option>
    					 <option value="日本" id="region4">日本</option> 
    					 </select> 

    					
    					</td>
    					<td id ="album_info" >图片地址：<input type="text" value="${album.picture}" disabled="disabled" name="picture" id="piclocation"/></td>
    				</tr>
    				<tr>
    					<td id ="album_info" >发行公司：<input type="text" value="${album.publishcompany}" disabled="disabled" name="publishcompany"/></td>
    					<td id ="album_info" class="ptime">发行时间：${album.time}</td>
    				</tr>
    			</table>
    			<textarea class="album_info_intro" disabled="disabled" name="intro" placeholder="简介：">${album.intro }</textarea>
    			<button class="album_info_insert" style="float:right;width:70px;height:30px;margin-right:40px;" type="button">新建信息</button>
    			<button class="album_info_edit" style="float:right;width:70px;height:30px;margin-right:40px;" type="button">编辑信息</button>
    		</div>
    	</div>
   
    	
    	
 <div class="album_list">
 <h2 class="album_info_tag">商品列表</h2>
    <div class="box" style="width:890px; margin:20px auto; float:left;">
    	
   		<div style="width:860px;margin:10px auto;">

   			<table cellspacing="0" border="0" >
   
   				<tr align="left">
   					<th class="first">专辑编号</th>  <th>专辑名</th> <th>库存</th>  <th>销量</th>		<th>收藏</th>	<th width="10%">折扣</th>	<th align="center" width="12%">操作</th>
   				</tr> 
  
   <c:forEach var="alb" items="${albums}" varStatus="status">  
   <c:choose>  
   <c:when test="${status.index%2==0}">
   <tr align="left" class="blue">    
   </c:when>  
     
   <c:otherwise> 
    <tr align="left">    
   </c:otherwise>  
</c:choose>  
  <td><input type="text" value="${alb.albumid}" disabled="disabled" class="id"></td>  
  					<td><input type="text" value="${alb.albumname}" disabled="disabled" style="width:150px;"></td> 
   					<td><input type="text" value="${alb.storage}" disabled="disabled" style="width:100px;"></td> 
   					<td><input type="text" value="${alb.sold}" disabled="disabled" style="width:100px;"></td>  
    				<td><input type="text" value="${alb.wished}" disabled="disabled" style="width:100px;"></td>  
    				<td><input type="text" value="${alb.discount}" disabled="disabled" style="width:100px;"></td>  
    				<td align="center">
    			<button style="width:50px;height:20px; font-size:9px; float:right;" type="button" class="delalbum">删除</button>
    				<button style="width:50px;height:20px; font-size:9px; float:right;" type="button" class="showalbuminfo">查看</button>
    				</td>
   				    
   				</tr>
   </c:forEach>
   				
   			</table>  
   			
   		</div>
   
   
   </div>
</div>





</div>
</form>
</body>
</html>
