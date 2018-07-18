package cn.oa.util;

public class Time {
	private String startTime;
	private String endTime;
	private String timeType;
	
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getTimeType() {
		return timeType;
	}
	public void setTimeType(String timeType) {
		this.timeType = timeType;
	}
	@Override
	public String toString() {
		return "Time [startTime=" + startTime + ", endTime=" + endTime
				+ ", timeType=" + timeType + "]";
	}


}
