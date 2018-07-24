package cn.oa.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.oa.entity.MyNote;
import cn.oa.entity.UserInfo;
import cn.oa.services.MynoteServices;
import cn.oa.services.UserServices;

import com.alibaba.fastjson.JSON;

public class MynoteController {
	 //查找标签
	public void getMynote(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String mynote =  (String) request.getSession().getAttribute("mynoteId");
		
		MyNote myNote = new MyNote();
		MynoteServices mynotesServices = new MynoteServices();
		if (mynote !=null) {
			myNote.setNote_id(Integer.valueOf(mynote));
			request.getSession().setAttribute("mynoteId", mynote);
		}
		List<MyNote> list = mynotesServices.getMynote(myNote);
		
		String json = JSON.toJSONString(list);
		response.getWriter().write(json);
	}
	
	
	public void getMynotes(HttpServletRequest request, HttpServletResponse response) throws IOException{
		MyNote myNote = new MyNote();
		MynoteServices mynoteServices = new MynoteServices();
		List<MyNote> list = mynoteServices.getMynote(myNote);
		
		String json = JSON.toJSONString(list);
		response.getWriter().write(json);
	}
	
	
	public void toMynote(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String mynoteid =  request.getParameter("id");
		System.out.println(mynoteid+"=======================");
		if (mynoteid !=null) {
			request.getSession().setAttribute("mynoteid", mynoteid);
			response.sendRedirect("/oa/BQxiugai.jsp");
		}else{
			response.sendRedirect("/oa/WDbiaoqian.jsp");
		}		
	}
	//获取
	public void getOneUser(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String mynoteId = (String) request.getSession().getAttribute("mynoteid");
		MynoteServices mynoteServices = new MynoteServices();
		MyNote myNote=new MyNote();
		myNote.setNote_id(Integer.valueOf(mynoteId));
		System.out.println("kongzhi"+mynoteId);
		List<MyNote> list = mynoteServices.getMynote(myNote);
		
		String json = JSON.toJSONString(list);
		response.getWriter().write(json);
	}
	//添加标签
	public void addMynote(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String title = request.getParameter("title");
		String count = request.getParameter("count");
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute("user");
		String user= userInfo.getUser_id();
		 
		MyNote mynote = new MyNote();
		mynote.setNote_title(title);
		mynote.setNote_count(count);
		mynote.setGreat_user(user);
		mynote.setGreat_time(new Date());
		MynoteServices mynoteServices = new MynoteServices();
		int result =  mynoteServices.addMynote(mynote);
		String msg = null;
		if (result ==1) {
			msg = "添加成功";
		}else{
			msg="添加失败";
		}
		String json = JSON.toJSONString(msg);
		response.getWriter().write(json);
	}
	
	//修改便签
	public void updateMynote(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String mynoteId = (String) request.getSession().getAttribute("mynoteid");
	    UserInfo userInfo = (UserInfo) request.getSession().getAttribute("user");
		String title = request.getParameter("title");
		String count = request.getParameter("count");
		String user= userInfo.getUser_id();
	
		MyNote mynote = new MyNote();
		mynote.setNote_title(title);
		mynote.setNote_count(count);
		
		mynote.setNote_id(Integer.valueOf(mynoteId));
		mynote.setGreat_time(new Date());
		mynote.setGreat_user(user);
		MynoteServices mynoteServices = new MynoteServices();
		String result =  mynoteServices.updateMynote(mynote);
		String json = JSON.toJSONString(result);
		response.getWriter().write(json);
		
	}
	
	//删除便签
	public void removeMynote(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String mynoteId = (String) request.getSession().getAttribute("mynoteid");
		MyNote mynote = new MyNote();
		mynote.setNote_id(Integer.valueOf(mynoteId));
		MynoteServices mynoteServices = new MynoteServices();
		int result = mynoteServices.removeMynote(mynote);
		String msg = "";
		if (result==1) {
			msg = "删除成功";
		} else {
			msg = "删除失败";
		}
		String json = JSON.toJSONString(msg);
		response.getWriter().write(json);
	}
	
}
