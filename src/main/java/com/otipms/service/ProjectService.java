package com.otipms.service;

import java.util.List;

import com.otipms.dto.Employee;
import com.otipms.dto.Project;

public interface ProjectService {
	public int addProject(Project project);
	public List<Project> getAllProjects();
	public Employee getEmployeeInfoByProjectNoAndRoleNo(Employee employee);
	public Project selectProjectByProjectNo(int projectNo);
	public Employee selectByEmployeeId(int empId);
}
