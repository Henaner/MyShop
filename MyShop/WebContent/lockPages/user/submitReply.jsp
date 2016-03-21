<%@page import="cn.wangchenhui.model.Comment"%>
<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@page import="cn.wangchenhui.dao.ICommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	int id = Integer.parseInt(request.getParameter("id"));
	ICommentDao commentDao = DaoFactory.getCommentDao();
	Comment comment = commentDao.load(id);
	String reply = request.getParameter("admin_reply");
	comment.setReply(reply);
	commentDao.update(comment);
	response.sendRedirect("replySucc.jsp");
%>