package cn.wangchenhui.model;

import java.util.Date;

/** 
 * @author  Dust 
 * @date 2016-2-21 下午4:01:53 
 * @version 1.0 
 */
public class Goods {
	private String goods_id;
	private String goods_name;
	private int stock;
	private String orgin_place;
	private int operator_id;
	private Date bracket_time;
	private int img_id;
	private int desc_id;
	private int comment_id;
	public String getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getOrgin_place() {
		return orgin_place;
	}
	public void setOrgin_place(String orgin_place) {
		this.orgin_place = orgin_place;
	}
	public int getOperator_id() {
		return operator_id;
	}
	public void setOperator_id(int operator_id) {
		this.operator_id = operator_id;
	}
	public Date getBracket_time() {
		return bracket_time;
	}
	public void setBracket_time(Date bracket_time) {
		this.bracket_time = bracket_time;
	}
	public int getImg_id() {
		return img_id;
	}
	public void setImg_id(int img_id) {
		this.img_id = img_id;
	}
	public int getDesc_id() {
		return desc_id;
	}
	public void setDesc_id(int desc_id) {
		this.desc_id = desc_id;
	}
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	
}
