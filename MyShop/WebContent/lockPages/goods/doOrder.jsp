<%@page import="cn.wangchenhui.model.User"%>
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
		ICartDao cartDao = DaoFactory.getCartDao();
		User user = (User)session.getAttribute("loginUser");
		int user_id = user.getUser_id();
		String ord_id = request.getParameter("ord_id");
		IOrderDao orderDao = DaoFactory.getOrderDao();
		Order order = orderDao.load(ord_id);
		String goods_id = order.getGoods_id();
		IGoodsDao goodsDao = DaoFactory.getGoodsDao();
		Goods goods = goodsDao.load(goods_id);
		goods.setCurr_stock(goods.getCurr_stock()-1);
		List<Cart> list = cartDao.getList(user_id);
		for(Cart cart:list){
			cartDao.deleteOfUser(user_id);
		}
		goodsDao.update(goods);
		order.setOrd_status("1");
		orderDao.update(order);
	response.sendRedirect(request.getContextPath()+"/lockPages/goods/ordSuccess.jsp?ord_id="+ord_id);
%>