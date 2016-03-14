<%@page import="cn.wangchenhui.util.LoginCheckUtil"%>
<%@page import="cn.wangchenhui.model.User"%>
<%@page import="cn.wangchenhui.dao.IUserDao"%>
<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String username = request.getParameter("userName");
	String userpass = request.getParameter("userPass");
	String input_captcha =request.getParameter("captcha");
	boolean check_ok = LoginCheckUtil.verifyLogin(request, new String[]{username,userpass,input_captcha});
	if(!check_ok){
%>
	<jsp:forward page="/login.jsp"/>
<%
	}else{
		IUserDao userDao = DaoFactory.getUserDao();
		User loginUser = userDao.login(username, userpass);
		session.setAttribute("loginUser", loginUser);
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}
%>