package cn.oa.dao;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.List;
import java.util.Map;

import cn.oa.entity.LoginLog;
import cn.oa.util.DBhelper;
import cn.oa.util.Time;

public class LoginLogDAO extends BaseDAO<LoginLog>{
    //添加
	public int addLog(LoginLog loginLog){
		String sql = "INSERT INTO loginlog(user_id,login_time,if_success,login_userIp,login_desc)"
                    +" VALUES(?,?,?,?,?)";
		String ipaddress = null;
		try {
			ipaddress = InetAddress.getLocalHost().getHostAddress();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		Object[] obj = new Object[5];
		obj[0] = loginLog.getUser_id();
		obj[1] = loginLog.getLogin_time();
		obj[2] = loginLog.getIf_success();;
		obj[3] = ipaddress;
		obj[4] = loginLog.getLogin_desc();
		int result = super.update(sql, obj);
		DBhelper.allClose(null, null, con);
		return result;
	}
	//删除
	public int removeLog(LoginLog loginLog){
		String sql ="DELETE FROM loginlog WHERE loginlog.login_id in ?";
		Object[] obj ={loginLog.getLogin_id()};
		int result = super.update(sql, obj);
		DBhelper.allClose(null, null, con);
	    return result;
	}
	//查找
	public List<Map<String, Object>> getLog(LoginLog loginLog,Time time,Integer index,Integer page){
		String sql =" SELECT * FROM loginlog l1" 
                  +" INNER JOIN userinfo u1 ON u1.user_id = l1.user_id"
                  +" WHERE 1=1";
		int num =0;
		if (time.getStartTime()!=null) {
			sql+=" and DATE(l1.login_time) BETWEEN ?";
			num++;
		}
		if (time.getEndTime()!=null) {
			sql+=" AND ?";
			num++;
		}
		if (time.getTimeType()!=null) {
			Integer t = Integer.valueOf(time.getTimeType());
			System.out.println("DAO"+t);
			if (t==1) {
				sql +=" and TO_DAYS(l1.login_time)=TO_DAYS(NOW()) ";
			}else if (t==2) {
				sql +=" and DATE_SUB(CURDATE(),INTERVAL 7 DAY) <=DATE(l1.login_time) ";
			}else if (t==3) {
				sql +=" and DATE_FORMAT(l1.login_time,'%Y%m') = DATE_FORMAT(CURDATE(),'%Y%m') ";
			}
		}
		sql+=" ORDER BY l1.login_time desc";
		sql+=" limit "+(index-1)*page+","+page;
		
		
		Object[] obj = new Object[num];	
		num=0;
		if (time.getStartTime()!=null) {
			obj[num] = time.getStartTime();
			num++;
		}
		if (time.getEndTime()!=null) {
			obj[num] = time.getEndTime();
			num++;
		}
		
		return super.queryListMap(sql, obj);
	}
	
	//查询总页数
	public int getCount(LoginLog loginLog,Time time){
		String sql =" SELECT count(1) FROM loginlog l1" 
                  +" INNER JOIN userinfo u1 ON u1.user_id = l1.user_id"
                  +" WHERE 1=1";
		int num =0;
		if (time.getStartTime()!=null) {
			sql+=" and DATE(l1.login_time) BETWEEN ?";
			num++;
		}
		if (time.getEndTime()!=null) {
			sql+=" AND ?";
			num++;
		}
		if (time.getTimeType()!=null) {
			Integer t = Integer.valueOf(time.getTimeType());
			System.out.println("DAO"+t);
			if (t==1) {
				sql +=" and TO_DAYS(l1.login_time)=TO_DAYS(NOW()) ";
			}else if (t==2) {
				sql +=" and DATE_SUB(CURDATE(),INTERVAL 7 DAY) <=DATE(l1.login_time) ";
			}else if (t==3) {
				sql +=" and DATE_FORMAT(l1.login_time,'%Y%m') = DATE_FORMAT(CURDATE(),'%Y%m') ";
			}
		}
		Object[] obj = new Object[num];	
		num=0;
		if (time.getStartTime()!=null) {
			obj[num] = time.getStartTime();
			num++;
		}
		if (time.getEndTime()!=null) {
			obj[num] = time.getEndTime();
			num++;
		}
		
		List<Map<String, Object>> list = super.queryListMap(sql, obj);
		int count = Integer.valueOf(list.get(0).get("count(1)").toString());
		return count;
	}

	
}
