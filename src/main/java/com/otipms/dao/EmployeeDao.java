package com.otipms.dao;

import org.apache.ibatis.annotations.Mapper;

import com.otipms.dto.Employee;

@Mapper
public interface EmployeeDao {
	public void insertEmployee(Employee employee);
	public void insertEmployeeInfo(Employee employee);
	public Employee selectByEmployeeId(int empId);
}
