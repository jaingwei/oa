package cn.oa.entity;

public class ParentFun {
	private Integer parent_id;
	private String parent_name;
	private String parent_url;
	private Integer parent_order;
	public Integer getParent_id() {
		return parent_id;
	}
	public void setParent_id(Integer parent_id) {
		this.parent_id = parent_id;
	}
	public String getParent_name() {
		return parent_name;
	}
	public void setParent_name(String parent_name) {
		this.parent_name = parent_name;
	}
	public String getParent_url() {
		return parent_url;
	}
	public void setParent_url(String parent_url) {
		this.parent_url = parent_url;
	}
	public Integer getParent_order() {
		return parent_order;
	}
	public void setParent_order(Integer parent_order) {
		this.parent_order = parent_order;
	}
	@Override
	public String toString() {
		return "ParentFun [parent_id=" + parent_id + ", parent_name="
				+ parent_name + ", parent_url=" + parent_url
				+ ", parent_order=" + parent_order + "]";
	}
	public ParentFun(Integer parent_id, String parent_name, String parent_url,
			Integer parent_order) {
		super();
		this.parent_id = parent_id;
		this.parent_name = parent_name;
		this.parent_url = parent_url;
		this.parent_order = parent_order;
	}
	public ParentFun() {
		super();
	}
	
	
	

}
