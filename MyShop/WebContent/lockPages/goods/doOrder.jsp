<%@page import="cn.wangchenhui.model.Goods"%>
<%@page import="cn.wangchenhui.dao.IGoodsDao"%>
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
	float amount = 0.00f;
	IGoodsDao goodsDao = DaoFactory.getGoodsDao();
	Goods goods = null;
	IOrderDao orderDao = DaoFactory.getOrderDao();
	List<Cart> list = cartDao.getList(user_id);
	Order order = null;
	for(Cart cart:list){
		order= new Order();
		goods = goodsDao.load(cart.getGoods_id());
		order.setOrd_id(ord_id);
		order.setGoods_id(cart.getGoods_id());
		order.setPost_date(DateFormat.formatLong(new Date()));
		order.setUser_id(user_id);
		order.setAmount(amount += cart.getAmount());
		orderDao.add(order);
		cartDao.delete(cart.getId());
		goods.setCurr_stock(goods.getCurr_stock()-cart.getCount());
		goodsDao.update(goods);
	}
	response.sendRedirect(request.getContextPath()+"/lockPages/goods/ordSuccess.jsp?ord_id="+ord_id+"&amount="+amount);
%>