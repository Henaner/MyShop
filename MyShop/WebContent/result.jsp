<%@page import="cn.wangchenhui.model.Goods"%>
<%@page import="cn.wangchenhui.model.Pager"%>
<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@page import="cn.wangchenhui.dao.IGoodsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" href="favicon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/js/icheck/skins/all.css" >
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-2.2.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/icheck/icheck.js"></script>
<title>搜索结果</title>
</head>
<body>
<%
	String condition = request.getParameter("condition");
	if(condition == null){
		condition = "";
	}
	IGoodsDao goodsDao = DaoFactory.getGoodsDao();
	Pager<Goods> pages = goodsDao.hot_or_new(condition);
	int totalPage = pages.getTotalPage();
	int totalRecord = pages.getTotalRecord();
%>
	<!-- 导入header部分 -->
		<div id="include_header" style="overflow:hidden;">
			<jsp:include page="/lockPages/user/header.jsp"></jsp:include>
		</div>
		<div style="width:90%;height:1100px;margin:200px auto;">
		<%
			for(Goods goods:pages.getData()){
		%>
			<div id="iterator_goods" onclick="window.location.href='<%=request.getContextPath() %>/product.jsp?goods_id=<%=goods.getGoods_id() %>'" style="cursor:pointer;width:210px;height:330px;border:solid 1px #9D2A29;float:left;margin:10px 13px;">
				<div id="goods_title" style=" width:210px;height:80px;background:#CCCCCC;">
					<%=goods.getGoods_title() %>
				</div>
				<img src="<%=request.getContextPath()%>/upload/goodsImg/<%=goods.getImg_name()%>" style="width:210px;height:210px;">
				<p align="center"><font color="#9D2A29"><%=goods.getPrice() %>￥</font></p>
			</div>
		<%
			}
		%>		
		</div>
		<div align="center" style="width:90%;margin-left:60px;border:solid 1px #CCCCCC;margin-top:-150px;">
			<jsp:include page="/lockPages/pager/pager.jsp">
							<jsp:param name="totalRecord" value="<%=totalRecord%>"/>
		               	    <jsp:param name="totalPage" value="<%=totalPage%>" />
			</jsp:include>
		</div>
		<!-- 导入底部的版权页 -->
		<div style="position:absolute;margin-top:50px;margin-left:150px;">
			<jsp:include page="/bottom.jsp"></jsp:include>
		</div>
</body>
</html>