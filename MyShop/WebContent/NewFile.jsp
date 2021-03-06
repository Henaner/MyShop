<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/favicon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css"> 
<script type="text/javascript" src="<%=request.getContextPath()%>/js/uploadFile.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-2.2.0.min.js"></script>
<title>家乡味管理后台</title>
</head>
<body>
   <form action="<%=request.getContextPath() %>/fileUpload.do" method="post" enctype="multipart/form-data" >
   		文件名:<input type="text" name="fileTitle"><br><br>
   		文件：
   		<div class="uploader green" style="position:absolute; margin-top:0px;margin-left:0px;">
   		
							<input type="text" class="filename" name="filename" readonly="readonly"/>
							<input type="button"  class="button" value="请选择图片..."/>
							<input type="file"  name = "image" size="30"/>
		</div>
		<br><br>
		<input type="submit" value="上传">
   </form>
</body>
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
		if($(this).val()==""){$(this).parents(".uploader").find(".filename").val("No file selected...");}
		});
	});
</script>
</html>