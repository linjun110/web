package com.linjun.testProj.testComponent.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.linjun.testProj.testComponent.bo.User;
import com.opensymphony.xwork2.ActionSupport;

public class ServiceAction extends ActionSupport{
	private String username;  
    private String password;  
    private User user;
    private List<User> users;
    
	public String execute() {
		// serialize primary
		this.setUsername("linjun");
		this.setPassword("lljj");
		
		// serialize object
		User u = new User();
		u.setName("un");
		u.setPassword("up");
		this.setUser(u);
		
		// serialize object array
		User u2 = new User();
		u2.setName("un2");
		u2.setPassword("up2");
		User u3 = new User();
		u3.setName("un3");
		u3.setPassword("up3");
		List ul = new ArrayList(); 
		ul.add(u2);
		ul.add(u3);
		this.setUsers(ul);
		
		return SUCCESS;
	}
	
	@JSON(serialize = true) 
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@JSON(serialize = true) 
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@JSON(serialize = true) 
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@JSON(serialize = true) 
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
}
