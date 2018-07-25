package cn.oa.dao;

import java.util.List;

import cn.oa.entity.MyNote;
import cn.oa.util.DBhelper;


public class MynoteDao extends BaseDAO<MyNote>{
	//搜索
	public List<MyNote> getMynote(MyNote myNote){
		String sql = "SELECT * from mynote n1"
				+" WHERE 1=1 ";
		int size =0;
		if (myNote.getNote_id() !=null) {
			sql += " and n1.note_id=?";
			size ++;
		}
		
		Object[] obj = new Object[size];
		size = 0;
		if (myNote.getNote_id() !=null) {
			obj[size] = myNote.getNote_id();
			size ++;
		}
		List<MyNote> list = super.queryList(sql, obj, MyNote.class);
		DBhelper.allClose(null, null, con);
		return list;
	}
	//搜素具体信息
	public List<MyNote> allMap(MyNote myNote){
		String sql = " SELECT * FROM mynote"
				+" WHERE 1=1";
		Integer index =0;
		if (myNote.getNote_title()!=null) {
			sql+=" and n1.note_title=?";
			index ++;
		}
		if (myNote.getNote_count()!=null) {
			sql +=" and n1.note_count=?";
			index ++ ;
		}
		Object[] obj =new Object[index];
		index =0;
		if (myNote.getNote_title()!=null) {
			obj[index] =myNote.getNote_title();
			index++;
		}
		if (myNote.getNote_count()!=null) {
			obj[index] = myNote.getNote_count();
			index++;
		}
		List<MyNote> list = super.queryList(sql, obj, MyNote.class);
		return list;
				}
	//添加标签
	public  int addMynote (MyNote myNote){		
		String sql = "INSERT into mynote(note_title,note_count,great_time,great_user)"
				+" VALUES(?,?,?,?)";
		Object[] obj = new Object[4];
		obj[0] = myNote.getNote_title();
		obj[1] = myNote.getNote_count();
		obj[2] = myNote.getGreat_time();
		obj[3] = myNote.getGreat_user();
		int result = super.update(sql, obj);
		DBhelper.allClose(null, null, con);
		return result;	
	}
	//删除标签
	public int removeMynote(MyNote mynote){
		String sql ="DELETE FROM  mynote WHERE mynote.note_id =?";
		Object[] obj ={mynote.getNote_id()};
		int reuslt = super.update(sql, obj);
		DBhelper.allClose(null, null, con);
		return reuslt;
	}
	//修改
	public int updateMynote(MyNote myNote){
		String sql =" UPDATE mynote SET mynote.note_title=? "
				+" ,mynote.note_count=? "
				+" ,mynote.great_time=? "
				+" ,mynote.great_user=? "
				+" WHERE mynote.note_id= ? ";
		Object[] obj ={myNote.getNote_title(),myNote.getNote_count(),myNote.getGreat_time(),myNote.getGreat_user(),myNote.getNote_id()};
		int result = super.update(sql, obj);
		DBhelper.allClose(null, null, con);
		return result;
	}
	public static void main(String[] args) {
		MynoteDao mynoteDao=new MynoteDao();
		MyNote myNote = new MyNote();
		List<MyNote> list = mynoteDao.getMynote(myNote);
		System.out.println(list);
				
	}
}
