package cn.wangchenhui.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import cn.wangchenhui.dao.DaoFactory;
import cn.wangchenhui.dao.IUserDao;
import cn.wangchenhui.model.User;

/** 
 * @author  Dust 
 * @date 2016-3-14 下午11:18:50 
 * @version 1.0 
 */
public class AdminCheckUtil {
	public static boolean verifyAdmin(HttpServletRequest request,String[] fields){
		boolean flag = true;
		Map<String,String> errMsg = new HashMap<String,String>();
		String username = fields[0];
		String userpass = fields[1];
		String captcha = fields[2];
		String origin_captcha =(String) request.getSession().getAttribute("captcha");
		IUserDao userDao  = DaoFactory.getUserDao();
		User user = userDao.login(username);
		if(user == null){
			errMsg.put("username", "X");
			flag = false;
		}else{
			user = userDao.login(username,userpass);
			if(!user.getUser_pass().equals(MD5Util.md5Encode(userpass))){
				errMsg.put("userpass","X");
				flag = false;
			}else{
				if(user.getOpt_status().equals("1")){
					errMsg.put("opt_status","账户被锁定");
					flag = false;
				}
				if(!user.getIs_operator().equals("Y")){
					errMsg.put("is_admin", "*你还不是管理员*");
					flag = false;
				}
			}
		}
		
		
		if(!captcha.equals(origin_captcha)){
			errMsg.put("captcha", "X");
			flag = false;
		}
		
		if(!flag){
			request.setAttribute("errMsg", errMsg);
		}
		System.out.println(errMsg);
		return flag;
	}
	@SuppressWarnings("unchecked")
	public static String showMsg(HttpServletRequest request,String field){
		@SuppressWarnings("unchecked")
		Map<String,String> message = (Map<String,String>)request.getAttribute("errMsg");
		System.out.println(message);
		if(message == null){
			return "";
		}else{
			if(message.get(field)==null){
				return "";
			}else{
				return message.get(field);
			}
		}
	} 
}
