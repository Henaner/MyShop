<%@page import="java.util.Date"%>
<%@page import="cn.wangchenhui.util.DateFormat"%>
<%@page import="cn.wangchenhui.model.Notice"%>
<%@page import="cn.wangchenhui.dao.INoticeDao"%>
<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@page import="cn.wangchenhui.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String notice_title = new String(request.getParameter("notice_title").getBytes("iso8859-1"),"utf8");
	String notice_content = new String(request.getParameter("notice_content").getBytes("iso8859-1"),"utf8");
	User loginOpt = (User)session.getAttribute("loginOpt");
	int user_id = loginOpt.getUser_id();
	INoticeDao noticeDao = DaoFactory.getNoticeDao();
	Notice notice = new Notice();
	notice.setNotice_title(notice_title);
	notice.setNotice_content(notice_content);
	notice.setPost_date(DateFormat.formatLong(new Date()));
	notice.setUser_id(user_id);
	try{
		noticeDao.add(notice);
		response.sendRedirect("noticeSucc.jsp");
	}catch(Exception e){
		e.printStackTrace();
	}
%>