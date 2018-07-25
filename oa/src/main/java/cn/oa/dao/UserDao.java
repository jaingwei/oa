package cn.oa.dao;

import java.util.List;
import java.util.Map;

import cn.oa.entity.Departinfo;
import cn.oa.entity.Roleinfo;
import cn.oa.entity.UserInfo;
import cn.oa.util.DBhelper;

public class UserDao extends BaseDAO<UserInfo>{
	//用户名搜索
	public List<UserInfo> dosearch(String username){
		String sql = "SELECT * FROM userinfo u1 WHERE  u1.user_id=?";
		Object[] obj ={username};
		List<UserInfo> list = super.queryList(sql, obj, UserInfo.class);
		DBhelper.allClose(null, null, con);
		return list;
	}

	//号码搜索
	public List<UserInfo> numbersearch(String number){
		String sql = "SELECT * FROM userinfo u1 WHERE  u1.number=?";
		Object[] obj ={number};
		List<UserInfo> list = super.queryList(sql, obj, UserInfo.class);
		DBhelper.allClose(null, null, con);
		return list;
	}

	//多表搜索
	public List<Map<String, Object>> dosearchMap(UserInfo userInfo){
		String sql = "SELECT u1.user_id,u1.pass_word,u1.gender,u1.user_name,u1.number,d1.depart_name,r1.role_name,u2.user_state_name,u1.image,u1.depart_id,u1.role_id,u1.gender,u1.user_state,u1.image FROM userstate u2"
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
		DBhelper.allClose(null, null, con);
		return list;
	}

