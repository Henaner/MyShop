<%@page import="cn.wangchenhui.model.User"%>
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
	User user = (User)session.getAttribute("loginUser");
	int user_id = user.getUser_id();
	String user_msg = (String)session.getAttribute("user_msg");
	if(user_msg == null){
		user_msg = "";
	}
%>
	<div style="border:solid 1px #CCCCCC;height:520px;width:97%">
		<div style="margin-top:50px;margin-left:420px;font-size:18px;color:red;"><%=user_msg %></div>
		<form method="post" action="<%=request.getContextPath()%>/lockPages/user/doPass.jsp?user_id=<%=user_id%>">
		<table style="margin-top:100px;margin-left:400px;width:40%;height:300px;">
			<tr>
				<td>请输入原密码</td>
				<td><input type="password" name="old_pass"></td>
			</tr>
			<tr>
				<td>请输入新密码</td>
				<td><input type="password" name="set_pass"></td>
			</tr>
			<tr>
				<td>请确认密码</td>
				<td><input type="password" name="set_repass"></td>
			</tr>
			<tr>
				<td><input type="reset" value="重置"></td>
				<td><input type="submit" value="更改"></td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>