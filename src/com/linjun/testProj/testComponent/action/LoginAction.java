package com.linjun.testProj.testComponent.action;

import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.linjun.testProj.testComponent.bll.AuthenticationExecutor;

import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport{
	private static final long serialVersionUID = 7912892052170751803L;

	private String account;

	private String password;

	public String execute() {
		System.out.println("LoginAction: execute");
		return SUCCESS;
	}
	
	public String login() {
		if( !AuthenticationExecutor.doAuthentication(account, password) ){
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
	
	public static void main(String[] args){
		if(AuthenticationExecutor.doAuthentication("testname", "testpassword")){
			System.out.println("pass");
		}else{
			System.out.println("failed");
		}
	}
}
