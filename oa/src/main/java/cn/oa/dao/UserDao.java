package cn.oa.dao;

import java.util.List;
import java.util.Map;

import cn.oa.entity.Departinfo;
import cn.oa.entity.Roleinfo;
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
	public List<Map<String, Object>> dosearchMap(UserInfo userInfo){
		String sql = "SELECT u1.user_id,u1.pass_word,u1.gender,u1.user_name,u1.number,d1.depart_name,r1.role_name,u2.user_state_name,u1.image,u1.depart_id,u1.role_id,u1.gender,u1.user_state FROM userstate u2"
				+" INNER JOIN userinfo u1 ON u1.user_state=u2.user_state_id"
				+" INNER JOIN roleinfo r1 ON r1.role_id = u1.role_id"
				+" INNER JOIN departinfo d1 ON d1.depart_id=u1.depart_id"
				+" WHERE 1=1";
		int index =0;

		if (userInfo.getUser_name()!=null) {
			sql+=" and u1.user_name=?";
			index ++;
		}
		if (userInfo.getUser_id() !=null) {
			sql +=" and u1.user_id=?";
			index++;
		}

		Object[] obj =new Object[index];
		index =0;
		if (userInfo.getUser_name()!=null) {
			obj[index] = userInfo.getUser_name();
			index ++;
		}
		if (userInfo.getUser_id() !=null) {
			obj[index] = userInfo.getUser_id();
			index ++;
		}

		List<Map<String, Object>> list = super.queryListMap(sql, obj);
		return list;
	}


	//用户名按职位搜索
	public List<UserInfo> getUsers(UserInfo userInfo){
		String sql = "SELECT * FROM userinfo u1 WHERE 1=1";
		int index =0;
		if (userInfo.getDepart_id()!=null) {
			sql+=" and u1.depart_id=?";
			index++;
		}
		if (userInfo.getUser_id()!=null) {
			sql+=" and u1.user_id=?";
			index++;
		}
		Object[] obj =new Object[index];
		index =0;
		if (userInfo.getDepart_id()!=null) {
			obj[index] = userInfo.getDepart_id();
			index++;
		}
		if (userInfo.getUser_id()!=null) {
			obj[index] = userInfo.getUser_id();
			index++;
		}
		List<UserInfo> list = super.queryList(sql, obj, UserInfo.class);
		return list;
	}

	//用户信息修改
	public int updateUser(UserInfo userInfo){
		String sql = " UPDATE userinfo SET userinfo.depart_id=? "
				+ " WHERE userinfo.user_id= ? ";
		Object[] obj ={userInfo.getDepart_id() ,userInfo.getUser_id()};
		int result = super.update(sql, obj);
		return result;
	}

	//添加用户信息
	public int addUser(Departinfo departinfo){
		String sql="INSERT INTO departinfo(depart_name,principa_user,connect_tel_no,connect_mobile_no,branch_id) VALUES (?,?,?,?,?)";
		Object[] obj = {departinfo.getDepart_name(),departinfo.getPrincipa_user(),departinfo.getConnect_tel_no(),departinfo.getConnect_mobile_no(),departinfo.getBranch_id()};
		return super.update(sql, obj);

	}

	//删除用户信息
	public int removeUser(UserInfo userInfo){
		String sql = " DELETE FROM userinfo WHERE user_id=? ";
		Object[] obj ={userInfo.getUser_id()};
		return super.update(sql, obj);
	}

	//用户信息修改大量信息
	public int updateUsers(UserInfo userInfo){
		String sql = " UPDATE userinfo SET  userinfo.user_name=?,userinfo.pass_word=?,userinfo.depart_id=?,userinfo.role_id=?,userinfo.user_state=?"
				+ " WHERE userinfo.user_id= ? ";
		Object[] obj ={userInfo.getUser_name(),userInfo.getPass_word(),userInfo.getDepart_id(),userInfo.getRole_id(),userInfo.getUser_state(),userInfo.getUser_id()};
		int result = super.update(sql, obj);
		return result;
	}


}
