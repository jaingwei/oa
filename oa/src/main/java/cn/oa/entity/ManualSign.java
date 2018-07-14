package cn.oa.entity;

import java.util.Date;

public class ManualSign {
	private Integer sign_id;
	private String user_id;
	private Date sign_time;
	private String sign_desc;
	private Integer sign_tag;
	public Integer getSign_id() {
		return sign_id;
	}
	public void setSign_id(Integer sign_id) {
		this.sign_id = sign_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getSign_time() {
		return sign_time;
	}
	public void setSign_time(Date sign_time) {
		this.sign_time = sign_time;
	}
	public String getSign_desc() {
		return sign_desc;
	}
	public void setSign_desc(String sign_desc) {
		this.sign_desc = sign_desc;
	}
	public Integer getSign_tag() {
		return sign_tag;
	}
	public void setSign_tag(Integer sign_tag) {
		this.sign_tag = sign_tag;
	}
	@Override
	public String toString() {
		return "ManualSign [sign_id=" + sign_id + ", user_id=" + user_id
				+ ", sign_time=" + sign_time + ", sign_desc=" + sign_desc
				+ ", sign_tag=" + sign_tag + "]";
	}
	public ManualSign(Integer sign_id, String user_id, Date sign_time,
			String sign_desc, Integer sign_tag) {
		super();
		this.sign_id = sign_id;
		this.user_id = user_id;
		this.sign_time = sign_time;
		this.sign_desc = sign_desc;
		this.sign_tag = sign_tag;
	}
	public ManualSign() {
		super();
	}

}
