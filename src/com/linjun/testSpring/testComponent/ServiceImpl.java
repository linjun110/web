package com.linjun.testSpring.testComponent;

public class ServiceImpl implements IService{
	private String msg;

	@Override
	public void execute() {
		// TODO Auto-generated method stub
		System.out.println("ServiceImpl execute");
	}

	public void setMsg(String msg) {
        this.msg = msg;
    }
	public String getMsg() {
        return msg;
    }
}
