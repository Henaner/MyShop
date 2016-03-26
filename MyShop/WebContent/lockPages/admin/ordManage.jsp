<%@page import="cn.wangchenhui.model.Order"%>
<%@page import="cn.wangchenhui.model.Pager"%>
<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@page import="cn.wangchenhui.dao.IOrderDao"%>
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
	if(condition == null){
		condition = "";
	}
	IOrderDao orderDao = DaoFactory.getOrderDao();
	Pager<Order> pages = orderDao.list(condition);
	int totalPage = pages.getTotalPage();
	int totalRecord = pages.getTotalRecord();
%>
	<jsp:include page="/lockPages/admin/inc/top.jsp"></jsp:include>
	<div align="center" style="position:absolute;width:98%;height:450px;border:solid 1px #7F0101;margin-left:2px;margin-top:50px;">
		<table align="center">
			<tr>
				<td colspan="3">请输入用户名进行查找：</td>
				<td colspan="9" align="left" valign="top">
					<form action="" method="post">
						<input type="text" name="condition" value="<%=condition %>" size="80">&nbsp;&nbsp;<input type="submit" style="width:60px;height:25px;background: #9D2A29;color:white;border-radius:5px;cursor:pointer;" value="查找">
					</form>
				</td>
			</tr>
			<tr id="table_title" align="center">
				<td>订单编号</td>
				<td>生成日期</td>
				<td>用户id</td>
				<td>总金额</td>
				<td>订单状态</td>
			</tr>
			<%
				for(Order order:pages.getData()){
			%>
			<tr id="table_content" align="center">
				<td><%=order.getOrd_id() %></td>
				<td><%=order.getPost_date()%></td>
				<td><%=order.getUser_id()%></td>
				<td><%=order.getAmount() %>￥</td>
				<%
					if(order.getOrd_status().equals("0")){
				%>
				<td>未付款</td>
				<%
					}else if(order.getOrd_status().equals("1")){
				%>
				<td><a href="<%=request.getContextPath()%>/lockPages/admin/sendOrder.jsp?ord_id=<%=order.getOrd_id()%>" title="单击启用">去发货</a></td>
				<%
					}else if(order.getOrd_status().equals("2")){
				%>
				<td><font color="green">待收货</font></td>
				<%
					}else {
				%>
				<td>已完成</td>
				<%
					}
				%>
			</tr>
			<%
				}
			%>
		</table>
		<div style="">
			<jsp:include page="/lockPages/pager/pager.jsp">
					<jsp:param name="totalRecord" value="<%=totalRecord%>"/>
               	    <jsp:param name="totalPage" value="<%=totalPage%>" />
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