package cn.oa.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import cn.oa.entity.ManualSign;
import cn.oa.entity.UserInfo;
import cn.oa.util.DBhelper;
import cn.oa.util.Time;

public class ManuslSignDAO extends BaseDAO<ManualSign>{
	//添加签到信息
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
	//查找签到信息
	public List<Map<String, Object>> getSign(ManualSign manualSign){
		String sql = " SELECT m1.sign_desc,m1.sign_time,m1.sign_tag,u1.user_name,"
				+" r1.role_name,d1.depart_name,b1.branch_name FROM manualsign m1"
				+" INNER JOIN userinfo u1 ON u1.user_id=m1.user_id"
				+" INNER JOIN roleinfo r1 ON r1.role_id = u1.role_id"
				+" INNER JOIN departinfo d1 ON d1.depart_id=u1.depart_id"
				+" INNER JOIN branchinfo b1 ON b1.branch_id=d1.branch_id"
				+" WHERE 1=1";
		int num = 0;
		if (manualSign.getUser_id()!=null) {
			sql+=" and m1.user_id =?";
			num++;
		}
		if (manualSign.getSign_time()!=null) {
			sql+=" and m1.sign_time=?";
			num++;
		}
		Object[] obj = new Object[num];
		num=0;
		if (manualSign.getUser_id()!=null) {
			obj[num] = manualSign.getUser_id();
			num++;
		}
		if (manualSign.getSign_time()!=null) {
			obj[num] = manualSign.getSign_time();
			num++;
		}
		List<Map<String, Object>> list = super.queryListMap(sql, obj);
		DBhelper.allClose(null, null, con);
		return list;

	}

	//查找签到信息分页，多条件查找
	public List<Map<String, Object>> getSign(Time time,UserInfo userInfo,ManualSign manualSign,Integer index,Integer page){
		String sql = " SELECT m1.sign_desc,m1.sign_time,m1.sign_tag,u1.user_name,"
				+" r1.role_name,d1.depart_name,b1.branch_name,u1.role_id FROM manualsign m1"
				+" INNER JOIN userinfo u1 ON u1.user_id=m1.user_id"
				+" INNER JOIN roleinfo r1 ON r1.role_id = u1.role_id"
				+" INNER JOIN departinfo d1 ON d1.depart_id=u1.depart_id"
				+" INNER JOIN branchinfo b1 ON b1.branch_id=d1.branch_id"
				+" WHERE 1=1";
		int num = 0;
		if (manualSign.getUser_id()!=null) {
			sql+=" and m1.user_id =?";
			num++;
		}
		if (manualSign.getSign_time()!=null) {
			sql+=" and m1.sign_time=?";
			num++;
		}
		if (userInfo.getUser_name()!=null) {
			sql+=" and u1.user_name LIKE CONCAT('%',?,'%') ";
			num++;
		}
		if (userInfo.getDepart_id()!=null) {
			sql+=" and u1.depart_id = ? ";
			num++;
		}
        if (userInfo.getUser_id()!=null) {
			sql+=" and u1.user_id =?";
			num++;
		}
		if (time.getStartTime()!=null) {
			sql+=" and DATE(m1.sign_time) BETWEEN ?";
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
				sql +=" and TO_DAYS(m1.sign_time)=TO_DAYS(NOW()) ";
			}else if (t==2) {
				sql +=" and DATE_SUB(CURDATE(),INTERVAL 7 DAY) <=DATE(m1.sign_time) ";
			}else if (t==3) {
				sql +=" and DATE_FORMAT(m1.sign_time,'%Y%m') = DATE_FORMAT(CURDATE(),'%Y%m') ";
			}
			
		}
		
