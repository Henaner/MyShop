package cn.wangchenhui.model;

import java.util.Date;

/** 
 * @author  Dust 
 * @date 2016-2-21 下午3:53:56 
 * @version 1.0 
 */
public class Comment {
	private int id;
	private int user_id;
	private String ord_id;
	private String eval_rank;
	private String advice;
	private String post_date;
	private String reply;
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getOrd_id() {
		return ord_id;
	}
	public void setOrd_id(String ord_id) {
		this.ord_id = ord_id;
	}
	public String getEval_rank() {
		return eval_rank;
	}
	public void setEval_rank(String eval_rank) {
		this.eval_rank = eval_rank;
	}
	public String getAdvice() {
		return advice;
	}
	public void setAdvice(String advice) {
		this.advice = advice;
	}
	public String getPost_date() {
		return post_date;
	}
	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}
}
