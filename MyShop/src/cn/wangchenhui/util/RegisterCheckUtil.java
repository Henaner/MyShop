package cn.wangchenhui.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.mysql.fabric.Response;

import cn.wangchenhui.dao.DaoFactory;
import cn.wangchenhui.dao.IUserDao;
import cn.wangchenhui.model.User;

/** 
 * @author  Dust 
 * @date 2016-3-13 下午7:39:39 
 * @version 1.0 
 */
public class RegisterCheckUtil {
	//检验是否有重复的用户名
	public static boolean verifyRegiter(HttpServletRequest request,String[] fields){
		boolean flag = true;
		String username = fields[0];
		String userpass = fields[1];
		String userrepass = fields[2];
		String gender = fields[3];
		String address = fields[4];
		String telphone = fields[5];
		String email = fields[6];
		String captcha = fields[7];
		String origin_captcha = (String) request.getSession().getAttribute("captcha");
		Map<String , String> errMsg = new HashMap<String,String>();
		IUserDao userDao = DaoFactory.getUserDao();
		User user = userDao.login(username);
		//检验用户名是否存在
		if(username == null||"".equals(username)){
			errMsg.put("username", "请输入用户名");
			flag = false;
		}else{
			if(user != null){
				errMsg.put("username","用户名已经存在");
				flag = false;
			}
		}
		//判断两次输入的密码是否一致
		if(userpass == null||"".equals(userpass)){
			errMsg.put("userpass","请输入密码");
			flag = false;
		}else{
			if(userrepass == null||"".equals(userrepass)){
				errMsg.put("userrepass", "请输入确认密码");
				flag = false;
			}else{
				if(!userpass.equals(userrepass)){
					errMsg.put("userpass","两次输入的密码不一致");
					flag = false;
				}
			}
		}
		//判断验证码是否正确
		if(!captcha.equals(origin_captcha)){
			errMsg.put("captcha", "验证码输入错误");
		}
		//判断性别
		if(gender == null){
			errMsg.put("gender","请选择性别");
			flag = false;
		}
		//判断地址
		if(address == null){
			errMsg.put("address","请选择地址");
			flag = false;
		}
		//判断手机号是否符合要求
		if(!Validator.isMobile(telphone)){
			errMsg.put("telphone","手机号格式不正确");
			flag = false;
		}
		//判断邮箱是否符合要求
		if(!Validator.isEmail(email)){
			errMsg.put("email","邮箱格式不正确");
			flag = false;
		}
		if(!flag){
			request.setAttribute("errMsg",errMsg);
		}
		System.out.println(errMsg);
		return flag;
	}
	
	//展示错误的信息
	public static String showMessage(HttpServletRequest request, String field){
		@SuppressWarnings("unchecked")
		Map<String,String> message = (Map<String,String>)request.getAttribute("errMsg"); 
		if(message == null){
			return "";
		}else{
			if(message.get(field) == null){
				return "";
			}else{
				System.out.println(message.get(field));
				return message.get(field);
			}
		}
	}
}
