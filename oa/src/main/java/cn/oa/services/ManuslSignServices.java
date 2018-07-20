package cn.oa.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import cn.oa.dao.ManuslSignDAO;
import cn.oa.dao.UserDao;
import cn.oa.entity.ManualSign;
import cn.oa.entity.UserInfo;
import cn.oa.util.PageUtil;
import cn.oa.util.Time;

public class ManuslSignServices {
    ManuslSignDAO manuslSignDAO = new ManuslSignDAO();
    //添加并且显示签到信息
    public List<Map<String, Object>> addSign(ManualSign manualSign){
    	int reuslt = manuslSignDAO.addSign(manualSign);
    	List<Map<String, Object>> list=null;
    	list =  this.getSign(manualSign);
		return list;
		
    }
	//查找新签到签退信息
    public List<Map<String, Object>> getSign(ManualSign manualSign){
		return manuslSignDAO.getSign(manualSign);	
    }
    
    
	//查找签到信息，分页
    public PageUtil getSigns(Time time,UserInfo userInfo,ManualSign manualSign,Integer index, Integer page){
		PageUtil pageUtil =new PageUtil();
		//查询总的签到信息
		List<Map<String,Object>> list = manuslSignDAO.getSign(time,userInfo, manualSign, index, page);
    	//查询信息总数
		int totalCount = manuslSignDAO.getCount(manualSign, userInfo,time);
		//计算总页数
		int totalPage = (totalCount-1)/page+1;
		pageUtil.setIndex(index);
		pageUtil.setList(list);
		pageUtil.setPageSize(page);
		pageUtil.setTotalCount(totalCount);
		pageUtil.setTotalPage(totalPage);
		return pageUtil;
    }
   
    
    //查询签到信息统计
    public List<Map<String, Object>> getStatistic(UserInfo userInfo){
    	UserDao userDao = new UserDao();
    	List<Map<String, Object>> list = userDao.map(userInfo);
    	
    	List<Map<String, Object>> list2 = new ArrayList<Map<String,Object>>();
    	for (int i = 0; i < list.size(); i++) {
    		Map<String, Object> map2 = new HashMap<String, Object>();
			Map<String, Object> map = list.get(i);
			String username = map.get("user_name").toString();
    		String depart = map.get("depart_name").toString();
    		String branch = map.get("branch_name").toString();
    		String userid = map.get("user_id").toString();
    		
    		userInfo.setUser_id(userid);
    		Integer Attendance = manuslSignDAO.getAttendance(userInfo, 1);
    		Integer late = manuslSignDAO.getlate(userInfo, 1);
    		Integer early = manuslSignDAO.getearly(userInfo, 0);
    		Integer noday = manuslSignDAO.getday(userInfo, 1);
    		map2.put("username", username);
    		map2.put("depart", depart);
    		map2.put("branch", branch);
    		map2.put("attendance", Attendance);
    		map2.put("late", late);
    		map2.put("early", early);
    		map2.put("noday", noday);
    		list2.add(map2);
		}
    	return list2;
    }
    
    

    
}
