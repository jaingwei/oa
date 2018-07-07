package cn.oa.services;

import java.util.List;

import cn.oa.dao.UserDao;
import cn.oa.entity.UserInfo;
public class UserServices {
    //用户账户名登录
    public UserInfo dologin(String username, String password) throws Exception{
    	UserDao userDao = new UserDao();
    	List<UserInfo> list = userDao.dosearch(username);
    	if (list!=null) {
		    UserInfo userInfo = (UserInfo) list.get(0);
		    if (!password.equals(userInfo.getPassWord())) {
				throw new Exception("账户密码错误");
			}else{
				return userInfo;
			}
		}else{
			throw new Exception("账户名不存在");
		}
    	
    }
    
    
    public static void main(String[] args) {
		UserServices userServices = new UserServices();
		try {
			UserInfo userInfo = userServices.dologin("1001", "123456789");
			System.out.println(userInfo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
}
