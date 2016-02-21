package cn.wangchenhui.model;

import java.util.Date;

/** 
 * @author  Dust 
 * @date 2016-2-21 下午4:04:19 
 * @version 1.0 
 */
public class Image {
	private int image_id;
	private int user_id;
	private String img_title;
	private String img_new_title;
	private String img_path;
	private String type;
	private Date post_date;
	private String goods_id;
	public int getImage_id() {
		return image_id;
	}
	public void setImage_id(int image_id) {
		this.image_id = image_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getImg_title() {
		return img_title;
	}
	public void setImg_title(String img_title) {
		this.img_title = img_title;
	}
	public String getImg_new_title() {
		return img_new_title;
	}
	public void setImg_new_title(String img_new_title) {
		this.img_new_title = img_new_title;
	}
	public String getImg_path() {
		return img_path;
	}
	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Date getPost_date() {
		return post_date;
	}
	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}
	public String getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}
	
}
