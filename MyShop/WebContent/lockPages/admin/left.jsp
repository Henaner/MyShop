<%@page import="cn.wangchenhui.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.12.0.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css"> 
</head>
<body style="background-color:#ECEADB;">
	<div id="left_div_total" style="margin-top:0px;margin-left:-2px;">
		<!-- 图片轮播 -->
		<div style="cursor:pointer;" id="left_div_slide" class="left_div"><img id="arrow" src="<%=request.getContextPath()%>/images/icon/backstage/Arrow_Right_24px_523784_easyicon.net.png"><p>图片轮播管理</p><div id="img"><img src="<%=request.getContextPath()%>/images/icon/backstage/settings_16px_1187941_easyicon.net.png"></div></div>
		<div id="left_div_slide_panel" class="left_div_panel" align="center">
		<br>
				<a href="<%=request.getContextPath()%>/lockPages/admin/imgSlide.jsp" target="main">图片轮播管理</a><br>
		</div>
		<!-- 用户管理 -->
		<div style="cursor:pointer;" id="left_div_user" class="left_div"><img id="arrow" src="<%=request.getContextPath()%>/images/icon/backstage/Arrow_Right_24px_523784_easyicon.net.png"><p>商城会员管理</p><div id="img"><img src="<%=request.getContextPath()%>/images/icon/backstage/settings_16px_1187941_easyicon.net.png"></div></div>
		<div id="left_div_user_panel" class="left_div_panel" align="center">
		<br>
				<a href="<%=request.getContextPath()%>/lockPages/user/userList.jsp" target="main">商城会员管理</a><br>
		</div>
		<!-- 用户订单 -->
		<div style="cursor:pointer;" id="left_div_order" class="left_div"><img id="arrow" src="<%=request.getContextPath()%>/images/icon/backstage/Arrow_Right_24px_523784_easyicon.net.png"><p>用户订单管理</p><div id="img"><img src="<%=request.getContextPath()%>/images/icon/backstage/settings_16px_1187941_easyicon.net.png"></div></div>
		<div id="left_div_order_panel" class="left_div_panel" align="center">
				<br>
				<a href="<%=request.getContextPath()%>/lockPages/user/ordManage.jsp" target="main">用户订单管理</a><br>
		</div>
		<!-- 商品管理 -->
		<div style="cursor:pointer;" id="left_div_goods" class="left_div"><img id="arrow" src="<%=request.getContextPath()%>/images/icon/backstage/Arrow_Right_24px_523784_easyicon.net.png"><p>商品管理</p><div id="img"><img src="<%=request.getContextPath()%>/images/icon/backstage/settings_16px_1187941_easyicon.net.png"></div></div>
		<div id="left_div_goods_panel" class="left_div_panel"  align="center">
				<br>
				<a href="<%=request.getContextPath()%>/lockPages/goods/gooodsManage.jsp" target="main">商品管理</a><br>
				<a href="<%=request.getContextPath()%>/lockPages/goods/gooodsAdd.jsp" target="main">商品新增</a><br>
		</div>
		<!-- 公告管理 -->
		<div style="cursor:pointer;" id="left_div_notice" class="left_div"><img id="arrow" src="<%=request.getContextPath()%>/images/icon/backstage/Arrow_Right_24px_523784_easyicon.net.png"><p>商城公告管理</p><div id="img"><img src="<%=request.getContextPath()%>/images/icon/backstage/settings_16px_1187941_easyicon.net.png"></div></div>
		<div id="left_div_notice_panel" class="left_div_panel" align="center">
				<br>
				<a href="<%=request.getContextPath()%>/lockPages/admin/noticeList.jsp" target="main">商城公告管理</a><br>
				<a href="<%=request.getContextPath()%>/lockPages/admin/addNotice.jsp" target="main">添加商城公告</a><br>
		</div>
		<%
			User loginOpt = (User)session.getAttribute("loginOpt");
			if(loginOpt.getIs_admin().equals("N")){}else{
		%>
		<!-- 操作员管理 -->
		<div style="cursor:pointer;" id="left_div_opt" class="left_div"><img id="arrow" src="<%=request.getContextPath()%>/images/icon/backstage/Arrow_Right_24px_523784_easyicon.net.png"><p>操作员管理</p><div id="img"><img src="<%=request.getContextPath()%>/images/icon/backstage/settings_16px_1187941_easyicon.net.png"></div></div>
		<div id="left_div_opt_panel" class="left_div_panel"  align="center">
				<br>
				<a href="<%=request.getContextPath()%>/lockPages/admin/optList.jsp" target="main">操作员管理</a><br>
				
		</div>
		<%
			}
		%>
		<!-- 评价管理 -->
		<div style="cursor:pointer;" id="left_div_evaluate" class="left_div"><img id="arrow" src="<%=request.getContextPath()%>/images/icon/backstage/Arrow_Right_24px_523784_easyicon.net.png"><p>用户评价管理</p><div id="img"><img src="<%=request.getContextPath()%>/images/icon/backstage/settings_16px_1187941_easyicon.net.png"></div></div>
		<div  id="left_div_evaluate_panel" class="left_div_panel" align="center">
				<br>
				<a href="<%=request.getContextPath()%>/lockPages/admin/commentManage.jsp" target="main">用户评价管理</a><br>
		</div>
			</div>
