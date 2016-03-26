package cn.wangchenhui.dao;

import java.util.List;

import cn.wangchenhui.model.Cart;
import cn.wangchenhui.model.Pager;

/** 
 * @author  Dust 
 * @date 2016-3-16 下午1:29:51 
 * @version 1.0 
 */
public interface ICartDao {
	void add(Cart cart);
	Cart load(String goods_id);
	void update(Cart cart);
	void delete(int id);
	void deleteOfUser(int user_id);
	Pager<Cart> list();
	int getCount(int user_id);
	List<Cart> getList(int user_id);
	int getAmout(int user_id);
	Cart getload(String goods_id);
}
