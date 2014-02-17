package com.linjun.testHibernate;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.linjun.testProj.testComponent.bo.User;

public class Test {
	public static void main(String[] args) {  
        
        Configuration cfg = new Configuration().configure();  

        SessionFactory factory = cfg.buildSessionFactory();  
          
        Session session = null;  
        try {  

            session.beginTransaction();  
            User user = new User();  
            user.setName("tn");  
            user.setPassword("tp");  

            session.save(user);  
              
            session.getTransaction().commit();  
        }catch(Exception e) {  
            e.printStackTrace();  
            session.getTransaction().rollback();  
        }finally {  
            if (session != null) {  
                if (session.isOpen()) {  
                    session.close();  
                }  
            }  
        }  
    } 
}
