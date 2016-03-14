<%@page import="cn.wangchenhui.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="<%=request.getContextPath() %>/favicon.ico">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/top.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/slider.js"></script>
<script type="text/javascript" language="javascript">
	window.onload=function(){
		//这里是图片轮播的js
		slider_show.scroll(3,"img_list","show_img_module","show_img_desc");
	}
</script>
<title>家乡味首页</title>
</head>
<body>

	<div id="include_header_bannner">
		<div id="include_header">
			<jsp:include page="/lockPages/user/header.jsp"></jsp:include>
		</div>
	</div>
	<div id="show_img">	
		<div id="show_img_bg"></div>  <!--轮播图片介绍的背景-->
		<a href="#" id="show_img_desc"></a> <!--轮播图片的介绍-->
	    <ul id="show_img_module"></ul><!-- 图片轮播模块介绍的模块 -->
  		 <div id="img_list">
	        <a href="#" target="_blank"><img src="<%=request.getContextPath()%>/images/slider_img/b0.jpg" title="欢乐购购购"  /></a>
	        <a href="#" target="_blank"><img src="<%=request.getContextPath()%>/images/slider_img/b1.jpg" title="源自大自然"  /></a>
	        <a href="#" target="_blank"><img src="<%=request.getContextPath()%>/images/slider_img/b2.jpg" title="吃出家乡的感觉"  /></a>
		</div>
	</div>
	<div id="goods_hot" >
			<!-- 这里是商品的展示 -->
			<div id="goods_hot_logo"><img src="<%=request.getContextPath()%>/images/icon/zdzb.png"></div>
			<div id="goods_hot_more"><a href="#">更多</a></div>
			<div id="goods_hot_list">
			
				<!-- 热门商品6个展示 -->
				<div id="goods_hot_list_1">
					<div id="goods_title_hot_1" style="position:absolute;display:none;width:220px;height:80px;background:#CCCCCC;margin-top:0px;">这个商品的名称</div>
					<img src="<%=request.getContextPath()%>/images/demo/4.jpg" >
					<p align="center" style="postion:absolute;margin-top:10px;">RMB:<font color="#9D2A29" size="+1">￥88.88</font></p>
					<form action="" method="post">
						<input type="submit" value="加入购物车" style="position:absolute;border-radius:5px;height:30px;width:80px;cursor:pointer;color:white;margin-left:10px;margin-top:20px;background-color:#9D2A29 ;">
					</form>
					<form action="#" method="post">
						<input type="submit" value="购买" style="position:absolute;border-radius:5px;margin-left:130px;width:80px;margin-top:20px;height:30px;cursor:pointer;color:white; background-color:#9D2A29 ;">
					</form>
				</div>
				
				
				<div id="goods_hot_list_2" >
					<div id="goods_title_hot_2" style="position:absolute;display:none;width:220px;height:80px;background:#CCCCCC;margin-top:0px;">这个商品的名称</div>
					<img src="<%=request.getContextPath()%>/images/demo/5.jpg" >
					<p align="center" style="postion:absolute;margin-top:10px;">RMB:<font color="#9D2A29" size="+1">￥88.88</font></p>
					<form action="" method="post">
						<input type="submit" value="加入购物车" style="position:absolute;border-radius:5px;height:30px;width:80px;cursor:pointer;color:white;margin-left:10px;margin-top:20px;background-color:#9D2A29 ;">
					</form>
					<form action="#" method="post">
						<input type="submit" value="购买" style="position:absolute;border-radius:5px;margin-left:130px;width:80px;margin-top:20px;height:30px;cursor:pointer;color:white; background-color:#9D2A29 ;">
					</form>
				</div>
				
				
				<div id="goods_hot_list_3" >
					<div id="goods_title_hot_3" style="position:absolute;display:none;width:220px;height:80px;background:#CCCCCC;margin-top:0px;">这个商品的名称</div>
					<img src="<%=request.getContextPath()%>/images/demo/6.jpg" >
					<p align="center" style="postion:absolute;margin-top:10px;">RMB:<font color="#9D2A29" size="+1">￥88.88</font></p>
					<form action="" method="post">
						<input type="submit" value="加入购物车" style="position:absolute;border-radius:5px;height:30px;width:80px;cursor:pointer;color:white;margin-left:10px;margin-top:20px;background-color:#9D2A29 ;">
					</form>
					<form action="#" method="post">
						<input type="submit" value="购买" style="position:absolute;border-radius:5px;margin-left:130px;width:80px;margin-top:20px;height:30px;cursor:pointer;color:white; background-color:#9D2A29 ;">
					</form>
				</div>
				
				
				<div id="goods_hot_list_4" >
					<div id="goods_title_hot_4" style="position:absolute;display:none;width:220px;height:80px;background:#CCCCCC;margin-top:0px;">这个商品的名称</div>
					<img src="<%=request.getContextPath()%>/images/demo/7.jpg" >
					<p align="center" style="postion:absolute;margin-top:10px;">RMB:<font color="#9D2A29" size="+1">￥88.88</font></p>
					<form action="" method="post">
						<input type="submit" value="加入购物车" style="position:absolute;border-radius:5px;height:30px;width:80px;cursor:pointer;color:white;margin-left:10px;margin-top:20px;background-color:#9D2A29 ;">
					</form>
					<form action="#" method="post">
						<input type="submit" value="购买" style="position:absolute;border-radius:5px;margin-left:130px;width:80px;margin-top:20px;height:30px;cursor:pointer;color:white; background-color:#9D2A29 ;">
					</form>
				</div>
				
				
				<div id="goods_hot_list_5" >
					<div id="goods_title_hot_5" style="position:absolute;display:none;width:220px;height:80px;background:#CCCCCC;margin-top:0px;">这个商品的名称</div>
					<img src="<%=request.getContextPath()%>/images/demo/8.jpg" >
					<p align="center" style="postion:absolute;margin-top:10px;">RMB:<font color="#9D2A29" size="+1">￥88.88</font></p>
					<form action="" method="post">
						<input type="submit" value="加入购物车" style="position:absolute;border-radius:5px;height:30px;width:80px;cursor:pointer;color:white;margin-left:10px;margin-top:20px;background-color:#9D2A29 ;">
					</form>
					<form action="#" method="post">
						<input type="submit" value="购买" style="position:absolute;border-radius:5px;margin-left:130px;width:80px;margin-top:20px;height:30px;cursor:pointer;color:white; background-color:#9D2A29 ;">
					</form>
				</div>
				
				
				<div id="goods_hot_list_6" >
					<div id="goods_title_hot_6" style="position:absolute;display:none;width:220px;height:80px;background:#CCCCCC;margin-top:0px;">这个商品的名称</div>
					<img src="<%=request.getContextPath()%>/images/demo/9.jpg" >
					<p align="center" style="postion:absolute;margin-top:10px;">RMB:<font color="#9D2A29" size="+1">￥88.88</font></p>
					<form action="" method="post">
						<input type="submit" value="加入购物车" style="position:absolute;border-radius:5px;height:30px;width:80px;cursor:pointer;color:white;margin-left:10px;margin-top:20px;background-color:#9D2A29 ;">
					</form>
					<form action="#" method="post">
						<input type="submit" value="购买" style="position:absolute;border-radius:5px;margin-left:130px;width:80px;margin-top:20px;height:30px;cursor:pointer;color:white; background-color:#9D2A29 ;">
					</form>
				</div>
				
				
			</div>
			
	</div>
	<div id="goods_new">
		<!-- 这里是商品的展示 -->
			<div id="goods_new_logo"><img src="<%=request.getContextPath()%>/images/icon/xptj.png"></div>
			<div id="goods_new_more"><a href="#">更多</a></div>
			<div id="goods_new_list">
			<!-- 新增商品6个展示 -->
				<div id="goods_new_list_1" >
					<div id="goods_title_new_1" style="position:absolute;display:none;width:220px;height:80px;background:#CCCCCC;margin-top:0px;">这个商品的名称</div>
					<img src="<%=request.getContextPath()%>/images/demo/4.jpg" >
					<p align="center" style="postion:absolute;margin-top:10px;">RMB:<font color="#9D2A29" size="+1">￥88.88</font></p>
					<form action="" method="post">
						<input type="submit" value="加入购物车" style="position:absolute;border-radius:5px;height:30px;width:80px;cursor:pointer;color:white;margin-left:10px;margin-top:20px;background-color:#9D2A29 ;">
					</form>
					<form action="#" method="post">
						<input type="submit" value="购买" style="position:absolute;border-radius:5px;margin-left:130px;width:80px;margin-top:20px;height:30px;cursor:pointer;color:white; background-color:#9D2A29 ;">
					</form>
				</div>
				
				
				<div id="goods_new_list_2" >
					<div id="goods_title_new_2" style="position:absolute;display:none;width:220px;height:80px;background:#CCCCCC;margin-top:0px;">这个商品的名称</div>
					<img src="<%=request.getContextPath()%>/images/demo/5.jpg" >
					<p align="center" style="postion:absolute;margin-top:10px;">RMB:<font color="#9D2A29" size="+1">￥88.88</font></p>
					<form action="" method="post">
						<input type="submit" value="加入购物车" style="position:absolute;border-radius:5px;height:30px;width:80px;cursor:pointer;color:white;margin-left:10px;margin-top:20px;background-color:#9D2A29 ;">
					</form>
					<form action="#" method="post">
						<input type="submit" value="购买" style="position:absolute;border-radius:5px;margin-left:130px;width:80px;margin-top:20px;height:30px;cursor:pointer;color:white; background-color:#9D2A29 ;">
					</form>
				</div>
				
				
				<div id="goods_new_list_3" >
					<div id="goods_title_new_3" style="position:absolute;display:none;width:220px;height:80px;background:#CCCCCC;margin-top:0px;">这个商品的名称</div>
					<img src="<%=request.getContextPath()%>/images/demo/6.jpg" >
					<p align="center" style="postion:absolute;margin-top:10px;">RMB:<font color="#9D2A29" size="+1">￥88.88</font></p>
					<form action="" method="post">
						<input type="submit" value="加入购物车" style="position:absolute;border-radius:5px;height:30px;width:80px;cursor:pointer;color:white;margin-left:10px;margin-top:20px;background-color:#9D2A29 ;">
					</form>
					<form action="#" method="post">
						<input type="submit" value="购买" style="position:absolute;border-radius:5px;margin-left:130px;width:80px;margin-top:20px;height:30px;cursor:pointer;color:white; background-color:#9D2A29 ;">
					</form>
				</div>
				
				
				<div id="goods_new_list_4" >
					<div id="goods_title_new_4" style="position:absolute;display:none;width:220px;height:80px;background:#CCCCCC;margin-top:0px;">这个商品的名称</div>
					<img src="<%=request.getContextPath()%>/images/demo/7.jpg" >
					<p align="center" style="postion:absolute;margin-top:10px;">RMB:<font color="#9D2A29" size="+1">￥88.88</font></p>
					<form action="" method="post">
						<input type="submit" value="加入购物车" style="position:absolute;border-radius:5px;height:30px;width:80px;cursor:pointer;color:white;margin-left:10px;margin-top:20px;background-color:#9D2A29 ;">
					</form>
					<form action="#" method="post">
						<input type="submit" value="购买" style="position:absolute;border-radius:5px;margin-left:130px;width:80px;margin-top:20px;height:30px;cursor:pointer;color:white; background-color:#9D2A29 ;">
					</form>
				</div>
				
				
				<div id="goods_new_list_5" >
					<div id="goods_title_new_5" style="position:absolute;display:none;width:220px;height:80px;background:#CCCCCC;margin-top:0px;">这个商品的名称</div>
					<img src="<%=request.getContextPath()%>/images/demo/8.jpg" >
					<p align="center" style="postion:absolute;margin-top:10px;">RMB:<font color="#9D2A29" size="+1">￥88.88</font></p>
					<form action="" method="post">
						<input type="submit" value="加入购物车" style="position:absolute;border-radius:5px;height:30px;width:80px;cursor:pointer;color:white;margin-left:10px;margin-top:20px;background-color:#9D2A29 ;">
					</form>
					<form action="#" method="post">
						<input type="submit" value="购买" style="position:absolute;border-radius:5px;margin-left:130px;width:80px;margin-top:20px;height:30px;cursor:pointer;color:white; background-color:#9D2A29 ;">
					</form>
				</div>
				
				
				<div id="goods_new_list_6" >
					<div id="goods_title_new_6" style="position:absolute;display:none;width:220px;height:80px;background:#CCCCCC;margin-top:0px;">这个商品的名称</div>
					<img src="<%=request.getContextPath()%>/images/demo/9.jpg" >
					<p align="center" style="postion:absolute;margin-top:10px;">RMB:<font color="#9D2A29" size="+1">￥88.88</font></p>
					<form action="" method="post">
						<input type="submit" value="加入购物车" style="position:absolute;border-radius:5px;height:30px;width:80px;cursor:pointer;color:white;margin-left:10px;margin-top:20px;background-color:#9D2A29 ;">
					</form>
					<form action="#" method="post">
						<input type="submit" value="购买" style="position:absolute;border-radius:5px;margin-left:130px;width:80px;margin-top:20px;height:30px;cursor:pointer;color:white; background-color:#9D2A29 ;">
					</form>
				</div>
				
				
			</div>
	</div>
	<!-- 加入版权信息 -->
	<div id="#include_bottom" style="position:absolute;margin-top:2450px;margin-left:150px;">
		<jsp:include page="/bottom.jsp"></jsp:include>
	</div>
