package cn.oa.services;

import java.util.List;
import java.util.Map;

import cn.oa.dao.ManuslSignDAO;
import cn.oa.entity.ManualSign;
import cn.oa.util.PageUtil;

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
    public List<Map<String, Object>> getSigns(ManualSign manualSign,Integer index, Integer page){
		PageUtil pageUtil =new PageUtil();
		//查询总的签到信息
		List<Map<String,Object>> list = manuslSignDAO.getSign(manualSign, index, page);
    	//查询信息总数
		
		
		
		
		return list;
    }
    
}
