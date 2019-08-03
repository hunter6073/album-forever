<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!--订单详情界面 -->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>用户管理界面</title>
<link rel="Shortcut Icon" href="images/ico128.png">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<link rel="stylesheet" type="text/css" href="css/ordermanager.css">
		<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
        <script src="javascript/workers.js" type="text/javascript"></script>
	</head>

	<body>
	<hidden id="rol" value="${employee.role}"></hidden>
	<hidden id="error" value=""></hidden>
<!-- 搜索框 -->
		<div class="searche">
			<div
				style="width: 510px; height: 25px; margin: 0 auto; padding-top: 20px;">
				<form action="receiptsearch.form" method="post">
				<input type="text" placeholder="请输入您想查找的订单号"
					style="width: 450px; height: 40px; color: black; float: left; border: solid 3px RGB(168, 191, 212);font-size:16px;" name="value"/>
				<input type="submit"
					style="width: 60px; height: 40px; border: solid 3px RGB(168, 191, 212); background-color: RGB(168, 191, 212); color: white; font-size: 12px;"
					value="搜索" />
					</form>
			</div>
		</div>

<!-- 订单详情 -->

		<div class="detail">
             <h2 class="album_info_tag">订单信息</h2>
			<div class="d_lr">
			<div class="d_l">
				<table >
				<tr align="left"><th>订单编号:</th><td>${receipt1.r_id}</td></tr>
				<tr align="left"><th>用户名:</th><td>${receipt1.username}</td></tr>
				<tr align="left"><th>地址:</th><td>${receipt1.address}</td></tr>
				<tr align="left"><th>收件人:</th><td>${receipt1.receivename}</td></tr>
				<tr align="left"><th>电话:</th><td>${receipt1.phone}</td></tr>
				<tr align="left"><th>订单状态:</th><td>${receipt1.status}</td></tr>
				<tr align="left"><th>完成时间:</th><td>${receipt1.time}</td></tr>
				<tr align="left"><th>邮编:</th><td>${receipt1.postalcode}</td></tr>
				
				</table>
			</div>
			<div class="d_r">
			<table>
			<tr><th>专辑编号</th><th>专辑名</th><th>购买数量</th><th>单价</th><th>总价</th></tr>
			<c:forEach var="tradeitem" items="${receipt1.albumtrade}">
			<tr>
			<td>${tradeitem.albumid}</td>
			<td>${tradeitem.albumname}</td>
			<td>${tradeitem.val}</td>
			<td><fmt:formatNumber type="number"  maxFractionDigits="2">${tradeitem.price/tradeitem.val}</fmt:formatNumber></td>
			<td><fmt:formatNumber type="number"  maxFractionDigits="2">${tradeitem.price}</fmt:formatNumber></td>
			
			</tr>
			</c:forEach>
			</table>


			</div>
			</div>
			
			
			
		</div>

<!-- 订单链表 -->
		<div class="allorder">
             <h2 class="album_info_tag" style="padding-bottom:20px;">订单列表</h2>
             <div class="box">
			<table cellspacing="0" border="0" align="center" width="80%">
			<tr align="left">		
			<th>订单编号	</th>
		    <th>用户名</th>					
			<th>订单状态	</th>
			<th>完成时间	</th>
			<th align="center">操作	</th>
			<th align="center">详情</th>
			</tr>
	<c:forEach var="ritem" items="${receiptlist}">   
			
			
					<tr align="left" class="blue">
						<td class="first">
							<input type="text" value="${ritem.r_id}" disabled="disabled" class="id">
						</td>
						
						<td>
							<input type="text" value="${ritem.username}" disabled="disabled">
						</td>
						
						<td>
							<input type="text" value="${ritem.status}" disabled="disabled">
						</td>
						
						<td>
							<input type="text" value="${ritem.time}" disabled="disabled">
						</td>
						
						
						
						<td align="center">
							<button style="width: 50px; height: 20px; font-size: 10px;" class="del" type="button">
								删除
							</button>
						</td>
						
						<td align="center">
							<button style="width: 50px; height: 20px; font-size: 10px;" class="search1" type="button">
								查看
							</button>
						</td>
					</tr>
           </c:forEach>
              
				</table>
</div>

		</div>



	</body>
</html>
