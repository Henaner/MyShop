package cn.wangchenhui.dao;

import java.util.List;

import cn.wangchenhui.model.Goods;
import cn.wangchenhui.model.Pager;
import cn.wangchenhui.model.User;

/** 
 * @author  Dust 
 * @date 2016-3-16 上午10:13:23 
 * @version 1.0 
 */
public interface IGoodsDao {
	void add(Goods goods);
	void update(Goods goods);
	void delete(String goods_id);
	Goods load(String goods_id);
	Pager<Goods> getList(String condition);
	Pager<Goods> list(String condition);
	List<Goods> getTop6(String type);
	Pager<Goods> hot_or_new(String condition);
}
