<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    <title>工作人员管理</title>
    <link rel="stylesheet" type="text/css" href="css/worker.css" />
    <script src="javascript/jquery-3.2.1.min.js"></script>
	<script src="javascript/workers.js" type="text/javascript"></script>
<link rel="Shortcut Icon" href="images/ico128.png">
  </head>
  
  <body>
  <hidden id="rol" value="${employee.role}"></hidden>
   <div class="main">
   
   <div class="searchholder">
    <form action="workerinfosearch.form" method="post">
    <input type="text" placeholder="请输入您想查找的工号" style="width:450px;height:40px; color:black;float:left;border:solid 3px RGB(168, 191, 212);" name="value"/>
    <input type="submit" style="width:60px;height:40px;border:solid 3px RGB(168, 191, 212);float:left;background-color:RGB(168, 191, 212);color:white;font-size:12px;" value="搜索"/>
    </form>
    	</div>
    
   <div class="secondary">
 <h2 class="album_info_tag" style="color:#11C2EE;">HR管理</h2>
<form action="workerupdate.form" method="post">
   <table cellspacing="0" border="0">
   
   <tr align="left">
   <th class="first">工号</th>  <th>姓名</th> <th>性别</th> <th>年龄</th>  <th>用户名</th>  <th>密码</th>  <th>管理权限</th>  <th align="center">操作</th>
   </tr>
   <tr align="left">    
   <td class="first"><input class="work" type="text" name="workerid" disabled="disabled"></td>  
   <td><input type="text"  class="work" name="name" disabled="disabled"></td> 
   <td><input type="text"  class="work" name="sex" disabled="disabled"></td> 
   <td><input type="text"  class="work" name="age" disabled="disabled"></td>  
   <td><input type="text"  class="work" name="username" disabled="disabled"></td> 
    <td><input type="text" class="work" name="password" disabled="disabled"></td>  
    <td><input type="text" class="work" name="role" disabled="disabled"></td>  
    <td align="center">
    <button style="width:50px;height:20px; font-size:10px;" id="insert" type="button">添加</button></td>
   </tr>
   
   
   <c:forEach var="workers" items="${workerlist}" varStatus="status">  
   
   <c:choose>  
   <c:when test="${status.index%2==0}">
   <tr align="left" class="blue">    
   </c:when>  
   <c:otherwise> 
    <tr align="left">    
   </c:otherwise>  
</c:choose>  
   <td class="first"><input type="text" value="${workers.workerid}" disabled="disabled" name="workerid"></td>  
   <td><input type="text" value="${workers.name}" disabled="disabled" class="work" name="name"></td> 
   <td><input type="text" value="${workers.sex}" disabled="disabled" class="work" name="sex"></td> 
   <td><input type="text" value="${workers.age}" disabled="disabled" class="work" name="age"></td>  
   <td><input type="text" value="${workers.username}" disabled="disabled" class="work" name="username"></td> 
    <td><input type="text" value="${workers.password}" disabled="disabled" class="work" name="password"></td>  
    <td><input type="text" value="${workers.role}" disabled="disabled" class="work" name="role"></td>  
    <td align="center" width="100px">
    <button style="width:50px;height:20px; font-size:10px; float:left;" class="bttn" type="button" >修改</button>
     <button style="width:50px;height:20px; font-size:10px; float:left;" class="bttn_delete">删除</button>
    </td>
    
   </tr>
   </c:forEach>
   

   </table>
</form>
   </div>

   </div>
   <hidden id="error" value="${error}"></hidden>
  </body>
</html>
