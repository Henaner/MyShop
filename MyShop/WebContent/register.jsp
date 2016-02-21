<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="favicon.ico">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/geo.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/birthday.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/js/icheck/skins/all.css" >
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-2.2.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/icheck/icheck.js"></script>
<title>家乡味会员注册</title>
</head>
<body onload="setup();preselect('');createCode()">
	<div id="reg_form_top" class="reg_form_top">
		<img class="register_top" src="./images/register_top.png" style="width:532px;height:65px;">
	</div>
	<div id="reg_form" class="reg_form" align="center">
		<form action="" method="post" name="reg_date">
			<table align="center" style="height:500px;" class="reg_table">
				<tr>
					<td>用户名&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><input type="text" name="userName" id="userName"
						class="userName" placeholder="请输入用户名"></td>
				</tr>
				<tr>
					<td>密码&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><input type="password" name="userPass" id="userPass"
						class="userPass" placeholder="请输入密码"></td>
				</tr>
				<tr>
					<td>确认密码&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><input type="password" name="userRepass" id="userRepass"
						class="userRepass" placeholder="请在输入一次"></td>
				</tr>
				<tr>
					<td>性别</td>
					<td><input type="radio" name="iCheck" id="gender"
						class="gender" value="男">&nbsp;男&nbsp;&nbsp;<input type="radio"
						name="iCheck" id="gender" class="gender" value="女">&nbsp;女</td>
				</tr>
				<tr>
					<td>生日</td>
					<td><select name="YYYY" id="check_input_year"
						onchange="YYYYDD(this.value)">
							<option>--选择-年-</option>
					</select> <select name="MM" id="check_input_month"
						onchange="MMDD(this.value)">
							<option>--选择-月-</option>
					</select> <select name="DD" id="check_input_day">
							<option>--选择-日-</option>
					</select></td>
				</tr>
				<tr>
					<td>所在地</td>
					<td><select class="select" name="province" id="s1"></select> <select
						class="select" name="city" id="s2"></select> <select
						class="select" name="town" id="s3"></select></td>
				</tr>
				<tr>
					<td>手机</td>
					<td><input type="text" name="userTel" id="userTel"
						class="userTel" placeholder="请输入手机号"></td>
				</tr>
				<tr>
					<td>邮箱</td>
					<td><input type="text" name="userEmail" id="userEmail"
						class="userEmail" placeholder="请输入邮箱"></td>
				</tr>
				<tr>
					<td>验证码</td>
					<td><input type="text" name="captcha" id="captcha"
						class="captcha" size="4" placeholder="验证码" maxlength="4"><div class="captcha_div"><img src="Captcha"
						style="cursor: pointer;" title="单击刷新验证码" alt="单击刷新验证码"
						onclick="this.src='Captcha?'+new Date().getTime();"></div>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="iCheck" id="item" class="item"></td>
					<td><div id="item_div" class="item_div">
							<a href="#">服务条款和隐私政策</a>
						</div></td>
				</tr>
				<tr>
					<th colspan="2"><input type="submit" style="height:30px;" value="同意协议并注册">&nbsp;&nbsp;&nbsp;&nbsp;<a href="login.jsp">已有账号</a></th>
				</tr>
			</table>
		</form>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		 $('input').iCheck({
		   checkboxClass: 'icheckbox_square-red',  // 注意square和blue的对应关系
		   radioClass: 'iradio_square-red',
		   increaseArea: '20%' // optional
		 });
	});
</script>
</html>