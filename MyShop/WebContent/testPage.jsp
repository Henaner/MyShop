<%@page import="java.util.List"%>
<%@page import="cn.wangchenhui.model.Pager"%>
<%@page import="cn.wangchenhui.model.User"%>
<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@page import="cn.wangchenhui.dao.IUserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		IUserDao userDao = DaoFactory.getUserDao();
		Pager<User> pages = userDao.list();
		List<User> list = pages.getData();
		int totalPage = pages.getTotalPage();
		int totalRecord = pages.getTotalRecord();
	%>
	<table width="80%" align="center">
		<tr>
			<td>id</td>
			<td>用户名</td>
			<td>密码</td>
			<td>性别</td>
			<td>生日</td>
			<td>地址</td>
			<td>邮箱</td>
			<td>电话</td>
			<td>类型</td>
			<td>状态</td>
			<td>操作员状态</td>
			<td>是否是操作员</td>
			<td>是否是管理员</td>
		</tr>
		<%
			for(User user:list){
		%>
		<tr>
			<td><%=user.getUser_id() %></td>
			<td><%=user.getUser_name() %></td>
			<td><%=user.getUser_pass() %></td>
			<td><%=user.getUser_gender() %></td>
			<td><%=user.getBirthday() %></td>
			<td><%=user.getAddress() %></td>
			<td><%=user.getEmail() %></td>
			<td><%=user.getTelphone() %></td>
			<td><%=user.getType() %></td>
			<td><%=user.getStatus() %></td>
			<td><%=user.getOpt_status() %></td>
			<td><%=user.getIs_operator() %></td>
			<td><%=user.getIs_admin() %></td>
		</tr>
		<%
			}
		%>
		<tr>
			<td colspan="13">
				<jsp:include page="/lockPages/pager/pager.jsp"></jsp:include>
			</td>
		</tr>
	</table>
</body>
</html>