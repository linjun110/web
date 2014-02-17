package com.linjun.testHibernate;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.linjun.testProj.testComponent.bo.TestBo;

public class Test {
	public static void main(String[] args) {  
		 TestBo user = new TestBo();  
         user.setName("tn");  
         user.setPassword("tp3");  
		insert(user);
    } 
	public static void insert(TestBo user) {  
        Configuration cfg = new Configuration().configure();  
        SessionFactory factory = cfg.buildSessionFactory();  
        Session session = null;  
        try {  
        	session = factory.openSession();
            session.beginTransaction();
            
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
