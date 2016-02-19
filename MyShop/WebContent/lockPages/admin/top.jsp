<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Calendar calendar = Calendar.getInstance();
	int year = calendar.get(Calendar.YEAR);
	int month = calendar.get(Calendar.MONTH)+1;
	int date = calendar.get(calendar.DATE);
	String dateString = year+"年"+month+"月"+date+"日";
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css"> 
<div id="admin_top_div" style="background:url(<%=request.getContextPath()%>/images/admin_top_banner.png) no-repeat 0 center;width:120%;height:100px;margin-top:-10px;margin-left:-10px;position: absolute;">
	<div id="top_logo" style="margin-left:100px;position: absolute;">
		<img src="<%=request.getContextPath()%>/images/logo.png" style="width:60px;height:60px;margin-top:20px;margin-left:5px;">
		<img src="<%=request.getContextPath()%>/images/admin_top_text.png" style="width:290px;height:69px;">
	</div>
	<div style="width:500px;height:30px;border-bottom-right-radius:15px;border-bottom-left-radius:15px;background:url(<%=request.getContextPath()%>/images/banner.jpg) no-repeat 0 center;margin-left:800px;margin-top:-20px;">
		<h4 align="center" ><a href="#">商城首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">修改密码</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">退出登录</a></h4>
	</div>
	<div id="top_text" style="margin-top:30px;color:white;margin-left:1000px;">
		管理员您好,今天是<%=dateString %>
	</div>
</div>