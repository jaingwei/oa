package text;

import cn.oa.util.MobileMessageSend;

public class SendMsg {
	public static void main(String[] args) {
		String mobileNumber = "15262046072";
		try {
			String str = MobileMessageSend.sendMsg(mobileNumber);
			if("success".equals(str)){
				System.out.println("发送成功");
			}else{
				System.out.println("发送失败");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
