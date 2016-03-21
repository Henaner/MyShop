<%@page import="cn.wangchenhui.dao.IUserDao"%>
<%@page import="cn.wangchenhui.dao.ICartDao"%>
<%@page import="cn.wangchenhui.dao.CartDao"%>
<%@page import="cn.wangchenhui.model.Notice"%>
<%@page import="cn.wangchenhui.dao.INoticeDao"%>
<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@page import="cn.wangchenhui.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css">
</head>
<body>
<%
	User loginUser =(User)session.getAttribute("loginUser");
	INoticeDao noticeDao = DaoFactory.getNoticeDao();
	Notice notice = noticeDao.getNotice();
	int id = notice.getId();
	String title = notice.getNotice_title();
%>
	<div style="position:absolute;width:100%;margin-left:-8px;height:50px;margin-top:-8px;background-color:#F2F2F2;" id="header_div">
		<div id="welcome_words">嗨！欢迎您来到家乡味商城</div>
		<div id="index_opt" style="margin-left:1100px;">
		<%
			if(loginUser==null){
				%>
				<img src="<%=request.getContextPath() %>/images/icon/login.png" style="height:14px;width:14px;">
				<a href="<%=request.getContextPath() %>/login.jsp" target="_parent">登录</a>
				&nbsp;&nbsp;|&nbsp;&nbsp;
				<img src="<%=request.getContextPath() %>/images/icon/register.png" style="height:14px;width:14px;">
				<a href="<%=request.getContextPath() %>/register.jsp" target="_parent">注册</a>
			<%
				}else{
					
		%>
			<a href="<%=request.getContextPath() %>/lockPages/user/userProfile.jsp?user_id=<%=loginUser.getUser_id()%>" target="_parent"><%=loginUser.getUser_name() %></a>
			&nbsp;&nbsp;|&nbsp;&nbsp;
			<img src="<%=request.getContextPath() %>/images/icon/exit.png" style="height:14px;width:14px;">
			<a href="<%=request.getContextPath()%>/logout.jsp" target="_parent">退出</a>
		<%
			}
		%>
	</div>
</div>
</body>
</html>