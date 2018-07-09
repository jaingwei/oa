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
	public void dologin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		//获取参数
		String username = request.getParameter("name");
		String password = request.getParameter("password");
		System.out.println(username);
		//调用方法
		UserServices userServices = new UserServices();
		try {
			UserInfo userInfo =userServices.dologin(username, password);
			request.getSession().setAttribute("user", username);
			response.sendRedirect("/oa/first.jsp");
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			request.getRequestDispatcher("/Prodeng.jsp").forward(request, response);
		}

	}

	public void sendSms(HttpServletRequest request, HttpServletResponse response) throws IOException{
         String number = request.getParameter("Number");
         UserServices userServices =new UserServices();
         String msg = userServices.number(number);
		 String json = JSON.toJSONString(msg);
		 response.getWriter().write(json);
	}
	
	public void sendLogin(HttpServletRequest request, HttpServletResponse response) throws IOException{
         String number = request.getParameter("number");
         String yan = request.getParameter("verification");
         //调用方法
         UserServices userServices = new UserServices();
         Map<String, Object> map = userServices.numberlogin(number, yan);
		 String msg = (String) map.get("msg");
		 UserInfo userInfo = (UserInfo) map.get("userInfo");
		 if ("验证成功".equals(msg) && userInfo!=null) {
			request.getSession().setAttribute("user",userInfo.getUserId());
			response.sendRedirect("/oa/first.jsp");
		}else{
			response.sendRedirect("/oa/Prodeng.jsp");
		}

	}
	
	
	
	
	
	
	
	
	
	
}
