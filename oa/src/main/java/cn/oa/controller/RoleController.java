package cn.oa.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import cn.oa.entity.Roleinfo;
import cn.oa.entity.SysFun;
import cn.oa.entity.UserInfo;
import cn.oa.services.RoleServices;

public class RoleController {
    //菜单信息显示
	public void getsys(HttpServletRequest request, HttpServletResponse response) throws IOException{
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute("user");
		Integer roleid = userInfo.getRole_id();
		RoleServices roleServices =new RoleServices();
		List<Map<String, Object>> list = roleServices.getSys(roleid);
		String json = JSON.toJSONString(list);
		response.getWriter().write(json);
	}
	
	//角色信息搜索
	public void getrole(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String id = request.getParameter("roleid");
		RoleServices roleServices = new RoleServices();
		Roleinfo roleinfo = new Roleinfo();
		if (id!=null) {
			roleinfo.setRole_id(Integer.valueOf(id));
			request.getSession().setAttribute("id", id);
		}
		List<Roleinfo> list = roleServices.getroles(roleinfo);
		String json = JSON.toJSONString(list);
		response.getWriter().write(json);
	}
	
	//所有角色信息搜索
		public void getRoles(HttpServletRequest request, HttpServletResponse response) throws IOException{	
			System.out.println("角色");
			RoleServices roleServices = new RoleServices();
			Roleinfo roleinfo = new Roleinfo();
			List<Roleinfo> list = roleServices.getroles(roleinfo);
			System.out.println(list);
			String json = JSON.toJSONString(list);
			response.getWriter().write(json);
		}
	
	//角色信息修改
	public void updaterole(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String msg =null;
		String id = (String) request.getSession().getAttribute("id");
		String name = request.getParameter("name");
		String desc = request.getParameter("desc");
		
		RoleServices roleServices = new RoleServices();
		Roleinfo roleinfo = new Roleinfo();
		if (id!=null) {
			roleinfo.setRole_id(Integer.valueOf(id));
		}
		roleinfo.setRole_name(name);
		roleinfo.setRole_desc(desc);
		int reuslt = roleServices.updatarole(roleinfo);
		if (reuslt ==1) {
			msg ="修改信息成功";
		} else {
			msg ="修改信息失败";
		}
		String json = JSON.toJSONString(msg);
		response.getWriter().write(json);
		
	}
	
	//角色信息修改
		public void addrole(HttpServletRequest request, HttpServletResponse response) throws IOException{
			String msg =null;
			String name = request.getParameter("name");
			String desc = request.getParameter("desc");
			RoleServices roleServices = new RoleServices();
			Roleinfo roleinfo = new Roleinfo();
			roleinfo.setRole_name(name);
			roleinfo.setRole_desc(desc);
			int reuslt = roleServices.addrole(roleinfo);
			if (reuslt ==1) {
				msg ="修改信息成功";
			} else {
				msg ="修改信息失败";
			}
			String json = JSON.toJSONString(msg);
			response.getWriter().write(json);
			
		}
	
      //角色删除
	 public void removerole(HttpServletRequest request, HttpServletResponse response) throws IOException{
		 String msg=null;
		 String id = request.getParameter("roleid");
		 RoleServices roleServices =new RoleServices();
		 Roleinfo roleinfo = new Roleinfo();
		 if (id !=null) {
			roleinfo.setRole_id(Integer.valueOf(id));
		 }
		  int result= roleServices.removerole(roleinfo); 
		  if (result==1) {
			 msg = "删除成功";
		}else {
			 msg="删除失败";
		}
		  String json = JSON.toJSONString(msg);
		 response.getWriter().write(json);
	 }
	 
	 //拿取已有权限菜单信息
	 public void getAlreadySys(HttpServletRequest request, HttpServletResponse response) throws IOException{
		 String id = request.getParameter("roleid");
		 RoleServices roleServices = new RoleServices();
		 List<Map<String, Object>> list = roleServices.getAlreadySys(Integer.valueOf(id));
		 request.getSession().setAttribute("id", id);
		 String json = JSON.toJSONString(list);
		 response.getWriter().write(json);	 
	 }
	 
	 //拿取未有权限菜单信息
      public void getNotSys(HttpServletRequest request, HttpServletResponse response) throws IOException{
    	 String id = request.getParameter("roleid");
 		 RoleServices roleServices = new RoleServices();
 		 List<Map<String, Object>> list = roleServices.getNotSys(Integer.valueOf(id));
 		 for (int i = 0; i < list.size(); i++) {
			list.get(i).put("id", Integer.valueOf(id));
		 }
 		 String json = JSON.toJSONString(list);
 		 response.getWriter().write(json);	 
	 }
    //角色权限添加
      public void addSys(HttpServletRequest request, HttpServletResponse response) throws IOException{
    	 String roleId= (String) request.getSession().getAttribute("id");
    	 String nodeId=request.getParameter("nodeid");
    	 RoleServices roleServices =new RoleServices();
    	 String msg = roleServices.addSys(Integer.valueOf(roleId),Integer.valueOf(nodeId)); 
    	 String json = JSON.toJSONString(msg);
    	 response.getWriter().write(json);
      }
    //角色权限删除
      public void removeSys(HttpServletRequest request, HttpServletResponse response) throws IOException{
     	 String roleId= request.getParameter("roleid");
     	 String nodeId=request.getParameter("nodeid");
     	 RoleServices roleServices =new RoleServices();
     	 String msg = roleServices.removeSys(Integer.valueOf(roleId),Integer.valueOf(nodeId)); 
     	 String json = JSON.toJSONString(msg);
     	 response.getWriter().write(json);
       }
      
      
      
}
