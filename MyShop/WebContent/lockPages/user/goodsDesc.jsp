<%--
  Created by IntelliJ IDEA.
  User: Dust
  Date: 2016/3/14
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
   <link rel="shortcut icon" href="favicon.ico">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/returntop.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/js/spinner/jquery.spinner.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/spinner/jquery.spinner.js"></script>
</head>
<body>
<input type="text" class="spinner" name="num_wanted"/>
</body>
   <script type="text/javascript">
		$('.spinner').spinner();
   </script>
</html>
