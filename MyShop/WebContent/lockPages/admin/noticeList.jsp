<%@page import="cn.wangchenhui.model.User"%>
<%@page import="cn.wangchenhui.dao.IUserDao"%>
<%@page import="cn.wangchenhui.model.Notice"%>
<%@page import="cn.wangchenhui.model.Pager"%>
<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@page import="cn.wangchenhui.dao.INoticeDao"%>
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
	INoticeDao noticeDao = DaoFactory.getNoticeDao();
	Pager<Notice> pages = noticeDao.list();
	int totalPage = pages.getPageSize();
	int totalRecord = pages.getTotalRecord();
%>
	<jsp:include page="/lockPages/admin/inc/top.jsp"></jsp:include>
	<div align="center" style="position:absolute;width:98%;height:450px;border:solid 1px #7F0101;margin-left:2px;margin-top:50px;">
		<table align="center">
			<tr>
				<td colspan="1">请输入公告关键词进行查找：</td>
				<td colspan="3" align="left" valign="top">
					<form action="" method="post">
						<input type="text" name="condition" size="80">&nbsp;&nbsp;<input type="submit" style="width:60px;height:25px;background: #9D2A29;color:white;border-radius:5px;cursor:pointer;" value="查找">
					</form>
				</td>
			</tr>
			<tr id="table_title" align="center">
				<td>公告标题</td>
				<td>发布时间</td>
				<td>发布人</td>
				<td>操作</td>
			</tr>
			<%
				IUserDao userDao = DaoFactory.getUserDao();
				for(Notice notice:pages.getData()){
			%>
			<tr id="table_content" align="center">
				<td width="500px"><a href="<%=request.getContextPath()%>/notice.jsp?id=<%=notice.getId()%>" target="blank"><%=notice.getNotice_title() %></a></td>
				<td width="200px"><%=notice.getPost_date() %></td>
				<td width="100px"><%=userDao.load(notice.getUser_id()).getUser_name()%></td>
				<td><a href="<%=request.getContextPath()%>/lockPages/admin/noticeDel.jsp?id=<%=notice.getId()%>">删除</a></td>
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