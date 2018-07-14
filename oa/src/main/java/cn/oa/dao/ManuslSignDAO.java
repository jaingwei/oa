package cn.oa.dao;

import java.util.List;
import java.util.Map;

import cn.oa.entity.ManualSign;

public class ManuslSignDAO extends BaseDAO<ManualSign>{
   //添加
	public int addSign(ManualSign manualSign){
		String sql ="INSERT into manualsign(user_id,sign_time,sign_desc,sign_tag)"
                   +" VALUES(?,?,?,?); ";
		Object[] obj = new Object[4];
		obj[0] = manualSign.getUser_id();
		obj[1] = manualSign.getSign_time();
		obj[2] = manualSign.getSign_desc();
		obj[3] = manualSign.getSign_tag();
		int result = super.update(sql, obj);
		return result;
		
	}
   //查找
	public List<Map<String, Object>> getSign(ManualSign manualSign){
		String sql = "SELECT m1.sign_desc,m1.sign_time,m1.sign_tag,u1.user_name,"
                  +"r1.role_name,d1.depart_name,b1.BranchName FROM manualsign m1"
                  +"INNER JOIN userinfo u1 ON u1.user_id=m1.user_id"
                  +"INNER JOIN roleinfo r1 ON r1.role_id = u1.role_id"
                  +"INNER JOIN departinfo d1 ON d1.depart_id=u1.depart_id"
                  +"INNER JOIN branchinfo b1 ON b1.BranchId=d1.branch_id"
                  +"WHERE m1.user_id =? and ?";
		Object[] obj = {manualSign.getUser_id() ,manualSign.getSign_time()};
		List<Map<String, Object>> list = super.queryListMap(sql, obj);
		return list;
	}
 
	
}
