<%@page import="java.util.Date"%>
<%@page import="cn.wangchenhui.util.DateFormat"%>
<%@page import="cn.wangchenhui.model.Order"%>
<%@page import="cn.wangchenhui.dao.IOrderDao"%>
<%@page import="cn.wangchenhui.model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@page import="cn.wangchenhui.dao.ICartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	int user_id = Integer.parseInt(request.getParameter("user_id"));
	String ord_id = request.getParameter("ord_id");
	ICartDao cartDao = DaoFactory.getCartDao();
	float amount = cartDao.getAmout(user_id);
	IOrderDao orderDao = DaoFactory.getOrderDao();
	List<Cart> list = cartDao.getList(user_id);
	Order order = null;
	for(Cart cart:list){
		order= new Order();
		order.setOrd_id(ord_id);
		order.setGoods_id(cart.getGoods_id());
		order.setPost_date(DateFormat.formatLong(new Date()));
		order.setUser_id(user_id);
		orderDao.add(order);
		cartDao.delete(cart.getId());
	}
	response.sendRedirect(request.getContextPath()+"/lockPages/goods/ordSuccess.jsp?ord_id="+ord_id+"&amount="+amount);
%>