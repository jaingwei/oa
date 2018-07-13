package cn.oa.dao;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.oa.entity.Roleinfo;
import cn.oa.entity.UserInfo;
import cn.oa.util.DBhelper;

/**
 * ͨ��baseDAO������,���,��ɾ�ģ�
 * 
 * @author Administrator
 *
 * @param <T>
 */
public class BaseDAO<T> {
	public Connection con;
	public ResultSet rs;
	public PreparedStatement pstm;
	
	/**
	 *单表查询
	 * @param sql
	 * @param objs
	 * @param clazz
	 * @return
	 */
	public List<T> queryList(String sql,Object[] objs,Class<T> clazz){
		if(con==null){
			con = DBhelper.getcon();
		}
		List<T> list = new ArrayList<T>();
		try {
			pstm = con.prepareStatement(sql);
			//设置参数，下标从1开始
			for (int i = 0; i < objs.length; i++) {
				pstm.setObject(i+1, objs[i]);
			}
			rs = pstm.executeQuery();
			ResultSetMetaData metaData = rs.getMetaData();
			//获取列数
			int columns = metaData.getColumnCount();
			while (rs.next()) {
				//利用列名获得类对象属性名
				//new对象
				Object obj = clazz.newInstance();
				for (int i = 1; i <= columns; i++) {
					//获取列名，从第一个列名开始
					String columnName = metaData.getColumnName(i);
					//根据列名获取对象属性名
					Field field = clazz.getDeclaredField(columnName);
					//设置需要调用的方法和参数
					Method method = clazz.getDeclaredMethod("set"+columnName.substring(0,1).toUpperCase()+columnName.substring(1),field.getType());
					//方法调用
					method.invoke(obj, rs.getObject(i));
				}
				list.add((T)obj);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBhelper.allClose(rs, pstm, con);
		}
		return list;
	}
	
	/**
	 * ͨ增删改
	 * @param sql
	 * @param obj
	 * @return
	 */
	public int update(String sql,Object[] obj){
		if(con==null){
			con=DBhelper.getcon();
		}
		int result = 0;
		try {
			pstm = con.prepareStatement(sql);
			//设置参数，下标从1开始
			for (int i = 0; i < obj.length; i++) {
				pstm.setObject(i+1, obj[i]);
			}
			result = pstm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBhelper.allClose(rs, pstm, null);
		}
		return result;
	}
	
	/**
	 * 多表查询
	 * @param sql
	 * @param objs
	 * @return
	 */
	public List<Map<String, Object>> queryListMap(String sql,Object[] objs){
		if(con==null){
			con = DBhelper.getcon();
		}
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		try {
			pstm = con.prepareStatement(sql);
			//设置参数，下标从1开始
			for (int i = 0; i < objs.length; i++) {
				pstm.setObject(i+1, objs[i]);
			}
			rs = pstm.executeQuery();
			//获取列信息
			ResultSetMetaData metaData = rs.getMetaData();
			//获取列数
			int colmns = metaData.getColumnCount();
			while (rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				for (int i = 1; i <= colmns; i++) {
					//获取列名
					String columnName = metaData.getColumnName(i);
					map.put(columnName, rs.getObject(columnName));
				}
				list.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBhelper.allClose(rs, pstm, null);
		}
		return list;
		
	}

	
	
	
	
	
	
	
}
