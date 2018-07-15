package cn.oa.entity;

public class Departinfo {
    private Integer depart_id;
    private String depart_name;
    private String principa_user;
    private Long connect_tel_no;
    private Long connect_mobile_no;
    private Long faxes;
    private Integer branch_id;
	public Integer getDepart_id() {
		return depart_id;
	}
	public void setDepart_id(Integer depart_id) {
		this.depart_id = depart_id;
	}
	public String getDepart_name() {
		return depart_name;
	}
	public void setDepart_name(String depart_name) {
		this.depart_name = depart_name;
	}
	public String getPrincipa_user() {
		return principa_user;
	}
	public void setPrincipa_user(String principa_user) {
		this.principa_user = principa_user;
	}
	public Long getConnect_tel_no() {
		return connect_tel_no;
	}
	public void setConnect_tel_no(Long connect_tel_no) {
		this.connect_tel_no = connect_tel_no;
	}
	public Long getConnect_mobile_no() {
		return connect_mobile_no;
	}
	public void setConnect_mobile_no(Long connect_mobile_no) {
		this.connect_mobile_no = connect_mobile_no;
	}
	public Long getFaxes() {
		return faxes;
	}
	public void setFaxes(Long faxes) {
		this.faxes = faxes;
	}
	public Integer getBranch_id() {
		return branch_id;
	}
	public void setBranch_id(Integer branch_id) {
		this.branch_id = branch_id;
	}
	@Override
	public String toString() {
		return "Departinfo [depart_id=" + depart_id + ", depart_name="
				+ depart_name + ", principa_user=" + principa_user
				+ ", connect_tel_no=" + connect_tel_no + ", connect_mobile_no="
				+ connect_mobile_no + ", faxes=" + faxes + ", branch_id="
				+ branch_id + "]";
	}
	public Departinfo(Integer depart_id, String depart_name,
			String principa_user, Long connect_tel_no, Long connect_mobile_no,
			Long faxes, Integer branch_id) {
		super();
		this.depart_id = depart_id;
		this.depart_name = depart_name;
		this.principa_user = principa_user;
		this.connect_tel_no = connect_tel_no;
		this.connect_mobile_no = connect_mobile_no;
		this.faxes = faxes;
		this.branch_id = branch_id;
	}
	public Departinfo() {
		super();
	}
	
    
    
    
    
}
