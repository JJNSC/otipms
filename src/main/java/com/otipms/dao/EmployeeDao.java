package com.otipms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.otipms.dto.Employee;
import com.otipms.dto.Team;

@Mapper
public interface EmployeeDao {
	public int insertEmployee(Employee employee);
	public void insertEmployeeInfo(Employee employee);
	public Employee selectByEmployeeId(int empId);
	public Employee selectInfoByEmployeeId(int empId);
	public int checkEmployeeByTel(String empTel);
	public List<Employee> getEmployeeByTeamNo(int teamNo);
	public List<Employee> selectAllEmployee();
	public void updateTeamNo(Employee employee);
	public List<Employee> selectEmployeeByRole(String role);
	public List<Employee> selectEmployeeByTeamNo(int teamNo);
	public List<Employee> selectEmployeeByTeamNoAndRole(Employee employee);
	public void updateToNoTeam(Team team);
	public void updateToDisabled(int empId);
	public void resetEmployeePassword(Employee employee);
	public void updateEmployee(Employee employee);
	public void updateEmployeeInfo(Employee employee);
	public void disableEmployee(int empId);
	public Employee getEmployeeInfoByProjectNoAndTeamName(Employee employee);
	public List<Employee> getProjectEmployees(String projectName);
	public Employee selectProfileEmpByEmpId(int empId);
}
