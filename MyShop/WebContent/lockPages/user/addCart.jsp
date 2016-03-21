<%@page import="cn.wangchenhui.model.Cart"%>
<%@page import="java.awt.font.TextLayout.CaretPolicy"%>
<%@page import="cn.wangchenhui.dao.ICartDao"%>
<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@page import="java.util.Date"%>
<%@page import="cn.wangchenhui.util.DateFormat"%>
<%@page import="cn.wangchenhui.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	User loginUser = (User)session.getAttribute("loginUser");
	if(loginUser == null){
%>
<jsp:forward page="/login.jsp"></jsp:forward>
<%
	}else{
		String goods_id = request.getParameter("goods_id");
		int user_id = loginUser.getUser_id();
		int count = Integer.parseInt(request.getParameter("num_wanted"));
		float price = Float.parseFloat(request.getParameter("goods_price"));
		float amount = count*price;
		String post_date = DateFormat.formatLong(new Date());
		String cart_status = "未结算";
		
		
		Cart cart = new Cart();
		cart.setUser_id(user_id);
		cart.setGoods_id(goods_id);
		cart.setPost_date(post_date);
		cart.setCount(count);
		cart.setAmount(amount);
		cart.setCart_status(cart_status);
		
		
		ICartDao cartDao = DaoFactory.getCartDao();
		try{
			cartDao.add(cart);
			response.sendRedirect(request.getContextPath() +"/product.jsp?goods_id="+goods_id);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
%>