package cn.oa.entity;

public class UserInfo {
	private String UserId;
	private String UserName;
	private String PassWord;
	private Integer DepartId;
	private Integer Gender;
	private Integer RoleId;
	private Integer UserState;
	public String getUserId() {
		return UserId;
	}
	public void setUserId(String userId) {
		UserId = userId;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getPassWord() {
		return PassWord;
	}
	public void setPassWord(String passWord) {
		PassWord = passWord;
	}
	public Integer getDepartId() {
		return DepartId;
	}
	public void setDepartId(Integer departId) {
		DepartId = departId;
	}
	public Integer getGender() {
		return Gender;
	}
	public void setGender(Integer gender) {
		Gender = gender;
	}
	public Integer getRoleId() {
		return RoleId;
	}
	public void setRoleId(Integer roleId) {
		RoleId = roleId;
	}
	public Integer getUserState() {
		return UserState;
	}
	public void setUserState(Integer userState) {
		UserState = userState;
	}
	@Override
	public String toString() {
		return "UserInfo [UserId=" + UserId + ", UserName=" + UserName
				+ ", PassWord=" + PassWord + ", DepartId=" + DepartId + ", Gender="
				+ Gender + ", RoleId=" + RoleId + ", UserState=" + UserState + "]";
	}
	public UserInfo(String userId, String userName, String passWord,
			Integer departId, Integer gender, Integer roleId, Integer userState) {
		super();
		UserId = userId;
		UserName = userName;
		PassWord = passWord;
		DepartId = departId;
		Gender = gender;
		RoleId = roleId;
		UserState = userState;
	}
	public UserInfo() {
		super();
	}



}
