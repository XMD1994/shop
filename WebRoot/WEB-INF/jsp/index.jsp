﻿<%@ page pageEncoding="UTF-8"  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>我的商城</title>
<link href="${pageContext.request.contextPath}/css/slider.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<%@ include file="header.jsp" %>
<div class="container index">
	<div class="span24">
		<div id="hotProduct" class="hotProduct clearfix">
			<div class="title">
				<strong>热门商品</strong>
			</div>
			<ul class="tab">
				<li class="current">
					<a href="./蔬菜分类.htm?tagIds=1" target="_blank"></a>
				</li>
				<li>
					<a  target="_blank"></a>
				</li>
				<li>
					<a target="_blank"></a>
				</li>
			</ul>
			<ul class="tabContent" style="display: block;">
				<s:iterator value="hotList">
					<li>
						<a target="_blank" href="${pageContext.request.contextPath}/product_findByPid.action?pid=<s:property value="pid"/>"><img src="${pageContext.request.contextPath}/<s:property value="image"/>" style="display: block;"></a>
					</li>
				</s:iterator>
			</ul>
		</div>
	</div>
	<div class="span24">
		<div id="newProduct" class="newProduct clearfix">
			<div class="title">
				<strong>最新商品</strong>
				<a  target="_blank"></a>
			</div>
			<ul class="tab">
				<li class="current">
					<a href="./蔬菜分类.htm?tagIds=2" target="_blank"></a>
				</li>
				<li>
					<a  target="_blank"></a>
				</li>
				<li>
					<a target="_blank"></a>
				</li>
			</ul>
			<ul class="tabContent" style="display: block;">
			 	<s:iterator value="newList">
					<li>
						<a  target="_blank" href="${pageContext.request.contextPath}/product_findByPid.action?pid=<s:property value="pid"/>" ><img src="${pageContext.request.contextPath}/<s:property value="image"/>" style="display: block;"></a>
					</li>
				</s:iterator>
			</ul>
		</div>
	</div>
	<div class="span24">
		<div class="friendLink">
			<dl>
				<dt>新手指南</dt>
				<dd><a  target="_blank">支付方式</a>|</dd>
				<dd><a  target="_blank">配送方式</a>|</dd>
				<dd><a  target="_blank">售后服务</a>|</dd>
				<dd><a  target="_blank">购物帮助</a>|</dd>
				<dd><a  target="_blank">会员卡</a>|</dd>
				<dd><a  target="_blank">礼品卡</a>|</dd>
				<dd><a target="_blank">银联卡</a>|</dd>
				<dd><a  target="_blank">亿家卡</a>|</dd>
				<dd class="more"><a >更多</a></dd>
			</dl>
		</div>
	</div>
</div>
<div class="container footer">
	<div class="span24">
		<div class="footerAd">
			<img src="${pageContext.request.contextPath}/image/footer.jpg"
			 width="950" height="52" alt="我们的优势" title="我们的优势">
		</div>	
	</div>
	<div class="span24">
		<ul class="bottomNav">
			<li><a>关于我们</a>|</li>
			<li><a>联系我们</a>|</li>
			<li><a>招贤纳士</a>|</li>
			<li><a>法律声明</a>|</li>
			<li><a>友情链接</a>|</li>
			<li><a target="_blank">支付方式</a>|</li>
			<li><a target="_blank">配送方式</a>|</li>
			<li><a>服务声明</a>|</li>
			<li><a>广告声明</a></li>
		</ul>
	</div>
	<div class="span24">
		<div class="copyright">Copyright © 2016-2017 Mango商城 版权所有</div>
	</div>
</div>
</body>
</html>