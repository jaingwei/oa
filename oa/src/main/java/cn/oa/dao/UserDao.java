package cn.oa.dao;

import java.util.List;
import java.util.Map;

import cn.oa.entity.UserInfo;

public class UserDao extends BaseDAO<UserInfo>{
     //用户名搜索
	public List<UserInfo> dosearch(String username){
		String sql = "SELECT * FROM userinfo u1 WHERE  u1.user_id=?";
		Object[] obj ={username};
		List<UserInfo> list = super.queryList(sql, obj, UserInfo.class);
		return list;
	}
	
	 //号码搜索
	public List<UserInfo> numbersearch(String number){
			String sql = "SELECT * FROM userinfo u1 WHERE  u1.number=?";
			Object[] obj ={number};
			List<UserInfo> list = super.queryList(sql, obj, UserInfo.class);
			return list;
	}
	
	//多表搜索
	public List<Map<String, Object>> dosearchMap(String username){
		String sql = "SELECT u1.user_id,u1.pass_word,u1.gender,u1.user_name,u1.number,d1.depart_name,r1.role_name,u2.user_state_name,u1.image FROM userstate u2"
                   +" INNER JOIN userinfo u1 ON u1.user_state=u2.user_state_id"
                   +" INNER JOIN roleinfo r1 ON r1.role_id = u1.role_id"
                   +" INNER JOIN departinfo d1 ON d1.depart_id=u1.depart_id"
                   +" WHERE u1.user_name=?";
		Object[] obj ={username};
		List<Map<String, Object>> list = super.queryListMap(sql, obj);
		return list;
	}

	
}
