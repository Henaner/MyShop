<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%
	int totalPage = Integer.parseInt(request.getParameter("totalPage"));
	int totalRecord = Integer.parseInt(request.getParameter("totalRecord"));
%>
<pg:pager items="<%=totalRecord %>" maxPageItems="15" export="curPage = number">
	一共有<%=totalRecord%>条记录，共有<%=totalPage%>页，当前是第<%=curPage%>页
  <pg:param name="condition"/>
  <pg:first>
    <a href="<%=pageUrl%>">首页</a>
  </pg:first>
  <pg:prev>
    <a href="<%=pageUrl%>">上一页</a>
  </pg:prev>
  <pg:pages>
    <%
      if(curPage == pageNumber){
    %>
    <%=pageNumber%>
    <%
    }else{
    %>
    [<a href="<%=pageUrl%>"><%=pageNumber%></a>]
    <%
      }
    %>
  </pg:pages>
  <pg:next>
    <a href="<%=pageUrl%>">下一页</a>
  </pg:next>
  <pg:last>
    <a href="<%=pageUrl%>">尾页</a>
  </pg:last>
</pg:pager>