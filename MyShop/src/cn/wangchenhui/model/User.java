package cn.wangchenhui.model;

import java.util.Date;

/**
 * 
 * @author Dust
 * @date 2016-2-19 下午4:46:17
 */
public class User {
	private int user_id;
	private String user_name;
	private String user_pass;
	private String user_gender;
	private String birthday;
	private String address;
	private String telphone;
	private String email;
	private String type;
	private String status;
	private String is_operator;
	private String is_admin;
	private String opt_status;
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_pass() {
		return user_pass;
	}
	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public String getBirthday(){
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address){
		this.address = address;
	}
	public String getTelphone() {
		return telphone;
	}
	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getIs_operator() {
		return is_operator;
	}
	public void setIs_operator(String is_operator) {
		this.is_operator = is_operator;
	}
	public String getIs_admin() {
		return is_admin;
	}
	public void setIs_admin(String is_admin) {
		this.is_admin = is_admin;
	}
	public String getOpt_status() {
		return opt_status;
	}
	public void setOpt_status(String opt_status) {
		this.opt_status = opt_status;
	}
}
