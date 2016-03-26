<%@page import="cn.wangchenhui.model.Goods"%>
<%@page import="cn.wangchenhui.dao.IGoodsDao"%>
<%@page import="java.util.Date"%>
<%@page import="cn.wangchenhui.util.DateFormat"%>
<%@page import="cn.wangchenhui.model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@page import="cn.wangchenhui.dao.ICartDao"%>
<%@page import="cn.wangchenhui.model.User"%>
<%@page import="cn.wangchenhui.dao.IUserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	User user = (User)session.getAttribute("loginUser");
	int user_id = user.getUser_id();
	ICartDao cartDao = DaoFactory.getCartDao();
	List<Cart> list = cartDao.getList(user_id);
	IGoodsDao goodsDao = DaoFactory.getGoodsDao();
	Goods goods = null;
	for(Cart cart:list){
		String goods_id = cart.getGoods_id();
		cart = cartDao.getload(cart.getGoods_id());
		goods = goodsDao.load(goods_id);
		String post_date = DateFormat.formatLong(new Date());
		String cart_status = "未结算";
		System.out.println(cart.getGoods_id());
		System.out.println("id:"+cart.getId());
		System.out.println("user_id:"+cart.getUser_id());
		cart.setUser_id(user_id);
		cart.setId(cart.getId());
		System.out.println("数量:"+request.getParameter(cart.getGoods_id()));
		cart.setPost_date(post_date);
		cart.setCart_status(cart_status);
		System.out.println("总价："+Integer.parseInt(request.getParameter(cart.getGoods_id()))*goods.getPrice());
		cart.setAmount(Integer.parseInt(request.getParameter(cart.getGoods_id()))*goods.getPrice());
		cart.setCount(Integer.parseInt(request.getParameter(cart.getGoods_id())));
		cartDao.update(cart);
	}
	response.sendRedirect(request.getContextPath()+"/lockPages/goods/order.jsp?user_id="+user_id);
%>