<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css">
<link rel="shortcut icon" href="<%=request.getContextPath() %>/favicon.ico">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/returntop.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-2.2.0.min.js"></script>
<title>购物车详情</title>
</head>
<body>
	<!-- 导入header部分 -->
	<div id="include_header_bannner">
		<div id="include_header">
			<jsp:include page="/header.jsp"></jsp:include>
		</div>
	</div>
	<!-- 这里是购物车的展示区 -->
	<hr style="position:absolute;width:90%;height:2px;border:none;border-top:2px dotted #9D2A29; margin-top:200px;margin-left:60px;">
	<div  style="position: absolute;margin-top:210px;width:99%;margin-left:3px;">
		<div style="position:absolute;margin-top:-8px;margin-left:62px;background-color:#9D2A29;border:solid 1px #9D2A29;width:90%;height:40px;backgroud-color:#9D2A29;"><p align="center" style="color:white;margin-top:-4px;"><font size="+3">购物车详情</font></p></div>
	</div>
	<div id="rec_address" style="position:absolute;height:800px;width:90%;margin-left:60px;margin-top:245px;">
		<table id="cart_table" align="center" style="width:90%; border-collapse:collapse;heght:600px;">
			<tr align="center" style="background-color:#9D2A29;color:white;">
				<td>商品图</td>
				<td>名称</td>
				<td>单价</td>
				<td>数量</td>
				<td>操作</td>
			</tr>
			<tr align="center">
				<td><img src="<%=request.getContextPath() %>/images/shuiguo.jpg" style="width:50px;height:50px;border:solid 1px #CCCCCC;"></td>
				<td>特价好评山西特甜苹果</td>
				<td>99.00</td>
				<td>
					<div style="position: absolute;margin-top:-10px;margin-left:50px;">
							<div id="minus" style="position:absolute;margin-top:-5px;margin-left:5px;cursor:pointer;height:32px;width:32px;"><img id="minus_img" name ="minus_img" src="<%=request.getContextPath()%>/images/icon/minus.png"></div>
							<div id="number" style="position:absolute;margin-top:-5px;margin-left:40px;"><input type="text" value="1" id = "num_wanted" name = "num_wanted" style="font-size:14px;text-align: center;" maxlength="2" size ="2"></div>
							<div id="plus" style="position:absolute;margin-top:-5px;margin-left:84px;cursor:pointer;height:32px;width:32px;"><img id="plus_img" name ="plus_img" src="<%=request.getContextPath()%>/images/icon/plus.png"></div>
					</div>
				</td>
				<td><a href="#">删除</a></td>
			</tr>
			<tr align="center">
				<td><img src="<%=request.getContextPath() %>/images/shuiguo.jpg" style="width:50px;height:50px;border:solid 1px #CCCCCC;"></td>
				<td>特价好评山西特甜苹果</td>
				<td>99.00</td>
				<td>
					<div style="position: absolute;margin-top:-10px;margin-left:50px;">
							<div id="minus" style="position:absolute;margin-top:-5px;margin-left:5px;cursor:pointer;height:32px;width:32px;"><img id="minus_img" name ="minus_img" src="<%=request.getContextPath()%>/images/icon/minus.png"></div>
							<div id="number" style="position:absolute;margin-top:-5px;margin-left:40px;"><input type="text" value="1" id = "num_wanted" name = "num_wanted" style="font-size:14px;text-align: center;" maxlength="2" size ="2"></div>
							<div id="plus" style="position:absolute;margin-top:-5px;margin-left:84px;cursor:pointer;height:32px;width:32px;"><img id="plus_img" name ="plus_img" src="<%=request.getContextPath()%>/images/icon/plus.png"></div>
					</div>
				</td>
				<td><a href="#">删除</a></td>
			</tr>
			<tr align="center">
				<td width="20%"><img src="<%=request.getContextPath() %>/images/shuiguo.jpg" style="width:50px;height:50px;border:solid 1px #CCCCCC;"></td>
				<td width="40%">特价好评山西特甜苹果</td>
				<td width="10%">99.00</td>
				<td width="20%">
					<div style="position: absolute;margin-top:-10px;margin-left:50px;">
							<div id="minus" style="position:absolute;margin-top:-5px;margin-left:5px;cursor:pointer;height:32px;width:32px;"><img id="minus_img" name ="minus_img" src="<%=request.getContextPath()%>/images/icon/minus.png"></div>
							<div id="number" style="position:absolute;margin-top:-5px;margin-left:40px;"><input type="text" value="1" id = "num_wanted" name = "num_wanted" style="font-size:14px;text-align: center;" maxlength="2" size ="2"></div>
							<div id="plus" style="position:absolute;margin-top:-5px;margin-left:84px;cursor:pointer;height:32px;width:32px;"><img id="plus_img" name ="plus_img" src="<%=request.getContextPath()%>/images/icon/plus.png"></div>
					</div>
				</td>
				<td width="10%"><a href="#">删除</a></td>
			</tr>
			<tr align="center">
				<td width="20%"><img src="<%=request.getContextPath() %>/images/shuiguo.jpg" style="width:50px;height:50px;border:solid 1px #CCCCCC;"></td>
				<td width="40%">特价好评山西特甜苹果</td>
				<td width="10%">99.00</td>
				<td width="20%">
					<div style="position: absolute;margin-top:-10px;margin-left:50px;">
							<div id="minus" style="position:absolute;margin-top:-5px;margin-left:5px;cursor:pointer;height:32px;width:32px;"><img id="minus_img" name ="minus_img" src="<%=request.getContextPath()%>/images/icon/minus.png"></div>
							<div id="number" style="position:absolute;margin-top:-5px;margin-left:40px;"><input type="text" value="1" id = "num_wanted" name = "num_wanted" style="font-size:14px;text-align: center;" maxlength="2" size ="2"></div>
							<div id="plus" style="position:absolute;margin-top:-5px;margin-left:84px;cursor:pointer;height:32px;width:32px;"><img id="plus_img" name ="plus_img" src="<%=request.getContextPath()%>/images/icon/plus.png"></div>
					</div>
				</td>
				<td width="10%"><a href="#">删除</a></td>
			</tr>
			<!-- 上面的两个tr是测试数据 -->
		</table>
		<div style="postion:relative;height:50px;width:90%;margin-left:60px;margin-top:0px;background-color:#9D2A29;color:white;font-size:20px;">
			<div style="position:absolute;margin-left:60px; margin-top:12px;" ><a href="#">继续添加</a></div>
			<div style="position:absolute;margin-left:600px;  margin-top:12px;">总金额：396￥</div>
			<div style="position:absolute;margin-left:950px;"><input type="button" style="color:#9D2A29;height:50px;width:120px;font-size:18px;" value="去结算"></div>
		</div>
	</div>
	<!-- 导入底部的版权页 -->
	<div id="include_bottom">
			<jsp:include page="/bottom.jsp"></jsp:include>
	</div>
</body>
<style type= text/css>
	#cart_table{ border-collapse:collapse ;}
	#cart_table tr{border:1px solid #9D2A29;}
</style>
<script type="text/javascript">
	$(document).ready(function(e){
		$("#cart_table tr:gt(0)").mouseover(function(){
			$(this).css("background","#CC6666");
			$(this).
			
		});
		$("#cart_table tr:gt(0)").mouseout(function(){
			$(this).css("background","");
			
		});
	});
</script>
</html>