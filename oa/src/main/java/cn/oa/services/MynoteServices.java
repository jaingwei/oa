package cn.oa.services;

import java.util.List;

import cn.oa.dao.MynoteDao;
import cn.oa.entity.MyNote;

public class MynoteServices {
	MynoteDao mynotedao = new MynoteDao();
	 //搜索标签信息
	public List<MyNote> getMynote(MyNote myNote){
		  return mynotedao.getMynote(myNote);
	   } 
		//添加标签信息
		public int addMynote(MyNote myNote ){
			return mynotedao.addMynote(myNote);
		}
	   //修改标签信息
	   public String updateMynote(MyNote myNote){
			int result = mynotedao.updateMynote(myNote);
			String msg = null;
			if (result ==1) {
				msg="修改成功";
			} else {
	            msg="修改失败";
			}
			return msg;
		}
	   
		//删除标签信息
		public int removeMynote(MyNote myNote ){
			return mynotedao.removeMynote(myNote);
		}
	   
	}
