package com.linjun.testStruts2.testComponent.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class ServiceAction extends ActionSupport{
	public String execute() {
		return SUCCESS;
	}
}
