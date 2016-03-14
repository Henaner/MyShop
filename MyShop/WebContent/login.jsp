<%@page import="cn.wangchenhui.util.LoginCheckUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="<%=request.getContextPath()%>/favicon.ico">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-2.2.0.min.js"></script>
<title>家乡味会员登录</title>
</head>
<body style="background: url(<%=request.getContextPath()%>/images/loginBG.png)"
	onload="setup();preselect('');createCode()">
	<div class="div_login_top">
		<img class="login_top" src="<%=request.getContextPath()%>/images/login_top.png">
	</div>
	<div class="div_login">
		<form action="<%=request.getContextPath() %>/lockPages/check/doLogin.jsp" method="post" onsubmit="return login_check();">
			<table>
				<tr>
					<td>用户名&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>
						<div class="userName_login">
							<input type="text" style="font-size:18px;" name="userName" id="userName_login"
						class="user" placeholder="请输入用户名">
						</div>
						<div style="font-size:16px;color:red;margin-left:210px;margin-top:-25px;"><%=LoginCheckUtil.showMsg(request,"username") %></div>
					</td>
				</tr>
				<tr>
					<td>密&nbsp;&nbsp;码&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><div class="userPass_login">
						<input type="password" style="font-size:18px;" maxlength="16" name="userPass" id="userPass_login"
						class="user" placeholder="请输入密码">
					</div>
					<div style="font-size:16px;color:red;margin-left:210px;margin-top:-25px;"><%=LoginCheckUtil.showMsg(request,"userpass") %></div>
					</td>
				</tr>
				<tr>
					<td>验证码&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><input type="text" style="font-size:16px;" name="captcha" id="captcha"
						class="captcha" size="4" maxlength="4"><div class="div_login_captcha" ><img alt="单击刷新验证码"
						style="cursor: pointer" title="单击刷新验证码" src="<%=request.getContextPath() %>/Captcha"
						onclick="this.src='<%=request.getContextPath()%>/Captcha?'+new Date().getTime();"></div>
						<div style="font-size:16px;color:red;margin-left:210px;margin-top:-25px;"><%=LoginCheckUtil.showMsg(request,"captcha") %></div>
						</td>
				</tr>
				<tr>
					<th colspan="2"><div class="conform_login"><input type="submit" value="登录" id="login_btn"
						class="login_btn">&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath() %>/register.jsp">还没账号？注册</a></div></th>
				</tr>
			</table>
		</form>
	</div>
</body>
<script type="text/javascript">
	function login_check(){
		var username = $("#userName_login").val();
		var userpass = $("#userPass_login").val();
		var capthcha = $("#captcha").val();
		
		if(username == null||""==username){
			alert("请输入用户名");
			return false;
		}
		else if(userpass = null || ""==userpass){
			alert("请输入密码");
			return false;
		}
		else if(captcha == null || "" == captcha ){
			alert("请输入验证码");
			return false;
		}else{
			return true;
		}
	}
</script>
</html>