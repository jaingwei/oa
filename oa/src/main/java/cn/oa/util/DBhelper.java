package cn.oa.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBhelper {
	static String diver="com.mysql.jdbc.Driver";
	static String url="jdbc:mysql://127.0.0.1:3306/oa";
	static String username="root";
	static String password="12345";

	static{
		try {
			Class.forName(diver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static Connection getcon(){
		Connection con = null;
		try {
			con = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	   
		return con;

	}

	public static void allClose( ResultSet rs, PreparedStatement pstm,Connection con){
		try {
			if (con !=null) {
				con.close();
			}
			if (pstm !=null) {
				pstm.close();
			}
			if (rs !=null) {
				rs.close();
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}


} 
