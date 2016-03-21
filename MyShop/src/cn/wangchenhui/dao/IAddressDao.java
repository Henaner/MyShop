package cn.wangchenhui.dao;

import cn.wangchenhui.model.Address;

/** 
 * @author  Dust 
 * @date 2016-3-17 上午8:37:11 
 * @version 1.0 
 */
public interface IAddressDao {
	void add(Address address,int user_id);
	void update(Address address,int user_id );
	Address load(int user_id);
}
