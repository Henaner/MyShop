<%@page import="cn.wangchenhui.model.Order"%>
<%@page import="cn.wangchenhui.dao.ICommentDao"%>
<%@page import="cn.wangchenhui.dao.IUserDao"%>
<%@page import="cn.wangchenhui.dao.IOrderDao"%>
<%@page import="cn.wangchenhui.model.Goods"%>
<%@page import="cn.wangchenhui.dao.IGoodsDao"%>
<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="favicon.ico">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-2.2.0.min.js"></script>
<title>商品详情页</title>
</head>

<body>
	<!-- 导入header部分 -->
		<div id="include_header" style="postion:absolute;">
			<jsp:include page="/lockPages/user/header.jsp"></jsp:include>
		</div>
	<%
		String goods_id = request.getParameter("goods_id");
		IGoodsDao goodsDao = DaoFactory.getGoodsDao();
		Goods goods = goodsDao.load(goods_id);
		IOrderDao orderDao =DaoFactory.getOrderDao();
		IUserDao userDao = DaoFactory.getUserDao();
		
	%>
	<!-- 这里控制的是图片的展示，已经加入购物车和购买的功能 -->
	<hr style="position:absolute;width:90%;height:2px;border:none;border-top:2px dotted #9D2A29; margin-top:190px;margin-left:60px;">
	<div id="div_product" style="position:absolute;width:90%;height:400px;margin-top:200px;margin-left:60px;" align="center">
		<div id="div_product_img" style="margin-top:30px;margin-left:-800px;">
			<img src="<%=request.getContextPath() %>/upload/goodsImg/<%=goods.getImg_name() %>" style="width:330px;height:330px;border:solid 1px #CCCCCC;">
		</div>
		<div id="slide" style="width:0px;height:398px;border:solid 2px #9D2A29;margin-top:-372px;"></div>
		<div style="position:relative;margin-left:600px;margin-top:-400px;height:400px;width:500px;">
			<div style="margin-top:30px;">
				<form action="<%=request.getContextPath()%>/lockPages/user/addCart.jsp?goods_id=<%=goods.getGoods_id()%>" method="post">
					<table align="left" style="width:100%;height:380px;">
					<tr>
						<td>商品名称</td>
						<td><%=goods.getGoods_title() %>
						</td>
					</tr>
					<tr>
						<td>价格</td>
						<td>
							<%=goods.getPrice() %>￥
							<input type="hidden" name="goods_price" value="<%=goods.getPrice() %>">
						</td>
					</tr>
					<tr>
						<td>库存</td>
						<td><%=goods.getCurr_stock()%></td>
					</tr>
					<tr>
						<td>需求量</td>
						<td>
							<div id="buy_number">
								<div  id="minus" align="center"  style="vertical-align:center; color:white;background:#9D2A29;margin-left:2px;cursor:pointer;height:28px;width:28px;border:solid 1px #9D2A29;border-right-style: none;border-top-left-radius:5px;border-bottom-left-radius:5px;">-</div>
								<div style="top:10px;margin-left:31px;margin-top:-30px;"><input  type="text" size="3" maxlength="3" id="num_wanted" name="num_wanted" style="border:solid 1px #9D2A29;text-align:center;height:26px;" value="1"></div>
								<div id="plus" align="center"  style="vertical-align:center;color:white;background:#9D2A29;margin-left:70px;margin-top:-30px;cursor:pointer; border:solid 1px #9D2A29;height:28px;width:28px;border-left-style: none;border-top-right-radius:5px;border-bottom-right-radius:5px;">+</div>
							</div>
						</td>
					</tr>
					<tr align="center">
						<td><input type="submit"  value="加入购物车" style="width:120px;height:50px;cursor:pointer;color:white;background:#9D2A29;border-radius:15px;"></td>
						<!-- <td><input type="button"  value="立刻购买" style="width:120px;height:50px;cursor:pointer;color:white;background:#9D2A29;border-radius:15px;"></td> -->
					</tr>
				</table>
				</form>
			</div>
		</div>
	</div>
	<hr style="position:absolute;width:90%;height:2px;border:none;border-top:2px dotted #9D2A29; margin-top:590px;margin-left:60px;">
	<div id="goods_desc" style="position: absolute;margin-top:600px;">
		<div style="position:absolute;margin-top:-8px;margin-left:62px;background-color:#9D2A29;border:solid 1px #9D2A29;width:1208px;height:40px;backgroud-color:#9D2A29;"><p align="center" style="color:white;margin-top:-4px;"><font size="+3">商品详情</font></p></div>
		<br>
		<div id="goods_desc_text" style="postion:absolute;font-size:16px;width:70%;margin-left:200px;margin-top:100px;" >
			<%=goods.getGoods_desc() %>
		</div>
		
		
		 
	</div>
	
	<!-- 导入底部的版权页 -->
	<div style="position:absolute;margin-top:2000px;margin-left:150px;">
		<jsp:include page="/bottom.jsp"></jsp:include>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function(e){
		$("#minus").click(function(){
			if(($("#num_wanted").val()==1)){
				alert("数量至少为1");
			}else{
				$("#num_wanted").val(($("#num_wanted").val()-0)-1);
			}
		});
		$("#plus").click(function(){
			if(($("#num_wanted").val()==999)){
				alert("数量至多为999");
			}else{
				$("#num_wanted").val(($("#num_wanted").val()-0)+1);
			}
		});
	});
</script>
</html>