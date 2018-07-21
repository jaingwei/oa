package cn.oa.dao;

import java.util.List;
import java.util.Map;

import cn.oa.entity.SysFun;
import cn.oa.util.DBhelper;

public class SysfunDAO extends BaseDAO<SysFun>{
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
			DBhelper.allClose(null, null, con);
			return list;
		}
    //拿取已有权限菜单信息
		public List<Map<String, Object>> getAlreadySys(Integer roleid){
			String sql =" SELECT * FROM sysfun s1"
				   +" INNER JOIN roleright ON roleright.node_id=s1.node_id"
                   +" WHERE s1.node_id IN("
                   +" SELECT roleright.node_id FROM roleright" 
                   +" WHERE roleright.role_id = ?) "
                   +" AND roleright.role_id= ? ";
			Object[] obj ={roleid,roleid};
			List<Map<String, Object>> list = super.queryListMap(sql, obj);
			DBhelper.allClose(null, null, con);
			return list;
		}
    //拿取未有权限菜单信息
		public List<Map<String, Object>> getNotSys(Integer roleid){
			String sql =" SELECT * FROM sysfun s1"
				   +" INNER JOIN roleright ON roleright.node_id=s1.node_id"
                   +" WHERE s1.node_id not IN("
                   +" SELECT roleright.node_id FROM roleright" 
                   +" WHERE roleright.role_id = ?) "
                   +" AND roleright.role_id= ? ";
			Object[] obj ={roleid,3};
			List<Map<String, Object>> list = super.queryListMap(sql, obj);
			DBhelper.allClose(null, null, con);
			return list;
	   }
		
	//添加权限
	public int addSys(Integer roleid, Integer nodeid){
		String sql="INSERT INTO roleright(role_id,node_id) VALUES (?,?)";
		Object[] obj = {roleid,nodeid};
		int result = super.update(sql, obj);
		DBhelper.allClose(null, null, con);
		return result;
		
	} 	
	//删除权限
	public int removeSys(Integer roleid, Integer nodeid){
		String sql = " DELETE FROM roleright WHERE roleright.role_id=? "
				+" AND roleright.node_id=? ";
		Object[] obj = {roleid,nodeid};
		int result = super.update(sql, obj);
		DBhelper.allClose(null, null, con);
		return result;	
	} 		
	
	
	
}
