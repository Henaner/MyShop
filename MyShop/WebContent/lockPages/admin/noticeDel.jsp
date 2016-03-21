<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@page import="cn.wangchenhui.dao.INoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	int id = Integer.parseInt(request.getParameter("id"));
	INoticeDao noticeDao = DaoFactory.getNoticeDao();
	try{
		noticeDao.delete(id);
		response.sendRedirect("noticeList.jsp");
	}catch(Exception e){
		e.printStackTrace();
	}
%>