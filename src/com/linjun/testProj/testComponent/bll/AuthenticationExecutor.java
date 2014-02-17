package com.linjun.testProj.testComponent.bll;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.linjun.testProj.testComponent.dao.IDao;
import com.linjun.testProj.testComponent.dao.MysqlDao;
import com.linjun.testProj.testComponent.exception.BusinessException;

public class AuthenticationExecutor {
	private static IDao dao = MysqlDao.getInstance();
	
	public static boolean doAuthentication(String account, String password){
		if(dao == null){
			return false;
		}
		try {  
			ResultSet rs = dao.query("select * from user");
            while (rs.next()) {
            	//int id = rs.getInt("id");
                String nameInDb = rs.getString("name");
                String passwordInDb = rs.getString("password");
                if( nameInDb.equals(account) && passwordInDb.equals(password)){
                	return true;
                }
            }  
        } catch (SQLException e) {
			e.printStackTrace();
			return false;
		} catch (BusinessException e) {
			e.printStackTrace();
			return false;
		}
		return false;
	}
}
