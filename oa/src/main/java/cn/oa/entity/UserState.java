package cn.oa.entity;

public class UserState {
	private Integer UserStateId;
	private String UserStateName;
	
	
	public Integer getUserStateId() {
		return UserStateId;
	}
	public void setUserStateId(Integer userStateId) {
		UserStateId = userStateId;
	}
	public String getUserStateIdName() {
		return UserStateName;
	}
	public void setUserStateIdName(String userStateIdName) {
		UserStateName = userStateIdName;
	}
	@Override
	public String toString() {
		return "UserState [UserStateId=" + UserStateId + ", UserStateIdName="
				+ UserStateName + "]";
	}
	public UserState(Integer userStateId, String userStateIdName) {
		super();
		UserStateId = userStateId;
		UserStateName = userStateIdName;
	}
	public UserState() {
		super();
	}



}
