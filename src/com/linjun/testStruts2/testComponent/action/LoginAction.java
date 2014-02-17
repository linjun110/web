package com.linjun.testStruts2.testComponent.action;

import java.io.File;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.linjun.testProj.testComponent.dao.IDao;
import com.linjun.testProj.testComponent.dao.MysqlDao;
import com.linjun.testProj.testComponent.exception.BusinessException;

import java.sql.ResultSet; 

import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport{
	private static final long serialVersionUID = 7912892052170751803L;

	private IDao dao = MysqlDao.getInstance();;
	
	private String account;

	private String password;

	public String execute() {
		System.out.println("LoginAction: execute");
		return SUCCESS;
	}
	
	public String login() {
		System.out.println("LoginAction: login");
		if(dao == null){
			return LOGIN;
		}
		Boolean is_found = false;
		try {  
			ResultSet rs = dao.query("select * from user");
            while (rs.next()) {
            	
            	int id = rs.getInt("id");
                String nameInDb = rs.getString("name");
                String passwordInDb = rs.getString("password");
                if( nameInDb.equals(account) && passwordInDb.equals(password)){
                	is_found = true;
                	break;
                }
            }  
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return LOGIN;
		} catch (BusinessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return LOGIN;
		}
		
		if(!is_found){
			return LOGIN;
		}
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();

		HttpSession session = request.getSession(true);
		session.setAttribute("account", account);
		session.setAttribute("loginTime", new Date());

		ServletContext context = ServletActionContext.getServletContext();
		//File uploadFile = new File(context.getRealPath("upload"));

		return SUCCESS;
	}

	public String logout() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();

		HttpSession session = request.getSession(true);
		session.removeAttribute("account");
		
		return "logout";
	}
	
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
