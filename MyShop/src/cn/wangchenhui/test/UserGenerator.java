package cn.wangchenhui.test;

import java.sql.Date;
import java.util.Random;
import cn.wangchenhui.dao.DaoFactory;
import cn.wangchenhui.dao.IUserDao;
import cn.wangchenhui.model.User;

/** 
 * @author  Dust 
 * @date 2016-2-19 下午4:20:53 
 * @version 1.0 
 */
public class UserGenerator {
	public static void main(String[] args) {
		IUserDao userDao = DaoFactory.getUserDao();
		User  user = null;
		for(int i=0;i<100;i++){
			user = new User();
			user.setUser_name("username_"+i);
			user.setUser_pass(getRandomString(6));
			user.setUser_gender(getRandomGender());
			user.setBirthday(new Date(i));
			user.setTelphone("18721686821");
			user.setAddress("Henan Province");
			user.setEmail("565999928@qq.com");
			user.setType(String.valueOf(new Random().nextInt(2)));
			user.setStatus(String.valueOf(new Random().nextInt(2)));
			user.setIs_operator("N");
			user.setOpt_status("1");
			user.setIs_admin("N");
			try {
				userDao.add(user);
				System.out.println("用户：username"+i+"已经生成");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//System.out.println(getRandomString(6));
	}
	public static String getRandomString(int length){
		String str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";//含有字符和数字的字符串
		StringBuffer buff = new StringBuffer();
		for(int i=0;i<length;i++){
			int position = new Random().nextInt(str.length());
			buff.append(str.charAt(position));
		}
		return buff.toString();
	}
	public static String getRandomGender(){
		String str = "男,女";
		String[] genderArray = str.split(",");
		return genderArray[new Random().nextInt(2)];
	}
}
