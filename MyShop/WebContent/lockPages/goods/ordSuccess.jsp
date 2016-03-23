<%@page import="cn.wangchenhui.model.Order"%>
<%@page import="cn.wangchenhui.dao.IOrderDao"%>
<%@page import="cn.wangchenhui.model.Goods"%>
<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@page import="cn.wangchenhui.dao.IGoodsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="<%=request.getContextPath() %>/favicon.ico">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/returntop.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/js/icheck/skins/all.css" >
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style_button.css" >
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css" >
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-2.2.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/icheck/icheck.js"></script>
<title>下单成功</title>
</head>
<body>
	<!-- 导入header部分 -->
	<div id="include_header_bannner">
		<div id="include_header">
			<jsp:include page="/lockPages/user/header.jsp"></jsp:include>
		</div>
	</div>
	<% 
		String ord_id = request.getParameter("ord_id");
		IOrderDao orderDao = DaoFactory.getOrderDao();
		Order order = orderDao.load(ord_id);
		String goods_id = order.getGoods_id();
		float amount = Float.parseFloat(request.getParameter("amount"));
		IGoodsDao goodsDao = DaoFactory.getGoodsDao();
		Goods goods = goodsDao.load(goods_id);
		goods.setCurr_stock(goods.getCurr_stock()-1);
		goodsDao.update(goods);
	%>
	<hr style="position:absolute;width:90%;height:2px;border:none;border-top:2px dotted #9D2A29; margin-top:200px;margin-left:60px;">
	<div  style="position: absolute;margin-top:210px;width:99%;margin-left:3px;">
		<div style="position:absolute;margin-top:-8px;margin-left:62px;border:solid 1px #9D2A29;width:90%;height:40px;background-color:#9D2A29;"><p align="center" style="color:white;height:50px;margin-top:-4px;"><font size="+3">订单状态详情</font></p></div>
		<div style="position:absolute;margin-top:-8px;margin-left:62px;border:solid 1px #9D2A29;width:90%;height:500px;">
			<div style="margin-top:100px;" align="center"><img src="<%=request.getContextPath()%>/images/icon/ord_success.png" style="width:80px;height:80px;"><p style="margin-top:0px;"><font color="#9D2A29" size="+3">恭喜您，购买成功！</font></p></div>
			<div style="position:absolute;margin-top:100px;height:50px;width:100%;background-color:#9D2A29;">
				<div style="color:white;margin-left:200px;font-size:18px;margin-top:15px;">
					<b>订单编号:</b><%=ord_id %>
				</div>
				<div style="color:white;margin-left:900px;font-size:18px;margin-top:-25px;">
					<b>订单总金额：</b><%=amount %>￥
				</div>
			</div>
			<div style="margin-top:200px;" ><p style="margin-left:350px;"><font color="green" size="+2">我们会尽快为亲配送！</font></p><img src="<%=request.getContextPath()%>/images/icon/deliver.png" style="width:80px;height:80px;margin-left:600px;margin-top:-70px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
			<div style="margin-top:-50px; margin-left:1000px;" ><a href="<%=request.getContextPath()%>/index.jsp">继续购物</a></div>
		</div>
	</div>
	
	<!-- 导入底部的版权页 -->
</body>
</html>