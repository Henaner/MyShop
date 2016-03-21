<%@page import="cn.wangchenhui.dao.OrderDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="cn.wangchenhui.util.DateFormat"%>
<%@page import="cn.wangchenhui.dao.IGoodsDao"%>
<%@page import="java.util.Calendar"%>
<%@page import="cn.wangchenhui.model.Address"%>
<%@page import="cn.wangchenhui.dao.IAddressDao"%>
<%@page import="java.util.List"%>
<%@page import="cn.wangchenhui.model.Cart"%>
<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@page import="cn.wangchenhui.dao.ICartDao"%>
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
<title>结算中心</title>
</head>
<body>
	<!-- 导入header部分 -->
	<div id="include_header_bannner">
		<div id="include_header">
			<jsp:include page="/lockPages/user/header.jsp"></jsp:include>
		</div>
	</div>
	<%
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		IAddressDao addressDao = DaoFactory.getAddressDao();
		Address address = addressDao.load(user_id);
		ICartDao cartDao = DaoFactory.getCartDao();
		IGoodsDao goodsDao = DaoFactory.getGoodsDao();
		List<Cart> list = cartDao.getList(user_id);
		Calendar calendar = Calendar.getInstance();
        int year = calendar.get(Calendar.YEAR);//年
        int month = calendar.get(Calendar.MONTH)+1; //这个是月份，要+1
        int day = calendar.get(Calendar.DAY_OF_MONTH);//日
        int hour = calendar.get(Calendar.HOUR_OF_DAY);
        int minute = calendar.get(Calendar.MINUTE);
        int seconde = calendar.get(Calendar.SECOND);
        int rndNum = (int)(Math.random()*1000+1);
        String post_date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        String ord_id = String.valueOf(year)+String.valueOf(month)+String.valueOf(day)+String.valueOf(hour)+String.valueOf(minute)+String.valueOf(seconde)+String.valueOf(rndNum);
	%>
	<hr style="position:absolute;width:90%;height:2px;border:none;border-top:2px dotted #9D2A29; margin-top:200px;margin-left:60px;">
	<div  style="position: absolute;margin-top:210px;width:99%;margin-left:3px;">
		<div style="position:absolute;margin-top:-8px;margin-left:62px;border:solid 1px #9D2A29;width:90%;height:40px;background-color:#9D2A29;"><p align="center" style="color:white;height:50px;margin-top:-4px;"><font size="+3">确认收货地址</font></p></div>
		<!-- 订单收货地址区域 -->
		<div style="position:absolute;margin-top:32px;margin-left:62px;width:90%;height:150px;border:solid 1px #9D2A29;">
				<div style="margin-top:5px;margin-left:1080px;"><a href="<%=request.getContextPath()%>/lockPages/user/userProfile.jsp"><font size="+1">管理收货地址</font></a></div>
				<div style="margin-top:30px;margin-left:50px;"><input type="radio" id="radio-2-1" checked name="radio-2-set" class="regular-radio big-radio" /><label for="radio-2-1"></label><div style="margin-top:-25px;margin-left:60px;"><%=address.getAddress() %>&nbsp;&nbsp;<%=address.getName() %>&nbsp;&nbsp;<%=address.getTelphone() %></div></div>
		</div>
	</div>
	<!-- 订单的详细信息区域 -->
	<hr style="position:absolute;width:90%;height:2px;border:none;border-top:2px dotted #9D2A29; margin-top:400px;margin-left:60px;">
	<div  style="position: absolute;margin-top:410px;width:99%;margin-left:3px;">
		<div style="position:absolute;margin-top:-8px;margin-left:62px;background-color:#9D2A29;border:solid 1px #9D2A29;width:90%;height:40px;backgroud-color:#9D2A29;"><p align="center" style="color:white;margin-top:-4px;"><font size="+3">订单详情</font></p></div>
		<!-- 订单详细信息区域 -->
		<div style="position:absolute;margin-top:32px;margin-left:62px;width:90%;height:500px;border:solid 1px #9D2A29;"></div>
		<div style="position:absolute;margin-top:532px;margin-left:62px;width:90%;height:50px;border:solid 1px #9D2A29;background-color:#9D2A29;">
			<div style="position:absolute;margin-top:-500px;width:100%;color:#9D2A29;">
			<div style="color:white;position:absolute;margin-top:-28px;width:20%;margin-left:900px;">订单编号：<%=ord_id %></div>
				<table id="order_table" width="100%">
					<thead align="center">
						<td>商品</td>
						<td>名称</td>
						<td>单价</td>
						<td>数量</td>
						<td>日期</td>
						<td>金额</td>
					</thead>
					<%
						for(Cart cart:list)	{
					%>
					<tr align="center">
						<td width="20%"><img src="<%=request.getContextPath()%>/upload/goodsImg/<%=goodsDao.load(cart.getGoods_id()).getImg_name() %>" style="width:50px;height:50px;border:solid 1px #CCCCCC;"></td>
						<td><%=goodsDao.load(cart.getGoods_id()).getGoods_title() %></td>
						<td><%=goodsDao.load(cart.getGoods_id()).getPrice() %>￥</td>
						<td><%=cart.getCount() %></td>
						<td><%=post_date %></td>
						<td><%=cart.getAmount() %>￥</td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
			<div style="margin-left:60px;position:absolute;margin-top:2px;;"><p style="font-size:18px;color:white;"><b>总金额:</b><%=cartDao.getAmout(user_id)%>￥</p></div>
			<div style="margin-left:1050px;position:absolute;margin-top:2px;"><input type="button" onclick= "window.location.href='<%=request.getContextPath() %>/lockPages/goods/doOrder.jsp?user_id=<%=user_id %>&ord_id=<%=ord_id %>&amount=cart.getAmount()'" style="color:#9D2A29;cursor:pointer;height:47px;width:120px;font-size:18px;left:900px;" value="下单"></div>
		</div>
	</div>
	
</body>
<style type= text/css>
	#order_table{ border-collapse:collapse ;}
	#order_table tr{border:1px solid #9D2A29;}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		 $('input').iCheck({
		   checkboxClass: 'icheckbox_square-red',  // 注意square和blue的对应关系
		   radioClass: 'iradio_square-red',
		   increaseArea: '20%' // optional
		 });
	});
</script>
</html>