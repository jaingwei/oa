package cn.oa.services;

import java.util.List;
import java.util.Map;

import cn.oa.dao.ManuslSignDAO;
import cn.oa.entity.ManualSign;

public class ManuslSignServices {
    ManuslSignDAO manuslSignDAO = new ManuslSignDAO();
    //添加签到信息
    public int addSign(ManualSign manualSign){
		return manuslSignDAO.addSign(manualSign);
    }
	//查新签到签退信息
    public List<Map<String, Object>> getSign(ManualSign manualSign){
		return manuslSignDAO.getSign(manualSign);	
    }
    
    
    
}
