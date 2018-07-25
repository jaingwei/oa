package cn.oa.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import cn.oa.entity.LoginLog;
import cn.oa.services.LoginLogServices;
import cn.oa.util.PageUtil;
import cn.oa.util.Time;

public class LoginController {
    LoginLogServices loginLogServices =new LoginLogServices();
    
    //查询记录
    public void getLogin(HttpServletRequest request, HttpServletResponse response) throws IOException{
    	String index = request.getParameter("index");
    	String start = request.getParameter("start");
		String end = request.getParameter("end");
		String timeType = request.getParameter("timeType");
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
    	
    	if (index==null) {
			index="1";
		}
    	LoginLog loginLog =new LoginLog();
    	PageUtil pageutil = loginLogServices.getLogin(loginLog, time, Integer.valueOf(index), 10);
    	String json = JSON.toJSONString(pageutil);
    	response.getWriter().write(json);
    }
    
	//删除登录记录
    public void removeLogin(HttpServletRequest request, HttpServletResponse response) throws IOException{
    	String id = request.getParameter("id");
    	LoginLog loginLog =new LoginLog();
    	if (id!=null) {
			loginLog.setUser_id(id);
		}
    	String msg = loginLogServices.removeLogin(loginLog);
    	String json = JSON.toJSONString(msg);
    	response.getWriter().write(json);
    }
	
}
