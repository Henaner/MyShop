<%@page import="cn.wangchenhui.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ckeditor/adapters/jquery.js"></script>
</head>
<body>
	<%
	User loginUser = (User)session.getAttribute("loginOpt");
%>
<jsp:include page="/lockPages/admin/inc/top.jsp"></jsp:include>
<br><br>
	<form action="<%=request.getContextPath() %>/lockPages/admin/doNotice.jsp" method="post" >
		<div align="center" style="width:90%;height:450px;border:solid 1px #7F0101;margin-left:60px;margin-top:10px;">
			<table align="left" style="width:100%;margin-top:10px;margin-left:10px;">
				<tr>
					<td>标题</td>
					<td><input type="text" name="notice_title" size ="120" maxlength="25">&nbsp;&nbsp;<font color="red">*标题字数最多为25&nbsp;&nbsp;<input type="submit" style="width:50px;border-radius:5px;background:#9D2A29;color:white;cursor:pointer;" value="添加"></font></td>
				</tr>
				<tr>
					<td>内容</td>
					<td><textarea id="notice_content" name="notice_content"></textarea></td>
				</tr>
			</table>
		</div>
	</form>
</body>
<script type="text/javascript">
    CKEDITOR.replace('notice_content', { height: '271px', width: '970px' });
</script>
</html>