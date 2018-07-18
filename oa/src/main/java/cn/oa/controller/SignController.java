package cn.oa.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import cn.oa.entity.ManualSign;
import cn.oa.entity.UserInfo;
import cn.oa.services.ManuslSignServices;
import cn.oa.util.PageUtil;
import cn.oa.util.Time;

public class SignController {
    //添加签到签退信息
	public void addSign(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String msg =null;
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute("user");
		String userId = userInfo.getUser_id();
		String signDesc = request.getParameter("signDesc");
		String signTag = request.getParameter("signTag");
		ManualSign manualSign =new ManualSign();
		manualSign.setUser_id(userId);
		manualSign.setSign_desc(signDesc);
		manualSign.setSign_tag(Integer.valueOf(signTag));
		manualSign.setSign_time(new Date());
		ManuslSignServices manuslSignServices =new ManuslSignServices();
		List<Map<String, Object>> list = manuslSignServices.addSign(manualSign);
		Map<String, Object> map = list.get(0);
		String json = JSON.toJSONString(map);
		response.getWriter().write(json);
	}
	
	//查找签到信息
	public void getSign(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		ManualSign manualSign =new ManualSign();
		//拿取页面数据
		String index = request.getParameter("index");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		//拿取用户姓名或者部门
		String userId = request.getParameter("name");
		String UserDepart = request.getParameter("depart");
		String timeType = request.getParameter("timeType");
		
		System.out.println(userId+"============="+UserDepart+"=========="+timeType);
		Time time = new Time(); 
		if ( start !="") {
			time.setStartTime(start);
		}
		if (end!="") {
			time.setEndTime(end);
		}	
		if (timeType != null) {
			time.setTimeType(timeType);
		}
		//拿取session中的值判断账户权限
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute("user"); 
		//拿取当前权限id
		Integer roleId = userInfo.getRole_id();
		
		//新建用户类，方法传参
		UserInfo userInfo2 = new UserInfo();
		if (roleId==1) {
			String name = userInfo.getUser_name();
			userInfo2.setUser_name(name);
		}
        if (roleId==2) {
			Integer depart = userInfo.getDepart_id();
			userInfo2.setDepart_id(depart);
			if (Integer.valueOf(userId) != -1) {
				userInfo2.setUser_id(userId);
			}
		}
        if (roleId==3) {
			if (Integer.valueOf(userId) !=-1 ) {
				userInfo2.setUser_id(userId);
			}
			if (Integer.valueOf(UserDepart) != -1) {
				userInfo2.setDepart_id(Integer.valueOf(UserDepart));
			}
		}
		
		if (index == null) {
		  index = "1";
		}
		//调用后台方法
		
		ManuslSignServices manuslSignServices = new ManuslSignServices();
		PageUtil pageUtil = manuslSignServices.getSigns(time,userInfo2, manualSign,Integer.valueOf(index), 10);
		//json向页扔数据
        String json = JSON.toJSONString(pageUtil);
        response.getWriter().write(json);
		
	}
	
	
}
