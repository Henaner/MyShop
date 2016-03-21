<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/lockPages/admin/inc/top.jsp"></jsp:include>
	<br><br>
	<div align="center" style="position:absolute;width:90%;height:450px;border:solid 1px #7F0101;margin-left:60px;margin-top:10px;font-size:18px;color:red;">
		<div align="center" style="margin-top:50px;">
			<img src="<%=request.getContextPath() %>/images/add_ok.png">
		</div>
		<div align="center" style="margin-top:100px;">
			回复成功，<a href="<%=request.getContextPath()%>/lockPages/admin/commentManage.jsp" target="main">返回</a>继续添加
		</div>
	</div>
</body>
</html>