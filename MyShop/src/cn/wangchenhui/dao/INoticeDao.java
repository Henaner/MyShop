package cn.wangchenhui.dao;

import cn.wangchenhui.model.Notice;
import cn.wangchenhui.model.Pager;
import cn.wangchenhui.model.User;

/** 
 * @author  Dust 
 * @date 2016-3-15 下午9:55:07 
 * @version 1.0 
 */
public interface INoticeDao {
	void add(Notice notice);
	Pager<Notice> list();
	Notice getNotice();
	void delete(int id);
}
