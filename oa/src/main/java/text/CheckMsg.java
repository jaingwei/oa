package text;

import cn.oa.util.MobileMessageCheck;

public class CheckMsg {
	public static void main(String[] args) {
		String mobileNumber = "15262046072";//�ֻ�����
		String code = "2980";//��֤��
		try {
			String str = MobileMessageCheck.checkMsg(mobileNumber,code);
			if("success".equals(str)){
				System.out.println("验证成功");
			}else{
				System.out.println("验证失败");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
