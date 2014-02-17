package com.linjun.testSpring.testComponent;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class SpringMain {
	 public static void main(String[] args) {
	        //ApplicationContext ac = new FileSystemXmlApplicationContext("C:\\Users\\junlin\\workspace\\j2ee\\WebContent\\WEB-INF\\spring-config.xml");
		 ApplicationContext ac = new ClassPathXmlApplicationContext("spring-config.xml");
	        IService service = (IService) ac.getBean("Service");
	        service.execute();
	 }
	 public void doit() {
	        //ApplicationContext ac = new FileSystemXmlApplicationContext("C:\\Users\\junlin\\workspace\\j2ee\\WebContent\\WEB-INF\\spring-config.xml");
		 ApplicationContext ac = new ClassPathXmlApplicationContext("spring-config.xml");
	        IService service = (IService) ac.getBean("Service");
	        service.execute();
	 }
}