</body>
<style type="text/css">
	.left_div{
		width:180px;
		height:30px;
		border:solid 2px grey;
		border-style:dotted;
		/*background: #BF4B25;*/
	}
	.left_div img{
		margin-top:3px;
	}
	.left_div #img{margin-top:-38px;margin-left:160px;}
	.left_div p{
		margin-top:-23px;
		margin-left:30px;
	}
	.left_div_panel{
		display:none;
		width:180px;
		height:150px;
		border:solid 1px grey;
	}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#left_div_slide").click(function(){
			$("#left_div_slide_panel").slideToggle("slow",function(){
				if($(this).is(":hidden")){
					$("#left_div_slide #arrow").attr("src","<%=request.getContextPath()%>/images/icon/backstage/Arrow_Right_24px_523784_easyicon.net.png");
				}else{
					$("#left_div_slide #arrow").attr("src","<%=request.getContextPath()%>/images/icon/backstage/Arrow_Down_24px_523786_easyicon.net.png");
				}
			});		
		});
		
		
		$("#left_div_user").click(function(){
			$("#left_div_user_panel").slideToggle("slow",function(){
				if($(this).is(":hidden")){
					$("#left_div_user #arrow").attr("src","<%=request.getContextPath()%>/images/icon/backstage/Arrow_Right_24px_523784_easyicon.net.png");
				}else{
					$("#left_div_user #arrow").attr("src","<%=request.getContextPath()%>/images/icon/backstage/Arrow_Down_24px_523786_easyicon.net.png");
				}
			});		
		});
		
		
		$("#left_div_opt").click(function(){
			$("#left_div_opt_panel").slideToggle("slow",function(){
				if($(this).is(":hidden")){
					$("#left_div_opt #arrow").attr("src","<%=request.getContextPath()%>/images/icon/backstage/Arrow_Right_24px_523784_easyicon.net.png");
				}else{
					$("#left_div_opt #arrow").attr("src","<%=request.getContextPath()%>/images/icon/backstage/Arrow_Down_24px_523786_easyicon.net.png");
				}
			});		
		});
		
		$("#left_div_order").click(function(){
			$("#left_div_order_panel").slideToggle("slow",function(){
				if($(this).is(":hidden")){
					$("#left_div_order #arrow").attr("src","<%=request.getContextPath()%>/images/icon/backstage/Arrow_Right_24px_523784_easyicon.net.png");
				}else{
					$("#left_div_order #arrow").attr("src","<%=request.getContextPath()%>/images/icon/backstage/Arrow_Down_24px_523786_easyicon.net.png");
				}
			});		
		});
		
		$("#left_div_notice").click(function(){
			$("#left_div_notice_panel").slideToggle("slow",function(){
				if($(this).is(":hidden")){
					$("#left_div_notice #arrow").attr("src","<%=request.getContextPath()%>/images/icon/backstage/Arrow_Right_24px_523784_easyicon.net.png");
				}else{
					$("#left_div_notice #arrow").attr("src","<%=request.getContextPath()%>/images/icon/backstage/Arrow_Down_24px_523786_easyicon.net.png");
				}
			});		
		});
		
		$("#left_div_evaluate").click(function(){
			$("#left_div_evaluate_panel").slideToggle("slow",function(){
				if($(this).is(":hidden")){
					$("#left_div_evaluate #arrow").attr("src","<%=request.getContextPath()%>/images/icon/backstage/Arrow_Right_24px_523784_easyicon.net.png");
				}else{
					$("#left_div_evaluate #arrow").attr("src","<%=request.getContextPath()%>/images/icon/backstage/Arrow_Down_24px_523786_easyicon.net.png");
				}
			});		
		});
		
		$("#left_div_goods").click(function(){
			$("#left_div_goods_panel").slideToggle("slow",function(){
				if($(this).is(":hidden")){
					$("#left_div_goods #arrow").attr("src","<%=request.getContextPath()%>/images/icon/backstage/Arrow_Right_24px_523784_easyicon.net.png");
				}else{
					$("#left_div_goods #arrow").attr("src","<%=request.getContextPath()%>/images/icon/backstage/Arrow_Down_24px_523786_easyicon.net.png");
				}
			});		
		});
	});
</script>
</html>