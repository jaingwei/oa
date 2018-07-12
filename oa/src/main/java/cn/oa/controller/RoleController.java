package cn.oa.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import cn.oa.entity.UserInfo;
import cn.oa.services.RoleServices;

public class RoleController {
  //角色菜单
	public void getsys(HttpServletRequest request, HttpServletResponse response) throws IOException{
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute("user");
		Integer roleid = userInfo.getRole_id();
		System.out.println(roleid);
		RoleServices roleServices =new RoleServices();
		List<Map<String, Object>> list = roleServices.getSys(roleid);
		String json = JSON.toJSONString(list);
		response.getWriter().write(json);
	}
	
	
	
	
	
}
