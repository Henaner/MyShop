<%@page import="cn.wangchenhui.model.Goods"%>
<%@page import="cn.wangchenhui.dao.IGoodsDao"%>
<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="favicon.ico">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/returntop.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/js/spinner/jquery.spinner.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/spinner/jquery.spinner.js"></script>
<title>商品展示页面</title>
</head>
<body>
	<!-- 导入header部分 -->
	 <div style="margin-top:600px;margin-left:400px;">
	 	<input type="text" class="spinner"/>
	 </div>
	
</body>
   <script type="text/javascript">
		$('.spinner').spinner();
   </script> 
</html>