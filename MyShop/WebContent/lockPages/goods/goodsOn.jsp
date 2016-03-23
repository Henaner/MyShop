<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@page import="cn.wangchenhui.model.Goods"%>
<%@page import="cn.wangchenhui.dao.IGoodsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String goods_id = request.getParameter("goods_id");
	IGoodsDao  goodsDao = DaoFactory.getGoodsDao();
	Goods goods = goodsDao.load(goods_id);
	goods.setGoods_status("在架");
	goodsDao.update(goods);
	response.sendRedirect(request.getContextPath()+"/lockPages/goods/gooodsManage.jsp");
%>