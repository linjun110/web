package com.linjun.testProj.testComponent.bll;

import java.util.List;

import com.linjun.testProj.testComponent.bo.User;
import com.linjun.testProj.testComponent.dao.HibernateDao;

public class AuthenticationExecutor2 {
	private static HibernateDao dao = HibernateDao.getInstance();
	
	public static boolean doAuthentication(String account, String password){
		if(dao == null){
			return false;
		}
		List<User> list = dao.getByHql("from User");
		for(int i=0; i<list.size(); i++){   
			User r = (User)list.get(i);   
			if( r.getName().equals(account) && r.getPassword().equals(password)){
				return true;
			}
		}
		return false;
	}
}
