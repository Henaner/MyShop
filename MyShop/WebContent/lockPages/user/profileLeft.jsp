<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.12.0.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css"> 
</head>
<body >
	<div id="left_div_total" style="margin-top:0px;margin-left:-2px;">
		<!--密码管理 -->
		<div  title="单击前去修改密码" style="cursor:pointer;" id="left_div_slide" class="left_div"><img id="arrow" src="<%=request.getContextPath()%>/images/icon/backstage/Arrow_Right_24px_523784_easyicon.net.png"><p><a href="<%=request.getContextPath() %>/lockPages/user/password.jsp" target="main">密码管理</a></p><div id="img"><img src="<%=request.getContextPath()%>/images/icon/backstage/settings_16px_1187941_easyicon.net.png"></div></div>
		<!--收货地址管理-->
		<div title="单击前去管理收货地址" style="cursor:pointer;" id="left_div_user" class="left_div"><img id="arrow" src="<%=request.getContextPath()%>/images/icon/backstage/Arrow_Right_24px_523784_easyicon.net.png"><p><a href="<%=request.getContextPath() %>/lockPages/user/address.jsp" target="main">收货地址管理</a></p><div id="img"><img src="<%=request.getContextPath()%>/images/icon/backstage/settings_16px_1187941_easyicon.net.png"></div></div>
		<!--订单管理 -->
		<div title="单击前去管理订单" style="cursor:pointer;" id="left_div_order" class="left_div"><img id="arrow" src="<%=request.getContextPath()%>/images/icon/backstage/Arrow_Right_24px_523784_easyicon.net.png"><p><a href="<%=request.getContextPath() %>/lockPages/user/orderManage.jsp" target="main">订单管理</a></p><div id="img"><img src="<%=request.getContextPath()%>/images/icon/backstage/settings_16px_1187941_easyicon.net.png"></div></div>
		<!--回到首页 -->
		<div title="单击前去管理订单" style="cursor:pointer;" id="left_div_order" class="left_div"><img id="arrow" src="<%=request.getContextPath()%>/images/icon/backstage/Arrow_Right_24px_523784_easyicon.net.png"><p><a href="<%=request.getContextPath() %>/index.jsp" target="_parent">返回首页</a></p><div id="img"><img src="<%=request.getContextPath()%>/images/icon/backstage/settings_16px_1187941_easyicon.net.png"></div></div>
	</div>
</body>
<style type="text/css">
	.left_div{
		width:180px;
		height:30px;
		border:solid 2px grey;
		border-style:dotted;
		/*background: #BF4B25;*/
	}
	.left_div img{
		margin-top:3px;
	}
	.left_div #img{margin-top:-38px;margin-left:160px;}
	.left_div p{
		margin-top:-23px;
		margin-left:30px;
	}
	.left_div_panel{
		display:none;
		width:180px;
		height:150px;
		border:solid 1px grey;
	}
</style>
</html>