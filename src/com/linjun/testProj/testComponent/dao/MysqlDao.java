package com.linjun.testProj.testComponent.dao;


/*sql*/
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.sql.Statement;  
/*end of sql*/





import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.linjun.testProj.testComponent.exception.BusinessException;


public class MysqlDao implements IDao{
	private static Connection con = null;
	private static Statement st = null;
	private static final MysqlDao _singleton = new MysqlDao();
	
	private static Logger logger;
	
	private MysqlDao() {
		logger = LogManager.getLogger(MysqlDao.class);
		connect2Db();
	}	
	private void connect2Db() {
		if( st != null){
			try {
				logger.debug("st is not null, closing");
				st.close();
			} catch (SQLException e) {
				logger.warn("st closing exception.");
			}
		}
		if( con != null){
			try {
				logger.debug("con is not null, closing");
				con.close();
			} catch (SQLException e) {
				logger.warn("con closing exception.");
			}
		}
		try {
			logger.debug("Loading mysql jdbc");
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			logger.warn("Load mysql jdbc exception ...");
			//e.printStackTrace();
			return;
		}
		
		try {
			logger.info("Connecting to db ...");
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/myProject", "root", "root");
			st = (Statement) con.createStatement();
			logger.info("Connected to db ...");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			logger.warn("Failed to connect to db ...");
			//e.printStackTrace();
			return;
		}
	}	
	public static MysqlDao getInstance() {
		return _singleton;
	}
	
	public ResultSet query(String sql) throws BusinessException {
		logger.debug("sql: "+sql);
        if(con == null || st == null){
        	logger.debug("con or st is null");
        	if(con == null){
        		logger.debug("con is null");
        	}
        	if(st == null){
        		logger.debug("st is null");
        	}
        	connect2Db();
        	throw new BusinessException(null, "MYSQL", 1, "disconnect to mysql server");
		}
		try {
			ResultSet rs = st.executeQuery(sql);
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			logger.warn("Failed to query to db, got exception.");
			//e.printStackTrace();
			connect2Db();
			throw new BusinessException(e, "MYSQL", 1, e.getMessage());
		}
	}
	public void execute(String sql) throws BusinessException {
		logger.debug("sql: "+sql);
		if(con == null || st == null){
			if(con == null){
        		logger.debug("con is null");
        	}
        	if(st == null){
        		logger.debug("st is null");
        	}
        	connect2Db();
        	throw new BusinessException(null, "MYSQL", 1, "disconnect to mysql server");
		}
		try {
			st.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			logger.warn("Failed to execute to db, got exception.");
			connect2Db();
			throw new BusinessException(e, "MYSQL", 1, e.getMessage());
		}
	}
	
	public static void main(String args[]) throws ClassNotFoundException, SQLException{

		Class.forName("com.mysql.jdbc.Driver");
		Connection con2 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/myProject", "root", "root");
		Statement st2 = (Statement) con2.createStatement();
		ResultSet rs2 = st2.executeQuery("select * from user");
		while (rs2.next()) {
			logger.debug("first:"+rs2.getString("name")+"_"+rs2.getString("password"));
        }  
		ResultSet rs3 = st2.executeQuery("select * from testbo");
		while (rs3.next()) {
			logger.debug("second:"+rs3.getString("name")+"_"+rs3.getString("password"));
        } 
		st2.executeUpdate("insert into testbo (name,password) values('test','test')");
		st2.close();
		con2.close();
	}
}
