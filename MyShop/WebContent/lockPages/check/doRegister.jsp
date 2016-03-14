<%@page import="cn.wangchenhui.test.MD5Util"%>
<%@page import="cn.wangchenhui.util.RegisterCheckUtil"%>
<%@page import="cn.wangchenhui.util.DateFormat"%>
<%@page import="cn.wangchenhui.model.ShopException"%>
<%@page import="cn.wangchenhui.model.User"%>
<%@page import="cn.wangchenhui.dao.IUserDao"%>
<%@page import="cn.wangchenhui.dao.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String username=request.getParameter("userName");
	String userpass=request.getParameter("userPass");
	String userrepass=request.getParameter("userRepass");
	String usergender=new String(request.getParameter("iCheck").getBytes("iso8859-1"),"utf8");
	String year = request.getParameter("YYYY");
	String month = request.getParameter("MM");
	String day = request.getParameter("DD");
	String province = new String(request.getParameter("province").getBytes("iso8859-1"),"utf8");
	String city = new String(request.getParameter("city").getBytes("iso8859-1"),"utf8");
	String town = new String(request.getParameter("town").getBytes("iso8859-1"),"utf8");
	String telphone = request.getParameter("userTel");
	String email = request.getParameter("userEmail");
	String captcha = request.getParameter("captcha");
	String address = province+city+town;
	IUserDao userDao = DaoFactory.getUserDao();
	if(Integer.parseInt(month)<10){
		month = "0"+month;
	}
	boolean check_ok = RegisterCheckUtil.verifyRegiter(request,new String[]{username,userpass,userrepass,usergender,address,telphone,email,captcha});
	if(!check_ok){
%>
	<jsp:forward page="/register.jsp"/>
<%
	}else{
		try{
			User user = new User();
			user.setUser_name(username);
			user.setUser_pass(userpass);
			user.setUser_gender(usergender);
			user.setBirthday(year+"-"+month+"-"+day);
			user.setAddress(province+city+town);
			user.setTelphone(telphone);
			user.setEmail(email);
			user.setType("0");//默认是注册用户
			user.setStatus("1");//默认是启用的状态
			user.setIs_operator("N");
			user.setOpt_status("0");
			user.setIs_admin("0");//默认都不是管理员
			userDao.add(user);
			session.setAttribute("loginUser", user);
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		}catch(ShopException e){
			System.out.println(e.getMessage());
		}
	}
%>