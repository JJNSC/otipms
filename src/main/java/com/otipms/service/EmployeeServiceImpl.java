package com.otipms.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.otipms.dao.EmployeeDao;
import com.otipms.dao.ProjectDao;
import com.otipms.dao.TeamDao;
import com.otipms.dto.Employee;
import com.otipms.dto.Project;
import com.otipms.dto.ProjectTeams;
import com.otipms.dto.Team;

import jdk.internal.org.jline.utils.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private EmployeeDao employeeDao;
	@Autowired
	private TeamDao teamDao;
	@Autowired
	private ProjectDao projectDao;

	@Transactional
	@Override
	public int addEmployee(Employee employee) {
		PasswordEncoder pwEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		employee.setEmpPw(pwEncoder.encode("0000"));
		employeeDao.insertEmployee(employee);
		System.out.println("employeeId : "+employee.getEmpId());
		//2300XX 형식으로 만들어줍니다.
		LocalDate currentDate = LocalDate.now();
        DateTimeFormatter yearFormatter = DateTimeFormatter.ofPattern("yy");
        String currentYear = currentDate.format(yearFormatter);
        currentYear = currentYear+"00"+Integer.valueOf(employee.getEmpId());
        
		employee.setEmpId(Integer.parseInt(currentYear));
		employeeDao.insertEmployeeInfo(employee);
		
		return employee.getEmpId();
	}

	@Override
	public LoginResult login(Employee employee) {
		Employee dbEmployee = employeeDao.selectByEmployeeId(employee.getEmpId());
		if(dbEmployee == null) {
			return LoginResult.FAIL_ID_WRONG;
		}
		PasswordEncoder pwEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		if(pwEncoder.matches(employee.getEmpPw(), dbEmployee.getEmpPw())) {
			return LoginResult.SUCCESS;
		}else {
			return LoginResult.FAIL_PASSWORD_WRONG;
		}
	}

	//emp table 정보만 가져오기
	@Override
	public Employee getEmployeeInfo(int empId) {
		return employeeDao.selectByEmployeeId(empId);
	}
	
	//emp, empInfo table 정보 둘다 가져오기
	@Override
	public Employee getEmployeeAllInfo(int empId) {
		if(empId ==0) {
			Employee employee = null;
			return employee;
		}
		System.out.println("empId : "+ empId);
		Employee employee = employeeDao.selectByEmployeeId(empId);
		Employee empInfo = employeeDao.selectInfoByEmployeeId(empId);
		System.out.println("employee : "+ employee);
		System.out.println("empInfo : "+ empInfo);
		int teamNo = empInfo.getTeamNo();
		log.info("팀번호는? : "+ teamNo);
		String teamName = teamDao.getTeamNameByTeamNo(teamNo);
		employee.setTeamNo(teamNo);
		employee.setTeamName(teamName);
		employee.setEmpTel(empInfo.getEmpTel());
		employee.setEmpEmail(empInfo.getEmpEmail());
		employee.setEmpLoginDate(empInfo.getEmpLoginDate());
		employee.setEmpEnabled(empInfo.getEmpEnabled());
		Project project = projectDao.selectProjectByProjectNo(teamDao.selectTeamByTeamNo(teamNo).getProjectNo());
		employee.setProjectNo(project.getProjectNo());
		employee.setProjectName(project.getProjectName());
		employee.setProjectCompanyName(project.getProjectCompanyName());
		return employee;
	}

	@Override
	public int getTeamNo(String projectName ,String teamName) {
		Team team = new Team();
		team.setProjectNo(projectDao.selectProjectNoByProjectName(projectName));
		team.setTeamName(teamName);
		return teamDao.getTeamNoByProjectNoAndTeamName(team);
	}

	@Override
	public int checkEmployeeByTel(String empTel) {
		return employeeDao.checkEmployeeByTel(empTel);
	}
	
	//인력 찾기(전체 인원 찾기)
	@Override
	public List<Employee> getAllEmployee() {
		return employeeDao.selectAllEmployee();
	}
	
	//인력찾기(권한 명으로)
	@Override
	public List<Employee> selectEmployeeByRole(String role) {
		return  employeeDao.selectEmployeeByRole(role);
	}

	//팀번호로 팀원들 검색(이름, 직급(rank,position) 필수
	@Override
	public List<Employee> selectEmployeeByTeamNo(int teamNo) {
		return employeeDao.selectEmployeeByTeamNo(teamNo);
	}

	@Override
	public List<Employee> selectEmployeeByTeamNoAndRole(int teamNo, String role) {
		Employee emp = new Employee();
		emp.setTeamNo(teamNo);
		emp.setRole(role);
		return employeeDao.selectEmployeeByTeamNoAndRole(emp);
	}

	//일괄 등록 
	//프로젝트 명과 팀명을 통해 해당 팀에 배정해야한다.
	//팀명 을 통해서 추가적으로 등록해야한다. PM : 해당프로젝트의 PM팀의 팀장, 고객 : 해당 프로젝트의 고객팀의 팀장
	//팀명이 고객인 사람은 추가적으로 project에 empId(고객 아이디), projectCompanyName(회사명)을 등록해야한다.
	@Override
	public void addMultiEmployee(Employee employee) {
		//사원 등록
		//팀 번호 세팅
		employee.setTeamNo(getTeamNo(employee.getProjectName(),employee.getTeamName()));
		int empId = addEmployee(employee);
		
		//팀명을 통해서 추가적으로 팀장 등록 
		Team team = new Team();
		if(employee.getTeamName().equals("PM")||employee.getTeamName().equals("고객")) {
			team.setEmpId(employee.getEmpId());
			team.setProjectNo(projectDao.selectProjectNoByProjectName(employee.getProjectName()));
			team.setTeamName(employee.getTeamName());
			teamDao.updateTeamEmpId(team);
		}
		//고객일 경우  project에  empId(고객 아이디), projectCompanyName(회사명)을 등록
		if(employee.getTeamName().equals("고객")) {
			Project project = projectDao.selectProjectByProjectNo(projectDao.selectProjectNoByProjectName(employee.getProjectName()));
			project.setEmpId(empId);
			project.setProjectCompanyName(employee.getProjectCompanyName());
			log.info(" 들어가는 프로젝트 내용 : "+ project);
			projectDao.updateProject(project);
		}
	}

	@Override
	public List<ProjectTeams> getTeamsPerProjects() {
		List<ProjectTeams> projectTeams = new ArrayList<ProjectTeams>();
		
		List<Project> projects = projectDao.selectAllProject();
		for(Project project : projects) {
			ProjectTeams oneProjectTeams =new ProjectTeams();
			oneProjectTeams.setProject(project);
			List<Team> teams = teamDao.selectTeamListByProjectNo(project.getProjectNo());
			oneProjectTeams.setTeamList(teams);
			projectTeams.add(oneProjectTeams);
		}
		return projectTeams;
	}

	@Override
	public void resetEmployeePassword(int empId) {
		Employee employee = new Employee();
		employee.setEmpId(empId);
		PasswordEncoder pwEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		employee.setEmpPw(pwEncoder.encode("0000"));
		employeeDao.resetEmployeePassword(employee);
		
	}

	

}
