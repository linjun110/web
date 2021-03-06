package com.linjun.testHibernate;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class Test {
	public static void main(String[] args) {  
		
		/*
		 TestBo user = new TestBo();  
		 user.setId(5); 
         user.setName("tn");  
         user.setPassword("tp45");  
		save(user);
		 TestCo user2 = new TestCo();  
		 user2.setId(2); 
		 user2.setCn(10);  
		 user2.setCp(14);  
		save(user2);
		
		List<TestBo> list = get("from TestBo");
		for(int i=0; i<list.size(); i++){   
			TestBo r = (TestBo)list.get(i);   
			System.out.println(r.getId()+"_"+r.getName()+"_"+r.getPassword());
		}
		*/
    } 
	
	public static <T> void save(T user) {  
        Configuration cfg = new Configuration().configure();  
        SessionFactory factory = cfg.buildSessionFactory();  
        Session session = null;  
        try {  
        	session = factory.openSession();
            session.beginTransaction();
            
            session.save(user);  
            //session.delete(user);
              
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
        factory.close();
    } 
	public static <T> List<T> get(String hql) {  
        Configuration cfg = new Configuration().configure();  
        SessionFactory factory = cfg.buildSessionFactory();  
        Session session = null;  
        List<T> allList = null;
        try {  
        	session = factory.openSession();
            session.beginTransaction();
        	
            Query query = session.createQuery(hql);
            allList = query.list();
              
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
        factory.close();
		return allList;  
    } 
}