	//按照多表搜索  出角色 和用户状态具体信息（无部门）
	public List<Map<String, Object>> searchMap(UserInfo userInfo){
		String sql = " SELECT * FROM userinfo"
				+" INNER JOIN userstate u2 ON userinfo.user_state=u2.user_state_id"
				+" INNER JOIN roleinfo r1 ON r1.role_id = userinfo.role_id"
				+" INNER JOIN departinfo d1 ON d1.depart_id = userinfo.depart_id"
				+" WHERE 1=1";
		int index =0;
		if (userInfo.getUser_name()!=null) {
			sql+=" and userinfo.user_name LIKE CONCAT('%',?,'%') ";
			index ++;
		}
		if (userInfo.getUser_id() !=null) {
			sql +=" and userinfo.user_id LIKE CONCAT('%',?,'%')";
			index++;
		}
		if (userInfo.getDepart_id()!=null) {
			sql +=" and userinfo.depart_id= ? ";
			index++;
		}
		if (userInfo.getRole_id()!=null) {
			sql +=" and userinfo.role_id=?";
			index++;
		}
		sql+=" ORDER BY userinfo.user_id desc";
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
		if (userInfo.getDepart_id()!=null) {
			obj[index] = userInfo.getDepart_id();
			index++;
		}
		if (userInfo.getRole_id()!=null) {
			obj[index] = userInfo.getRole_id();
			index++;
		}
		List<Map<String, Object>> list = super.queryListMap(sql, obj);
		DBhelper.allClose(null, null, con);
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
		if (userInfo.getRole_id()!=null) {
			sql+=" and u1.role_id=?";
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
		if (userInfo.getRole_id()!=null) {
			obj[index] = userInfo.getRole_id();
			index++;
		}
		List<UserInfo> list = super.queryList(sql, obj, UserInfo.class);
		DBhelper.allClose(null, null, con);
		return list;
	}

	//用户信息修改
	public int updateUser(UserInfo userInfo){
		String sql = " UPDATE userinfo SET userinfo.role_id=? "
				+ " WHERE 1=1 ";
		int index =1;
		if (userInfo.getUser_id()!=null) {
			sql+=" and userinfo.user_id= ?";
			index++;
		}
		if (userInfo.getUser_name()!=null) {
			sql+=" and userinfo.user_name= ?";
			index++;
		}
		if (userInfo.getDepart_id()!=null) {
			sql+=" and userinfo.depart_id= ?";
			index++;
		}
		Object[] obj = new Object[index];
		index =0;
		obj[index] = userInfo.getRole_id();
		index++;
		if (userInfo.getUser_id()!=null) {
			obj[index] = userInfo.getUser_id();
			index++;
		}
		if (userInfo.getUser_name()!=null) {
			obj[index] = userInfo.getUser_name();
			index++;
		}
		if (userInfo.getDepart_id()!=null) {
			obj[index] = userInfo.getDepart_id();
			index++;
		}
		int result = super.update(sql, obj);
		return result;
	}

	//用户部门信息复原为  “未分配部门”状态
	public int updateUserDepart(Integer departid, Integer newid){
		String sql = " UPDATE userinfo SET userinfo.depart_id= ? "
				+ " WHERE userinfo.depart_id= ? ";
		Object[] obj = {newid,departid }; 
		int result = super.update(sql, obj);
		DBhelper.allClose(null, null, con);
		return result;
	}

	//添加用户部门信息
	public int addUser(Departinfo departinfo){
		String sql="INSERT INTO departinfo(depart_name,principa_user,connect_tel_no,connect_mobile_no,branch_id) VALUES (?,?,?,?,?)";
		Object[] obj = {departinfo.getDepart_name(),departinfo.getPrincipa_user(),departinfo.getConnect_tel_no(),departinfo.getConnect_mobile_no(),departinfo.getBranch_id()};
		DBhelper.allClose(null, null, con);
		return super.update(sql, obj);

	}

	//删除用户信息
	public int removeUser(UserInfo userInfo){
		String sql = " DELETE FROM userinfo WHERE user_id=? ";
		Object[] obj ={userInfo.getUser_id()};
		DBhelper.allClose(null, null, con);
		return super.update(sql, obj);
	}

	//用户信息修改大量信息
	public int updateUsers(UserInfo userInfo){
		String sql = " UPDATE userinfo SET  userinfo.user_name=?,userinfo.pass_word=?,userinfo.depart_id=?,userinfo.role_id=?,userinfo.user_state=?,userinfo.image=?,userinfo.number=?"
				+ " WHERE userinfo.user_id= ? ";
		Object[] obj ={userInfo.getUser_name(),userInfo.getPass_word(),userInfo.getDepart_id(),userInfo.getRole_id(),userInfo.getUser_state(),userInfo.getImage(),userInfo.getNumber(),userInfo.getUser_id()};
		int result = super.update(sql, obj);
		DBhelper.allClose(null, null, con);
		return result;
	}

	//添加用户基本信息
	public int addUserInfo(UserInfo userInfo){
		String sql="INSERT INTO userinfo(user_id,user_name,pass_word,depart_id,gender,role_id,user_state,number,image) VALUES (?,?,?,?,?,?,?,?,?)";
		Object[] obj = new Object[9];
		obj[0] = userInfo.getUser_id();
		obj[1] = userInfo.getUser_name();
		obj[2] = userInfo.getPass_word();
		obj[3] = userInfo.getDepart_id();
		obj[4] = userInfo.getGender();
		obj[5] = userInfo.getRole_id();
		obj[6] = userInfo.getUser_state();
		obj[7] = userInfo.getNumber();
		obj[8] = userInfo.getImage();
		DBhelper.allClose(null, null, con);
		return super.update(sql, obj);

	}

	//多表搜索
		public List<Map<String, Object>> map(UserInfo userInfo){
			String sql = "SELECT * FROM userstate u2"
					+" INNER JOIN userinfo u1 ON u1.user_state=u2.user_state_id"
					+" INNER JOIN roleinfo r1 ON r1.role_id = u1.role_id"
					+" INNER JOIN departinfo d1 ON d1.depart_id=u1.depart_id"
					+" INNER JOIN branchinfo b1 ON b1.branch_id=d1.branch_id"
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
			if (userInfo.getDepart_id()!=null) {
				sql +=" and u1.depart_id =?";
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
			if (userInfo.getDepart_id()!=null) {
				obj[index] = userInfo.getDepart_id();
				index++;
			}
			List<Map<String, Object>> list = super.queryListMap(sql, obj);
			return list;
		}
 

}
