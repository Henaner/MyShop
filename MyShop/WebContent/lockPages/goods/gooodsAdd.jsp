<%@page import="cn.wangchenhui.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ckeditor/adapters/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ckeditor/ckeditor.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/js/icheck/skins/all.css" >
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-2.2.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/icheck/icheck.js"></script>
</head>
<body>
	<jsp:include page="/lockPages/admin/inc/top.jsp"></jsp:include>
<br><br>
<%
	User user = (User)session.getAttribute("loginOpt");
%>
	<form action="<%=request.getContextPath() %>/GoodsAdd" method="post" enctype="multipart/form-data" name="goods_add">
		<div align="center" style="width:90%;height:450px;border:solid 1px #7F0101;margin-left:60px;margin-top:10px;">
		<div><img src="<%=request.getContextPath()%>/images/banner.jpg" style="width:100%;height:50px;"><p style="color:red;margin-top:-30px;">注意图片的尺寸是1920*600的格式</p></div>
			<table align="left" style="margin-top:5px;">
				<tr>
					<td>商品标题&nbsp;&nbsp;<input type="hidden" name="user_id" value="<%=user.getUser_id()%>"></td>
					<td><input type="text" name="goods_title" size="42" maxlength="25" style="border:solid 1px #CCCCCC;height:28px;border-radius:5px;text-indent:2px;padding-left: 2px;"><font color="red">&nbsp;&nbsp;商品的名称字数最多为25</font>
					<div style="postion:absolute;margin-left:750px;margin-top:-30px;"><input type="submit" style="width:50px;border-radius:5px;background:#9D2A29;color:white;cursor:pointer;" value="添加"></div>
					</td>
				</tr>
				<tr>
					<td>上传图片&nbsp;&nbsp;</td>
					<td>
						<div class="uploader green">
							<input type="text" class="filename" readonly="readonly"/>
							<input type="button" class="button" value="请选择图片..."/>
							<input type="file" name="image" size="30" />
						</div>
						<div style="postion:absolute;margin-left:290px;margin-top:-40px;">类型：
							<input type="radio" name="iCheck" id="gender"
							class="type"  value="新">&nbsp;新&nbsp;&nbsp;<input type="radio"
							name="iCheck" id="type" class="gender" value="热">&nbsp;热
						&nbsp;&nbsp;|</div>
						<div style="postion:absolute;margin-left:460px;margin-top:-23px;">
							单价：<input type="text" size="10" name="goods_price">&nbsp;&nbsp;<font color="red">*精确两位</font>&nbsp;&nbsp;|
						</div>
						<div style="postion:absolute;margin-left:690px;margin-top:-23px;">
							库存：<input type="text" size="10" name="goods_stock">&nbsp;&nbsp;|
						</div>
						<div style="margin-left:838px;margin-top:-23px;">类别：
							<select name="category">
								<option value="肉类精选">肉类精选</option>
								<option value="粮油米面">粮油米面</option>
								<option value="果蔬副食">果蔬副食</option>
								<option value="名茶名酒">名茶名酒</option>
								<option value="野生特产">野生特产</option>
								<option value="工艺礼品">工艺礼品</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td>商品描述&nbsp;&nbsp;</td>
					<td><textarea id="goods_desc" name="goods_desc"></textarea></td>
				</tr>
			</table>
		</div>
	</form>
</body>
<script type="text/javascript">
    CKEDITOR.replace('goods_desc', { height: '148px', width: '970px' });
</script>
<script type="text/javascript">
	$(document).ready(function(){
		 $('input').iCheck({
		   checkboxClass: 'icheckbox_square-red',  // 注意square和blue的对应关系
		   radioClass: 'iradio_square-red',
		   increaseArea: '20%' // optional
		 });
	});
