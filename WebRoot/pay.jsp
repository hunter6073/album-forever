<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>购物车</title>
    <link rel="Shortcut Icon" href="images/ico128.png">
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    
    <script src="javascript/jquery-3.2.1.min.js"></script> 
    <script type="text/javascript" src="javascript/Ajax.js"></script>
    <link rel="stylesheet" type="text/css" href="css/pay.css">
    
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
  <div id="head">
    	<%@include file="new_head.jsp"%>
    </div>
    <div id="body">
    	<div id="content">
    		<div id="address">
    			<strong>收货地址</strong>
    			<!-- 遮罩层 -->
    			<div id="mask" class="mask">
    				<div id="editAddress">
    					<div id="closeDiv" onclick="hideMask()"></div>
	    				<div id="editDiv" >
		    				<input id="username" name="username" type="hidden" value="${address.username }"/>
		    				<label id="addressLabel">收货地址：</label>&nbsp;<textArea id="addressInput" name="address"/>${address.address }</textArea>
		    				<br/><br/>
		    				<label>邮政编码：</label>&nbsp;<input id="postalcodeInput" name="postalcode" class="{required:true}" type="text" value="${address.postalcode }"/>
		    				<br/><br/>
		    				<label>收货人姓名：</label>&nbsp;<input id="receiverInput" name="receivename" type="text" value="${address.receivename }"/>
		    				<br/><br/>
		    				<label>手机号码：</label>&nbsp;<input id="phoneInput" name="phone" type="text" value="${address.phone }"/>
		    				<br/><br/>
		    				<input id="save" type="submit" onclick="updateAddress()" value="保存"/>
	    				</div>
    				</div>
    			</div>
    			<div id="letter"  onclick="showMask()">
    				<div id="addressContent">
	    				<table>
	    					<tr><td>${address.receivename }&nbsp;<label>收</label></td></tr>
	    					<tr><td>${address.address } </td></tr>
	    					<tr><td>${address.postalcode }</td></tr>
	    					<tr><td>${address.phone }</td></tr>
	    				</table>
	    			</div>		
	    		</div>
    		</div>
    		<div id="orderTitle"><strong>确认订单信息</strong></div>
    		<div id="order">
    			<table id="payTable">
	  				<thead>
	  					<tr>
	  						<th class="td2"><label>商品信息</label></th>
	  						<th class="td3"><label>单价</label></th>
	  						<th class="td4"><label>数量</label></th>
	  						<th class="td5"><label>小计</label></th>
	  					</tr>
	  				</thead>
	  				<tbody>
	  					<c:forEach var="orderItem" items="${order}">
	  						<tr bgcolor="#f2f7ff" class="tr">
		  						<td class="td1">
		  							<div class="image">
		  								<img src="${orderItem.albumimage }"/>
		  							</div>
		  							<div id="goodName">${orderItem.albumname }</div>
		  						</td>
		  						<td class="td2">${orderItem.price }</td>
		  						<td class="td3">${orderItem.number}</td>
		  						<td class="td4">
		  							${orderItem.subTotal }
		  							<input type="hidden" id="goodId"/>
		  						</td>
	  						</tr>
	  					</c:forEach>
	  					<tr bgcolor="#f2f7ff" class="totalTr">
	  						<td colspan="4"><span>合计：<label>${total}</label></span></td>
	  					</tr>
	  				</tbody>
	  			</table>		
    		</div>
    		
	    	<div id="deal" style="float:none;position:relative; margin-left:335px;">
	    		<div id="orderInfo">
	    			<span id="total">实付款：<label id="symbol">¥&nbsp;</label><label id="totalLabel">${total}</label></span><br/>
	    			<span id="send">寄送至：<label class="label" id="addrLabel">${address.address}</label></span><br/>
	    			<span id="receiver">收货人：<label class="label" id="receiverLabel">${address.receivename}&nbsp;${address.phone}</label></span>
	    		</div>
    			<div id="pay" style="float:none;position:relative;margin-left:227px;">
	    			<span id="post"> 
	    				<form action="toPay.form" method="post">
	    					<a href="getCart.form?username=${username}" style="position:relative;top:12px;">返回购物车</a>
	    					<input name="receiptid_toPay" type="hidden" value="${receiptid}"/>
	    					<input id="receiver_toPay" name="receiver_toPay" type="hidden" value="${address.receivename}"/>
	    					<input name="total_toPay" type="hidden" value="${total}"/>
	    					<input type="submit" style="position:relative;top:-14px;left:65px;"value="提交订单"/>
	    				</form>
	    			</span>
    			
    		</div>
    		</div>
    	</div>
    </div>
    <div id="footer">
    	<%@include file="tail_white.jsp" %>
    </div>
  </body>
  <script type="text/javascript">
  //显示遮罩层
  function showMask(){     

        $("#mask").css("height",$(window).height());     
        $("#mask").css("width",$(document).width());   
        $("#mask").show();     
    }  
    //隐藏遮罩层  
    function hideMask(){     
          
        $("#mask").hide();     
    }
    $(window).on('resize', function() {
        $("#mask").css("height",$(window).height());     
        $("#mask").css("width",$(document).width());  
    });
    //更新地址
    function updateAddress(){
    	var RegExp = /(^\s*)|(\s*$)/g;
    	var address = $("#addressInput").val();
		var receiver = $("#receiverInput").val();
		var phone = $("#phoneInput").val();
		var postalcode = $("#postalcodeInput").val();
		if (address.replace(RegExp, "")=="") {
			alert("地址禁止为空！");
		} else if(postalcode.replace(RegExp, "")==""){
			alert("邮政编码禁止为空！");
		} else if(receiver.replace(RegExp, "")==""){
			alert("收货人姓名禁止为空！");
		} else if(phone.replace(RegExp, "")==""){
			alert("电话禁止为空！");
		} else{
			hideMask();
			$.ajax({
				type:"post",
				url:"updateAddress.form",
				data:{"username":$("#username").val(),"address":address,"phone":phone,"receivename":receiver,"postalcode":postalcode},
				dateType:'json',
				success:function(data){
					reloadAddress();
				}
			});
		}
    }
    //重新加载地址
    function reloadAddress(){
    	$.ajax({
			type:"post",
			url:"getAddress.form",
			data:{"username":$("#username").val()},
			dateType:'json',
			success:function(data){
				$("#addressContent").find("tr:eq(0)").find("td:eq(0)").html(data.receivename+"&nbsp;<label>收</label>");
				$("#addressContent").find("tr:eq(1)").find("td:eq(0)").html(data.address);
				$("#addressContent").find("tr:eq(2)").find("td:eq(0)").html(data.postalcode);
				$("#addressContent").find("tr:eq(3)").find("td:eq(0)").html(data.phone);
				$("#addrLabel").html(data.address);
				$("#receiverLabel").html(data.receivename+"&nbsp;"+data.phone);
				$("#receiver_toPay").val(data.receivename);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) { //请求失败时执行该函数
						alert("失败：status:" + XMLHttpRequest.status
								+ " readyState:" + XMLHttpRequest.readyState);
					}
			
		});
    }
  </script>
</html>
