<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员中心</title>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/favicon.ico">
</head>
<frameset style="height:800px;" rows="10%,90%">
	<frame src="<%=request.getContextPath()%>/lockPages/user/profileTop.jsp" scrolling="no" frameborder="0">
	<frameset cols="15%,*">
		<frame id="left" src="<%=request.getContextPath()%>/lockPages/user/profileLeft.jsp" scrolling="no" frameborder="0">
		<frame id="main" src="<%=request.getContextPath()%>/lockPages/user/profileIndex.jsp" name="main" scrolling="no" frameborder="0">
	</frameset>
</frameset>
</html>