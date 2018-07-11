package cn.oa.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.oa.entity.UserInfo;
import cn.oa.services.RoleServices;

public class RoleController {
  //角色菜单
	public void getsys(HttpServletRequest request, HttpServletResponse response){
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute("user");
		Integer roleid = userInfo.getRole_id();
		RoleServices roleServices =new RoleServices();
		List<Map<String, Object>> list = roleServices.getSys(roleid);
		
		
		
	}
}
