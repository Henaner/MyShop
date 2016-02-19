<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="favicon.ico">
<link rel="stylesheet" href="../css/main.css">
<title>家乡味后台登录</title>
</head>
<body style="background: url(../images/adminBG.png);">
	<div class="div_login">
		<form action="" method="post">
			<table align="center" style="margin-top: 360px;">
				<tr>
					<td>账号&nbsp;</td>
					<td><input type="text" name="userName"></td>
				</tr>
				<tr>
					<td>密码&nbsp;</td>
					<td><input type="password" name="userPass"></td>
				</tr>
				<tr align="right">
					<th colspan="2"><input type="submit" class="btn_login"
						value="登录"> <input type="reset" class="btn_login"
						value="清空"></th>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>