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

</head>
<body>

<%@ include file="header.jsp" %>

<div class="container cart">

		<div class="span24">
		
			<div class="step step1">
				<ul>					
					<li  class="current">生成订单成功:</li>
					<li>订单号:<s:property value="order.oid"/></li>
				</ul>
			</div>
	
		
				<table>
					<tbody>
					<tr>
						<th>图片</th>
						<th>商品</th>
						<th>价格</th>
						<th>数量</th>
						<th>小计</th>
						<th>操作</th>
					</tr>
					<s:iterator var="orderItem" value="order.orderItems">
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
							<td>
								<a href="./cart_removeCart.action?pid=1" class="delete">删除</a>
							</td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
				<dl id="giftItems" class="hidden" style="display: none;">
				</dl>
				<div class="total">
					<em id="promotion"></em>
					商品金额: <strong id="effectivePrice">￥<s:property value="order.total"/>元</strong>
				</div>
			<form id="orderForm" action="${pageContext.request.contextPath}/order_payOrder.action" method="post">
				<input type="hidden" name="order.oid" value="<s:property value="order.oid"/>"/>
				<div class="span24">
					<p>
							收货地址：<input name="order.addr" type="text" value="<s:property value="order.user.addr"/>" style="width:350px" />
								<br />
							收货人&nbsp;&nbsp;&nbsp;：<input name="order.name" type="text" value="<s:property value="order.user.name"/>" style="width:150px" />
								<br /> 
							联系方式：<input name="order.phone" type="text"value="<s:property value="order.user.phone"/>" style="width:150px" />

						</p>
						<hr />
						<div>
							<input name="paytype" checked="checked" type="radio"  onclick="show('bank')" value="1"/>货到付款
							<input name="paytype" type="radio" onclick="show('bank')" value="2"/>在线支付
						</div>
						<div id="bank" style="display: none;">
							<p>
								选择银行：<br/>
								<input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked"/>工商银行
								<img src="${pageContext.request.contextPath}/bank_img/icbc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="pd_FrpId" value="BOC-NET-B2C"/>中国银行
								<img src="${pageContext.request.contextPath}/bank_img/bc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="pd_FrpId" value="ABC-NET-B2C"/>农业银行
								<img src="${pageContext.request.contextPath}/bank_img/abc.bmp" align="middle"/>
								<br/>
								<input type="radio" name="pd_FrpId" value="BOCO-NET-B2C"/>交通银行
								<img src="${pageContext.request.contextPath}/bank_img/bcc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="pd_FrpId" value="PINGANBANK-NET"/>平安银行
								<img src="${pageContext.request.contextPath}/bank_img/pingan.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="pd_FrpId" value="CCB-NET-B2C"/>建设银行
								<img src="${pageContext.request.contextPath}/bank_img/ccb.bmp" align="middle"/>
								<br/>
								<input type="radio" name="pd_FrpId" value="CEB-NET-B2C"/>光大银行
								<img src="${pageContext.request.contextPath}/bank_img/guangda.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C"/>招商银行
								<img src="${pageContext.request.contextPath}/bank_img/cmb.bmp" align="middle"/>
							</p>
						</div>
						<hr />
						<p style="text-align:right">
							<a href="javascript:document.getElementById('orderForm').submit();">
								<img src="${pageContext.request.contextPath}/images/finalbutton.gif" width="204" height="51" border="0" />
							</a>
						</p>
				</div>
			</form>
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
<script type="text/javascript">
	function show(objID){
        var divID = document.getElementById(objID);
                 //判断DIV显示状态 要是显示的就隐藏，隐藏的就显示
        if(divID.style.display=="block"){
              divID.style.display="none"
                }else{
              divID.style.display="block"   
        }
    }
</script>
</body>
</html>
