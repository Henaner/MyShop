<%@page import="cn.wangchenhui.model.Pager"%>
<%@page import="cn.wangchenhui.dao.IUserDao"%>
<%@page import="cn.wangchenhui.model.Order"%>
<%@page import="java.util.List"%>
<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@page import="cn.wangchenhui.dao.IOrderDao"%>
<%@page import="cn.wangchenhui.model.User"%>
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
		User user = (User)session.getAttribute("loginUser");
		int user_id = user.getUser_id();
		IOrderDao orderDao = DaoFactory.getOrderDao();
		String condition = request.getParameter("condition");
		if(condition == null){
			condition = "";
		}
		Pager<Order> pages = orderDao.getList(user_id);
		int totalPage = pages.getTotalPage();
		int totalRecord = pages.getTotalRecord();
	%>
	<div style="border:solid 1px #9D2A29;height:520px;width:97%">
		<table>
			<tr id="table_title" align="center">
				<td>订单编号</td>
				<td>订单生成日期</td>
				<td>订单状态</td>
				<td>操作</td>
			</tr>
			<%
				for(Order order:pages.getData()){
			%>
			<tr id="table_content" align="center">
				<td><%=order.getOrd_id() %></td>
				<td><%=order.getPost_date()%></td>
				<%
					if(order.getOrd_status().equals("0")){
				%>
				<td>未发货</td>
				<%
					}else if(order.getOrd_status().equals("1")){
				%>
				<td><input type="button" onclick="window.location.href='<%=request.getContextPath() %>/lockPages/user/orderConfirm.jsp?ord_id=<%=order.getOrd_id() %>'" value="确认收货"></td>
				<%
					}else if(order.getOrd_status().equals("2")){
				%>
				<td><input type="button" onclick="window.location.href='<%=request.getContextPath() %>/lockPages/user/evaluate.jsp?ord_id=<%=order.getOrd_id() %>'" value="评价"></td>
				<%
					}else{
				%>
					<td>订单已完成</td>
				<%
					}
				%>
				<td width="30%"><a href="<%=request.getContextPath()%>/lockPages/user/ordDetail.jsp?ord_id=<%=order.getOrd_id()%>" target="main">查看详情</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/lockPages/user/ordDel.jsp?ord_id=<%=order.getOrd_id()%>">删除</a></td>
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