package cn.oa.entity;

public class UserInfo {
	
	private String user_id;
	private String user_name;
	private String pass_word;
	private Integer depart_id;
	private Integer gender;
	private Integer role_id;
	private Integer user_state;
	private String number;
	private String image;
	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getPass_word() {
		return pass_word;
	}
	public void setPass_word(String pass_word) {
		this.pass_word = pass_word;
	}
	public Integer getDepart_id() {
		return depart_id;
	}
	public void setDepart_id(Integer depart_id) {
		this.depart_id = depart_id;
	}
	public Integer getGender() {
		return gender;
	}
	public void setGender(Integer gender) {
		this.gender = gender;
	}
	public Integer getRole_id() {
		return role_id;
	}
	public void setRole_id(Integer role_id) {
		this.role_id = role_id;
	}
	public Integer getUser_state() {
		return user_state;
	}
	public void setUser_state(Integer user_state) {
		this.user_state = user_state;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	@Override
	public String toString() {
		return "UserInfo [user_id=" + user_id + ", user_name=" + user_name
				+ ", pass_word=" + pass_word + ", depart_id=" + depart_id
				+ ", gender=" + gender + ", role_id=" + role_id
				+ ", user_state=" + user_state + ", number=" + number
				+ ", image=" + image + "]";
	}
	public UserInfo(String user_id, String user_name, String pass_word,
			Integer depart_id, Integer gender, Integer role_id,
			Integer user_state, String number, String image) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.pass_word = pass_word;
		this.depart_id = depart_id;
		this.gender = gender;
		this.role_id = role_id;
		this.user_state = user_state;
		this.number = number;
		this.image = image;
	}
	public UserInfo() {
		super();
	}
	
	
}

	
