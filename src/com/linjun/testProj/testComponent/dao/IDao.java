package com.linjun.testProj.testComponent.dao;

import java.sql.ResultSet;

import com.linjun.testProj.testComponent.exception.BusinessException;

public interface IDao {
	public ResultSet query(String sql) throws BusinessException;
	public void execute(String sql) throws BusinessException;
}