</body>
	<script type="text/javascript">
$(document).ready(function(e) {
	//这里控制的是热销商品
	 $("#goods_hot_list_1").mouseover(function(){
			$("#goods_hot_list_1").css("border","solid 1px #9D2A29");
			$("#goods_hot_list_1 input").css("border","solid 1px #9D2A29");
			$("#goods_title_hot_1").css("display","block");
		});
    	
	$("#goods_hot_list_1").mouseleave(function(){
		$("#goods_hot_list_1").css("border","solid 1px #EEEEEE");
		$("#goods_hot_list_1 input").css("border","solid 1px #EEEEEE");
		$("#goods_title_hot_1").css("display","none");
	});
	
	
	$("#goods_hot_list_2").mouseover(function(){
		$("#goods_hot_list_2").css("border","solid 1px #9D2A29");
		$("#goods_hot_list_2 input").css("border","solid 1px #9D2A29");
		$("#goods_title_hot_2").css("display","block");
	});

	$("#goods_hot_list_2").mouseleave(function(){
		$("#goods_hot_list_2").css("border","solid 1px #EEEEEE");
		$("#goods_hot_list_2 input").css("border","solid 1px #EEEEEE");
		$("#goods_title_hot_2").css("display","none");
	});
	
	
	$("#goods_hot_list_3").mouseover(function(){
		$("#goods_hot_list_3").css("border","solid 1px #9D2A29");
		$("#goods_hot_list_3 input").css("border","solid 1px #9D2A29");
		$("#goods_title_hot_3").css("display","block");
	});

	$("#goods_hot_list_3").mouseleave(function(){
		$("#goods_hot_list_3").css("border","solid 1px #EEEEEE");
		$("#goods_hot_list_3 input").css("border","solid 1px #EEEEEE");
		$("#goods_title_hot_3").css("display","none");
	});
	
	
	$("#goods_hot_list_4").mouseover(function(){
		$("#goods_hot_list_4").css("border","solid 1px #9D2A29");
		$("#goods_hot_list_4 input").css("border","solid 1px #9D2A29");
		$("#goods_title_hot_4").css("display","block");
	});

	$("#goods_hot_list_4").mouseleave(function(){
		$("#goods_hot_list_4").css("border","solid 1px #EEEEEE");
		$("#goods_hot_list_4 input").css("border","solid 1px #EEEEEE");
		$("#goods_title_hot_4").css("display","none");
	});
	
	
	$("#goods_hot_list_5").mouseover(function(){
		$("#goods_hot_list_5").css("border","solid 1px #9D2A29");
		$("#goods_hot_list_5 input").css("border","solid 1px #9D2A29");
		$("#goods_title_hot_5").css("display","block");
	});		
	$("#goods_hot_list_5").mouseout(function(){
		$("#goods_hot_list_5").css("border","solid 1px #EEEEEE");
		$("#goods_hot_list_5 input").css("border","solid 1px #EEEEEE");
		$("#goods_title_hot_5").css("display","none");
	});
	
	
	$("#goods_hot_list_6").mouseover(function(){
		$("#goods_hot_list_6").css("border","solid 1px #9D2A29");
		$("#goods_hot_list_6 input").css("border","solid 1px #9D2A29");
		$("#goods_title_hot_6").css("display","block");
	});
	$("#goods_hot_list_6").mouseleave(function(){
		$("#goods_hot_list_6").css("border","solid 1px #EEEEEE");
		$("#goods_hot_list_6 input").css("border","solid 1px #EEEEEE");
		$("#goods_title_hot_6").css("display","none");
	});
	//这里控制的是新品
    $("#goods_new_list_1").mouseover(function(){
			$("#goods_new_list_1").css("border","solid 1px #9D2A29");
			$("#goods_new_list_1 input").css("border","solid 1px #9D2A29");
			$("#goods_title_new_1").css("display","block");
		});
    	
	$("#goods_new_list_1").mouseleave(function(){
		$("#goods_new_list_1").css("border","solid 1px #EEEEEE");
		$("#goods_new_list_1 input").css("border","solid 1px #EEEEEE");
		$("#goods_title_new_1").css("display","none");
	});
	
	
	$("#goods_new_list_2").mouseover(function(){
		$("#goods_new_list_2").css("border","solid 1px #9D2A29");
		$("#goods_new_list_2 input").css("border","solid 1px #9D2A29");
		$("#goods_title_new_2").css("display","block");
	});

	$("#goods_new_list_2").mouseleave(function(){
		$("#goods_new_list_2").css("border","solid 1px #EEEEEE");
		$("#goods_new_list_2 input").css("border","solid 1px #EEEEEE");
		$("#goods_title_new_2").css("display","none");
	});
	
	
	$("#goods_new_list_3").mouseover(function(){
		$("#goods_new_list_3").css("border","solid 1px #9D2A29");
		$("#goods_new_list_3 input").css("border","solid 1px #9D2A29");
		$("#goods_title_new_3").css("display","block");
	});

	$("#goods_new_list_3").mouseleave(function(){
		$("#goods_new_list_3").css("border","solid 1px #EEEEEE");
		$("#goods_new_list_3 input").css("border","solid 1px #EEEEEE");
		$("#goods_title_new_3").css("display","none");
	});
	
	
	$("#goods_new_list_4").mouseover(function(){
		$("#goods_new_list_4").css("border","solid 1px #9D2A29");
		$("#goods_new_list_4 input").css("border","solid 1px #9D2A29");
		$("#goods_title_new_4").css("display","block");
	});

	$("#goods_new_list_4").mouseleave(function(){
		$("#goods_new_list_4").css("border","solid 1px #EEEEEE");
		$("#goods_new_list_4 input").css("border","solid 1px #EEEEEE");
		$("#goods_title_new_4").css("display","none");
	});
	
	
	$("#goods_new_list_5").mouseover(function(){
		$("#goods_new_list_5").css("border","solid 1px #9D2A29");
		$("#goods_new_list_5 input").css("border","solid 1px #9D2A29");
		$("#goods_title_new_5").css("display","block");
	});		
	$("#goods_new_list_5").mouseout(function(){
		$("#goods_new_list_5").css("border","solid 1px #EEEEEE");
		$("#goods_new_list_5 input").css("border","solid 1px #EEEEEE");
		$("#goods_title_new_5").css("display","none");
	});
	
	
	$("#goods_new_list_6").mouseover(function(){
		$("#goods_new_list_6").css("border","solid 1px #9D2A29");
		$("#goods_new_list_6 input").css("border","solid 1px #9D2A29");
		$("#goods_title_new_6").css("display","block");
	});
	$("#goods_new_list_6").mouseleave(function(){
		$("#goods_new_list_6").css("border","solid 1px #EEEEEE");
		$("#goods_new_list_6 input").css("border","solid 1px #EEEEEE");
		$("#goods_title_new_6").css("display","none");
	});
	
});

</script>
</html>