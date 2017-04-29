<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="${pageContext.request.contextPath}/css/Style1.css" rel="stylesheet" type="text/css" />
		<style type="text/css">
			a {
				text-decoration:none;
			}
		</style>
		<script language="javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
		<script type="text/javascript">
			function addProduct(){
				window.location.href = "${pageContext.request.contextPath}/product_addPage.action";
			}
		</script>
	</HEAD>
	<body>
		<br>
		<form id="Form1" name="Form1" action="${pageContext.request.contextPath}/user/list.jsp" method="post">
			<table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
				<TBODY>
					<tr>
						<td class="ta_01" align="center" bgColor="#afd1f3">
							<strong>用户 列 表</strong>
						</TD>
					</tr>
					<tr>
						<td class="ta_01" align="right">&nbsp;&nbsp;</td>
					</tr>
					<tr>
						<td class="ta_01" align="center" bgColor="#f5fafe">
							<table cellspacing="0" cellpadding="1" rules="all"
								bordercolor="gray" border="1" id="DataGrid1"
								style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
								<tr
									style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

									<td align="center" width="10%">
										序号
									</td>
									<td align="center" width="17%">
										用户名
									</td>
									<td align="center" width="17%">
										真实姓名
									</td>
									<td align="center" width="8%">
										性别
									</td>
									<td align="center" width="23%">
										电话
									</td>
									<td width="11%" align="center">
										状态
									</td>
									<td width="7%" align="center">
										操作
									</td>
									<td width="7%" align="center">
										删除
									</td>
								</tr>
									<s:iterator var="p" value="pageBean.list" status="status">
										<tr onmouseover="this.style.backgroundColor = 'white'"
											onmouseout="this.style.backgroundColor = '#F5FAFE';">
											<td hidden="hidden"><s:property value="#p.uid"/></td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="10%">
												<s:property value="#status.count"/>
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="17%">
												<s:property value="#p.username"/>
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="17%">
												<s:property value="#p.name"/>
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="8%">
												<s:property value="#p.sex"/>
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="23%">
												<s:property value="#p.phone"/>
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center">
												<s:if test="#p.state == 0">
													未激活
												</s:if>
												<s:else>
													已激活
												</s:else>
											</td>
											<td align="center" style="HEIGHT: 22px">
											
												<s:if test="#p.state == 0">
													<a href="${pageContext.request.contextPath}/user_accountActivation.action?uid=<s:property value="#p.uid"/>">
													激活
												</a>
												</s:if>
												<s:else>
													<span style="color:#999">已激活</span>
												</s:else>
												
											</td>
											
											<td align="center" style="HEIGHT: 22px">
												<a href="${pageContext.request.contextPath}/user_delete.action?uid=<s:property value="#p.uid"/>">
													<img src="${pageContext.request.contextPath}/images/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">
												</a>
											</td>
										</tr>
									</s:iterator>	
									<tr
									style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

									<td align="center" width="18%" colspan="8">
										第 <s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/>页
										<s:if test="pageBean.page != 1">
											<a href="${ pageContext.request.contextPath }/user_adminFindAll.action?page=1">首页</a> |
											<a href="${ pageContext.request.contextPath }/user_adminFindAll.action?page=<s:property value="pageBean.page-1"/>">上一页</a> |
										</s:if>
										<s:if test="pageBean.page != pageBean.totalPage">
											<a href="${ pageContext.request.contextPath }/user_adminFindAll.action?page=<s:property value="pageBean.page+1"/>">下一页</a> |
											<a href="${ pageContext.request.contextPath }/user_adminFindAll.action?page=<s:property value="pageBean.totalPage"/>">尾页</a>
										</s:if>
									</td>
									
								</tr>
							</table>
						</td>
					</tr>
				</TBODY>
			</table>
		</form>
	</body>
</HTML>

