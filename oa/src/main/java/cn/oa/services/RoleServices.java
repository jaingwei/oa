package cn.oa.services;

import java.util.List;
import java.util.Map;

import cn.oa.dao.RoleDAO;

public class RoleServices {
  //拿取数据
  public List<Map<String, Object>> getSys(Integer roleid){
	  RoleDAO roleDAO = new RoleDAO();  
	  return roleDAO.getsys(roleid);  
  }
}
