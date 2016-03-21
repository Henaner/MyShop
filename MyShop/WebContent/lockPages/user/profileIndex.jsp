<%@page import="cn.wangchenhui.model.Cart"%>
<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@page import="cn.wangchenhui.dao.ICartDao"%>
<%@page import="cn.wangchenhui.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div style="border:solid 1px #CCCCCC;height:520px;width:97%">
		<div id="weather" style="margin-left:150px;">
			<iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=2" width="770" height="70" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
		</div>
		<%
			User user = (User)session.getAttribute("loginUser");
			int user_id = user.getUser_id();
			ICartDao cartDao = DaoFactory.getCartDao();
			int amount = cartDao.getAmout(user_id);
			if(amount != 0){
		%>
		<div style="margin-top:100px;margin-left:150px;">
			购物车状态：购物车中有商品未付款，前往<a href="<%=request.getContextPath()%>/lockPages/goods/order.jsp?user_id=<%=user_id%>" target="_parent">付款</a>
		</div>
		<%
			}else{
		%>
		<div style="margin-top:100px;margin-left:150px;">
			购物车状态：购物车没有商品，去<a href="<%=request.getContextPath()%>/index.jsp" target="_parent">添加</a>点吧
		</div>
		<%
			}
		%>
	</div>
</body>
</html>