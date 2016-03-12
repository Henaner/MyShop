<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String img_title = request.getParameter("img_title");
	String goods_id = request.getParameter("goods_id");
	int display_count = Integer.parseInt(request.getParameter("slide_count"));
	int user_id = Integer.parseInt(request.getParameter("id"));
%>