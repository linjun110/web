package com.linjun.testProj.testComponent.action;

import com.opensymphony.xwork2.ActionSupport;

public class JspAction extends ActionSupport{
	private static final long serialVersionUID = 7912892052170751803L;

	public String execute() {
		System.out.println("JspAction: execute");
		return SUCCESS;
	}
	public String home() {
		return "home";
	}
	public String manageUser() {
		return "manageUser";
	}
	public String bootstrapWysiwygTryout() {
		return "bootstrapWysiwygTryout";
	}
	public String grumbleTryout() {
		return "grumbleTryout";
	}
	public String homeStyle1() {
		return "homeStyle1";
	}
}
