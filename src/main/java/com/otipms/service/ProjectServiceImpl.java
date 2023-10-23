package com.otipms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.otipms.dao.EmployeeDao;
import com.otipms.dao.ProjectDao;
import com.otipms.dto.Employee;
import com.otipms.dto.Project;

@Service
public class ProjectServiceImpl implements ProjectService {
	@Autowired
	private ProjectDao projectDao;
	private EmployeeDao employDao;

	@Override
	public int addProject(Project project) {
		projectDao.addProject(project);
		return project.getProjectNo();
	}

	@Override
	public List<Project> getAllProjects() {
		
		return projectDao.selectAllProject();
	}

	@Override
	public Employee getEmployeeInfoByProjectNoAndRoleNo(Employee employee) {
		return projectDao.getEmployeeInfoByProjectNoAndRoleNo(employee);
	}

	@Override
	public Project selectProjectByProjectNo(int projectNo) {
		return projectDao.selectProjectByProjectNo(projectNo);
	}

	@Override
	public Employee selectByEmployeeId(int empId) {
		return employDao.selectByEmployeeId(empId);
	}
	
	

}
