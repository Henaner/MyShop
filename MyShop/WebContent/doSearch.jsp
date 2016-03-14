<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/js/icheck/skins/all.css" >
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-2.2.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/icheck/icheck.js"></script>
<title>搜索结果</title>
</head>
<body>
<input type="radio" name="iCheck" id="item" class="item">
</body>
<script type="text/javascript">
	$(document).ready(function(){
		 $('input').iCheck({
		   checkboxClass: 'icheckbox_square-red',  // 注意square和blue的对应关系
		   radioClass: 'iradio_square-red',
		   increaseArea: '20%' // optional
		 });
	});
</script>
</html>