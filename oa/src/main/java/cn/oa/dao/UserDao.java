package cn.oa.dao;

import java.util.List;

import cn.oa.entity.UserInfo;

public class UserDao extends BaseDAO<UserInfo>{
     //用户名搜索
	public List<UserInfo> dosearch(String username){
		String sql = "SELECT * FROM userinfo u1 WHERE  u1.userid=?";
		Object[] obj ={username};
		List<UserInfo> list = super.queryList(sql, obj, UserInfo.class);
		return list;
	}
	
	
	 
}
