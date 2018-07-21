package cn.oa.services;

import java.util.List;
import java.util.Map;

import cn.oa.dao.LoginLogDAO;
import cn.oa.entity.LoginLog;
import cn.oa.util.PageUtil;
import cn.oa.util.Time;

public class LoginLogServices {
       LoginLogDAO loginLogDAO = new  LoginLogDAO();
       
       //搜索登录记录
    public PageUtil getLogin(LoginLog loginLog,Time time,Integer index,Integer page){
    	PageUtil pageUtil =new PageUtil();
   	    List<Map<String, Object>> list = loginLogDAO.getLog(loginLog, time, index, page);
   	    int totalcount = loginLogDAO.getCount(loginLog, time);
   	    int totalpage = (totalcount-1)/page +1;
   	    pageUtil.setIndex(index);
   	    pageUtil.setList(list);
   	    pageUtil.setPageSize(page);
   	    pageUtil.setTotalCount(totalcount);
   	    pageUtil.setTotalPage(totalpage);
		return pageUtil;
    }
    
    //删除登录记录
    public String removeLogin(LoginLog loginLog){
    	int result = loginLogDAO.removeLog(loginLog);
    	String msg="删除失败";
    	if (result !=0) {
			msg="删除成功";
		}	
		return msg;	
    }  
    
    //添加登录记录
    public String addLogin(LoginLog loginLog){
    	int result = loginLogDAO.addLog(loginLog);
    	String msg="添加失败";
    	if (result !=0) {
			msg="添加成功";
		}	
		return msg;	
     }
    
}
