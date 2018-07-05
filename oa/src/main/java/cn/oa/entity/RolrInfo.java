package cn.oa.entity;

public class RolrInfo {
	private Integer RoleId;
	private String RoleName;
	private String RoleDesc;
	public Integer getRoleId() {
		return RoleId;
	}
	public void setRoleId(Integer roleId) {
		RoleId = roleId;
	}
	public String getRoleName() {
		return RoleName;
	}
	public void setRoleName(String roleName) {
		RoleName = roleName;
	}
	public String getRoleDesc() {
		return RoleDesc;
	}
	public void setRoleDesc(String roleDesc) {
		RoleDesc = roleDesc;
	}
	@Override
	public String toString() {
		return "RolrInfo [RoleId=" + RoleId + ", RoleName=" + RoleName
				+ ", RoleDesc=" + RoleDesc + "]";
	}
	public RolrInfo(Integer roleId, String roleName, String roleDesc) {
		super();
		RoleId = roleId;
		RoleName = roleName;
		RoleDesc = roleDesc;
	}
	public RolrInfo() {
		super();
	}



}
