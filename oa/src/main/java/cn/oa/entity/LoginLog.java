package cn.oa.entity;

import java.util.Date;

public class LoginLog {
	private Integer login_id;
	private String user_id;
	private Date login_time;
	private Integer if_success;
	private String login_user_ip;
	private String login_desc;
	
	public Integer getLogin_id() {
		return login_id;
	}
	public void setLogin_id(Integer login_id) {
		this.login_id = login_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getLogin_time() {
		return login_time;
	}
	public void setLogin_time(Date login_time) {
		this.login_time = login_time;
	}
	public Integer getIf_success() {
		return if_success;
	}
	public void setIf_success(Integer if_success) {
		this.if_success = if_success;
	}
	public String getLogin_user_ip() {
		return login_user_ip;
	}
	public void setLogin_user_ip(String login_user_ip) {
		this.login_user_ip = login_user_ip;
	}
	public String getLogin_desc() {
		return login_desc;
	}
	public void setLogin_desc(String login_desc) {
		this.login_desc = login_desc;
	}
	@Override
	public String toString() {
		return "LoginLog [login_id=" + login_id + ", user_id=" + user_id
				+ ", login_time=" + login_time + ", if_success=" + if_success
				+ ", login_user_ip=" + login_user_ip + ", login_desc="
				+ login_desc + "]";
	}
	public LoginLog(Integer login_id, String user_id, Date login_time,
			Integer if_success, String login_user_ip, String login_desc) {
		super();
		this.login_id = login_id;
		this.user_id = user_id;
		this.login_time = login_time;
		this.if_success = if_success;
		this.login_user_ip = login_user_ip;
		this.login_desc = login_desc;
	}
	public LoginLog() {
		super();
	}
	


}
