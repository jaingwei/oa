package cn.oa.dao;

import java.util.List;
import java.util.Map;

import cn.oa.entity.SysFun;

public class RoleDAO extends BaseDAO<SysFun>{
	//拿取菜单信息
	public List<Map<String,Object>> getsys( Integer roleid){
		String sql = "SELECT s1.display_name,s1.node_url,s1.display_order,"
			   +" s1.parent_node_id,f1.parent_name,"
			   +" f1.parent_order FROM sysfun s1" 
               +" INNER JOIN parentfun f1 ON s1.parent_node_id=f1.parent_id"
               +" WHERE s1.node_id" 
               +" IN(SELECT r1.node_id FROM roleright r1 "
               +" WHERE r1.role_id=?)";
		Object[] obj = {roleid};
		List<Map<String, Object>> list = super.queryListMap(sql, obj);
		System.out.println(list);
		return list;
	}
	
	
   
}
