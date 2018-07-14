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

public class SignController {
    //添加签到签退信息
	public void addSign(HttpServletRequest request, HttpServletResponse response) throws IOException{
		System.out.println("签到");
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
		System.out.println(map);
		String json = JSON.toJSONString(map);
		response.getWriter().write(json);
	}
	
	
	
	
}
