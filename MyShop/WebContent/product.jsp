<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="favicon.ico">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/returntop.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-2.2.0.min.js"></script>
<title>商品展示页面</title>
</head>
<body>
	<!-- 导入header部分 -->
	<div id="include_header_bannner">
		<div id="include_header">
			<jsp:include page="/lockPages/user/header.jsp"></jsp:include>
		</div>
	</div>
	<!-- 这里控制的是图片的展示，已经加入购物车和购买的功能 -->
	<hr style="position:absolute;width:90%;height:2px;border:none;border-top:2px dotted #9D2A29; margin-top:190px;margin-left:60px;">
	<div id="div_product" style="position:absolute;width:90%;height:400px;margin-top:200px;margin-left:60px;" align="center">
		<div id="div_product_img" style="margin-top:30px;margin-left:-800px;">
			<img src="<%=request.getContextPath() %>/images/shuiguo.jpg" style="width:330px;height:330px;border:solid 1px #CCCCCC;">
		</div>
		<div id="slide" style="width:0px;height:398px;border:solid 2px #CCCCCC;margin-top:-372px;"></div>
		<div id="div_product_detail" style="height:400px;width:400px;border:solid 0px #CCCCCC;margin-top:-402px;margin-left:500px;">
			<table width="90%" style="margin-top:30px;">
				<tr>
					<td>商品名</td>
					<td>特价好评山西特甜苹果</td>
				</tr>
				<tr>
					<td>库存量</td>
					<td>999</td>
				</tr>
				<tr>
					<td>真心价</td>
					<td>99.00￥</td>
				</tr>
				<tr>
					<td>需要量</td>
					<td>
						<div style="margin-top:-10px;">
							<div id="minus" style="position:absolute;margin-top:-5px;margin-left:5px;cursor:pointer;height:32px;width:32px;"><img id="minus_img" src="<%=request.getContextPath()%>/images/icon/minus.png"></div>
							<div id="number" style="position:absolute;margin-top:-5px;margin-left:40px;"><input type="text" value="1" id = "num_wanted" name = "num_wanted" style="font-size:14px;text-align: center;" maxlength="2" size ="2"></div>
							<div id="plus" style="position:absolute;margin-top:-5px;margin-left:84px;cursor:pointer;height:32px;width:32px;"><img id="plus_img" src="<%=request.getContextPath()%>/images/icon/plus.png"></div>
						</div>
					</td>
				</tr>
				<tr>
					<td>好评率</td>
					<td><font size="14px" color="#9D2A29">98%</font></td>
				</tr>
				<tr>
					<td>
						<button style="border:none;width:100px;height:40px;border-radius:5px;text-align: center;background-color:#930101;color: white;cursor:pointer;">加入购物车</button>
					</td>
					<td>
						<button style="border:none;width:100px;height:40px;border-radius:5px;text-align: center;background-color:#930101;color: white;cursor:pointer;">立即购买</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<hr style="position:absolute;width:90%;height:2px;border:none;border-top:2px dotted #9D2A29; margin-top:590px;margin-left:60px;">
	<div id="goods_desc" style="position: absolute;margin-top:600px;">
		<div style="position:absolute;margin-top:-8px;margin-left:62px;background-color:#9D2A29;border:solid 1px #9D2A29;width:90%;height:40px;backgroud-color:#9D2A29;"><p align="center" style="color:white;margin-top:-4px;"><font size="+3">商品详情</font></p></div>
		<br>
		<div id="goods_desc_text" style="width:80%;margin-left:80px;" align="center">
			<p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 芦柑</strong>，别名柑果。颜色鲜艳，酸甜可口，是日常生活中最常见的水果之一。柑果实一般较大，但比柚小，圆形而稍扁，皮较厚，凸凹粗糙，果皮较易剥离，其种子大部分为白色。芦柑果实硕大，色泽鲜艳，皮松易剥，肉质脆嫩，汁多化渣。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 李时珍《本草纲木&middot;果部》说：&ldquo;橘实小，其瓣味微酢(意与酸同)，其皮薄而红，味辛而苦；柑大于橘，其瓣味酢，其皮稍厚而黄，叶辛而甘。&rdquo;一般说来，果形正圆，色黄赤，皮紧纹细不易剥，多汁甘香的叫柑；果形扁圆，色红或黄，皮薄而光滑易剥，味微甘酸的叫橘；柑和橘的分别原是很明显的，不过在俗话中常见混淆，如广柑也说广橘，蜜橘也说蜜柑.</p>
		</div>
	</div>
	<!-- 导入底部的版权页 -->
	<div id="include_bottom">
			<jsp:include page="bottom.jsp"></jsp:include>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function(e){
		
		$("#minus_img").click(function(){
			var num = $("#num_wanted").val()-0;
			if(num<=1){
				alert("数量至少为1");
			}else{
				$("#num_wanted").val(num-1);
			}
		});
		$("#plus_img").click(function(){
			var num = $("#num_wanted").val()-0;
			if(num>=99){
				alert("数量至多为99");
			}else{
				$("#num_wanted").val(num+1);
			}
		});
		
	});
</script>
</html>