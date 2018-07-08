package cn.oa.services;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.oa.dao.UserDao;
import cn.oa.entity.UserInfo;
import cn.oa.util.MobileMessageCheck;
import cn.oa.util.MobileMessageSend;
public class UserServices {
	//用户账户名登录
	public UserInfo dologin(String username, String password) throws Exception{
		UserDao userDao = new UserDao();
		List<UserInfo> list = userDao.dosearch(username);
		if (list==null ||list.size()==0 ) {
			throw new Exception("账户名不存在");
		}else{
			UserInfo userInfo = (UserInfo) list.get(0);
			if (!password.equals(userInfo.getPassWord())) {
				throw new Exception("账户密码错误");
			}else{
				return userInfo;
			}
		}

	}
	//号码搜索账号发验证码
	public String number(String number){
		String msg= null;
		MobileMessageSend mobileMessageSend = new MobileMessageSend();
		UserDao userDao = new UserDao();
		List<UserInfo> list = userDao.numbersearch(number);
		if (list==null ||list.size()==0) {
			msg ="号码不存在";
		}else{
			try {
				msg = mobileMessageSend.sendMsg(number);
				if ("success".equals(msg)) {
					msg="发送成功";
				}else{
					msg="发送失败";
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return msg;
	}
	//验证码登录
	public Map<String, Object> numberlogin(String number,String yan){
		String msg= null; 
		Map<String, Object> map = new HashMap<String, Object>();
		MobileMessageCheck check = new MobileMessageCheck();
		UserDao userDao = new UserDao();
		List<UserInfo> list = userDao.numbersearch(number);
		if (list==null ||list.size()==0) {
			msg ="号码不存在";
			map.put("msg", msg);
		}else{
			try {
				String str = check.checkMsg(number, yan);
				if("success".equals(str)){
					System.out.println("验证成功");
					UserInfo userInfo = (UserInfo) list.get(0);
					map.put("msg", "验证成功");
					map.put("userInfo", userInfo);
				}else{
					System.out.println("验证失败");
					map.put("msg", "验证失败");
					map.put("userInfo", null);
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return map;
	}



	public static void main(String[] args) {
		UserServices userServices =new UserServices();
		Map<String, Object> map = userServices.numberlogin("15262046072", "6605");
		System.out.println(map);
	}

}
