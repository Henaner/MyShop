<%@page import="cn.wangchenhui.model.Comment"%>
<%@page import="cn.wangchenhui.dao.ICommentDao"%>
<%@page import="cn.wangchenhui.dao.IGoodsDao"%>
<%@page import="cn.wangchenhui.model.Order"%>
<%@page import="java.util.List"%>
<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@page import="cn.wangchenhui.dao.IOrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String ord_id = request.getParameter("ord_id");
	IOrderDao orderDao = DaoFactory.getOrderDao();
	List<Order> list = orderDao.returnList(ord_id);
	IGoodsDao goodsDao = DaoFactory.getGoodsDao();
	ICommentDao commentDao = DaoFactory.getCommentDao();
	Comment comment = commentDao.getLoad(ord_id);
%>
	<div style="border:solid 1px #9D2A29;height:520px;width:97%">
	<table>
			<tr id="table_title" align="center">
				<td colspan="4">
					订单编号：<%=ord_id %>
				</td>
			</tr>
			<tr id="table_title" align="center">
				<td>商品图</td>
				<td>商品名称</td>
				<td>数量</td>
				<td>单价</td>
			</tr>
			<%
				for(Order order:list){
			%>	
				<tr id="table_content" align="center">
					<td><img style="height:50px;height:50px;" src="<%=request.getContextPath()%>/upload/goodsImg/<%=goodsDao.load(order.getGoods_id()).getImg_name() %>"></td>
					<td><%=goodsDao.load(order.getGoods_id()).getGoods_title() %></td>
					<td>1</td>
					<td><%=goodsDao.load(order.getGoods_id()).getPrice() %></td>
				</tr>
			<%
				}
			%>
		</table>
		<%
			if(comment == null){}else{
			Order order = orderDao.load(ord_id);
			if(comment.getAdvice()==null||"".equals(comment.getAdvice().trim())){}else{
		%>
			<table>
				<tr>
					<td>您的评论</td>
					<td><b>类型：</b><font color="red"><%=comment.getEval_rank() %></font></td>
					<td><textarea rows="6" style=" resize: none;" cols="60" readonly="readonly" disabled ><%=comment.getAdvice() %></textarea></td>
				</tr>
				
			</table>
		<%
			}
		%>
		<%
			if(comment.getReply()==null||"".equals(comment.getReply().trim())){}else{
		%>
			<table>
				<tr>
					<td>家乡味商城回复您</td>
					<td></td>
					<td ><textarea rows="6" style=" resize: none;" cols="60" readonly="readonly" disabled ><%=comment.getReply() %></textarea></td>
				</tr>
				
			</table>
		<%
				}
			}
		%>
		
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