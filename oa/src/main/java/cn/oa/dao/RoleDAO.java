package cn.oa.dao;

import java.util.List;
import java.util.Map;

import javax.management.relation.RoleInfo;

import org.apache.commons.codec.language.bm.Rule.RPattern;

import cn.oa.entity.Roleinfo;
import cn.oa.entity.SysFun;
import cn.oa.entity.UserInfo;
import cn.oa.util.DBhelper;
public class RoleDAO extends BaseDAO<Roleinfo>{
	

	//角色信息搜索
	public List<Roleinfo> getrole(Roleinfo roleinfo){
		String sql = " SELECT r1.role_id,r1.role_name,"
				    +" r1.role_desc FROM roleinfo r1 where 1=1";
		int num = 0;
		if (roleinfo.getRole_id() != null) {
			sql+=" and r1.role_id=?";
			num++;
		}
		if (roleinfo.getRole_name()!=null) {
			sql +=" and r1.role_name = ?";
			num++;
		}
		Object[] obj =new Object[num];
		num = 0;
		if (roleinfo.getRole_id() != null) {
			obj[num] = roleinfo.getRole_id();
			num++;
		}
		if (roleinfo.getRole_name()!=null) {
			obj[num]= roleinfo.getRole_name();
			num++;
		}
		sql+=" ORDER BY r1.role_id";
	    List<Roleinfo> list = super.queryList(sql, obj, Roleinfo.class);
	    DBhelper.allClose(null, null, con);
		return list;
	}
	//角色信息修改
	public int updaterole(Roleinfo roleinfo){
		String sql = " UPDATE roleinfo r1 SET r1.role_name=?,"
				+ " r1.role_desc=? WHERE r1.role_id=?";
		Object[] obj ={roleinfo.getRole_name(),roleinfo.getRole_desc(),roleinfo.getRole_id()};
        int result = super.update(sql, obj);
        DBhelper.allClose(null, null, con);
		return result;
	}
	//角色信息添加
	public int addrole(Roleinfo roleinfo){
		String sql = "INSERT INTO roleinfo(role_name,role_desc) VALUES(?,?)";
		Object[] obj ={roleinfo.getRole_name(),roleinfo.getRole_desc()};
        int reuslt = super.update(sql, obj);
        DBhelper.allClose(null, null, con);
		return reuslt;
	}
	//角色信息删除
	public int removerole(Roleinfo roleinfo){
		String sql = "DELETE FROM roleinfo WHERE roleinfo.role_id=?";
		Object[] obj ={roleinfo.getRole_id()};
		int result = super.update(sql, obj);
		DBhelper.allClose(null, null, con);
		return result;
	}
	


}
