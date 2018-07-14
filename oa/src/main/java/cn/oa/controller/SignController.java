package cn.oa.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import cn.oa.entity.ManualSign;
import cn.oa.entity.UserInfo;
import cn.oa.services.ManuslSignServices;

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
		int result = manuslSignServices.addSign(manualSign);
		System.out.println(result);
		if (result==1) {
			msg = "签到成功";
		}else{
			msg = "签到失败";
		}
		String json = JSON.toJSONString(msg);
		response.getWriter().write(json);
	}
}
