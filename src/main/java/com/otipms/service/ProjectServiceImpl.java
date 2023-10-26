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

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
public class ProjectServiceImpl implements ProjectService {
	@Autowired
	private ProjectDao projectDao;
	@Autowired
	private EmployeeDao employeeDao;
	@Autowired
	private TeamDao teamDao;

	//프로젝트 생성하기 
	//PM, 고객사 팀 동시 생성 하기 
	//동시에 PM의 팀을 PM으로 자동설정, 고객의 팀을 고객으로 자동 설정하기
	@Transactional
	@Override
	public int addProject(Project project, int pmId, int clientId) {  
		//프로젝트 생성
		projectDao.addProject(project);
		//PM 전용 팀 만들기
		Team PMTeam = new Team();
		PMTeam.setTeamName("PM");
		log.info(" 프로젝트 번호 : "+project.getProjectNo());
		PMTeam.setProjectNo(project.getProjectNo());
		log.info(" 프로젝트  : "+PMTeam);
		int teamNo = this.teamDao.addTeam(PMTeam);
		System.out.println("teamNo : "+ teamNo);
		//PM 팀 설정
		Employee PM = new Employee();
		PM.setEmpId(pmId);
		PM.setTeamNo(PMTeam.getTeamNo());
		employeeDao.updateTeamNo(PM);
		
		//고객사 전용 팀 만들기
		Team cilentTeam = new Team();
		cilentTeam.setTeamName("고객");
		cilentTeam.setProjectNo(project.getProjectNo());
		teamDao.addTeam(cilentTeam);
		//고객 팀 설정
		Employee client = new Employee();
		client.setEmpId(clientId);
		client.setTeamNo(cilentTeam.getTeamNo());
		employeeDao.updateTeamNo(client);

		
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
		return employeeDao.selectByEmployeeId(empId);
	}
	
	

}
