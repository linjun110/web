package com.linjun.testProj.testComponent.bll;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.linjun.testProj.testComponent.dao.MysqlDao;
import com.linjun.testProj.testComponent.exception.BusinessException;

public class AuthenticationExecutor {
	private static MysqlDao dao = MysqlDao.getInstance();
	private static Logger logger = LogManager.getLogger(AuthenticationExecutor.class);
	
	public static boolean doAuthentication(String account, String password){
		logger.debug("enter doAuthentication");
		if(dao == null){
			logger.debug("dao is null, return false.");
			return false;
		}
		try {  
			ResultSet rs = dao.query("select * from user");
            while (rs.next()) {
            	//int id = rs.getInt("id");
                String nameInDb = rs.getString("name");
                String passwordInDb = rs.getString("password");
                if( nameInDb.equals(account) && passwordInDb.equals(password)){
                	logger.debug("find account:"+nameInDb+", return true.");
                	return true;
                }
            }  
        } catch (SQLException e) {
			e.printStackTrace();
		} catch (BusinessException e) {
			e.printStackTrace();
		}
		logger.debug("return false.");
		return false;
	}
}
