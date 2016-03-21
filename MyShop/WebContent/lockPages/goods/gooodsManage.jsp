<%@page import="cn.wangchenhui.model.Goods"%>
<%@page import="cn.wangchenhui.model.Pager"%>
<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@page import="cn.wangchenhui.dao.IGoodsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.12.0.min.js"></script>
</head>
<body>
<%
	String condition = request.getParameter("condition");
	if (condition == null){
	    condition = "";
	}
	IGoodsDao goodsDao = DaoFactory.getGoodsDao();
	Pager<Goods> pages = goodsDao.list(condition);
	int totalPage = pages.getPageSize();
	int totalRecord = pages.getTotalRecord();
%>
	<jsp:include page="/lockPages/admin/inc/top.jsp"></jsp:include>
	<div align="center" style="position:absolute;width:98%;height:450px;border:solid 1px #7F0101;margin-left:2px;margin-top:50px;">
		<table align="center">
			<tr>
				<td colspan="3">请输入商品id进行查找：</td>
				<td colspan="9" align="left" valign="top">
					<form action="" method="post">
						<input type="text" name="condition" value="<%=condition%>" size="80">&nbsp;&nbsp;<input type="submit" style="width:60px;height:25px;background: #9D2A29;color:white;border-radius:5px;cursor:pointer;" value="查找">
					</form>
				</td>
			</tr>
			<tr id="table_title" align="center">
				<td>商品id</td>
				<td>上架时间</td>
				<td>操作员id</td>
				<td>库存</td>
				<td>状态</td>
			</tr>
			<%
				for(Goods goods:pages.getData()){
			%>
			<tr id="table_content" align="center">
				<td><%=goods.getGoods_id() %></td>
				<td><%=goods.getPost_date() %></td>
				<td><%=goods.getUser_id() %></td>
				<td><%=goods.getCurr_stock() %></td>
				<td><%=goods.getGoods_status() %></td>
			</tr>
			<%
					}
			%>
		</table>
		<div style="">
			<jsp:include page="/lockPages/pager/pager.jsp">
					<jsp:param value="<%=totalPage %>" name="totalPage"/>
					<jsp:param value="<%=totalRecord%>" name="totalRecord"/>
			</jsp:include>
		</div>
	</div>
</body>
<style>
	table{width:100%; border-collapse:collapse ;}
	#table_title{background:#9D2A29;color:white;}
	#table_content{border:solid 1px #9D2A29;};
</style>
<script type="text/javascript">
	$(document).ready(function(e){
		$("tr:gt(1)").mouseover(function(){
			$(this).css("background","#CC6666");
		});
		$("tr").mouseout(function(){
			$(this).css("background","");
		});
	});
</script>
</html>