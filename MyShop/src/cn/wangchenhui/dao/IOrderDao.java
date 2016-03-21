package cn.wangchenhui.dao;

import java.util.List;
import java.util.Map;

import cn.wangchenhui.model.Order;
import cn.wangchenhui.model.Pager;

/** 
 * @author  Dust 
 * @date 2016-3-17 上午9:03:18 
 * @version 1.0 
 */
public interface IOrderDao {
	void add(Order order);
	void delete(String ord_id);
	void update(Order order);
	Order load(String  ord_id);
	List<Order> list(int user_id);
	Pager<Order> list(String condition);
	Pager<Order> getList(int user_id);
	List<Order> returnList(String ord_id);
	List<Order> commentList(String goods_id);
	Map<String,Integer> getTop3();
}
