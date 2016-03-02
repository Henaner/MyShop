package cn.wangchenhui.test;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import cn.wangchenhui.model.User;





/** 
 * @author  Dust 
 * @date 2016-2-21 下午5:36:19 
 * @version 1.0 
 */
public class TestMybatis {
	public static void main(String[] args) {
		try {
			InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
			SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(inputStream);
			SqlSession session = factory.openSession();
			User user = new User();
			user.setUser_name("user101");
			user.setUser_pass("xeb3rt");
			user.setUser_gender("女");
			user.setBirthday(new Date());
			user.setAddress("Henan Province");
			user.setEmail("565999928@qq.com");
			user.setIs_admin("N");
			user.setTelphone("18721686821");
			user.setIs_operator("N");
			user.setOpt_status("1");
			user.setStatus("1");
			user.setType("1");
			session.insert("cn.wangchenhui.model.User.add",user);
			session.commit();
			System.out.println("新增用户成功！");
			session.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
