package cn.wangchenhui.dao;

import cn.wangchenhui.model.Pager;
import cn.wangchenhui.model.User;

public interface IUserDao {
	void add(User user);
	void update(User user);
	void delete(int user_id);
	User login(String user_name,String user_pass);
	User load(int user_id);
	Pager<User> list(String condition);
	Pager<User> optList(String condition);
	User login(String username);
}
