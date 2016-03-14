<%@page import="cn.wangchenhui.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>header</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-2.2.0.min.js"></script>
</head>
<body>
<%
	User loginUser =(User)session.getAttribute("loginUser");
%>
	<div style="position:absolute;width:110%;height:50px;margin-top:0px;background-color:#F2F2F2;" id="header_div">
		<div id="welcome_words">嗨！欢迎您来到家乡味商城</div>
		<div id="index_opt" style="margin-left:1100px;">
		<%
			if(loginUser==null){
		%>
			<img src="<%=request.getContextPath() %>/images/icon/login.png" style="height:14px;width:14px;">
			<a href="login.jsp">登录</a>
			&nbsp;&nbsp;|&nbsp;&nbsp;
			<img src="<%=request.getContextPath() %>/images/icon/register.png" style="height:14px;width:14px;">
			<a href="register.jsp">注册</a>
		<%
			}else{
		%>
			<a href="<%=request.getContextPath() %>/lockPages/user/userProfile.jsp"><%=loginUser.getUser_name() %></a>
			&nbsp;&nbsp;|&nbsp;&nbsp;
			<img src="<%=request.getContextPath() %>/images/icon/exit.png" style="height:14px;width:14px;">
			<a href="<%=request.getContextPath()%>/logout.jsp">退出</a>
		<%
			}
		%>
		</div>
		<div id="banner_year"><a href="#" title="新年快乐" alt="新年快乐"><img src="<%=request.getContextPath() %>/images/banner_year.png"></a></div>
		<form id="search_form" action="doSearch.jsp" method="get">
			<div id="banner_search">
				<div id="banner_search_img"></div>
				<div id="banner_search_input"><input type="text"  size="50" placeholder="请输入关键词:  如小磨香油"></div>
				<div id="banner_search_btn"><button type="submit" style="width:40px;height:30px;border:none;background-color:transparent;cursor:pointer;"></button></div>
			</div>
		</form>
		<div id="banner_cart" style="cursor:pointer;">
			<div id="banner_cart_show">
				<img src="<%=request.getContextPath() %>/images/icon/cart_white.png" style="height:30px;width:30px;">
				<p id="cart_num" style="color:white;font-size:18px;">购物车(0)</p>
			</div>
			<div id="banner_cart_hide" style="display:none;">
				购物车空空如也
			</div>
	</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function(e) {
	        $("#banner_search_input input").focus(function(){
	        	$("#banner_search_img").css("background-color","#F4F4F4");
	        });
	        $("#banner_search_input input").blur(function(){
	        	$("#banner_search_img").css("background-color","");
	        });
	        $("#banner_search_img img").mouseover(function(){
	        	$("#banner_search_img").css("background-color","#F4F4F4");
	        });
	        $("#banner_search_img img").mouseleave(function(){
	        	$("#banner_search_img").css("background-color","");
	        });
	        $("#banner_search_btn button").mouseover(function(){
	        	$("#banner_search_img").css("background-color","#F4F4F4");
	        });
	        $("#banner_search_btn button").mouseleave(function(){
	        	$("#banner_search_img").css("background-color","");
	        });
	        $("#banner_cart").mouseover(function(){
	        	$("#banner_cart").css("background-color","white");
	        	$("#banner_cart p").css("color","#CA0618");
	        	$("#banner_cart img").attr("src","<%=request.getContextPath()%>/images/icon/cart.png");
	        	$("#banner_cart").css("border","solid 1px #CA0618");
	        });
	        $("#banner_cart").mouseleave(function(){
	        	$("#banner_cart img").attr("src","<%=request.getContextPath()%>/images/icon/cart_white.png");
	        	$("#banner_cart").css("background-color","#CA0618");
	        	$("#banner_cart p").css("color","white");
	        	$("#banner_cart").css("border","none");
	        });
	    });
	</script>
</body>
</html>