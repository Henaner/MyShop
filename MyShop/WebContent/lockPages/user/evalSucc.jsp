<%@page import="cn.wangchenhui.model.Order"%>
<%@page import="cn.wangchenhui.dao.IOrderDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="cn.wangchenhui.util.DateFormat"%>
<%@page import="cn.wangchenhui.model.Comment"%>
<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@page import="cn.wangchenhui.dao.ICommentDao"%>
<%@page import="cn.wangchenhui.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.12.0.min.js"></script>
</head>
<body>
	<%
		
		String rank = request.getParameter("rank");
		String advice = request.getParameter("advice");
		String ord_id = request.getParameter("ord_id");
		User user = (User)session.getAttribute("loginUser");
		int user_id = user.getUser_id();
		IOrderDao orderDao = DaoFactory.getOrderDao();
		Order order = orderDao.load(ord_id);
		String post_date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		ICommentDao commentDao = DaoFactory.getCommentDao();
		Comment comment = new Comment();
		comment.setOrd_id(ord_id);
		comment.setUser_id(user_id);
		comment.setEval_rank(rank);
		comment.setAdvice(advice);
		comment.setPost_date(post_date);
		commentDao.add(comment);
		order.setOrd_status("4");
		orderDao.update(order);
	%>
	<div style="border:solid 1px #CCCCCC;height:520px;width:97%">
		<div align="center" style="margin-top:50px;">
			<img src="<%=request.getContextPath() %>/images/add_ok.png">
		</div>
		<div align="center" style="margin-top:100px;">
			评论成功，您的评价是我们改善的动力&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/lockPages/user/orderManage.jsp" target="main">返回</a>
		</div>
	</div>
</body>
</html>