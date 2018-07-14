package cn.oa.entity;

import java.util.Date;

public class OperateLog {
	private Integer operate_id;
	private String user_id;
	private String operate_name;
	private String object_id;
	private String operate_desc;
	private Date operate_time;
	
	public Integer getOperate_id() {
		return operate_id;
	}
	public void setOperate_id(Integer operate_id) {
		this.operate_id = operate_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getOperate_name() {
		return operate_name;
	}
	public void setOperate_name(String operate_name) {
		this.operate_name = operate_name;
	}
	public String getObject_id() {
		return object_id;
	}
	public void setObject_id(String object_id) {
		this.object_id = object_id;
	}
	public String getOperate_desc() {
		return operate_desc;
	}
	public void setOperate_desc(String operate_desc) {
		this.operate_desc = operate_desc;
	}
	public Date getOperate_time() {
		return operate_time;
	}
	public void setOperate_time(Date operate_time) {
		this.operate_time = operate_time;
	}
	@Override
	public String toString() {
		return "OperateLog [operate_id=" + operate_id + ", user_id=" + user_id
				+ ", operate_name=" + operate_name + ", object_id=" + object_id
				+ ", operate_desc=" + operate_desc + ", operate_time="
				+ operate_time + "]";
	}
	public OperateLog(Integer operate_id, String user_id, String operate_name,
			String object_id, String operate_desc, Date operate_time) {
		super();
		this.operate_id = operate_id;
		this.user_id = user_id;
		this.operate_name = operate_name;
		this.object_id = object_id;
		this.operate_desc = operate_desc;
		this.operate_time = operate_time;
	}
	public OperateLog() {
		super();
	}




}
