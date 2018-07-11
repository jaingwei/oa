package cn.oa.entity;

public class UserState {
	private Integer user_state_id;
	private String user_state_name;
	
	public Integer getUser_state_id() {
		return user_state_id;
	}
	public void setUser_state_id(Integer user_state_id) {
		this.user_state_id = user_state_id;
	}
	public String getUser_state_name() {
		return user_state_name;
	}
	public void setUser_state_name(String user_state_name) {
		this.user_state_name = user_state_name;
	}
	@Override
	public String toString() {
		return "UserState [user_state_id=" + user_state_id
				+ ", user_state_name=" + user_state_name + "]";
	}
	public UserState(Integer user_state_id, String user_state_name) {
		super();
		this.user_state_id = user_state_id;
		this.user_state_name = user_state_name;
	}
	public UserState() {
		super();
	}
	
	
	



}
