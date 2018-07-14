package cn.oa.dao;

import cn.oa.entity.LoginLog;

public class LoginLogDAO extends BaseDAO<LoginLog>{
    //添加
	public void addLog(LoginLog loginLog){
		String sql = "INSERT INTO loginlog(user_id,login_time,if_success,login_userIp,login_desc)"
                    +" VALUES(?,?,?,?,?)";
		Object[] obj = new Object[5];
		obj[0] = loginLog.getUser_id();
		obj[1] = loginLog.getLogin_time();
		obj[2] = loginLog.getIf_success();;
		obj[3] = loginLog.getLogin_user_ip();
		obj[4] = loginLog.getLogin_desc();
		super.update(sql, obj);
	}
	//删除
	public void removeLog(LoginLog loginLog){
		String sql ="DELETE FROM loginlog WHERE loginlog.login_id =?";
		Object[] obj ={loginLog.getLogin_id()};
		super.update(sql, obj);
	}
	//查找
	public void getLog(LoginLog loginLog){
		String sql ="";
		Object[] obj = {};	
	}
	
	 
	
}
