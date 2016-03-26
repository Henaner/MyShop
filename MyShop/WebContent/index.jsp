<%@page import="cn.wangchenhui.dao.IGoodsDao"%>
<%@page import="cn.wangchenhui.model.Goods"%>
<%@page import="java.util.List"%>
<%@page import="cn.wangchenhui.dao.ISliderDao"%>
<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@page import="cn.wangchenhui.model.SliderImg"%>
<%@page import="cn.wangchenhui.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="<%=request.getContextPath() %>/favicon.ico">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/slider.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
<script type="text/javascript" language="javascript">
	window.onload=function(){
		//这里是图片轮播的js
		slider_show.scroll(3,"img_list","show_img_module","show_img_desc");
	}
</script>
<title>家乡味首页</title>
</head>
<body>
	<%
		SliderImg[] sliderImg = new SliderImg[3];	
		ISliderDao sliderDao = DaoFactory.getSliderDao();
		List<SliderImg> list = sliderDao.getSliderImg();
		for(int i=0;i<list.size();i++){
			sliderImg[i] = (SliderImg)list.get(i);
		}
		//展示的商品
		Goods[] hot_goods = new Goods[6];
		IGoodsDao goodsDao = DaoFactory.getGoodsDao();
		List<Goods> hot_list = goodsDao.getTop6("热");
		for(int i=0;i<hot_list.size();i++){
			hot_goods[i] = (Goods)hot_list.get(i);
		}
		//展示的商品
				Goods[] new_goods = new Goods[6];
				List<Goods> new_list = goodsDao.getTop6("新");
				for(int i=0;i<new_list.size();i++){
					new_goods[i] = (Goods)new_list.get(i);
				}
	%>
	<div id="include_header_bannner" >
		<div id="include_header">
			<jsp:include page="/lockPages/user/header.jsp"></jsp:include>
		</div>
	</div>
	<div id="show_img">	
		<div id="show_img_bg"></div>  <!--轮播图片介绍的背景-->
		<a href="#" id="show_img_desc"></a> <!--轮播图片的介绍-->
	    <ul id="show_img_module"></ul><!-- 图片轮播模块介绍的模块 -->
  		 <div id="img_list">
	        <a href="<%=request.getContextPath()%>/product.jsp?goods_id=<%=sliderImg[0].getGoods_id() %>" target="_blank"><img  src="<%=request.getContextPath()%>/upload/slideImg/<%=sliderImg[0].getImg_path() %>" title="<%=sliderImg[0].getImg_title() %>"  /></a>
	        <a href="<%=request.getContextPath()%>/product.jsp?goods_id=<%=sliderImg[1].getGoods_id() %>" target="_blank"><img  src="<%=request.getContextPath()%>/upload/slideImg/<%=sliderImg[1].getImg_path() %>" title="<%=sliderImg[1].getImg_title() %>"  /></a>
	        <a href="<%=request.getContextPath()%>/product.jsp?goods_id=<%=sliderImg[2].getGoods_id() %>" target="_blank"><img  src="<%=request.getContextPath()%>/upload/slideImg/<%=sliderImg[2].getImg_path() %>" title="<%=sliderImg[2].getImg_title() %>"  /></a>
		</div>
	</div>
	<div id="goods_hot" >
			<!-- 这里是商品的展示 -->
			<div id="goods_hot_logo"><img src="<%=request.getContextPath()%>/images/icon/zdzb.png"></div>
			<div id="goods_hot_more"><a href="<%=request.getContextPath()%>/result.jsp?condition=1">更多</a></div>
			<div id="goods_hot_list">
				<!-- 热门商品6个展示 -->
				<div onclick="window.location.href='<%=request.getContextPath() %>/product.jsp?goods_id=<%=hot_goods[0].getGoods_id() %>'" style="cursor:pointer;width:210px;height:330px;border:solid 1px #9D2A29;float:left;margin:15px 95px;">
					<div id="goods_title" style=" width:210px;height:80px;background:#CCCCCC;">
						<!--这里是商品的标题-->
						<%=hot_goods[0].getGoods_title()%>
					</div>
					<img src="<%=request.getContextPath()%>/upload/goodsImg/<%=hot_goods[0].getImg_name()%>" style="width:210px;height:210px;">
					<p align="center"><font color="#9D2A29"><%=hot_goods[0].getPrice()%>￥</font></p>
				</div>
				
				<div onclick="window.location.href='<%=request.getContextPath() %>/product.jsp?goods_id=<%=hot_goods[1].getGoods_id()  %>'" style="cursor:pointer;width:210px;height:330px;border:solid 1px #9D2A29;float:left;margin:15px 95px;">
					<div id="goods_title" style="width:210px;height:80px;background:#CCCCCC;">
						<!--这里是商品的标题-->
						<%=hot_goods[1].getGoods_title()%>
					</div>
					<img src="<%=request.getContextPath()%>/upload/goodsImg/<%=hot_goods[1].getImg_name()%>" style="width:210px;height:210px;">
					<p align="center"><font color="#9D2A29"><%=hot_goods[1].getPrice()%>￥</font></p>
				</div>
				
				<div onclick="window.location.href='<%=request.getContextPath() %>/product.jsp?goods_id=<%=hot_goods[2].getGoods_id()  %>'" style="cursor:pointer;width:210px;height:330px;border:solid 1px #9D2A29;float:left;margin:15px 95px;">
					<div id="goods_title" style=" width:210px;height:80px;background:#CCCCCC;">
						<!--这里是商品的标题-->
						<%=hot_goods[2].getGoods_title()%>
					</div>
					<img src="<%=request.getContextPath()%>/upload/goodsImg/<%=hot_goods[2].getImg_name()%>" style="width:210px;height:210px;">
					<p align="center"><font color="#9D2A29"><%=hot_goods[2].getPrice()%>￥</font></p>
				</div>
				
				<div onclick="window.location.href='<%=request.getContextPath() %>/product.jsp?goods_id=<%=hot_goods[3].getGoods_id()  %>'" style="cursor:pointer;width:210px;height:330px;border:solid 1px #9D2A29;float:left;margin:15px 95px;">
					<div id="goods_title" style=" width:210px;height:80px;background:#CCCCCC;">
						<!--这里是商品的标题-->
						<%=hot_goods[3].getGoods_title()%>
					</div>
					<img src="<%=request.getContextPath()%>/upload/goodsImg/<%=hot_goods[3].getImg_name()%>" style="width:210px;height:210px;">
					<p align="center"><font color="#9D2A29"><%=hot_goods[3].getPrice()%>￥</font></p>
				</div>
				
				<div onclick="window.location.href='<%=request.getContextPath() %>/product.jsp?goods_id=<%=hot_goods[4].getGoods_id()  %>'" style="cursor:pointer;width:210px;height:330px;border:solid 1px #9D2A29;float:left;margin:15px 95px;">
					<div id="goods_title" style=" width:210px;height:80px;background:#CCCCCC;">
						<!--这里是商品的标题-->
						<%=hot_goods[4].getGoods_title()%>
					</div>
					<img src="<%=request.getContextPath()%>/upload/goodsImg/<%=hot_goods[4].getImg_name()%>" style="width:210px;height:210px;">
					<p align="center"><font color="#9D2A29"><%=hot_goods[4].getPrice()%>￥</font></p>
				</div>
				
				<div onclick="window.location.href='<%=request.getContextPath() %>/product.jsp?goods_id=<%=hot_goods[5].getGoods_id()  %>'" style="cursor:pointer;width:210px;height:330px;border:solid 1px #9D2A29;float:left;margin:15px 95px;">
					<div id="goods_title" style=" width:210px;height:80px;background:#CCCCCC;">
						<!--这里是商品的标题-->
						<%=hot_goods[5].getGoods_title()%>
					</div>
					<img src="<%=request.getContextPath()%>/upload/goodsImg/<%=hot_goods[5].getImg_name()%>" style="width:210px;height:210px;">
					<p align="center"><font color="#9D2A29"><%=hot_goods[5].getPrice()%>￥</font></p>
				</div>
				
				
			</div>
			
	</div>
	<div id="goods_new">
		<!-- 这里是商品的展示 -->
			<div id="goods_new_logo"><img src="<%=request.getContextPath()%>/images/icon/xptj.png"></div>
			<div id="goods_new_more"><a href="<%=request.getContextPath()%>/result.jsp?condition=2">更多</a></div>
			<div id="goods_new_list" >
			<!-- 新增商品6个展示 -->
				<div onclick="window.location.href='<%=request.getContextPath() %>/product.jsp?goods_id=<%=new_goods[0].getGoods_id() %>'" style="cursor:pointer;width:210px;height:330px;border:solid 1px #9D2A29;float:left;margin:15px 95px;">
					<div id="goods_title" style=" width:210px;height:80px;background:#CCCCCC;">
						<!--这里是商品的标题-->
						<%=new_goods[0].getGoods_title()%>
					</div>
					<img src="<%=request.getContextPath()%>/upload/goodsImg/<%=new_goods[0].getImg_name()%>" style="width:210px;height:210px;">
					<p align="center"><font color="#9D2A29"><%=new_goods[0].getPrice()%>￥</font></p>
				</div>
				
				<div onclick="window.location.href='<%=request.getContextPath() %>/product.jsp?goods_id=<%=new_goods[1].getGoods_id()  %>'" style="cursor:pointer;width:210px;height:330px;border:solid 1px #9D2A29;float:left;margin:15px 95px;">
					<div id="goods_title" style="width:210px;height:80px;background:#CCCCCC;">
						<!--这里是商品的标题-->
						<%=new_goods[1].getGoods_title()%>
					</div>
					<img src="<%=request.getContextPath()%>/upload/goodsImg/<%=new_goods[1].getImg_name()%>" style="width:210px;height:210px;">
					<p align="center"><font color="#9D2A29"><%=new_goods[1].getPrice()%>￥</font></p>
				</div>
				
				<div onclick="window.location.href='<%=request.getContextPath() %>/product.jsp?goods_id=<%=new_goods[2].getGoods_id()  %>'" style="cursor:pointer;width:210px;height:330px;border:solid 1px #9D2A29;float:left;margin:15px 95px;">
					<div id="goods_title" style=" width:210px;height:80px;background:#CCCCCC;">
						<!--这里是商品的标题-->
						<%=new_goods[2].getGoods_title()%>
					</div>
					<img src="<%=request.getContextPath()%>/upload/goodsImg/<%=new_goods[2].getImg_name()%>" style="width:210px;height:210px;">
					<p align="center"><font color="#9D2A29"><%=new_goods[2].getPrice()%>￥</font></p>
				</div>
				
				<div onclick="window.location.href='<%=request.getContextPath() %>/product.jsp?goods_id=<%=new_goods[3].getGoods_id()  %>'" style="cursor:pointer;width:210px;height:330px;border:solid 1px #9D2A29;float:left;margin:15px 95px;">
					<div id="goods_title" style=" width:210px;height:80px;background:#CCCCCC;">
						<!--这里是商品的标题-->
						<%=new_goods[3].getGoods_title()%>
					</div>
					<img src="<%=request.getContextPath()%>/upload/goodsImg/<%=new_goods[3].getImg_name()%>" style="width:210px;height:210px;">
					<p align="center"><font color="#9D2A29"><%=new_goods[3].getPrice()%>￥</font></p>
				</div>
				
				<div onclick="window.location.href='<%=request.getContextPath() %>/product.jsp?goods_id=<%=new_goods[4].getGoods_id()  %>'" style="cursor:pointer;width:210px;height:330px;border:solid 1px #9D2A29;float:left;margin:15px 95px;">
					<div id="goods_title" style=" width:210px;height:80px;background:#CCCCCC;">
						<!--这里是商品的标题-->
						<%=new_goods[4].getGoods_title()%>
					</div>
					<img src="<%=request.getContextPath()%>/upload/goodsImg/<%=new_goods[4].getImg_name()%>" style="width:210px;height:210px;">
					<p align="center"><font color="#9D2A29"><%=new_goods[4].getPrice()%>￥</font></p>
				</div>
				
				<div onclick="window.location.href='<%=request.getContextPath() %>/product.jsp?goods_id=<%=new_goods[5].getGoods_id()  %>'" style="cursor:pointer;width:210px;height:330px;border:solid 1px #9D2A29;float:left;margin:15px 95px;">
					<div id="goods_title" style=" width:210px;height:80px;background:#CCCCCC;">
						<!--这里是商品的标题-->
						<%=new_goods[5].getGoods_title()%>
					</div>
					<img src="<%=request.getContextPath()%>/upload/goodsImg/<%=new_goods[5].getImg_name()%>" style="width:210px;height:210px;">
					<p align="center"><font color="#9D2A29"><%=new_goods[5].getPrice()%>￥</font></p>
				</div>

			</div>
	</div>
	<!-- 加入版权信息 -->
	<div id="#include_bottom" style="position:absolute;margin-top:2450px;margin-left:150px;">
		<jsp:include page="/bottom.jsp"></jsp:include>
	</div>
</body>
</html>