package cn.wangchenhui.model;

import java.util.Date;

/** 
 * @author  Dust 
 * @date 2016-2-21 下午3:53:56 
 * @version 1.0 
 */
public class Comment {
	private int comment_id;
	private int user_id;
	private String goods_id;
	private String order_id;
	private Date post_date;
	private String is_ok;
	private String content ;
	public int getComment_id() {
		return comment_id;
		
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public Date getPost_date() {
		return post_date;
	}
	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}
	public String getIs_ok() {
		return is_ok;
	}
	public void setIs_ok(String is_ok) {
		this.is_ok = is_ok;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
