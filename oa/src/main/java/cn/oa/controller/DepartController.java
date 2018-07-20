package cn.oa.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import cn.oa.entity.Departinfo;
import cn.oa.services.DepartinfoServices;

public class DepartController {
   //查找部门
	public void getDepart(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String depardid =  (String) request.getSession().getAttribute("depardId");
		Departinfo departinfo = new Departinfo();
		DepartinfoServices departinfoServices = new DepartinfoServices();
		if (depardid !=null) {
			departinfo.setDepart_id(Integer.valueOf(depardid));
			request.getSession().setAttribute("depardId", depardid);
		}
		List<Map<String, Object>> list = departinfoServices.getDepart(departinfo);
		String json = JSON.toJSONString(list);
		response.getWriter().write(json);
	}
	
	public void getDeparts(HttpServletRequest request, HttpServletResponse response) throws IOException{
		Departinfo departinfo = new Departinfo();
		DepartinfoServices departinfoServices = new DepartinfoServices();
		List<Map<String, Object>> list = departinfoServices.getDepart(departinfo);
		String json = JSON.toJSONString(list);
		response.getWriter().write(json);
	}
	
	
	public void toDepart(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String depardid =  request.getParameter("departId");
		if (depardid !=null) {
			request.getSession().setAttribute("depardId", depardid);
			response.sendRedirect("/oa/RSbmAdd.jsp");
		}else{
			response.sendRedirect("/oa/RSbmSearch.jsp");
		}
		
	}
	
   //添加部门
	public void addDepart(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String name = request.getParameter("name");
		String user = request.getParameter("user");
		String number = request.getParameter("number");
		String tel = request.getParameter("tel");
		
		Departinfo departinfo = new Departinfo();
		departinfo.setDepart_name(name);
		departinfo.setConnect_mobile_no(Long.valueOf(number));
		departinfo.setConnect_tel_no(Long.valueOf(tel));
		departinfo.setPrincipa_user(user);
		departinfo.setBranch_id(1);
		DepartinfoServices departinfoServices = new DepartinfoServices();
		int result = departinfoServices.addDepart(departinfo);
		String msg = null;
		if (result ==1) {
			msg = "添加成功";
		}else{
			msg="添加失败";
		}
		String json = JSON.toJSONString(msg);
		response.getWriter().write(json);
	}
	
	
   //修改部门
	public void updateDepart(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String id = (String) request.getSession().getAttribute("depardId");
		String name = request.getParameter("name");
		String user = request.getParameter("user");
		String number = request.getParameter("number");
		String tel = request.getParameter("tel");
		
		Departinfo departinfo = new Departinfo();
		
		departinfo.setDepart_id(Integer.valueOf(id));
		departinfo.setDepart_name(name);
		departinfo.setConnect_mobile_no(Long.valueOf(number));
		departinfo.setConnect_tel_no(Long.valueOf(tel));
		departinfo.setPrincipa_user(user);
		departinfo.setBranch_id(1);
		
		DepartinfoServices departinfoServices = new DepartinfoServices();
		String result = departinfoServices.updateDepart(departinfo);
		String json = JSON.toJSONString(result);
		response.getWriter().write(json);
		
	}
	
	
   //删除部门
	public void removeDepart(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String id = request.getParameter("depardId");
		Departinfo departinfo = new Departinfo();
		departinfo.setDepart_id(Integer.valueOf(id));
		DepartinfoServices departinfoServices = new DepartinfoServices();
		int result = departinfoServices.removeDepart(departinfo);
		String json = JSON.toJSONString(result);
		response.getWriter().write(json);
		
	}
	//查找部门
	public void search(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String depart = request.getParameter("depart");
		Departinfo departinfo = new Departinfo();
		departinfo.setDepart_name(depart);
		DepartinfoServices departinfoServices = new  DepartinfoServices();
		List<Map<String, Object>> list = departinfoServices.getDepart(departinfo);
		String msg = null;
		
		if (list==null||list.size()==0) {
		   	msg = "0";
		}else{
			msg = "1";
		}
		String json = JSON.toJSONString(msg);
		response.getWriter().write(json);
	}
	
}
