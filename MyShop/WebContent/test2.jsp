<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-2.2.0.min.js"></script>
<title>Insert title here</title>
<script>
	$(function(){
		$(".add").click(function(){
			var t=$(this).parent().find('input[class*=text_box]');
			t.val(parseInt(t.val())+1)
			setTotal();
		});
		$(".min").click(function(){
			var t=$(this).parent().find('input[class*=text_box]');
			t.val(parseInt(t.val())-1)
			if(parseInt(t.val())<0){
			t.val(0);
			}
			setTotal();
		});
	function setTotal(){
		var s=0;
		$("#tab td").each(function(){
			s+=parseInt($(this).find('input[class*=text_box]').val())*parseFloat($(this).find('span[class*=price]').text());
		});
			$("#total").html(s.toFixed(2));
		}
		setTotal();
		})
</script>
</head>
<body>
<table id="tab" style="border:solid 1px #CCCCCC;">
<tr>
<td>
<span>单价:</span><span class="price">1.50</span>
<input class="min" name="" type="button" style="vertical-align:center; color:white;background:#9D2A29;cursor:pointer;height:28px;width:28px;border:solid 1px #9D2A29;border-right-style: none;border-top-left-radius:5px;border-bottom-left-radius:5px;" value="-" />
<input class="text_box" name="" type="text" value="1"  size="3" maxlength="3"  style="margin-left:-8px;border:solid 1px #9D2A29;text-align:center;height:24px;" />
<input class="add" name="" type="button" style="margin-left:-8px;vertical-align:center;color:white;background:#9D2A29;cursor:pointer; border:solid 1px #9D2A29;height:28px;width:28px;border-left-style: none;border-top-right-radius:5px;border-bottom-right-radius:5px;" value="+" />
</td>
</tr>
<tr>
<td>
<span>单价:</span><span class="price">7.50</span>
<input class="min" name="" type="button" style="vertical-align:center; color:white;background:#9D2A29;cursor:pointer;height:28px;width:28px;border:solid 1px #9D2A29;border-right-style: none;border-top-left-radius:5px;border-bottom-left-radius:5px;" value="-" />
<input class="text_box" name="" type="text" value="1"  size="3" maxlength="3"  style="margin-left:-8px;border:solid 1px #9D2A29;text-align:center;height:24px;" />
<input class="add" name="" type="button" style="margin-left:-8px;vertical-align:center;color:white;background:#9D2A29;cursor:pointer; border:solid 1px #9D2A29;height:28px;width:28px;border-left-style: none;border-top-right-radius:5px;border-bottom-right-radius:5px;" value="+" />
</td>
</tr>
</table>

<p>总价：<label id="total"></label></p>
</body>
</html> 