<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-2.2.0.min.js"></script>
</head>
<body>
	<div id="buy_number">
		<div  id="minus" align="center"  style=" color:white;background:#9D2A29;margin-left:2px;cursor:pointer;height:28px;width:28px;border:solid 1px #9D2A29;border-right-style: none;border-top-left-radius:5px;border-bottom-left-radius:5px;">-</div>
		<div style="top:10px;margin-left:31px;margin-top:-30px;"><input  type="text" size="3" maxlength="3" id="num_wanted" name="num_wanted" style="border:solid 1px #9D2A29;text-align:center;height:26px;" value="1"></div>
		<div id="plus" align="center"  style="color:white;background:#9D2A29;margin-left:70px;margin-top:-30px;cursor:pointer; border:solid 1px #9D2A29;height:28px;width:28px;border-left-style: none;border-top-right-radius:5px;border-bottom-right-radius:5px;">+</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function(e){
		$("#minus").click(function(){
			if(($("#num_wanted").val()==1)){
				alert("数量至少为1");
			}else{
				$("#num_wanted").val(($("#num_wanted").val()-0)-1);
			}
		});
		$("#plus").click(function(){
			if(($("#num_wanted").val()==999)){
				alert("数量至多为999");
			}else{
				$("#num_wanted").val(($("#num_wanted").val()-0)+1);
			}
		});
	});
</script>
</html>