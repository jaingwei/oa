package cn.oa.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import cn.oa.entity.UserInfo;
import cn.oa.services.UserServices;
import cn.oa.util.MobileMessageSend;

public class UserController {
	//账号登录
	public void dologin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		//获取参数
		String username = request.getParameter("name");
		String password = request.getParameter("password");
		System.out.println(username);
		//调用方法
		UserServices userServices = new UserServices();
		try {
			UserInfo userInfo =userServices.dologin(username, password);
			System.out.println("报错");
			request.getSession().setAttribute("user", userInfo.getUserName());
			response.sendRedirect("/oa/first.jsp");
		} catch (Exception e) {
			request.getSession().setAttribute("msg", e.getMessage());
			response.sendRedirect("/oa/Prodeng.jsp");
		}

	}
	
    //发送短信
	public void sendSms(HttpServletRequest request, HttpServletResponse response) throws IOException{
         String number = request.getParameter("Number");
         UserServices userServices =new UserServices();
         String msg = userServices.number(number);
		 String json = JSON.toJSONString(msg);
		 response.getWriter().write(json);
	}
	
	//短信验证登录
	public void sendLogin(HttpServletRequest request, HttpServletResponse response) throws IOException{
         String number = request.getParameter("number");
         String yan = request.getParameter("verification");
         //调用方法
         UserServices userServices = new UserServices();
         Map<String, Object> map = userServices.numberlogin(number, yan);
		 String msg = (String) map.get("msg");
		 UserInfo userInfo = (UserInfo) map.get("userInfo");
		 if ("验证成功".equals(msg) && userInfo!=null) {
			request.getSession().setAttribute("user",userInfo.getUserName());
			response.sendRedirect("/oa/first.jsp");
		}else{
			response.sendRedirect("/oa/Prodeng.jsp");
		}

	}
	
	
	//个人信息查看
	public void searchUser(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String username = (String) request.getSession().getAttribute("user");
		//调用方法
		UserServices userServices =new UserServices();
		Map<String, Object> map = userServices.searchMap(username);
	    System.out.println(map);
		String json = JSON.toJSONString(map);
		response.getWriter().write(json);
	}
	
	
	
	
	
	
	
	
}
