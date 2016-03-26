package cn.wangchenhui.dao;

import java.util.List;

import cn.wangchenhui.model.Comment;
import cn.wangchenhui.model.Pager;
import cn.wangchenhui.model.User;

/** 
 * @author  Dust 
 * @date 2016-3-17 下午6:24:59 
 * @version 1.0 
 */
public interface ICommentDao {
	void add (Comment comment);
	void delete(int id);
	void update(Comment comment);
	Comment load(int id);
	Comment getLoad(String ord_id);
	List<Comment> getTop6(String ord_id);
	Pager<Comment> list(String condition);
	Comment getComment(String ord_id);
}
