package com.linjun.testProj.testComponent.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateDao {
	private static final HibernateDao _singleton = new HibernateDao();
	
	private Configuration cfg;
	private SessionFactory factory;
	
	private HibernateDao() {
		cfg = new Configuration().configure();  
		if (cfg == null){
			return;
		}
        factory = cfg.buildSessionFactory();
	}	

	public static HibernateDao getInstance() {
		return _singleton;
	}
	
	public <T> void save(T o) {  
        if(factory == null){
        	//TODO: or throw exception
        	return;
        }
        Session session = null;
        try {  
        	session = factory.openSession();
            session.beginTransaction();
            
            session.save(o);  
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
	
	public <T> List<T> getByHql(String hql) {  
        Session session = null;  
        List<T> list = null;
        
        if(factory == null){
        	//TODO: or throw exception
        	return null;
        }
        try {  
        	session = factory.openSession();
        	if(session == null){
        		return null;
        	}
            session.beginTransaction();
            Query query = session.createQuery(hql);

            list = query.list();
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
		return list;  
    } 
}
