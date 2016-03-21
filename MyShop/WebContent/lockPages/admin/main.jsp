<%@page import="java.util.Map"%>
<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@page import="cn.wangchenhui.dao.IOrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- ECharts单文件引入 -->
    <script src="<%=request.getContextPath()%>/js/echarts/echarts-all.js"></script>
</head>
<body>
<%
	IOrderDao orderDao = DaoFactory.getOrderDao();
	Map<String,Integer> map = orderDao.getTop3();
	Object[] keys = map.keySet().toArray();
	String[] names = new String[keys.length];
	for(int i=0;i<keys.length;i++){
		names[i] = (String)keys[i];
	}
%>
	<jsp:include page="/lockPages/admin/inc/top.jsp"></jsp:include>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<div id="saleData" style="width:90%;height:430px;border:solid 1px #7F0101;margin-left:60px;margin-top:50px;position: absolute;"></div>
	<script type="text/javascript">
        // 基于准备好的dom，初始化echarts图表
        var myChart = echarts.init(document.getElementById('saleData')); 
        var option = {
            tooltip: {
                show: true
            },
            legend: {
                data:['产品销量分析图']
            },
            xAxis : [
                {
                    type : 'category',
                    data : [<%=names[0]%>,<%=names[1]%>,<%=names[2]%>]
                }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],
            series : [
                {
                    "name":"产品销量分析图",
                    "type":"bar",
                    /*这里可以用jsp代码传入昨天商品的销量值*/
                    "data":[<%=map.get(names[0])%>, <%=map.get(names[1])%>, <%=map.get(names[2])%>]
                }
            ]
        };

        // 为echarts对象加载数据 
        myChart.setOption(option); 
    </script>
</body>
</html>