package cn.oa.entity;

public class branchinfo {
	private Integer branch_id;
	private String branch_name;
	private String branch_short_name;
	public Integer getBranch_id() {
		return branch_id;
	}
	public void setBranch_id(Integer branch_id) {
		this.branch_id = branch_id;
	}
	public String getBranch_name() {
		return branch_name;
	}
	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}
	public String getBranch_short_name() {
		return branch_short_name;
	}
	public void setBranch_short_name(String branch_short_name) {
		this.branch_short_name = branch_short_name;
	}
	@Override
	public String toString() {
		return "branchinfo [branch_id=" + branch_id + ", branch_name="
				+ branch_name + ", branch_short_name=" + branch_short_name
				+ "]";
	}
	public branchinfo(Integer branch_id, String branch_name,
			String branch_short_name) {
		super();
		this.branch_id = branch_id;
		this.branch_name = branch_name;
		this.branch_short_name = branch_short_name;
	}
	public branchinfo() {
		super();
	}
	
	
	
	
}
