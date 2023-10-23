package com.otipms.dao;

import org.apache.ibatis.annotations.Mapper;

import com.otipms.dto.Employee;

@Mapper
public interface EmployeeDao {
	public int insertEmployee(Employee employee);
	public void insertEmployeeInfo(Employee employee);
	public Employee selectByEmployeeId(int empId);
	public int getTeamNoByTeamName(String teamName);
	public int checkEmployeeByTel(String empTel);
}