</script>
<style type="text/css">
	.uploader{
	position:relative;
	display:inline-block;
	overflow:hidden;
	cursor:default;
	padding:0;
	margin:10px 0px;
	-moz-box-shadow:0px 0px 5px #ddd;
	-webkit-box-shadow:0px 0px 5px #ddd;
	box-shadow:0px 0px 5px #ddd;
	
	-moz-border-radius:5px;
	-webkit-border-radius:5px;
	border-radius:5px;
	}
	
	.filename{
	float:left;
	display:inline-block;
	outline:0 none;
	height:32px;
	width:180px;
	margin:0;
	padding:8px 10px;
	overflow:hidden;
	cursor:default;
	border:1px solid;
	border-right:0;
	font:9pt/100% Arial, Helvetica, sans-serif; color:#777;
	text-shadow:1px 1px 0px #fff;
	text-overflow:ellipsis;
	white-space:nowrap;
	
	-moz-border-radius:5px 0px 0px 5px;
	-webkit-border-radius:5px 0px 0px 5px;
	border-radius:5px 0px 0px 5px;
	
	background:#f5f5f5;
	background:-moz-linear-gradient(top, #fafafa 0%, #eee 100%);
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0%,#fafafa), color-stop(100%,#f5f5f5));
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fafafa', endColorstr='#f5f5f5',GradientType=0);
	border-color:#ccc;
	
	-moz-box-shadow:0px 0px 1px #fff inset;
	-webkit-box-shadow:0px 0px 1px #fff inset;
	box-shadow:0px 0px 1px #fff inset;
	
	-moz-box-sizing:border-box;
	-webkit-box-sizing:border-box;
	box-sizing:border-box;
	}
	
	.button{
	float:left;
	height:32px;
	display:inline-block;
	outline:0 none;
	padding:8px 12px;
	margin:0;
	cursor:pointer;
	border:1px solid;
	font:bold 9pt/100% Arial, Helvetica, sans-serif;
	
	-moz-border-radius:0px 5px 5px 0px;
	-webkit-border-radius:0px 5px 5px 0px;
	border-radius:0px 5px 5px 0px;
	
	-moz-box-shadow:0px 0px 1px #fff inset;
	-webkit-box-shadow:0px 0px 1px #fff inset;
	box-shadow:0px 0px 1px #fff inset;
	}
	
	
	.uploader input[type=file]{
	position:absolute;
	top:0; right:0; bottom:0;
	border:0;
	padding:0; margin:0;
	height:30px;
	cursor:pointer;
	filter:alpha(opacity=0);
	-moz-opacity:0;
	-khtml-opacity: 0;
	opacity:0;
	}
	
	input[type=button]::-moz-focus-inner{padding:0; border:0 none; -moz-box-sizing:content-box;}
	input[type=button]::-webkit-focus-inner{padding:0; border:0 none; -webkit-box-sizing:content-box;}
	input[type=text]::-moz-focus-inner{padding:0; border:0 none; -moz-box-sizing:content-box;}
	input[type=text]::-webkit-focus-inner{padding:0; border:0 none; -webkit-box-sizing:content-box;}
		
	.green .button{
	color:#fff;
	text-shadow:1px 1px 0px #6b7735;
	background:#7d8f33;
	background:-moz-linear-gradient(top, #93aa4c 0%, #7d8f33 100%);
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0%,#93aa4c), color-stop(100%,#7d8f33));
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#93aa4c', endColorstr='#7d8f33',GradientType=0);
	border-color:#6b7735;
	}
	.green:hover .button{
	background:#93aa4c;
	background:-moz-linear-gradient(top, #7d8f33 0%, #93aa4c 100%);
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0%,#7d8f33), color-stop(100%,#93aa4c));
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#7d8f33', endColorstr='#93aa4c',GradientType=0);
	}
</style>
<script type="text/javascript">
	$(function(){
		$("input[type=file]").change(function(){$(this).parents(".uploader").find(".filename").val($(this).val());});
		$("input[type=file]").each(function(){
		if($(this).val()==""){$(this).parents(".uploader").find(".filename").val("未选择图片...");}
		});
	});
</script>
</html>
</body>
</html>