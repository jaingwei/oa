package cn.oa.services;

import java.util.List;
import java.util.Map;

import cn.oa.dao.DepartinfoDAO;
import cn.oa.entity.Departinfo;

public class DepartinfoServices {
   DepartinfoDAO departinfoDAO = new DepartinfoDAO();
    //搜索部门信息
   public List<Map<String, Object>> getDepart(Departinfo departinfo){
	  return departinfoDAO.getDepart(departinfo);
   } 
   
	//添加部门信息
	public int addDepart(Departinfo departinfo){
		return departinfoDAO.addDepart(departinfo);
	}
   //修改部门信息
   public String updateDepart(Departinfo departinfo){
		int result = departinfoDAO.updateDepart(departinfo);
		String msg = null;
		if (result ==1) {
			msg="修改成功";
		} else {
            msg="修改失败";
		}
		return msg;
	}
   
	//删除部门信息
	public int removeDepart(Departinfo departinfo){
		return departinfoDAO.removeDepart(departinfo);
	}
   
}
