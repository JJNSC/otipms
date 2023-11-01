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
		int PMTeamNo = this.teamDao.addTeam(PMTeam);
		System.out.println("PMTeamNo : "+ PMTeamNo);
		
		if(pmId==0) {
			
		}else {
			//PM 팀 설정
			Employee PM = new Employee();
			PM.setEmpId(pmId);
			PM.setTeamNo(PMTeam.getTeamNo());
			employeeDao.updateTeamNo(PM);
			//PM팀의 팀장 등록
			PMTeam.setTeamNo(PMTeamNo);
			PMTeam.setEmpId(pmId);
			teamDao.updateTeamLeader(PMTeam);
		}
		
		//고객사 전용 팀 만들기
		Team cilentTeam = new Team();
		cilentTeam.setTeamName("고객");
		cilentTeam.setProjectNo(project.getProjectNo());
		int clientTeamNo =teamDao.addTeam(cilentTeam);
		
		if(clientId==0) {
			
		}else {
			//고객 팀 설정
			Employee client = new Employee();
			client.setEmpId(clientId);
			client.setTeamNo(cilentTeam.getTeamNo());
			employeeDao.updateTeamNo(client);
			//client팀의 팀장 등록
			cilentTeam.setTeamNo(clientTeamNo);
			cilentTeam.setEmpId(clientId);
			teamDao.updateTeamLeader(cilentTeam);
		}
		
		//미배정 팀 만들기
		Team noTeam = new Team();
		noTeam.setTeamName("미배정");
		noTeam.setProjectNo(project.getProjectNo());
		teamDao.addTeam(noTeam);

		
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
	
	//아래의 정보 수정
	//프로젝트 : 프로젝트명, 시작일,종료일 , 고객아이디(empId), 개요, 회사명
	//팀 : 해당 프로젝트의 PM팀, 고객사팀 의 empId  
	//개인 : 소속 팀 수정
	@Override
	public void modifyProject(Project project, int pmId, int clientId, int beforePmId, int beforeClientId) {
		projectDao.updateProject(project);
		//PM팀
		Team PMTeam = new Team();
		PMTeam.setProjectNo(project.getProjectNo());
		PMTeam.setTeamName("PM");
		PMTeam.setEmpId(pmId);
		teamDao.updateTeamEmpId(PMTeam);
		
		//과거 PM
		Employee oldPM = new Employee();
		oldPM.setEmpId(beforePmId);
		oldPM.setTeamNo(0);
		employeeDao.updateTeamNo(oldPM);
		//새로운 PM
		Employee newPM = new Employee();
		newPM.setEmpId(pmId);
		newPM.setTeamNo(PMTeam.getTeamNo());
		employeeDao.updateTeamNo(newPM);
		
		//Client팀
		Team clientTeam = new Team();
		clientTeam.setProjectNo(project.getProjectNo());
		clientTeam.setTeamName("고객");
		clientTeam.setEmpId(clientId);
		teamDao.updateTeamEmpId(clientTeam);
		
		//과거 PM
		Employee oldClient = new Employee();
		oldClient.setEmpId(beforeClientId);
		oldClient.setTeamNo(0);
		employeeDao.updateTeamNo(oldClient);
		//새로운 PM
		Employee newClient = new Employee();
		newClient.setEmpId(clientId);
		newClient.setTeamNo(clientTeam.getTeamNo());
		employeeDao.updateTeamNo(newClient);
		
	}

	@Override
	public void updateProjectDeletedStatus(Project project) {
		//프로젝트 비활성화
		projectDao.updateProjectDeletedStatus(project);
		//프로젝트에 속한 인원들 비활성화
		List<Team> teamList = teamDao.selectTeamListByProjectNo(project.getProjectNo());
		for(Team team : teamList) {
			List<Employee> empList = employeeDao.selectEmployeeByTeamNo(team.getTeamNo());
			for(Employee emp : empList ) {
				employeeDao.updateToDisabled(emp.getEmpId());
			}
		}
		
	}
	
	

}
