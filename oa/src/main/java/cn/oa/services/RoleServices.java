package cn.oa.services;

import java.util.List;
import java.util.Map;

import cn.oa.dao.RoleDAO;
import cn.oa.dao.SysfunDAO;
import cn.oa.entity.Roleinfo;
import cn.oa.entity.SysFun;

public class RoleServices {
	RoleDAO roleDAO = new RoleDAO();
	//拿菜单取数据
	public List<Map<String, Object>> getSys(Integer roleid){
		SysfunDAO sysfunDAO = new SysfunDAO();  
		return sysfunDAO.getsys(roleid);  
	}

	//拿取角色中信息
	public List<Roleinfo> getroles(Roleinfo roleinfo){
		List<Roleinfo> list = roleDAO.getrole(roleinfo);
		return list;  
	}
	//修改角色信息
	public int updatarole(Roleinfo roleinfo){
		return roleDAO.updaterole(roleinfo);
	}
	//添加角色信息
	public int addrole(Roleinfo roleinfo){
		return roleDAO.addrole(roleinfo);
	}
	//删除角色信息
	public int removerole(Roleinfo roleinfo){
		return roleDAO.removerole(roleinfo);
	}

	//拿取已有权限信息
	public List<Map<String, Object>> getAlreadySys(Integer roleid){
		SysfunDAO sysfunDAO = new SysfunDAO();
		return sysfunDAO.getAlreadySys(roleid);
	}

	//拿取未有权限信息
	public List<Map<String, Object>> getNotSys(Integer roleid){
		SysfunDAO sysfunDAO = new SysfunDAO();
		return sysfunDAO.getNotSys(roleid);
	}

   //添加角色权限
	public String addSys(Integer roleId, Integer nodeId){
		String msg =null;
		SysfunDAO sysfunDAO = new SysfunDAO();
		int result = sysfunDAO.addSys(roleId, nodeId);
		if (result==1) {
			msg="添加成功";
		}else{
			msg="添加失败";
		}
		return msg;
	}
   //删除角色权限
	public String removeSys(Integer roleId, Integer nodeId){
		String msg =null;
		SysfunDAO sysfunDAO = new SysfunDAO();
		int result = sysfunDAO.removeSys(roleId, nodeId);
		if (result==1) {
			msg="删除成功";
		}else{
			msg="删除失败";
		}
		return msg;
	}


	
}
