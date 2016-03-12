<%@page import="cn.wangchenhui.model.User"%>
<%@page import="cn.wangchenhui.model.Pager"%>
<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@page import="cn.wangchenhui.dao.IUserDao"%>
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
	IUserDao userDao = DaoFactory.getUserDao();
	Pager<User> pages = userDao.list();
	int totalPage = pages.getPageSize();
	int totalRecord = pages.getTotalRecord();
%>
	<jsp:include page="/lockPages/admin/inc/top.jsp"></jsp:include>
	<div align="center" style="position:absolute;width:98%;height:450px;border:solid 1px #7F0101;margin-left:2px;margin-top:50px;">
		<table align="center">
			<tr>
				<td colspan="3">请输入用户名或者联系方式(邮箱|手机号)进行查找：</td>
				<td colspan="9" align="left" valign="top">
					<form action="" method="post">
						<input type="text" name="condition" size="80">&nbsp;&nbsp;<input type="submit" style="width:60px;height:25px;background: #9D2A29;color:white;border-radius:5px;cursor:pointer;" value="查找">
					</form>
				</td>
			</tr>
			<tr id="table_title" align="center">
				<td>用户名</td>
				<td>性别</td>
				<td>生日</td>
				<td>邮箱</td>
				<td>电话</td>
				<td>类型</td>
				<td>状态</td>
				<td>操作员状态</td>
				<td>是否是操作员</td>
				<td>是否是管理员</td>
			</tr>
			<%
				for(User user:pages.getData()){
			%>
			<tr id="table_content" align="center">
				<td><%=user.getUser_name() %></td>
				<td><%=user.getUser_gender() %></td>
				<td><%=user.getBirthday() %></td>
				<td><%=user.getEmail() %></td>
				<td><%=user.getTelphone() %></td>
				<%
					if(Integer.parseInt(user.getType())==0){
				%>
				<td>会员</td>
				<%
					}else{
				%>
				<td>管理员</td>
				<%
					}
				%>
				<%
					if(Integer.parseInt(user.getStatus())==1){
				%>
				<td><a title= "单击更改为禁用" href="<%=request.getContextPath()%>/lockPages/user/disable.jsp?id=<%=user.getUser_id()%>">启用</a></td>
				<%
					}else{
				%>
				<td><a title= "单击更改为启用" href="<%=request.getContextPath()%>/lockPages/user/enable.jsp?id=<%=user.getUser_id()%>">禁用</a></td>
				<%
					}
				%>
				<td><%=user.getOpt_status() %></td>
				<td><%=user.getIs_operator() %></td>
				<td><%=user.getIs_admin() %></td>
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