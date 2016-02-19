<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="favicon.ico">
<link rel="stylesheet" href="./css/main.css">
<script type="text/javascript" src="./js/returntop.js"></script>
<script type="text/javascript" src="./js/slider.js"></script>
<script type="text/javascript" language="javascript">
	window.onload=function(){
		//这里是图片轮播的js
		slider_show.scroll(3,"img_list","show_img_module","show_img_desc");
	}
</script>
<title>家乡味首页</title>
</head>
	<div id="include_header_bannner">
		<div id="include_header">
			<jsp:include page="header.jsp"></jsp:include>
		</div>
	</div>
	<div id="show_img">	
		<div id="show_img_bg"></div>  <!--轮播图片介绍的背景-->
		<a href="#" id="show_img_desc"></a> <!--轮播图片的介绍-->
	    <ul id="show_img_module"></ul><!-- 图片轮播模块介绍的模块 -->
  		 <div id="img_list">
	        <a href="#" target="_blank"><img src="./images/slider_img/b0.jpg" title="欢乐购购购"  /></a>
	        <a href="#" target="_blank"><img src="./images/slider_img/b1.jpg" title="源自大自然"  /></a>
	        <a href="#" target="_blank"><img src="./images/slider_img/b2.jpg" title="吃出家乡的感觉"  /></a>
		</div>
	</div>
	<div id="goods_hot">
			<!-- 这里是商品的展示 -->
			<div id="goods_hot_logo"><img src="./images/icon/zdzb.png"></div>
			<div id="goods_hot_more"><a href="#">更多</a></div>
			<div id="goods_hot_list">
				<div id="goods_hot_list_1" class="goods_list_1">
					<img src="./images/demo/4.jpg">
					<p align="center">RMB:<font color="#9D2A29">￥88.88</font></p>
					<input type="button" value="加入购物车" style="height:30px;cursor:pointer;margin-left:35px;border:solid 1px #EEEEEE; background: none;">
					<input type="button" value="购买" style="height:30px;cursor:pointer;border:solid 1px #EEEEEE; background: none;">
				</div>
				<div id="goods_hot_list_2" class="goods_list_1">
					<img src="./images/demo/5.jpg">
					<p align="center">RMB:<font color="#9D2A29">￥88.88</font></p>
					<input type="button" value="加入购物车" style="height:30px;cursor:pointer;margin-left:35px;border:solid 1px #EEEEEE; background: none;">
					<input type="button" value="购买" style="height:30px;cursor:pointer;border:solid 1px #EEEEEE; background: none;">
				</div>
				<div id="goods_hot_list_3" class="goods_list_1">
					<img src="./images/demo/6.jpg">
					<p align="center">RMB:<font color="#9D2A29">￥88.88</font></p>
					<input type="button" value="加入购物车" style="height:30px;cursor:pointer;margin-left:35px;border:solid 1px #EEEEEE; background: none;">
					<input type="button" value="购买" style="height:30px;cursor:pointer;border:solid 1px #EEEEEE; background: none;">
				</div>
				<div id="goods_hot_list_4" class="goods_list_1">
					<img src="./images/demo/7.jpg">
					<p align="center">RMB:<font color="#9D2A29">￥88.88</font></p>
					<input type="button" value="加入购物车" style="height:30px;cursor:pointer;margin-left:35px;border:solid 1px #EEEEEE; background: none;">
					<input type="button" value="购买" style="height:30px;cursor:pointer;border:solid 1px #EEEEEE; background: none;">
				</div>
				<div id="goods_hot_list_5" class="goods_list_1">
					<img src="./images/demo/8.jpg">
					<p align="center">RMB:<font color="#9D2A29">￥88.88</font></p>
					<input type="button" value="加入购物车" style="height:30px;cursor:pointer;margin-left:35px;border:solid 1px #EEEEEE; background: none;">
					<input type="button" value="购买" style="height:30px;cursor:pointer;border:solid 1px #EEEEEE; background: none;">
				</div>
				<div id="goods_hot_list_6" class="goods_list_1">
					<img src="./images/demo/9.jpg">
					<p align="center">RMB:<font color="#9D2A29">￥88.88</font></p>
					<input type="button" value="加入购物车" style="height:30px;cursor:pointer;margin-left:35px;border:solid 1px #EEEEEE; background: none;">
					<input type="button" value="购买" style="height:30px;cursor:pointer;border:solid 1px #EEEEEE; background: none;">
				</div>
			</div>
	</div>
	<div id="goods_new">
		<!-- 这里是商品的展示 -->
			<div id="goods_new_logo"><img src="./images/icon/xptj.png"></div>
			<div id="goods_new_more"><a href="#">更多</a></div>
			<div id="goods_new_list">
				<div id="goods_new_list_1" class="goods_list_1">
					<img src="./images/demo/4.jpg">
					<p align="center">RMB:<font color="#9D2A29">￥88.88</font></p>
					<input type="button" value="加入购物车" style="height:30px;cursor:pointer;margin-left:35px;border:solid 1px #EEEEEE; background: none;">
					<input type="button" value="购买" style="height:30px;cursor:pointer;border:solid 1px #EEEEEE; background: none;">
				</div>
				
				<div id="goods_new_list_2" class="goods_list_2">
					<img src="./images/demo/5.jpg">
					<p align="center">RMB:<font color="#9D2A29">￥88.88</font></p>
					<input type="button" value="加入购物车" style="height:30px;cursor:pointer;margin-left:35px;border:solid 1px #EEEEEE; background: none;">
					<input type="button" value="购买" style="height:30px;cursor:pointer;border:solid 1px #EEEEEE; background: none;">
				</div>
				<div id="goods_new_list_3" class="goods_list_3">
					<img src="./images/demo/6.jpg">
					<p align="center">RMB:<font color="#9D2A29">￥88.88</font></p>
					<input type="button" value="加入购物车" style="height:30px;cursor:pointer;margin-left:35px;border:solid 1px #EEEEEE; background: none;">
					<input type="button" value="购买" style="height:30px;cursor:pointer;border:solid 1px #EEEEEE; background: none;">
				</div>
				<div id="goods_new_list_4" class="goods_list_4">
					<img src="./images/demo/7.jpg">
					<p align="center">RMB:<font color="#9D2A29">￥88.88</font></p>
					<input type="button" value="加入购物车" style="height:30px;cursor:pointer;margin-left:35px;border:solid 1px #EEEEEE; background: none;">
					<input type="button" value="购买" style="height:30px;cursor:pointer;border:solid 1px #EEEEEE; background: none;">
				</div>
				<div id="goods_new_list_5" class="goods_list_5">
					<img src="./images/demo/8.jpg">
					<p align="center">RMB:<font color="#9D2A29">￥88.88</font></p>
					<input type="button" value="加入购物车" style="height:30px;cursor:pointer;margin-left:35px;border:solid 1px #EEEEEE; background: none;">
					<input type="button" value="购买" style="height:30px;cursor:pointer;border:solid 1px #EEEEEE; background: none;">
				</div>
				<div id="goods_new_list_6" class="goods_list_6">
					<img src="./images/demo/9.jpg">
					<p align="center">RMB:<font color="#9D2A29">￥88.88</font></p>
					<input type="button" value="加入购物车" style="height:30px;cursor:pointer;margin-left:35px;border:solid 1px #EEEEEE; background: none;">
					<input type="button" value="购买" style="height:30px;cursor:pointer;border:solid 1px #EEEEEE; background: none;">
				</div>
			</div>
	</div>
	<!-- 这个是首页下面的版权 -->
	<div id="include_bottom">
			<jsp:include page="bottom.jsp"></jsp:include>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function(e) {
	//这里控制的是热销商品
	 $("#goods_hot_list_1").mouseover(function(){
			$("#goods_hot_list_1").css("border","solid 1px #9D2A29");
			$("#goods_hot_list_1 input").css("border","solid 1px #9D2A29");
		});
    	
	$("#goods_hot_list_1").mouseleave(function(){
		$("#goods_hot_list_1").css("border","solid 1px #EEEEEE");
		$("#goods_hot_list_1 input").css("border","solid 1px #EEEEEE");
	});
	
	
	$("#goods_hot_list_2").mouseover(function(){
		$("#goods_hot_list_2").css("border","solid 1px #9D2A29");
		$("#goods_hot_list_2 input").css("border","solid 1px #9D2A29");
	});

	$("#goods_hot_list_2").mouseleave(function(){
		$("#goods_hot_list_2").css("border","solid 1px #EEEEEE");
		$("#goods_hot_list_2 input").attr("src","<%=request.getContextPath()%>/images/icon/backstage/Arrow_Down_24px_523786_easyicon.net.png");
	});
	
	
	$("#goods_hot_list_3").mouseover(function(){
		$("#goods_hot_list_3").css("border","solid 1px #9D2A29");
		$("#goods_hot_list_3 input").css("border","solid 1px #9D2A29");
	});

	$("#goods_hot_list_3").mouseleave(function(){
		$("#goods_hot_list_3").css("border","solid 1px #EEEEEE");
		$("#goods_hot_list_3 input").css("border","solid 1px #EEEEEE");
	});
	
	
	$("#goods_hot_list_4").mouseover(function(){
		$("#goods_hot_list_4").css("border","solid 1px #9D2A29");
		$("#goods_hot_list_4 input").css("border","solid 1px #9D2A29");
	});

	$("#goods_hot_list_4").mouseleave(function(){
		$("#goods_hot_list_4").css("border","solid 1px #EEEEEE");
		$("#goods_hot_list_4 input").css("border","solid 1px #EEEEEE");
	});
	
	
	$("#goods_hot_list_5").mouseover(function(){
		$("#goods_hot_list_5").css("border","solid 1px #9D2A29");
		$("#goods_hot_list_5 input").css("border","solid 1px #9D2A29");
	});		
	$("#goods_hot_list_5").mouseout(function(){
		$("#goods_hot_list_5").css("border","solid 1px #EEEEEE");
		$("#goods_hot_list_5 input").css("border","solid 1px #EEEEEE");
	});
	
	
	$("#goods_hot_list_6").mouseover(function(){
		$("#goods_hot_list_6").css("border","solid 1px #9D2A29");
		$("#goods_hot_list_6 input").css("border","solid 1px #9D2A29");
	});
	$("#goods_hot_list_6").mouseleave(function(){
		$("#goods_hot_list_6").css("border","solid 1px #EEEEEE");
		$("#goods_hot_list_6 input").css("border","solid 1px #EEEEEE");
	});
	//这里控制的是新品
    $("#goods_new_list_1").mouseover(function(){
			$("#goods_new_list_1").css("border","solid 1px #9D2A29");
			$("#goods_new_list_1 input").css("border","solid 1px #9D2A29");
		});
    	
	$("#goods_new_list_1").mouseleave(function(){
		$("#goods_new_list_1").css("border","solid 1px #EEEEEE");
		$("#goods_new_list_1 input").css("border","solid 1px #EEEEEE");
	});
	
	
	$("#goods_new_list_2").mouseover(function(){
		$("#goods_new_list_2").css("border","solid 1px #9D2A29");
		$("#goods_new_list_2 input").css("border","solid 1px #9D2A29");
	});

	$("#goods_new_list_2").mouseleave(function(){
		$("#goods_new_list_2").css("border","solid 1px #EEEEEE");
		$("#goods_new_list_2 input").css("border","solid 1px #EEEEEE");
	});
	
	
	$("#goods_new_list_3").mouseover(function(){
		$("#goods_new_list_3").css("border","solid 1px #9D2A29");
		$("#goods_new_list_3 input").css("border","solid 1px #9D2A29");
	});

	$("#goods_new_list_3").mouseleave(function(){
		$("#goods_new_list_3").css("border","solid 1px #EEEEEE");
		$("#goods_new_list_3 input").css("border","solid 1px #EEEEEE");
	});
	
	
	$("#goods_new_list_4").mouseover(function(){
		$("#goods_new_list_4").css("border","solid 1px #9D2A29");
		$("#goods_new_list_4 input").css("border","solid 1px #9D2A29");
	});

	$("#goods_new_list_4").mouseleave(function(){
		$("#goods_new_list_4").css("border","solid 1px #EEEEEE");
		$("#goods_new_list_4 input").css("border","solid 1px #EEEEEE");
	});
	
	
	$("#goods_new_list_5").mouseover(function(){
		$("#goods_new_list_5").css("border","solid 1px #9D2A29");
		$("#goods_new_list_5 input").css("border","solid 1px #9D2A29");
	});		
	$("#goods_new_list_5").mouseout(function(){
		$("#goods_new_list_5").css("border","solid 1px #EEEEEE");
		$("#goods_new_list_5 input").css("border","solid 1px #EEEEEE");
	});
	
	
	$("#goods_new_list_6").mouseover(function(){
		$("#goods_new_list_6").css("border","solid 1px #9D2A29");
		$("#goods_new_list_6 input").css("border","solid 1px #9D2A29");
	});
	$("#goods_new_list_6").mouseleave(function(){
		$("#goods_new_list_6").css("border","solid 1px #EEEEEE");
		$("#goods_new_list_6 input").css("border","solid 1px #EEEEEE");
	});
	
});
</script>
</html>