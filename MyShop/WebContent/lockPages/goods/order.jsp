<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="<%=request.getContextPath() %>/favicon.ico">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/returntop.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/js/icheck/skins/all.css" >
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-2.2.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/icheck/icheck.js"></script>
<title>结算中心</title>
</head>
<body>
	<!-- 导入header部分 -->
	<div id="include_header_bannner">
		<div id="include_header">
			<jsp:include page="/header.jsp"></jsp:include>
		</div>
	</div>
	<hr style="position:absolute;width:90%;height:2px;border:none;border-top:2px dotted #9D2A29; margin-top:200px;margin-left:60px;">
	<div  style="position: absolute;margin-top:210px;width:99%;margin-left:3px;">
		<div style="position:absolute;margin-top:-8px;margin-left:62px;border:solid 1px #9D2A29;width:90%;height:40px;background-color:#9D2A29;"><p align="center" style="color:white;height:50px;margin-top:-4px;"><font size="+3">确认收货地址</font></p></div>
		<!-- 订单收货地址区域 -->
		<div style="position:absolute;margin-top:32px;margin-left:62px;width:90%;height:150px;border:solid 1px #9D2A29;">
				<div></div>
					<input type="radio" name="iCheck" id="item" class="item">河南省新蔡县
		</div>
	</div>
	<!-- 订单的详细信息区域 -->
	<hr style="position:absolute;width:90%;height:2px;border:none;border-top:2px dotted #9D2A29; margin-top:400px;margin-left:60px;">
	<div  style="position: absolute;margin-top:410px;width:99%;margin-left:3px;">
		<div style="position:absolute;margin-top:-8px;margin-left:62px;background-color:#9D2A29;border:solid 1px #9D2A29;width:90%;height:40px;backgroud-color:#9D2A29;"><p align="center" style="color:white;margin-top:-4px;"><font size="+3">订单详情</font></p></div>
		<!-- 订单详细信息区域 -->
		<div style="position:absolute;margin-top:32px;margin-left:62px;width:90%;height:500px;border:solid 1px #9D2A29;"></div>
		<div style="position:absolute;margin-top:532px;margin-left:62px;width:90%;height:50px;border:solid 1px #9D2A29;background-color:#9D2A29;">
			<div style="margin-left:60px;position:absolute;margin-top:-2px;;"><p style="font-size:18px;color:white;"><b>寄送至：</b>河南省新蔡县河坞乡石营村委新庄组888号&nbsp;&nbsp;	<b>收货人：</b>王晨辉	18721686821</p></div>
			<div style="margin-left:1000px;position:absolute;"><input type="button" style="color:#9D2A29;height:50px;width:120px;font-size:18px;left:900px;" value="下单"></div>
		</div>
	</div>
	<!-- 导入底部的版权页 -->
	<div id="include_bottom">
			<jsp:include page="/bottom.jsp"></jsp:include>
	</div>
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