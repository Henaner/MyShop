<%@page import="cn.wangchenhui.model.Address"%>
<%@page import="cn.wangchenhui.dao.IAddressDao"%>
<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@page import="cn.wangchenhui.dao.IUserDao"%>
<%@page import="cn.wangchenhui.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	User user = (User)session.getAttribute("loginUser");
	int user_id = user.getUser_id();
	IAddressDao addressDao = DaoFactory.getAddressDao();
	Address address = addressDao.load(user_id);
	String province = new String(request.getParameter("province").getBytes("iso8859-1"),"utf-8");
	String city = new String(request.getParameter("city").getBytes("iso8859-1"),"utf-8");
	String town = new String(request.getParameter("town").getBytes("iso8859-1"),"utf-8");
	String location = province+city+town;
	String extra_addr = new String(request.getParameter("detail_addr").getBytes("iso8859-1"),"utf-8");
	String telphone = request.getParameter("telphone");
	String name = new String(request.getParameter("ord_name").getBytes("iso8859-1"),"utf-8");
	try{
		address.setUser_id(user_id);
		address.setName(name);
		address.setAddress(location+extra_addr);
		address.setTelphone(telphone);
		addressDao.update(address, user_id);
		response.sendRedirect(request.getContextPath()+"/lockPages/user/address.jsp");
	}catch(Exception e){
		e.printStackTrace();
	}
%>