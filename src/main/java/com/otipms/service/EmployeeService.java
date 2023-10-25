package com.otipms.service;

import java.util.List;

import com.otipms.dto.Employee;

public interface EmployeeService {
	public enum LoginResult{
		SUCCESS,
		FAIL_ID_WRONG,
		FAIL_PASSWORD_WRONG
	}
	public void AddEmploy(Employee employee);
	public LoginResult login(Employee employee);
	public Employee getEmployeeInfo(int empId);
	public int getTeamNo(String teamName);
	public int checkEmployeeByTel(String empTel);
	public List<Employee> getAllEmployee();
}
