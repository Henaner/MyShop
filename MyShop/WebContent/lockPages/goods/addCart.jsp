<%@page import="cn.wangchenhui.dao.IGoodsDao"%>
<%@page import="cn.wangchenhui.model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="cn.wangchenhui.dao.ICartDao"%>
<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@page import="cn.wangchenhui.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css">
<link rel="shortcut icon" href="<%=request.getContextPath() %>/favicon.ico">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-2.2.0.min.js"></script>
<title>购物车详情</title>
</head>
<body>
	<!-- 导入header部分 -->
	<div id="include_header_bannner">
		<div id="include_header">
			<jsp:include page="/lockPages/user/header.jsp"></jsp:include>
		</div>
	</div>
	
	<%
		User user = (User)session.getAttribute("loginUser");
		int user_id = user.getUser_id();
		ICartDao cartDao = DaoFactory.getCartDao();
		List<Cart> list = cartDao.getList(user_id);
		IGoodsDao  goodsDao = DaoFactory.getGoodsDao();
		double amount = (double)cartDao.getAmout(user_id);
	%>
	<!-- 这里是购物车的展示区 -->
	<hr style="position:absolute;width:90%;height:2px;border:none;border-top:2px dotted #9D2A29; margin-top:200px;margin-left:60px;">
	<div  style="position: absolute;margin-top:210px;width:99%;margin-left:3px;">
		<div style="position:absolute;margin-top:-8px;margin-left:62px;background-color:#9D2A29;border:solid 1px #9D2A29;width:90%;height:40px;backgroud-color:#9D2A29;"><p align="center" style="color:white;margin-top:-4px;"><font size="+3">购物车详情</font></p></div>
	</div>
	<div id="rec_address" style="position:absolute;height:800px;width:90%;margin-left:60px;margin-top:245px;">
		<table id="cart_table" align="center" style="width:90%;margin-left:60px; border-collapse:collapse;heght:600px;">
			<tr align="center" style="background-color:#9D2A29;color:white;">
				<td>商品图</td>
				<td>名称</td>
				<td>单价</td>
				<td>数量</td>
				<td>操作</td>
			</tr>
			<%
				if(cartDao.getCount(user_id) == 0){
			%>
			<tr align="center" style="border-bottom-style:none;">
				<td align="center" colspan="5">
					<img src="<%=request.getContextPath() %>/images/empty.png" style="height:100px;width:100px;">
				</td>
			</tr>
			<tr align="center" style="border-top-style:none;">
				<td colspan="5">
					<font size="+3" color="#9D2A29">空空如也~~</font>
				</td>
			</tr>
			<%
				}else{
			%>
				
			<%
				for(Cart cart:list){
			%>
			<tr align="center">
				<td><img src="<%=request.getContextPath() %>/upload/goodsImg/<%=goodsDao.load(cart.getGoods_id()).getImg_name() %>" style="height:50px;width:50px;"></td>
				<td><%=goodsDao.load(cart.getGoods_id()).getGoods_title() %></td>
				<td><%=goodsDao.load(cart.getGoods_id()).getPrice() %></td>
				<td><%=cart.getCount() %>
				<td><a href="<%=request.getContextPath()%>/lockPages/goods/delCart.jsp?id=<%=cart.getId()%>">删除</a></td>
			</tr>
			<%
				}
			%>
			<%
				}
			%>
			<!-- 上面的两个tr是测试数据 -->
		</table>
		<div style="postion:relative;height:50px;width:90%;margin-left:60px;margin-top:0px;background-color:#9D2A29;color:white;font-size:20px;">
			<div style="position:absolute;margin-left:60px; margin-top:12px;" ><a href="<%=request.getContextPath()%>/index.jsp">添加商品</a></div>
			<div style="position:absolute;margin-left:600px;  margin-top:12px;">总金额：<%=amount %>￥</div>
			<div style="position:absolute;margin-left:950px;margin-top:1px;"><input type="button" onclick= "window.location.href='<%=request.getContextPath() %>/lockPages/goods/order.jsp?user_id=<%=user_id %>'" style="color:#9D2A29;height:47px;width:120px;font-size:18px;" value="去结算"></div>
		</div>
	</div>
	<!-- 导入底部的版权页 -->
	<div id="include_bottom" style="position:absolute;margin-top:1500px;margin-left:150px;">
			<jsp:include page="/bottom.jsp"></jsp:include>
	</div>
</body>
<style type= text/css>
	#cart_table{ border-collapse:collapse ;}
	#cart_table tr{border:1px solid #9D2A29;}
</style>
<script type="text/javascript">
	$(document).ready(function(e){
		$("#cart_table tr:gt(0)").mouseover(function(){
			$(this).css("background","#CC6666");
			$(this).
			
		});
		$("#cart_table tr:gt(0)").mouseout(function(){
			$(this).css("background","");
			
		});
	});
</script>
</html>