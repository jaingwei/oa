package cn.oa.dao;

import java.util.List;
import java.util.Map;

import cn.oa.entity.UserInfo;

public class UserDao extends BaseDAO<UserInfo>{
     //用户名搜索
	public List<UserInfo> dosearch(String username){
		String sql = "SELECT * FROM userinfo u1 WHERE  u1.userid=?";
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
		String sql = "SELECT u1.UserId,u1.PassWord,u1.Gender,u1.UserName,u1.number,d1.DepartName,r1.RoleName,u2.UserStateName,u1.image FROM userstate u2"
                   +" INNER JOIN userinfo u1 ON u1.UserState=u2.UserStateId"
                   +" INNER JOIN roleinfo r1 ON r1.RoleId = u1.RoleId"
                   +" INNER JOIN departinfo d1 ON d1.DepartId=u1.DepartId"
                   +" WHERE u1.UserName=?";
		Object[] obj ={username};
		List<Map<String, Object>> list = super.queryListMap(sql, obj);
		return list;
	}
	public static void main(String[] args) {
		UserDao userDao = new UserDao();
		List<Map<String, Object>> list = userDao.dosearchMap("姜伟");
		System.out.println(list);
	}
	
}
