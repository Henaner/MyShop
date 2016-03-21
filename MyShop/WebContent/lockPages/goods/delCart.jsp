<%@page import="cn.wangchenhui.model.User"%>
<%@page import="cn.wangchenhui.dao.ICartDao"%>
<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	int id = Integer.parseInt(request.getParameter("id"));
	ICartDao cartDao = DaoFactory.getCartDao();
	User user = (User)session.getAttribute("loginUser");
	int user_id = user.getUser_id();
	try{
		cartDao.delete(id);
		response.sendRedirect(request.getContextPath()+"/lockPages/goods/addCart.jsp?id="+user_id);
	}catch(Exception e){
		e.printStackTrace();
	}
%>