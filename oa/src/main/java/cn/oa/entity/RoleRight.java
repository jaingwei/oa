package cn.oa.entity;

public class RoleRight {
	private Integer role_right_id;;
	private Integer role_id;
	private Integer node_id;
	public Integer getRole_right_id() {
		return role_right_id;
	}
	public void setRole_right_id(Integer role_right_id) {
		this.role_right_id = role_right_id;
	}
	public Integer getRole_id() {
		return role_id;
	}
	public void setRole_id(Integer role_id) {
		this.role_id = role_id;
	}
	public Integer getNode_id() {
		return node_id;
	}
	public void setNode_id(Integer node_id) {
		this.node_id = node_id;
	}
	@Override
	public String toString() {
		return "RoleRight [role_right_id=" + role_right_id + ", role_id="
				+ role_id + ", node_id=" + node_id + "]";
	}
	public RoleRight(Integer role_right_id, Integer role_id, Integer node_id) {
		super();
		this.role_right_id = role_right_id;
		this.role_id = role_id;
		this.node_id = node_id;
	}
	public RoleRight() {
		super();
	}
	
	



}
