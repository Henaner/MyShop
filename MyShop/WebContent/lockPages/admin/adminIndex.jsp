<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/favicon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css"> 
<title>家乡味管理后台</title>
</head>
<frameset id="frameset1" class="frameset1" rows="98,*" border="0"> 
	<frame src="top.jsp" scrolling="no" frameborder="0">
	<frameset id="frameset2" class="frameset2" cols="196,*" >
		<frame src="left.jsp" id="leftFrame" class="leftFrame" scrolling="no" frameborder="0">
		<frame src="main.jsp" id="mainFrame" scrolling="no" class="mainFrame" frameborder="0" name="main">
	</frameset>
</frameset>
</html>