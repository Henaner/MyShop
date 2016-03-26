<%@page import="cn.wangchenhui.model.Comment"%>
<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@page import="cn.wangchenhui.dao.ICommentDao"%>
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
	int id = Integer.parseInt(request.getParameter("id"));
	ICommentDao commentDao = DaoFactory.getCommentDao();
	Comment comment = commentDao.load(id);
%>
	<jsp:include page="/lockPages/admin/inc/top.jsp"></jsp:include>
	<div align="center" style="position:absolute;width:98%;height:450px;border:solid 1px #7F0101;margin-left:2px;margin-top:50px;">
		<form action="<%=request.getContextPath()%>/lockPages/admin/submitReply.jsp">
		<table>
			<tr>
				<td>顾客评论<input type="hidden" name="id" value="<%=id%>"></td>
				<td>
					<textarea rows="6" cols="80" readonly="readonly" disabled style="resize:none"><%=comment.getAdvice()%></textarea>
				</td>
			</tr>
			<tr>
				<td>回复</td>
				<td>
					<textarea rows="6" cols="80" name = "admin_reply" style="resize:none"></textarea>
				</td>
			</tr>
			<tr>
				<td><input type="reset" value="重置"></td>
				<td><input type="submit" value="提交"></td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>