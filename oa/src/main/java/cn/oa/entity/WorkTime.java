package cn.oa.entity;

public class WorkTime {
	private Integer work_time_id;
	private  String on_duty_time;
	private String off_duty_time;
	public Integer getWork_time_id() {
		return work_time_id;
	}
	public void setWork_time_id(Integer work_time_id) {
		this.work_time_id = work_time_id;
	}
	public String getOn_duty_time() {
		return on_duty_time;
	}
	public void setOn_duty_time(String on_duty_time) {
		this.on_duty_time = on_duty_time;
	}
	public String getOff_duty_time() {
		return off_duty_time;
	}
	public void setOff_duty_time(String off_duty_time) {
		this.off_duty_time = off_duty_time;
	}
	@Override
	public String toString() {
		return "WorkTime [work_time_id=" + work_time_id + ", on_duty_time="
				+ on_duty_time + ", off_duty_time=" + off_duty_time + "]";
	}
	public WorkTime(Integer work_time_id, String on_duty_time, String off_duty_time) {
		super();
		this.work_time_id = work_time_id;
		this.on_duty_time = on_duty_time;
		this.off_duty_time = off_duty_time;
	}
	public WorkTime() {
		super();
	}




}
