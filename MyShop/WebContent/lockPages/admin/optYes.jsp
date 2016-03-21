<%@page import="cn.wangchenhui.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@page import="cn.wangchenhui.dao.IUserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    %>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	IUserDao userDao = DaoFactory.getUserDao();
	User user = userDao.load(id);
	user.setOpt_status("0");
	userDao.update(user);
	System.out.println("状态修改成功：enable");
	response.sendRedirect("optList.jsp");
%>