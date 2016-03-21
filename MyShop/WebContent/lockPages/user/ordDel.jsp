<%@page import="cn.wangchenhui.model.Order"%>
<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@page import="cn.wangchenhui.dao.IOrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String ord_id = request.getParameter("ord_id");
	IOrderDao orderDao = DaoFactory.getOrderDao();
	try{
		orderDao.delete(ord_id);
		response.sendRedirect(request.getContextPath()+"/lockPages/user/orderManage.jsp");
	}catch(Exception e){
		e.printStackTrace();
	}
%>