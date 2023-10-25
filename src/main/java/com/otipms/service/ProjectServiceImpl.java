package com.otipms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.otipms.dao.EmployeeDao;
import com.otipms.dao.ProjectDao;
import com.otipms.dao.TeamDao;
import com.otipms.dto.Employee;
import com.otipms.dto.Project;
import com.otipms.dto.Team;

@Service
public class ProjectServiceImpl implements ProjectService {
	@Autowired
	private ProjectDao projectDao;
	private EmployeeDao employDao;
	private TeamDao teamDao;

	@Transactional
	@Override
	public int addProject(Project project) {  //PM, 고객사 팀 동시 생성 하기
		//프로젝트 생성
		projectDao.addProject(project);
		//PM 전용 팀 만들기
		Team PMTeam = new Team();
		PMTeam.setTeamName("PM");
		PMTeam.setProjectNo(project.getProjectNo());
		teamDao.addTeam(PMTeam);
		//고객사 전용 팀 만들기
		Team cilentTeam = new Team();
		cilentTeam.setTeamName("고객");
		cilentTeam.setProjectNo(project.getProjectNo());
		teamDao.addTeam(cilentTeam);

		
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
