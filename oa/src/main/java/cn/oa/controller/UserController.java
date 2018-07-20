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
		//调用方法
		UserServices userServices = new UserServices();
		try {
			UserInfo userInfo =userServices.dologin(username, password);
			request.getSession().setAttribute("user",userInfo);
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
			request.getSession().setAttribute("user",userInfo);
			response.sendRedirect("/oa/first.jsp");
		}else{
			response.sendRedirect("/oa/Prodeng.jsp");
		}
	}
	//退出，清除session
	public void removeSession(HttpServletRequest request, HttpServletResponse response) throws IOException{
		request.getSession().removeAttribute("user");
	}

	//个人信息查看
	public void searchUser(HttpServletRequest request, HttpServletResponse response) throws IOException{
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute("user");
		//调用方法
		UserServices userServices =new UserServices();
		List<Map<String, Object>> list = userServices.searchMap(userInfo);
		Map<String, Object> map = list.get(0);
		String json = JSON.toJSONString(map);
		response.getWriter().write(json);
	}

	//RS获取权限为1的所有用户账号信息
	public void getUsers(HttpServletRequest request, HttpServletResponse response) throws IOException{
		UserInfo userInfo =new UserInfo();
		UserServices userServices = new UserServices();
		userInfo.setRole_id(1);
		List<UserInfo> list = userServices.getUsers(userInfo);
		String json = JSON.toJSONString(list);
		response.getWriter().write(json);
	}

	//获取所有用户账号信息
	public void getUsersAll(HttpServletRequest request, HttpServletResponse response) throws IOException{
		//获取值
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String depart = request.getParameter("depart");
		String role = request.getParameter("role");
		//向对象中属性赋值
		UserInfo userInfo =new UserInfo();
         if (name != null) {
			userInfo.setUser_name(name);
		}
         if (id != null) {
 			userInfo.setUser_id(id);
 		}
         if (Integer.valueOf(depart) != -1) {
 			userInfo.setDepart_id(Integer.valueOf(depart));
 		}
         if (Integer.valueOf(role) != -1) {
 			userInfo.setRole_id(Integer.valueOf(role));
 		}
		UserServices userServices = new UserServices();
		List<Map<String, Object>> list = userServices.searchMap11(userInfo);
		String json = JSON.toJSONString(list);
		response.getWriter().write(json);
	}
	
	
	//根据权限获取相应的用户账号信息
		public void getUserName(HttpServletRequest request, HttpServletResponse response) throws IOException{
			UserInfo userInfo2 = new UserInfo();
 			//获取值
			UserInfo userInfo =(UserInfo) request.getSession().getAttribute("user");
			Integer role = userInfo.getRole_id();
			if (role ==1) {
				String userId = userInfo.getUser_id();
				userInfo2.setUser_id(userId);
			}
            if (role ==2) {
				Integer depart = userInfo.getDepart_id();
				userInfo2.setDepart_id(depart);
			}	
			//向对象中属性赋值
			
			UserServices userServices = new UserServices();
			List<Map<String, Object>> list = userServices.searchMap11(userInfo2);
			String json = JSON.toJSONString(list);
			response.getWriter().write(json);
		}


	//RS修改用户账号部门角色信息
	public void updateUser(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String userid = request.getParameter("userId");
		UserInfo userInfo =new UserInfo();
		UserServices userServices = new UserServices();
		if (userid!=null) {
			userInfo.setRole_id(2);
			userInfo.setUser_id(userid);
		}
		List<UserInfo> list = userServices.updateUser(userInfo);
		String json = JSON.toJSONString(list);
		response.getWriter().write(json);
	}

	//RS 删除部门时，角色部门信息归0
	public void updateUserDepart(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String departId = request.getParameter("depardId");
		UserServices userServices = new UserServices();
		int msg = userServices.updateUserDepart(Integer.valueOf(departId), 0);
		String json = JSON.toJSONString(msg);
		response.getWriter().write(json);
	}

	//RS修改用户账号部门角色信息
	public void updateUserIn(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String username = request.getParameter("username");
		UserInfo userInfo =new UserInfo();
		UserServices userServices = new UserServices();
		userInfo.setRole_id(1);
		userInfo.setUser_name(username);
		List<UserInfo> list = userServices.updateUser(userInfo);
		String json = JSON.toJSONString(list);
		response.getWriter().write(json);
	}


	//用户删除
	public void removeUser(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String userId = request.getParameter("userId");
		UserInfo userInfo =new UserInfo();
		userInfo.setUser_id(userId);;
		UserServices userServices = new UserServices();
		int result = userServices.removeUser(userInfo);
		String msg = null;
		if (result ==1) {
			msg ="删除成功";
		} else {
			msg ="删除失败";
		}
		String json = JSON.toJSONString(msg);
		response.getWriter().write(json);
	}

	//获取用户id 存入session
	public void toUser(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String userId =  request.getParameter("userId");
		if (userId !=null) {
			request.getSession().setAttribute("userId",userId);
			response.sendRedirect("/oa/RSuseradd.jsp");
		}else{
			response.sendRedirect("/oa/RSuserSearcch.jsp");
		}

	}

	//获取某一账户的信息
	public void getOneUser(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String userId = (String) request.getSession().getAttribute("userId");
		UserServices userServices = new UserServices();
		UserInfo userInfo =new UserInfo();
		userInfo.setUser_id(userId);
		List<Map<String, Object>> list = userServices.searchMap(userInfo);
		Map<String, Object> map = list.get(0);
		String json = JSON.toJSONString(map);
		response.getWriter().write(json);
	}

	//修改用户信息
	public void updateUsers(HttpServletRequest request,HttpServletResponse response) throws IOException{

		String userId = request.getParameter("userId");
		String username = request.getParameter("name");
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		String depart = request.getParameter("depart");
		String role = request.getParameter("role");
		String state = request.getParameter("state");
		if (Integer.valueOf(role)==-1 || Integer.valueOf(depart)==-1) {
			System.out.println("错误");
			return;
		}
	
		UserInfo userInfo =new UserInfo();
		userInfo.setUser_id(userId);
		userInfo.setUser_name(username);
		userInfo.setPass_word(password1);
		userInfo.setDepart_id(Integer.valueOf(depart));
		userInfo.setRole_id(Integer.valueOf(role));
		if ("屏蔽状态".equals(state)) {
			userInfo.setUser_state(0);
		} else {
			userInfo.setUser_state(1);
		}
		UserServices userServices = new UserServices();
		String msg = userServices.updateUsers(userInfo);
		String json = JSON.toJSONString(msg);
		response.getWriter().write(json);  
	}


	//添加用户信息
	public void addUser(HttpServletRequest request,HttpServletResponse response) throws IOException{

		String userId = request.getParameter("userId");
		String username = request.getParameter("name");
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		String depart = request.getParameter("depart");
		String role = request.getParameter("role");
		String state = request.getParameter("state");
		String number =request.getParameter("number");
		String sex =request.getParameter("sex");

		if (Integer.valueOf(role)==-1 || Integer.valueOf(depart)==-1) {
			return;
		}
		
		UserInfo userInfo =new UserInfo();
		userInfo.setUser_id(userId);
		userInfo.setUser_name(username);
		userInfo.setPass_word(password1);
		userInfo.setDepart_id(Integer.valueOf(depart));
		userInfo.setRole_id(Integer.valueOf(role));
		if ("屏蔽状态".equals(state)) {
			userInfo.setUser_state(0);
		} else {
			userInfo.setUser_state(1);
		}
		userInfo.setNumber(number);
		userInfo.setGender(Integer.valueOf(sex));
		UserServices userServices = new UserServices();
		String msg = userServices.addUser(userInfo);
		String json = JSON.toJSONString(msg);
		response.getWriter().write(json);  
	}
	//将当前登录用户role扔到页面
	public void getRole(HttpServletRequest request, HttpServletResponse response) throws IOException{
	    UserInfo userInfo = (UserInfo) request.getSession().getAttribute("user");
		Integer role = userInfo.getRole_id();
		String json = JSON.toJSONString(role);
		response.getWriter().write(json);
	}
	
	//获取某一账户的信息
		public void YgetUser(HttpServletRequest request, HttpServletResponse response) throws IOException{
			String userId = request.getParameter("userId");
			UserServices userServices = new UserServices();
			UserInfo userInfo =new UserInfo();
			userInfo.setUser_id(userId);
			List<Map<String, Object>> list = userServices.searchMap(userInfo);
			String msg = "";
			if (list==null||list.size()==0) {
			   	msg = "0";
			}else{
				msg = "1";
			}
			String json = JSON.toJSONString(msg);
			response.getWriter().write(json);
		}
	
	

}
