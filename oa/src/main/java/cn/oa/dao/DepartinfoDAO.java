package cn.oa.dao;

import java.util.List;
import java.util.Map;

import cn.oa.entity.Departinfo;
import cn.oa.entity.Roleinfo;

public class DepartinfoDAO extends BaseDAO<Departinfo>{
	//搜索部门信息
	public List<Map<String, Object>> getDepart(Departinfo departinfo){
		String sql =" SELECT * FROM departinfo d1 " 
				+" INNER JOIN branchinfo b1 ON b1.branch_id=d1.branch_id"
				+" where 1=1";
		int index = 0;
		if (departinfo.getDepart_id()!=null) {
			sql +=" and d1.depart_id = ?";
			index++;
		}
		if (departinfo.getDepart_name()!=null) {
			sql += " and d1.depart_name = ? ";
			index++;
		}
		Object[] obj = new Object[index];
		index = 0;
		if (departinfo.getDepart_id()!=null) {
			obj[index] = departinfo.getDepart_id();	
			index++;
		}
		if (departinfo.getDepart_name()!=null) {
			obj[index] = departinfo.getDepart_name();
			index++;
		}

		List<Map<String, Object>> list = super.queryListMap(sql, obj);
		return list;   
	} 

	//添加部门信息
	public int addDepart(Departinfo departinfo){
		String sql="INSERT INTO departinfo(depart_name,principa_user,connect_tel_no,connect_mobile_no,branch_id) VALUES (?,?,?,?,?)";
		Object[] obj = {departinfo.getDepart_name(),departinfo.getPrincipa_user(),departinfo.getConnect_tel_no(),departinfo.getConnect_mobile_no(),departinfo.getBranch_id()};
		return super.update(sql, obj);

	}
	//修改部门信息
	public int updateDepart(Departinfo departinfo){
		String sql = " UPDATE departinfo SET departinfo.depart_name=?,departinfo.principa_user=?,departinfo.connect_tel_no=?,departinfo.connect_mobile_no=?,departinfo.branch_id=?"
				+" WHERE departinfo.depart_id =?";
		Object[] obj ={departinfo.getDepart_name(),departinfo.getPrincipa_user(),departinfo.getConnect_tel_no(),departinfo.getConnect_mobile_no(),departinfo.getBranch_id(),departinfo.getDepart_id()};
		int result = super.update(sql, obj);
		return result;

	} 



	//删除部门信息
	public int removeDepart(Departinfo departinfo){
		String sql = " DELETE FROM departinfo WHERE depart_id=? ";
		Object[] obj ={departinfo.getDepart_id()};
		return super.update(sql, obj);
	}



}