		Object[] obj = new Object[num];
		num=0;
		if (manualSign.getUser_id()!=null) {
			obj[num] = manualSign.getUser_id();
			num++;
		}
		if (manualSign.getSign_time()!=null) {
			obj[num] = manualSign.getSign_time();
			num++;
		}
		if (userInfo.getUser_name()!=null) {
			obj[num] = userInfo.getUser_name();
			num++;
		}
		if (userInfo.getDepart_id()!=null) {
			obj[num] = userInfo.getDepart_id();
			num++;
		}
		if (userInfo.getUser_id()!=null) {
			obj[num] = userInfo.getUser_id();
			num++;
		}
		if (time.getStartTime()!=null) {
			obj[num] = time.getStartTime();
			num++;
		}
		if (time.getEndTime()!=null) {
			obj[num] = time.getEndTime();
			num++;
		}
		sql+=" ORDER BY m1.sign_time desc";
		sql+=" limit "+(index-1)*page+","+page;
		List<Map<String, Object>> list = super.queryListMap(sql, obj);
		return list;

	}

	//获取签到信息总数
	public int getCount(ManualSign manualSign,UserInfo userInfo,Time time){
		String sql = " SELECT count(1) FROM manualsign m1"
				+" INNER JOIN userinfo u1 ON u1.user_id=m1.user_id"
				+" WHERE 1=1";
		int num = 0;
		if (manualSign.getUser_id()!=null) {
			sql+=" and m1.user_id =?";
			num++;
		}
		if (manualSign.getSign_time()!=null) {
			sql+=" and m1.sign_time=?";
			num++;
		}
		if (userInfo.getUser_name()!=null) {
			sql+=" and u1.user_name LIKE CONCAT('%',?,'%') ";
			num++;
		}
		if (userInfo.getDepart_id()!=null) {
			sql+=" and u1.depart_id = ? ";
			num++;
		}
        if (userInfo.getUser_id()!=null) {
			sql+=" and u1.user_id =?";
			num++;
		}
		if (time.getStartTime()!=null) {
			sql+=" and DATE(m1.sign_time) BETWEEN ?";
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
				sql +=" and TO_DAYS(m1.sign_time)=TO_DAYS(NOW()) ";
			}else if (t==2) {
				sql +=" and DATE_SUB(CURDATE(),INTERVAL 7 DAY) <=DATE(m1.sign_time) ";
			}else if (t==3) {
				sql +=" and DATE_FORMAT(m1.sign_time,'%Y%m') = DATE_FORMAT(CURDATE(),'%Y%m') ";
			}
			
		}
		
		Object[] obj = new Object[num];
		num=0;
		if (manualSign.getUser_id()!=null) {
			obj[num] = manualSign.getUser_id();
			num++;
		}
		if (manualSign.getSign_time()!=null) {
			obj[num] = manualSign.getSign_time();
			num++;
		}
		if (userInfo.getUser_name()!=null) {
			obj[num] = userInfo.getUser_name();
			num++;
		}
		if (userInfo.getDepart_id()!=null) {
			obj[num] = userInfo.getDepart_id();
			num++;
		}
		if (userInfo.getUser_id()!=null) {
			obj[num] = userInfo.getUser_id();
			num++;
		}
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
  //获取用户出勤次数
	public Integer getAttendance(UserInfo userInfo, Integer tag){
		String sql =" SELECT count(1) FROM manualsign WHERE " 
             +" manualsign.user_id=? AND manualsign.sign_tag=? "
             +" AND DATE_FORMAT(manualsign.sign_time,'%Y%m') = DATE_FORMAT(CURDATE(),'%Y%m')";
		Object[] obj = {userInfo.getUser_id(), tag};
		List<Map<String, Object>> list = super.queryListMap(sql, obj);
		int num = Integer.valueOf(list.get(0).get("count(1)").toString());
		return num;
	}
  //获取用户迟到次数
	public Integer getlate(UserInfo userInfo, Integer tag){
		String sql =" SELECT count(1) FROM manualsign WHERE " 
             +" manualsign.user_id=? AND manualsign.sign_tag=? "
             +" AND DATE_FORMAT(manualsign.sign_time,'%Y%m') = DATE_FORMAT(CURDATE(),'%Y%m')"
		     +" AND DATE_FORMAT(manualsign.sign_time,'%T')> "
		     +" (SELECT worktime.on_duty_time FROM worktime)";
		Object[] obj = {userInfo.getUser_id(), tag};
		List<Map<String, Object>> list = super.queryListMap(sql, obj);
		int num = Integer.valueOf(list.get(0).get("count(1)").toString());
		return num;
	}
  //获取用户早退次数
	public Integer getearly(UserInfo userInfo, Integer tag){
		String sql =" SELECT count(1) FROM manualsign WHERE " 
             +" manualsign.user_id=? AND manualsign.sign_tag=? "
             +" AND DATE_FORMAT(manualsign.sign_time,'%Y%m') = DATE_FORMAT(CURDATE(),'%Y%m')"
		     +" AND DATE_FORMAT(manualsign.sign_time,'%T')< "
		     +" ( SELECT worktime.off_duty_time FROM worktime)";
		Object[] obj = {userInfo.getUser_id(), tag};
		List<Map<String, Object>> list = super.queryListMap(sql, obj);
		int num = Integer.valueOf(list.get(0).get("count(1)").toString());
		return num;
	}
  //获取用户旷工次数
	public Integer getday(UserInfo userInfo, Integer tag){
		String sql =" select DATEDIFF(date_add(curdate()-day(curdate())+1,interval 1 month ),"
				+" DATE_ADD(curdate(),interval -day(curdate())+1 day)) d from dual";
		Object[] obj = {};
		List<Map<String, Object>> list = super.queryListMap(sql, obj);
		int allday = Integer.valueOf(list.get(0).get("d").toString());
		ManuslSignDAO manuslSignDAO = new ManuslSignDAO();
		int day = manuslSignDAO.getAttendance(userInfo, tag);
		int noday = allday-day;
		return noday;
	}
		
	

}
