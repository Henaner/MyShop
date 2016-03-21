<%@page import="cn.wangchenhui.model.User"%>
<%@page import="cn.wangchenhui.dao.IUserDao"%>
<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@page import="cn.wangchenhui.util.AdminCheckUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String username = request.getParameter("userName");
	String userpass = request.getParameter("userPass");
	String captcha = request.getParameter("captcha");
	boolean check_ok = AdminCheckUtil.verifyAdmin(request,new String[]{username,userpass,captcha});
	if(!check_ok){
%>
<jsp:forward page="/lockPages/admin/admin.jsp"/>
<%
	}else{
		IUserDao userDao = DaoFactory.getUserDao();
		User loginOpt = userDao.login(username, userpass);
		session.setAttribute("loginOpt", loginOpt);
		response.sendRedirect(request.getContextPath() +"/lockPages/admin/adminIndex.jsp");
	}
%>