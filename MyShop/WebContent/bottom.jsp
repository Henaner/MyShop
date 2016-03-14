<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/top.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/top.js"></script>
<title>Copyright</title>
</head>
<body>
	<!-- 返回顶部 -->
	<a href="#" onclick="gotoTop();return false;" class="totop"></a>
	<div id="copyright">
		<hr  id="copyright_hr" style="width:105%;height:1px;border:none;border-top:2px dotted #E50B0B;">
			<div id="shopping_ensure">
				<table>
					<tr>
						<th>购物保障</th>
					</tr>
					<tr id="tr">
						<td><a href="">退换货流程</a></td>
					</tr>
					<tr id="tr">
						<td><a href="">退换货政策</a></td>
					</tr>
					<tr id="tr">
						<td><a href="">条款条约</a></td>
					</tr>
				</table>
			</div>
			<div id="line_1"></div>
			<div id="new_hand">
				<table>
					<tr>
						<th>新手入门</th>
					</tr>
					<tr id="tr">
						<td><a href="">用户注册</a></td>
					</tr>
					<tr id="tr">
						<td><a href="">找回密码</a></td>
					</tr>
					<tr id="tr">
						<td><a href="">帮助中心</a></td>
					</tr>
				</table>
			</div>
			<div id="line_2"></div>
			<div id="logistic">
				<table>
					<tr>
						<th>配送方式</th>
					</tr>
					<tr id="tr">
						<td><a href="">配送标准</a></td>
					</tr>
					<tr id="tr">
						<td><a href="">包裹查询</a></td>
					</tr>
					<tr id="tr">
						<td><a href="">送货方式</a></td>
					</tr>
				</table>
			</div>
			<div id="line_3"></div>
			<div id="about">
				<table>
					<tr>
						<th>关于我们</th>
					</tr>
					<tr id="tr">
						<td><a href="">关于家乡味</a></td>
					</tr>
					<tr id="tr">
						<td><a href="">诚聘英才</a></td>
					</tr>
					<tr id="tr">
						<td><a href="<%=request.getContextPath()%>/lockPages/admin/admin.jsp">后台管理</a></td>
					</tr>
				</table>
			</div>
			<div id="line_4"></div>
			<div id="follow">
				<table>
					<tr>
						<th>联系我们</th>
					</tr>
					<tr>
						<td><a href="http://t.qq.com/king_dust"><img src="<%=request.getContextPath() %>/images/icon/weibo_qq.png"></a>&nbsp;&nbsp;<a href="http://weibo.com/chenhuiaichengwei"><img src="<%=request.getContextPath() %>/images/icon/weibo_sina.png"></a></td>
					</tr>
					<tr>
						<td><img id="qrcode_small" src="<%=request.getContextPath() %>/images/icon/qr.png"  style="height:60px;width:60px;margin-left:5px;"></td>
					</tr>
				</table>
			</div>
			<div id="line_5"></div>
			<div id="contact">
				<table>
					<tr>
						<th>400-88888888</th>
					</tr>
					<tr align="center" id="tr">
						<td>工作时间7*24小时</td>
					</tr>
					<tr>
						<td><a target="_blank" href="http://sighttp.qq.com/authd?IDKEY=2099e3b7dbeeab019d96633ff36bae1239ebfeaedfcd2a1f"><img border="0" src="<%=request.getContextPath() %>/images/Qchat.png" style="height:45px;width:100px;" alt="点击这里给我发消息" title="点击这里给我发消息"></a></td>
					</tr>
				</table>
			</div>
		<hr id="copyright_hr" style="width:105%;height:1px;border:none;border-top:2px dotted #E50B0B;">
		<div id="statement" align="center">
			<div id="statemet_text">Copyright © 2008-2016 家乡味-王晨辉 版权所有  <a href="http://www.miitbeian.gov.cn/publish/query/indexFirst.action">豫ICP备15028016号-1</a> 增值电信业务经营许可证:豫ICP备15028016号</div>
			<div id="statement_img" align="center"><a href="http://t.knet.cn/index_new.jsp"><img style="width:160px;height:90px;" src="<%=request.getContextPath() %>/images/icon/trusted.jpg"></a>&nbsp;&nbsp;<a href="http://www.szfw.org/"><img id="honest_img" style="width:160px;height:72px;" src="<%=request.getContextPath() %>/images/icon/honest.png"></a></div>
		</div>
		<div id="qrcode_big" style="height:145px;width:145px;border:solid 1px red; display:none;margin-left:670px;margin-top:-265px;"><img style="height:145px;width:145px;" alt="加入我们有更多的优惠哦" title="加入我们有更多的优惠哦" src="<%=request.getContextPath() %>/images/icon/qr.png"></div>
	</div>
	<!-- 控制鼠标放到二维码上的放大效果 -->
	<script type="text/javascript">
		$(document).ready(function(e) {
	        $("#qrcode_small").mouseover(function(){
					$("#qrcode_big").css("display","block");
					$("#qrcode_big").css("cursor","pointer");
				});
	        
			$("#qrcode_big").mouseleave(function(){
				$("#qrcode_big").css("display","none");
			});
			$("#qrcode_big img").mouseleave(function(){
				$("#qrcode_big").css("display","none");
			});
	    });
</script>
</body>
</html>