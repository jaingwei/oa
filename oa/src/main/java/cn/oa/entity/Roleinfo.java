package cn.oa.entity;

public class Roleinfo {
	private Integer role_id;
	private String role_name;
	private String role_desc;
	
	
	public Integer getRole_id() {
		return role_id;
	}
	public void setRole_id(Integer role_id) {
		this.role_id = role_id;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	public String getRole_desc() {
		return role_desc;
	}
	public void setRole_desc(String role_desc) {
		this.role_desc = role_desc;
	}
	@Override
	public String toString() {
		return "Roleinfo [role_id=" + role_id + ", role_name=" + role_name
				+ ", role_desc=" + role_desc + "]";
	}
	public Roleinfo(Integer role_id, String role_name, String role_desc) {
		super();
		this.role_id = role_id;
		this.role_name = role_name;
		this.role_desc = role_desc;
	}
	public Roleinfo() {
		super();
	}




}
