package cn.oa.entity;

import java.util.Date;

public class MyNote {
	private Integer note_id;
	private String note_title;
	private String note_count;
	private Date great_time;
	private String great_user;
	public Integer getNote_id() {
		return note_id;
	}
	public void setNote_id(Integer note_id) {
		this.note_id = note_id;
	}
	public String getNote_title() {
		return note_title;
	}
	public void setNote_title(String note_title) {
		this.note_title = note_title;
	}
	public String getNote_count() {
		return note_count;
	}
	public void setNote_count(String note_count) {
		this.note_count = note_count;
	}
	public Date getGreat_time() {
		return great_time;
	}
	public void setGreat_time(Date great_time) {
		this.great_time = great_time;
	}
	public String getGreat_user() {
		return great_user;
	}
	public void setGreat_user(String great_User) {
		this.great_user = great_User;
	}
	@Override
	public String toString() {
		return "MyNote [note_id=" + note_id + ", note_title=" + note_title
				+ ", note_count=" + note_count + ", great_time=" + great_time
				+ ", great_user=" + great_user + "]";
	}
	public MyNote() {
		super();
	}
	
}
