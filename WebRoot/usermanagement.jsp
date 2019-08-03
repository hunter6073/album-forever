<%@ page language="java" import="java.util.*,java.text.SimpleDateFormat;" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>工作人员管理</title>
    <link rel="stylesheet" type="text/css" href="css/user.css" />
<link rel="Shortcut Icon" href="images/ico128.png">
  </head>
  
  <body>
   <div class="main">
   <div class="searchholder">  
   <form action="userinfosearch.form" method="post">                <!-- 搜索框及按钮 -->
    <input type="text" placeholder="请输入您想查找的用户名" style="width:450px;height:40px; color:black;float:left;border:solid 3px RGB(168, 191, 212);" name="value"/>
    <input type="submit" style="width:60px;height:40px;border:solid 3px RGB(168, 191, 212);float:left;background-color:RGB(168, 191, 212);color:white;font-size:12px;" value="搜索"/>
   </form>           
    </div>
    
   <div class="secondary">       <!-- 用户信息表格 -->
   <h2 class="album_info_tag" style="color:#11C2EE;">用户信息</h2>
   <table cellspacing="0" border="0" >
   <tr align="left" >
   <th style="padding-left:3%;">用户邮箱</th>  <th>用户名</th> <th>姓名</th><th>常用电话</th>  <th>常用地址</th> <th>最近登录时间</th> <th>最近登录IP</th> 
   </tr>
   
    <c:forEach var="users" items="${userlist}" varStatus="status">  
   
   <c:choose>  
   <c:when test="${status.index%2==0}">
   <tr align="left" class="blue">    
   </c:when>  
     
   <c:otherwise> 
    <tr align="left">    
   </c:otherwise>  
</c:choose>  
  <td>${users.usermail}</td>   <td style="width:8%;">${users.username}</td>   <td style="width:6%;">${users.name}</td>  
    <td style="width:12%;">${users.recentphone}</td>   <td>${users.recentaddress}</td>     <td>${users.formatedtime}</td>  
   
     
     
      <td>${users.lastloginip}</td>
   </tr>
   </c:forEach>
   <tr>
   
   
   
   
   </table>

   </div>

   </div>
  </body>
</html>
