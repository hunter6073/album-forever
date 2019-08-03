<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<meta http-equiv="X-UA-Compatible" content="IE=10"/>
  	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7" />
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
  	<link rel="Shortcut Icon" href="images/ico128.png">
   	<link rel="stylesheet" type="text/css" href="css/payWay.css">
   
    <base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page"> 
  </head>
  <body>
  <%@include file="new_head.jsp"%>
  	<div id="body">
	    <form action="toSure.form" method="post">
	
			<div id="receiptInfo">
				<!-- 订单号：<INPUT TYPE="text" NAME="ordernum" value="201608080000002"> 
				支付金额：<INPUT TYPE="text" NAME="money" size="6" value="0.01">元 -->
						
						
				订单编号 : ${receiptid}       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
				支付金额 : ${total}元       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				收货人 : ${receiver}       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							   <br/><br/>
						
				<input type="hidden" name="receiptid" value="${receiptid}"/>
				<input type="hidden" name="total" value="${total}"/>
			</div>
			<span id="bankTitle">支付方式：</span>
			<div id="bankDiv">
				<table>
					<tr>
						<td><INPUT TYPE="radio" NAME="pd_FrpId" value="CMBCHINA-NET">招商银行
						</td>
						<td><INPUT TYPE="radio" NAME="pd_FrpId" value="ICBC-NET">工商银行</td>
						<td><INPUT TYPE="radio" NAME="pd_FrpId" value="ABC-NET">农业银行</td>
						<td><INPUT TYPE="radio" NAME="pd_FrpId" value="CCB-NET">建设银行
						</td>
					</tr>
					<tr>
						<td><INPUT TYPE="radio" NAME="pd_FrpId" value="BOC-NET">中国银行</td>
						<td><INPUT TYPE="radio" NAME="pd_FrpId" value="CEB-NET">光大银行
						</td>
						<td><INPUT TYPE="radio" NAME="pd_FrpId" value="BOCO-NET">交通银行</td>
						<td><INPUT TYPE="radio" NAME="pd_FrpId" value="SDB-NET">深圳发展银行</td>
					</tr>
					<tr>
						<td><INPUT TYPE="radio" NAME="pd_FrpId" value="BCCB-NET">北京银行</td>
						<td><INPUT TYPE="radio" NAME="pd_FrpId" value="CIB-NET">兴业银行
						</td>
						<td><INPUT TYPE="radio" NAME="pd_FrpId" value="SPDB-NET">浦发银行
						</td>
						<td><INPUT TYPE="radio" NAME="pd_FrpId" value="ECITIC-NET">中信银行</td>
					</tr>
				</table>
				<input id="button" TYPE="submit" value="确定支付"><br/>
				
				
			</div>
		</form>
    <a href="toFinished.form?total=${total}&receiptid=${receiptid}&payResult=true">支付完成测试链接</a>
    </div>
    <%@include file="tail_white.jsp" %>
    
  </body>
</html>
