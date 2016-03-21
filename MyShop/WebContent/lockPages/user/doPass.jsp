<%@page import="cn.wangchenhui.util.MD5Util"%>
<%@page import="cn.wangchenhui.model.User"%>
<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@page import="cn.wangchenhui.dao.IUserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	int user_id = Integer.parseInt(request.getParameter("user_id"));
	IUserDao userDao = DaoFactory.getUserDao();
	User user = userDao.load(user_id);
	String password = user.getUser_pass();
	String old_pass = request.getParameter("old_pass");
	String set_pass = request.getParameter("set_pass");
	String set_repass = request.getParameter("set_repass");
	if(!set_pass.equals(set_repass)){
		session.setAttribute("user_msg", "新密码和确认密码不一致！");
		response.sendRedirect(request.getContextPath()+"/lockPages/user/password.jsp");
		
	}else{
		if(!password.equals(MD5Util.md5Encode(old_pass))){
			session.setAttribute("user_msg", "原密码输入错误！");
			response.sendRedirect(request.getContextPath()+"/lockPages/user/password.jsp");
			
		}else{
			user.setUser_pass(MD5Util.md5Encode(set_pass));
			userDao.update(user);
			session.setAttribute("user_msg", "密码修改成功,下次登录自动生效");
			response.sendRedirect(request.getContextPath()+"/lockPages/user/password.jsp");
			
		}
	}
%>