package cn.wangchenhui.model;

import java.util.Date;

/** 
 * @author  Dust 
 * @date 2016-2-21 下午3:47:41 
 * @version 1.0 
 */
public class SliderImg {
	private int img_id;
	private String img_title;
	private String img_type;
	private String goods_id;
	private String img_path;
	private String post_date;
	private int user_id;
	public void setUser_id(int user_id){
		this.user_id = user_id;
	}
	public int getUser_id(){
		return user_id;
	}
	public void setGoods_id(String goods_id){
		this.goods_id = goods_id;
	}
	public String getGoods_id(){
		return goods_id;
	}
	public int getImg_id() {
		return img_id;
	}
	public void setImg_id(int img_id) {
		this.img_id = img_id;
	}
	public String getImg_title() {
		return img_title;
	}
	public void setImg_title(String img_title) {
		this.img_title = img_title;
	}
	public String getImg_type() {
		return img_type;
	}
	public void setImg_type(String img_type) {
		this.img_type = img_type;
	}
	public String getImg_path() {
		return img_path;
	}
	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}
	public String getPost_date() {
		return post_date;
	}
	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}
}
