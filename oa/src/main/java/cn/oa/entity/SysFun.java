package cn.oa.entity;

public class SysFun {
	private Integer node_id;
	private String display_name;
	private String node_url;
	private Integer display_order;
	private Integer parent_node_id;
	public Integer getNode_id() {
		return node_id;
	}
	public void setNode_id(Integer node_id) {
		this.node_id = node_id;
	}
	public String getDisplay_name() {
		return display_name;
	}
	public void setDisplay_name(String display_name) {
		this.display_name = display_name;
	}
	public String getNode_url() {
		return node_url;
	}
	public void setNode_url(String node_url) {
		this.node_url = node_url;
	}
	public Integer getDisplay_order() {
		return display_order;
	}
	public void setDisplay_order(Integer display_order) {
		this.display_order = display_order;
	}
	public Integer getParent_node_id() {
		return parent_node_id;
	}
	public void setParent_node_id(Integer parent_node_id) {
		this.parent_node_id = parent_node_id;
	}
	@Override
	public String toString() {
		return "SysFun [node_id=" + node_id + ", display_name=" + display_name
				+ ", node_url=" + node_url + ", display_order=" + display_order
				+ ", parent_node_id=" + parent_node_id + "]";
	}
	public SysFun(Integer node_id, String display_name, String node_url,
			Integer display_order, Integer parent_node_id) {
		super();
		this.node_id = node_id;
		this.display_name = display_name;
		this.node_url = node_url;
		this.display_order = display_order;
		this.parent_node_id = parent_node_id;
	}
	public SysFun() {
		super();
	}





}
