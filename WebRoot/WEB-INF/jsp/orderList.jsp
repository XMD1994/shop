<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0043)http://localhost:8080/mango/cart/list.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<title>订单页面</title>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/cart.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
	.back {
		display: inline-block;
	    padding: 5px 10px 6px;
	    color: #fff;
	    text-decoration: none;
	    -moz-border-radius: 6px;
	    -webkit-border-radius: 6px;
	    -moz-box-shadow: 0 1px 3px rgba(0,0,0,0.6);
	    -webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.6);
	    text-shadow: 0 -1px 1px rgba(0,0,0,0.25);
	    border-bottom: 1px solid rgba(0,0,0,0.25);
	    position: relative;
	    cursor: pointer;
	    float: right;
	    width: 55px;
	    height: 11px;
	    text-align: center;
	    line-height: 11px;
	    margin-top: 7px;
	}
</style>

</head>
<body>

<%@ include file="header.jsp" %>

<div class="container cart">

		<div class="span24">
		
			<div class="step step1">
				<ul>					
					<li  class="current">订单列表</li>
					
				</ul>
			</div>
	
		
				<table>
					<tbody>
					
					<s:iterator var="order" value="oList">
					<tr>
						<th colspan="5">
							订单号：<s:property value="#order.oid"/>  
							金额:<font color="red"> <s:property value="#order.total"/></font>
							状态：<s:if test="#order.state == 1">
									<a href="${pageContext.request.contextPath}/order_findByOid?oid=<s:property value="#order.oid"/>"><font color="red">付款</font></a>
								</s:if>
								  <s:elseif test="#order.state == 2">已付款</s:elseif>
								  <s:elseif test="#order.state == -2">货到付款</s:elseif>
								  <s:elseif test="#order.state == 3"><a href="${pageContext.request.contextPath}/order_updateState.action?oid=<s:property value="#order.oid"/>"><font color="blue">确认收货</font></a></s:elseif>
								  <s:elseif test="#order.state == 4">订单完成</s:elseif>
								  <s:if test="#order.state < 3">
								  	<span class="back" >
								  		<a href="${pageContext.request.contextPath}/order_delete.action?oid=<s:property value="#order.oid"/>">撤单</a>
								  	</span>
								  </s:if>
								  <s:elseif test="#order.state ==4">
								  	<span class="back" >
								  		<a href="${pageContext.request.contextPath}/order_delete.action?oid=<s:property value="#order.oid"/>">删除订单</a>
								  	</span>
								  </s:elseif>
						</th>
						
					</tr>
					<tr>
						<th>图片</th>
						<th>商品</th>
						<th>价格</th>
						<th>数量</th>
						<th>小计</th>
						
					</tr>
					<s:iterator var="orderItem" value="#order.orderItems">
						<tr>
							<td width="60">
								<img src="${pageContext.request.contextPath}/<s:property value="#orderItem.product.image"/>"/>
							</td>
							<td>
								<a target="_blank"><s:property value="#orderItem.product.pname"/></a>
							</td>
							<td>
								<s:property value="#orderItem.product.shop_price"/>
							</td>
							<td class="quantity" width="60">
								<s:property value="count"/>
							</td>
							<td width="140">
								<span class="subtotal">￥<s:property value="#orderItem.subtotal"/></span>
							</td>
							
						</tr>
						
						</s:iterator>
					</s:iterator>
				
				</tbody>
			</table>
				
			
		</div>
		
	</div>
<div class="container footer">
	<div class="span24">
		<div class="footerAd">
					<img src="image\footer.jpg" alt="我们的优势" title="我们的优势" height="52" width="950">
</div>
</div>
	<div class="span24">
		<ul class="bottomNav">
					<li>
						<a href="#">关于我们</a>
						|
					</li>
					<li>
						<a href="#">联系我们</a>
						|
					</li>
					<li>
						<a href="#">诚聘英才</a>
						|
					</li>
					<li>
						<a href="#">法律声明</a>
						|
					</li>
					<li>
						<a>友情链接</a>
						|
					</li>
					<li>
						<a target="_blank">支付方式</a>
						|
					</li>
					<li>
						<a target="_blank">配送方式</a>
						|
					</li>
					<li>
						<a >SHOP++官网</a>
						|
					</li>
					<li>
						<a>SHOP++论坛</a>
						
					</li>
		</ul>
	</div>
	<div class="span24">
		<div class="copyright">Copyright © 2005-2013 Mango商城 版权所有</div>
	</div>
</div>
</body>
</html>
