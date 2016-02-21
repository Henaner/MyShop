package cn.wangchenhui.model;

import java.util.Date;

/** 
 * @author  Dust 
 * @date 2016-2-21 下午4:08:18 
 * @version 1.0 
 */
public class Description {
	private int desc_id;
	private int user_id;
	private int img_id;
	private String goods_id;
	private Date post_date;
	public int getDesc_id() {
		return desc_id;
	}
	public void setDesc_id(int desc_id) {
		this.desc_id = desc_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getImg_id() {
		return img_id;
	}
	public void setImg_id(int img_id) {
		this.img_id = img_id;
	}
	public String getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}
	public Date getPost_date() {
		return post_date;
	}
	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}
	
}
