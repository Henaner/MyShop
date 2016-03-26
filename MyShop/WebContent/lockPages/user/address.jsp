<%@page import="cn.wangchenhui.model.Address"%>
<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@page import="cn.wangchenhui.dao.IAddressDao"%>
<%@page import="cn.wangchenhui.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/geo.js"></script>
</head>
<body onload="setup();preselect('');createCode()">
	<%
		User user = (User)session.getAttribute("loginUser");
		int user_id = user.getUser_id();
		IAddressDao addressDao = DaoFactory.getAddressDao();
		Address address = addressDao.load(user_id);
	%>
	<div style="border:solid 1px #CCCCCC;height:520px;width:97%">
		<p style="margin-left:40px;margin-top:80px;font-size:20px;"><b>地址：</b><%=address.getAddress() %>&nbsp;&nbsp;<b>姓名：</b><%=address.getName() %>&nbsp;&nbsp;<b>联系方式：</b><%=address.getTelphone() %>&nbsp;&nbsp;&nbsp;&nbsp;<input style="cursor:pointer;border-radius:5px;width:80px;height:30px;background:#9D2A29;color:white;" type="button" onclick="addr_see();" value="修改"></p>
		<div style="margin-left:100px;margin-top:50px;display:none;" id="hidden_addr">
			<form action="<%=request.getContextPath()%>/lockPages/user/changeAddr.jsp" method="post">
				<table style="width:140%;height:350px;">
					<tr>
						<td>地址</td>
						<td>
							<select class="select"  name="province" id="s1"></select> <select
							class="select" name="city"  id="s2"></select> <select
							class="select" name="town" id="s3"></select>
						</td>
					</tr>
					<tr>
						<td>详细地址：</td>
						<td><input type="text" name="detail_addr" size="100px" value="<%=address.getAddress()%>"></td>
					</tr>
					<tr>
						<td>收货人姓名：</td>
						<td><input type="text" name="ord_name" size="100px" value="<%=address.getName()%>"></td>
					</tr>
					<tr>
						<td>联系方式：</td>
						<td><input type="text" name="telphone" size="100px" value="<%=address.getTelphone()%>"></td>
					</tr>
					<tr>
						<td ><input type="submit" value="确认" style="cursor:pointer;border-radius:5px;width:80px;height:30px;background:#9D2A29;color:white;"></td>
						<td ><input type="button" onclick="cancel_change();" value="取消" style="cursor:pointer;border-radius:5px;width:80px;height:30px;background:#9D2A29;color:white;"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
	function addr_see(){
		var objDiv = document.getElementById("hidden_addr");
		objDiv.style.display="block";
	}
	function cancel_change(){
		var objDiv = document.getElementById("hidden_addr");
		objDiv.style.display="none";
	}
</script>
</html>