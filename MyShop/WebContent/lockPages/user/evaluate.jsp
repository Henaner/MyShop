<%@page import="cn.wangchenhui.model.Order"%>
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
		String ord_id = request.getParameter("ord_id");
		IOrderDao orderDao = DaoFactory.getOrderDao();
		Order order = orderDao.load(ord_id);
	%>
	<div style="border:solid 1px #CCCCCC;height:520px;width:97%">
		<div style="margin-left:80px;margin-top:50px;font-size:20px;">现在正为订单:<b><%=order.getOrd_id() %></b>&nbsp;&nbsp;&nbsp;&nbsp;做出评价</div>
		<div style="margin-left:80px;margin-top:60px;">
			<form action="<%=request.getContextPath()%>/lockPages/user/evalSucc.jsp">
				<table width="70%">
					<tr>
						<td>请您对此次的服务做出评价</td>
						<td><input type="radio" name="rank" class="rank" value="好">好评<input type="radio" name="rank" class="rank" value="中">中评<input type="radio" name="rank" class="rank" value="差">差评</td>
					</tr>
					<tr height="200px">
						<td>您的意见或建议<input type="hidden" name="ord_id" value="<%=order.getOrd_id() %>"></td>
						<td>
							<textarea rows="6" cols="40" name = "advice" style="resize:none;"></textarea>
						</td>
					</tr>
					<tr>
						<td><input type="reset" value="清空"></td>
						<td><input type="submit" value="评价"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>