<%@page import="cn.wangchenhui.model.Notice"%>
<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@page import="cn.wangchenhui.dao.INoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css">
<link rel="shortcut icon" href="<%=request.getContextPath() %>/favicon.ico">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-2.2.0.min.js"></script>
<title>购物车详情</title>
</head>
<body>
<%
	INoticeDao noticeDao = DaoFactory.getNoticeDao();
	Notice notice = noticeDao.getNotice();
%>
	<!-- 导入header部分 -->
	<div id="include_header_bannner">
		<div id="include_header">
			<jsp:include page="/lockPages/user/header.jsp"></jsp:include>
		</div>
	</div>
	<!-- 这里是公告板的展示区 -->
	<hr style="position:absolute;width:90%;height:2px;border:none;border-top:2px dotted #9D2A29; margin-top:200px;margin-left:60px;">
	<div  style="position: absolute;margin-top:210px;width:99%;margin-left:3px;">
		<div style="position:absolute;margin-top:-8px;margin-left:250px;background-color:#9D2A29;border:solid 1px #9D2A29;width:60%;height:40px;backgroud-color:#9D2A29;"><p align="center" style="color:white;margin-top:-4px;"><font size="+3">公告详情</font></p></div>
		<div id="notice_detail" style="position:absolute;height:800px;width:60%;margin-left:250px;margin-top:30px;border:solid 1px #9D2A29;">
			<table style="width:90%;height:800px;margin-left:40px;margin-top:2px;">
				<tr height="50px;" align="center">
					<td style="font-size:20px;"><b><%=notice.getNotice_title() %></b></td>
				</tr>
				<tr height="50px;" align="right">
					<td>发布时间：<%=notice.getPost_date() %></td>
				</tr>
				<tr valign="top">
					<td><%=notice.getNotice_content() %></td>
				</tr>
			</table>
		</div>
	</div>
	<!-- 导入底部的版权页 -->
	<div id="include_bottom" style="position: absolute;margin-top:1100px;margin-left:150px;">
			<jsp:include page="/bottom.jsp"></jsp:include>
	</div>
</body>
</html>