package com.otipms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.otipms.dto.Employee;

@Mapper
public interface EmployeeDao {
	public int insertEmployee(Employee employee);
	public void insertEmployeeInfo(Employee employee);
	public Employee selectByEmployeeId(int empId);
	public Employee selectInfoByEmployeeId(int empId);
	public int getTeamNoByTeamName(String teamName);
	public int checkEmployeeByTel(String empTel);
	public Employee getEmployeeByTeamNo(int teamNo);
	public List<Employee> selectAllEmployee();
	public void updateTeamNo(Employee employee);
	public List<Employee> selectEmployeeByRole(String role);
}
