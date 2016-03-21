<%@page import="cn.wangchenhui.util.AdminCheckUtil"%>
<%@page import="cn.wangchenhui.util.LoginCheckUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="<%=request.getContextPath()%>/favicon.ico">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css">
<title>家乡味后台登录</title>
</head>
<body style="background: url(<%=request.getContextPath() %>/images/adminBG.png);">
	<div class="div_admin_login">
		<div style="position: absolute;color:red;margin-top:325px;margin-left:635px;"><%=AdminCheckUtil.showMsg(request, "is_admin") %><%=AdminCheckUtil.showMsg(request, "opt_status") %></div>
		<form action="<%=request.getContextPath() %>/lockPages/admin/adminLogin.jsp" method="post">
			<table align="center" width="370px" style="position:absolute;margin-top:350px;margin-left:550px;">
				<tr align="left" height="40px">
					<td>账号</td>
					<td><input type="text" name="userName">
					<div style="postion:abolute;margin-top:-15px;margin-left:150px;color:red;"><%=AdminCheckUtil.showMsg(request, "username") %></div>
					</td>
				</tr>
				<tr align="left" height="40px">
					<td>密码</td>
					<td><input type="password" name="userPass">
					<div style="postion:abolute;margin-top:-15px;margin-left:150px;color:red;"><%=AdminCheckUtil.showMsg(request, "userpass") %></div>
					</td>
				</tr>
				<tr align="left" height="50px">
					<td>验证码</td>
					<td>
						<input type="text" name="captcha" id="captcha"
						class="captcha" size="4" maxlength="4"><div style="position:absolute ;margin-top:-30px;margin-left:60px;"><img src="<%=request.getContextPath()%>/Captcha"
						style="cursor: pointer;" title="单击刷新验证码" alt="单击刷新验证码"
						onclick="this.src='<%=request.getContextPath()%>/Captcha?'+new Date().getTime();"></div>
					<div style="postion:abolute;margin-top:-15px;margin-left:150px;color:red;"><%=AdminCheckUtil.showMsg(request, "captcha") %></div>
					</td>
				</tr>
				<tr >
					<th colspan="2" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input  style="cursor:pointer;border-radius:5px;width:80px;height:30px;background:#9D2A29;color:white;" type="submit" class="admin_btn_login"
						value="登录"> <input  type="reset" class="admin_btn_login"
						value="清空" style="cursor:pointer;border-radius:5px;width:80px;height:30px;background:#9D2A29;color:white;"></th>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>