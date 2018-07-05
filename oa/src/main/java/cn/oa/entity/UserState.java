package cn.oa.entity;

public class UserState {
	private Integer UserStateId;
	private String UserStateIdName;
	
	
	public Integer getUserStateId() {
		return UserStateId;
	}
	public void setUserStateId(Integer userStateId) {
		UserStateId = userStateId;
	}
	public String getUserStateIdName() {
		return UserStateIdName;
	}
	public void setUserStateIdName(String userStateIdName) {
		UserStateIdName = userStateIdName;
	}
	@Override
	public String toString() {
		return "UserState [UserStateId=" + UserStateId + ", UserStateIdName="
				+ UserStateIdName + "]";
	}
	public UserState(Integer userStateId, String userStateIdName) {
		super();
		UserStateId = userStateId;
		UserStateIdName = userStateIdName;
	}
	public UserState() {
		super();
	}



}
