package com.linjun.testProj.testComponent.dao;


/*sql*/
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.sql.Statement;  
/*end of sql*/

import com.linjun.testProj.testComponent.exception.BusinessException;


public class MysqlDao implements IDao{
	private static Connection con = null;
	private static final MysqlDao _singleton = new MysqlDao();
	
	private MysqlDao() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("Load mysql jdbc failed ...");
			e.printStackTrace();
			return;
		}
		
		try {
			System.out.println("Connecting to db ...");
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/myProject", "root", "root");
			System.out.println("connected to db ...");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Failed to connect to db ...");
			e.printStackTrace();
			return;
		}
	}	

	public static MysqlDao getInstance() {
		return _singleton;
	}
	
	public ResultSet query(String sql) throws BusinessException {
        Statement st;
        if(con == null){
        	throw new BusinessException(null, "MYSQL", 1, "disconnect to mysql server");
		}
		try {
			st = (Statement) con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new BusinessException(e, "MYSQL", 1, e.getMessage());
		}
	}
	public void execute(String sql) throws BusinessException {
		if(con == null){
			throw new BusinessException(null, "MYSQL", 1, "disconnect to mysql server");
		}
        Statement st;
		try {
			st = (Statement) con.createStatement();
			st.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new BusinessException(e, "MYSQL", 1, e.getMessage());
		}
	}
}
