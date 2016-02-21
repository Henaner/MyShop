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
		<form action="" method="post">
			<table align="center" style="margin-top:340px;margin-left:580px;">
				<tr>
					<td>账号&nbsp;</td>
					<td><input type="text" name="userName"></td>
				</tr>
				<tr>
					<td>密码&nbsp;</td>
					<td><input type="password" name="userPass"></td>
				</tr>
				<tr>
					<td>验证码</td>
					<td>
						<input type="text" name="captcha" id="captcha"
						class="captcha" size="4"  maxlength="4"><div style="position:absolute ;margin-top:-30px;margin-left:60px;"><img src="<%=request.getContextPath()%>/Captcha"
						style="cursor: pointer;" title="单击刷新验证码" alt="单击刷新验证码"
						onclick="this.src='<%=request.getContextPath()%>/Captcha?'+new Date().getTime();"></div>
					</td>
				</tr>
				<tr align="center">
					<th colspan="2"><input type="submit" class="admin_btn_login"
						value="登录"> <input type="reset" class="admin_btn_login"
						value="清空"></th>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>