<%@ page language="java" contentType="text/html;charset=utf-8" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <base href="<%=basePath%>">
    <link rel="Shortcut Icon" href="images/ico128.png">
    <title>喋喋不朽</title>
    <link rel="Shortcut Icon" href="images/ico128.png">
    
    <link rel="stylesheet" type="text/css" href="css/cart.css">
    <script src="javascript/jquery-3.2.1.min.js"></script> 
    <script type="text/javascript" src="javascript/Ajax.js"></script>
    <script src="javascript/jquery.validate-1.13.1.js"></script> 
    
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="碟碟不朽商城">

  </head>
  
  <body>
   <!-- 网页头部DIV -->
	  		<%@include file="new_head.jsp" %>

  	<div id="body">
  	
	  <!-- 中部内容容器DIV -->
	  <div id="content">
	  	<!-- 容器头部DIV -->
	  	<div id="content_head">
	  	</div>
	  	
	  	<!-- 容器中部内容容器DIV -->
	  	<div id="content_body">
	  		<!-- 当前位置信息条 -->
	  		<div id="content_body_location" style="text-align:left;">
	  			您的位置：
	  			<a href="ddbx.form">首页</a>
	  			<span>> 购物车</span>
	  		</div>
	  		<!-- 购物车内容 -->
	  		<div id="content_body_content">
	  			<div id="loading">
	  				<c:choose>
	  					<c:when test="${ empty cart}">
	  						<div class="loadingContent1">
	  						<p>您的购物车还是空的！</p>
	  					</div>
	  					</c:when>
	  					<c:otherwise>
	  						<div class="loadingContent2">
	  							<table id="cartTable">
	  								<thead>
	  									<tr>
	  										<th class="td1"><label><input class="check-all check" type="checkbox"/>	全选</label></th>
	  										<th class="td2"><label>商品信息</label></th>
	  										<th class="td3"><label>单价</label></th>
	  										<th class="td4"><label>数量</label></th>
	  										<th class="td5"><label>金额</label></th>
	  										<th class="td6"><label>操作</label></th>
	  									</tr>
	  								</thead>
	  								<tbody>
	  									<c:forEach var="cartItem" items="${cart}">
	  										<tr bgcolor="#fafcfd">
	  											<td class="td1"><input class="check-one check" type="checkbox" /></td>
		  										<td class="td2">
		  											<a href="distinctitem.form?album=${cartItem.albumid}">
			  											<div class="image">
			  												<img src="${cartItem.albumimage }"/>
			  											</div>
			  											<div id="goodName">${cartItem.albumname }</div>
		  											</a>

		  										</td>
		  										<td class="td3">${cartItem.price }</td>
		  										<td class="td4">
		  											<input class="numberMinus" type="button" value="-"/>  
	                   								<input class="numberInput" type="text" value="${cartItem.number }" 
	                   										onkeyup="this.value=this.value.replace(/\D|^0/g,'');if(this.value == '')this.value=1;"/>  
	                    							<input class="numberPlus" type="button" value="+"/>
	                    						</td>
		  										<td class="td5"><span id="subTotal"></span><br></td>
		  										<td class="td6">
		  											<input type="hidden" value="${cartItem.albumid }"/>
		  											<input type="hidden" value="${cartItem.username }"/>
		  											<a href="javascript:void(0);" onclick="deleteAlbum($(this))">删除</a>
		  										</td>
	  										</tr>
	  									</c:forEach>
	  								</tbody>
	  							</table>
	  							<div id="totalContent">
	  								<span id="totalSpan">已选商品<label id="numberOfGoods">0</label>件，合计<label id="total">0.00</label></span>
	  								<input id="deal" type="button" onclick="getPay()" value="结算" style="margin-left:30px;"/>
	  							</div>
	  						</div>
	  					</c:otherwise>
	  				</c:choose>
	  			</div>
	  		</div>
	  	</div>
  	</div>
  	</div>
  	<!-- 网页尾部 -->
  	<div id="footer">
	  		<%@include file="tail_white.jsp" %>
	</div>
    
  </body>
  <script type="text/javascript">
  	//选择框监听事件
   $("#cartTable").find(":checkbox").click(function() {  
  		//点击了全选
        if ($(this).hasClass("check-all")) {  
            var checked = $(this).prop("checked");  
            $("#cartTable").find(".check-one").prop("checked", checked);  
        }  
        //当全都选中时将全选勾选上
        var items = $("#cartTable").find("tr:gt(0)");  
        $("#cartTable").find(".check-all").prop("checked", items.find(":checkbox:checked").length == items.length);
        getTotal();
    });  
    //初始化金额
    $(document).ready(function() { 
	   getSubTotal();
	   getTotal();
	});
	//加数量按钮点击事件
	$("#cartTable").find(":input").click(function(){
		if($(this).hasClass("numberMinus")){
			var value = $(this).parent().find("input:eq(1)").val();
			if(value>1){
				value--;
				modifyNumber($(this),value);
			}
		}else if($(this).hasClass("numberPlus")){
			var value = $(this).parent().find("input:eq(1)").val();
			value++;
			modifyNumber($(this),value);
		}
	});
	$("#cartTable").find(":input").change(function(){
		if($(this).hasClass("numberInput")){
			modifyNumber($(this),$(this).val());
		}
	});

	//计算每行金额
	function getSubTotal(){
		//遍历talbe中的每一行
		 $("#cartTable tr").each(function() { 
	    	var unitPrice = 0;
	    	var number = 0;
	    	//定位到某一行的第三列（单价）
			$(this).find("td:eq(2)").each(function() { 
				unitPrice = parseFloat($(this).text());
			})
			//定位到某一行的第四列（数量）
			$(this).find("td:eq(3)").each(function() { 
				number = parseInt($(this).find("input:eq(1)").val());
			})
			//定位到某一行的第五列（金额小计）
			$(this).find("td:eq(4)").each(function() { 
				$(this).find("span").text((unitPrice*number));
			})
		});
	}
	//计算总金额
	function getTotal(){
		var subTotal = 0;
	    var total = 0.00;
	    var numberOfGoods = 0;
	    //跳过table中第一行开始遍历
		$("#cartTable").find("tr:gt(0)").each(function() { 
			if($(this).find(":checkbox").prop("checked")){
				$(this).find("td:eq(4)").each(function() { 
					subTotal = $(this).find("span").text();
				});
				total = total + parseFloat(subTotal);
				numberOfGoods++;
			}
		});
		$("#numberOfGoods").text(numberOfGoods);
		$("#total").text(total.toFixed(2));
	}
	//ajax修改商品的数量
	function modifyNumber(obj,value){
		var number = value;
		var albumid = obj.parent().parent().find("td:eq(5)").find("input:eq(0)").val();
		var username = obj.parent().parent().find("td:eq(5)").find("input:eq(1)").val();
		 $.ajax({
             type: "post",
             url: "modifyNumber.form",
             data: {username:username, albumid:albumid, number:number},
             async : true,
             dateType:'json',
             success: function(data){
             	obj.parent().parent().find("td:eq(3)").find("input:eq(1)").val(data);
             	getSubTotal();
				getTotal();
             },
             error : function(XMLHttpRequest, textStatus, errorThrown) { //请求失败时执行该函数
						alert("失败：status:" + XMLHttpRequest.status
								+ " readyState:" + XMLHttpRequest.readyState);
					}
         });
	}
	//ajax删除一条商品
	function deleteAlbum(obj){
		var albumid = obj.parent().find("input:eq(0)").val();
		var username = obj.parent().find("input:eq(1)").val()
		$.ajax({
			type:"post",
			url:"deleteCartItem.form",
			data:{username:username, albumid:albumid},
			dateType:'json',
			success:function(data){
				obj.parent().parent().remove();
			}
		});
	}
	//提交商品并调到订单页面
	function getPay(){
		var album = new Array();
		var number = new Array();
		var subtotal = new Array();
		var username;
		var total = $("#total").text();
		//var albumInfo = "[";
		$("#cartTable").find("tr:gt(0)").each(function() {   
	        if($(this).find(":checkbox").prop("checked")){
	        	album.push($(this).find("td:eq(5)").find("input:eq(0)").val());
	        	number.push($(this).find("td:eq(3)").find("input:eq(1)").val());
	        	subtotal.push($(this).find("td:eq(4)").text());
	        	username=$(this).find("td:eq(5)").find("input:eq(1)").val();
	        }
    	});  
    	$.ajax({
			type:"post",
			url:"insertOrder.form",
			data:{"album":album,"number":number,"username":username,"subtotal":subtotal,"total":total},
			dateType:'json',
			success:function(url){
				window.location.href=url;
			}
		});
	}
  </script>
  
</html>
