<%@page import="cn.wangchenhui.dao.IUserDao"%>
<%@page import="cn.wangchenhui.dao.ICartDao"%>
<%@page import="cn.wangchenhui.dao.CartDao"%>
<%@page import="cn.wangchenhui.model.Notice"%>
<%@page import="cn.wangchenhui.dao.INoticeDao"%>
<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@page import="cn.wangchenhui.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>header</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css">
</head>
<body>
<%
	User loginUser =(User)session.getAttribute("loginUser");
	INoticeDao noticeDao = DaoFactory.getNoticeDao();
	Notice notice = noticeDao.getNotice();
	int id = notice.getId();
	String title = notice.getNotice_title();
	String condition = (String)session.getAttribute("condition");
	if(condition == null){
		condition = "";
	}
%>
	<div style="width:100%;margin-left:-8px;height:50px;margin-top:-8px;background-color:#F2F2F2;" id="header_div">
		<div id="welcome_words">嗨！欢迎您来到家乡味商城</div>
		<div id="index_opt" style="margin-left:1100px;">
		<div id="catagory" style="margin-left:-700px;width:720px;margin-top:0px; line-height:35px;   ">
			<a href="<%=request.getContextPath() %>/category.jsp?category=1" target="_blank"><div id="catagory_1" style="cursor:pointer;color:white;background:#9D2A29;border-top-left-radius:15px;border-top-right-radius:15px;border:solid 1px #CCCCCC;height:35px;width:58px;float:left;margin:0 15px;">肉类精选</div></a>
			<a href="<%=request.getContextPath() %>/category.jsp?category=2" target="_blank"><div id="catagory_2" style="cursor:pointer;color:white;background:#9D2A29;border-top-left-radius:15px;border-top-right-radius:15px;border:solid 1px #CCCCCC;height:35px;width:58px;float:left;margin:0 15px;">粮油米面</div></a>
			<a href="<%=request.getContextPath() %>/category.jsp?category=3" target="_blank"><div id="catagory_3" style="cursor:pointer;color:white;background:#9D2A29;border-top-left-radius:15px;border-top-right-radius:15px;border:solid 1px #CCCCCC;height:35px;width:58px;float:left;margin:0 15px;">果蔬副食</div></a>
			<a href="<%=request.getContextPath() %>/category.jsp?category=4" target="_blank"><div id="catagory_4" style="cursor:pointer;color:white;background:#9D2A29;border-top-left-radius:15px;border-top-right-radius:15px;border:solid 1px #CCCCCC;height:35px;width:58px;float:left;margin:0 15px;">名茶名酒</div></a>
			<a href="<%=request.getContextPath() %>/category.jsp?category=5" target="_blank"><div id="catagory_5" style="cursor:pointer;color:white;background:#9D2A29;border-top-left-radius:15px;border-top-right-radius:15px;border:solid 1px #CCCCCC;height:35px;width:58px;float:left;margin:0 15px;">野生特产</div></a>
			<a href="<%=request.getContextPath() %>/category.jsp?category=6" target="_blank"><div id="catagory_6" style="cursor:pointer;color:white;background:#9D2A29;border-top-left-radius:15px;border-top-right-radius:15px;border:solid 1px #CCCCCC;height:35px;width:58px;float:left;margin:0 15px;">工艺礼品</div></a>
		</div>
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
		<div id="banner_year"><a href="<%=request.getContextPath() %>/index.jsp" title="新年快乐" alt="新年快乐"><img src="<%=request.getContextPath() %>/images/banner_year.png"></a></div>
		<form id="search_form" action="doSearch.jsp" method="get">
			<div id="banner_search">
				<div id="banner_search_img"></div>
				<div id="banner_search_input"><input type="text"  name = "condition" size="50" placeholder="请输入关键词:  如小磨香油" value="<%=condition%>"></div>
				<div id="banner_search_btn"><button type="submit" style="width:40px;height:30px;border:none;background-color:transparent;cursor:pointer;"></button></div>
			</div>
			<div id="notice" style="position:absolute;margin-top:15px;margin-left:500px;">
				<div style="position：absolute;margin-top:-6px;margin-left:30px;"><font color="red">最新公告</font></div> 
				<div style="position：absolute;margin-top:-14px;margin-left:100px;"><img src="<%=request.getContextPath()%>/images/gif/notice.gif" ></div>
			</div>
			<div id="notice_detail" style="position:absolute;margin-top:10px;margin-left:650px;width:430px;height:22px;">
				<a href="<%=request.getContextPath()%>/notice.jsp?id=<%=id%>"><%=title %></a>
			</div>
		</form>
		<div id="banner_cart" style="cursor:pointer;position:absolute;margin-left:1076px;">
			<%
						if(loginUser == null){
						
			%>
			<script type="text/javascript">
				function judge(){
					window.location.href='<%=request.getContextPath() %>/login.jsp';
				}
			</script>
			<div id="banner_cart_show" onclick="judge();">
				<img src="<%=request.getContextPath() %>/images/icon/cart_white.png" onclick="judge();" style="height:30px;width:30px;">
				<p id="cart_num" style="color:white;font-size:18px;" >
					购物车(0)
				</p>
			</div>
			<%
						}else{
							int user_id = loginUser.getUser_id();
							ICartDao cartDao = DaoFactory.getCartDao();
							int count = cartDao.getCount(user_id);
			%>
			<script type="text/javascript">
				function judge(){
					window.location.href='<%=request.getContextPath() %>/lockPages/goods/addCart.jsp?user_id=<%=user_id%>';
				}
			</script>
			<div id="banner_cart_show" onclick="judge();">
				<img src="<%=request.getContextPath() %>/images/icon/cart_white.png" onclick="judge();" style="height:30px;width:30px;">
				<p id="cart_num" style="color:white;font-size:18px;" >
					购物车(<%=count%>)
				</p>
			</div>
			<%
				}
			%>
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
	        /*控制导航条的变化*/
	        $("#catagory_1").mouseover(function(){
	        	$("#catagory_1").css("background-color","green");
	        });
	        $("#catagory_1").mouseout(function(){
	        	$("#catagory_1").css("background-color","#9D2A29");
	        });
	        
	        $("#catagory_2").mouseover(function(){
	        	$("#catagory_2").css("background-color","green");
	        });
	        $("#catagory_2").mouseout(function(){
	        	$("#catagory_2").css("background-color","#9D2A29");
	        });
	        
	        $("#catagory_3").mouseover(function(){
	        	$("#catagory_3").css("background-color","green");
	        });
	        $("#catagory_3").mouseout(function(){
	        	$("#catagory_3").css("background-color","#9D2A29");
	        });
	        
	        $("#catagory_4").mouseover(function(){
	        	$("#catagory_4").css("background-color","green");
	        });
	        $("#catagory_4").mouseout(function(){
	        	$("#catagory_4").css("background-color","#9D2A29");
	        });
	        
	        $("#catagory_5").mouseover(function(){
	        	$("#catagory_5").css("background-color","green");
	        });
	        $("#catagory_5").mouseout(function(){
	        	$("#catagory_5").css("background-color","#9D2A29");
	        });
	        
	        $("#catagory_6").mouseover(function(){
	        	$("#catagory_6").css("background-color","green");
	        });
	        $("#catagory_6").mouseout(function(){
	        	$("#catagory_6").css("background-color","#9D2A29");
	        });
	    });
	</script>
</body>
</html>