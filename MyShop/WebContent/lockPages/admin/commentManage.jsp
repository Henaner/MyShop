<%@page import="cn.wangchenhui.model.Comment"%>
<%@page import="cn.wangchenhui.model.Pager"%>
<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@page import="cn.wangchenhui.dao.ICommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
<%
	String condition = request.getParameter("condition");
	if(condition == null){
		condition = "";
	}else{
		condition = new String(request.getParameter("condition").getBytes("iso8859-1"),"utf-8");
	}
	ICommentDao commentDao = DaoFactory.getCommentDao();
	Pager<Comment> pages = commentDao.list(condition);
	int totalPage = pages.getTotalPage();
	int totalRecord = pages.getTotalRecord();
%>
	<jsp:include page="/lockPages/admin/inc/top.jsp"></jsp:include>
	<div align="center" style="position:absolute;width:98%;height:450px;border:solid 1px #7F0101;margin-left:2px;margin-top:50px;">
		<table align="center">
			<tr>
				<td colspan="3">请输入订单编号进行查找：</td>
				<td colspan="9" align="left" valign="top">
					<form action="" method="post">
						<input type="text" name="condition" value="<%=condition %>" size="80">&nbsp;&nbsp;<input type="submit" style="width:60px;height:25px;background: #9D2A29;color:white;border-radius:5px;cursor:pointer;" value="查找">
					</form>
				</td>
			</tr>
			<tr id="table_title" align="center">
				<td>订单id</td>
				<td>用户id</td>
				<td>等级</td>
				<td>评论时间</td>
				<td>操作</td>
			</tr>
			<%
				for(Comment comment:pages.getData()){
			%>
			<tr id="table_content" align="center">
				<td><%=comment.getOrd_id() %></td>
				<td><%=comment.getUser_id() %></td>
				<td><%=comment.getEval_rank()%></td>
				<td><%=comment.getPost_date()%></td>
				<%
					if(comment.getReply()==null||"".equals(comment.getReply().trim())){
				%>
					<td><a href="<%=request.getContextPath()%>/lockPages/admin/reply.jsp?id=<%=comment.getId()%>">回复</a></td>
				<%
					}else{
				%>
					<td>已经回复</td>
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