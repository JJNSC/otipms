package com.otipms.service;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.otipms.dao.BoardDao;
import com.otipms.dao.EmployeeDao;
import com.otipms.dao.ProjectDao;
import com.otipms.dao.TeamDao;
import com.otipms.dto.Board;
import com.otipms.dto.Employee;
import com.otipms.dto.MediaFile;
import com.otipms.dto.Project;
import com.otipms.dto.ProjectTeams;
import com.otipms.dto.Team;

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
	@Autowired
	private BoardDao boardDao;

	@Transactional
	@Override
	public int addEmployee(Employee employee) {
		PasswordEncoder pwEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		employee.setEmpPw(pwEncoder.encode("0000"));
		employeeDao.insertEmployee(employee);
		//2300XX 형식으로 만들어줍니다.
		LocalDate currentDate = LocalDate.now();
        DateTimeFormatter yearFormatter = DateTimeFormatter.ofPattern("yy");
        String currentYear = currentDate.format(yearFormatter);
        //currentYear => 실질적으로 만들어진 사원번호 (yy00seq)
        currentYear = currentYear+"00"+Integer.valueOf(employee.getEmpId());
        
		employee.setEmpId(Integer.parseInt(currentYear));
		employeeDao.insertEmployeeInfo(employee);
		
		//기본 이미지 받아와서 세팅하기 
		//받아오기 
		MediaFile mediaFile = employeeDao.getDefaultProfileImg();
		//사원번호 세팅
		mediaFile.setEmpId(Integer.parseInt(currentYear));
		//db에 저장
		employeeDao.insertEmployeeDefaultProfileImg(mediaFile);
		
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
		Employee employee = employeeDao.selectByEmployeeId(empId);
		Employee empInfo = employeeDao.selectInfoByEmployeeId(empId);
		int teamNo = empInfo.getTeamNo();
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
		
		Employee empProfile = selectProfileEmp(empId);
		if(empProfile.getMediaFileData() != null) {
			String base64Img = Base64.getEncoder().encodeToString(empProfile.getMediaFileData());
			employee.setBase64Img(base64Img);
			employee.setMediaFileType(empProfile.getMediaFileType());
			employee.setMediaFileData(empProfile.getMediaFileData());
		}
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
	public List<Employee> selectNoTeamEmployeeByRole(String role) {
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

	@Override
	public void updateEmployeeInfo(Employee employee) {
		/*int projectNo = projectDao.selectProjectNoByProjectName(employee.getProjectName());
		Team t = new Team();
		t.setProjectNo(projectNo);
		t.setTeamName(employee.getTeamName());
		int teamNo = teamDao.getTeamNoByProjectNoAndTeamName(t);
		employee.setProjectNo(projectNo);
		employee.setTeamNo(teamNo);*/
		employeeDao.updateEmployee(employee);
		employeeDao.updateEmployeeInfo(employee);
		
	}

	@Override
	public void disableEmployee(int empId) {
		employeeDao.disableEmployee(empId);
		
	}

	@Override
	public List<Employee> getProjectEmployees(String projectName) {
		List<Employee> empListDB = employeeDao.getProjectEmployees(projectName);
		List<Employee> empList = new ArrayList<>();
		int projectNo= projectDao.selectProjectNoByProjectName(projectName);
		for(Employee emp : empListDB) {
			emp.setProjectName(projectName);
			emp.setProjectNo(projectNo);
			Team team = teamDao.selectTeamByEmpId(emp.getEmpId());
			emp.setTeamNo(team.getTeamNo());
			emp.setTeamName(team.getTeamName());
			empList.add(emp);
		}
		
		return empList;
	}

	@Override
	public List<Employee> getProjectTeamEmployees(String projectName, String teamName) {
		int projectNo = projectDao.selectProjectNoByProjectName(projectName);
		Team team = new Team();
		team.setProjectNo(projectNo);
		team.setTeamName(teamName);
		int teamNo = teamDao.getTeamNoByProjectNoAndTeamName(team);
		List<Employee> empListDB = employeeDao.getEmployeeByTeamNo(teamNo);
		List<Employee> empList = new ArrayList<>();
		for(Employee emp : empListDB) {
			emp.setProjectName(projectName);
			emp.setProjectNo(projectNo);
			emp.setTeamName(teamName);
			emp.setTeamNo(teamNo);
			empList.add(emp);
		}
		return empList;
	}
	
	//사원 번호로 프로필 사진 세팅하기
	@Override
	public Employee selectProfileEmp(int empId) {
		Employee employee = employeeDao.selectProfileEmpByEmpId(empId);
		if(employee == null) {
			//받아오기 
			MediaFile mediaFile = employeeDao.getDefaultProfileImg();
			//사원번호 세팅
			mediaFile.setEmpId(empId);
			//db에 저장
			employeeDao.insertEmployeeDefaultProfileImg(mediaFile);
			//한번 더 가져오기
			employee = employeeDao.selectProfileEmpByEmpId(empId);
		}
		return employee;
	}

	//비밀번호 수정
	@Override
	public void modifyPassword(Employee employee) {
		PasswordEncoder pwEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		employee.setEmpPw(pwEncoder.encode(employee.getEmpPw()));
		employeeDao.resetEmployeePassword(employee);
	}

	//프로필 사진 변경
	@Override
	public void updateProfileImg(MediaFile mediaFile) {
		int result = employeeDao.updateEmployeeProfileImg(mediaFile);
		if(result == 0) {
			employeeDao.insertEmployeeDefaultProfileImg(mediaFile);
		}
	}
	
	//사원번호로 프로필 사진 가져오기
	@Override
	public MediaFile getProfileImgByEmpId(int empId) {
		return employeeDao.selectProfileImgByEmpId(empId);
	}

	@Override
	public MediaFile getDefaultImg() {
		return employeeDao.getDefaultProfileImg();
	}

	@Override
	public int getEmployeeCount() {
		return employeeDao.getEmployeeCount();
	}
	
	//최조 관리자, 기본 프로필 사진 등록, 게시판 타입 등록
	@Override
	public void addInitialInfo(Employee employee, MultipartFile defaultProfileImage) {
		//비밀번호 암호화
		PasswordEncoder pwEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		employee.setEmpPw(pwEncoder.encode(employee.getEmpPw()));
		//관리자 회원가입
		employeeDao.insertInitialAdmin(employee);
		employeeDao.insertInitialAdminInfo(employee);
		//기본 프로필 사진 세팅
		MediaFile mediaFile = new MediaFile();
		mediaFile.setMediaFileName("defaultProfile");
		mediaFile.setMediaFileType(defaultProfileImage.getContentType());
		try {
			mediaFile.setMediaFileData(defaultProfileImage.getBytes());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		employeeDao.insertDefaultProfileImage(mediaFile);
		
		//관리자에게 방금생성한 기본 프로필 사진 적용
		//기본 이미지 받아와서 세팅하기 
		//받아오기 
		MediaFile media = employeeDao.getDefaultProfileImg();
		//사원번호 세팅
		media.setEmpId(employee.getEmpId());
		//db에 저장
		employeeDao.insertEmployeeDefaultProfileImg(media);
		
		Board initialBoard = new Board();
		initialBoard.setBoardTypeName("공지사항");
		boardDao.insertInitialBoardType(initialBoard);
		initialBoard.setBoardTypeName("질의 게시판");
		initialBoard.setInquiryBoardType("시스템 관리");
		boardDao.insertInitialBoardType(initialBoard);
		initialBoard.setInquiryBoardType("아키텍쳐");
		boardDao.insertInitialBoardType(initialBoard);
		initialBoard.setInquiryBoardType("DBA");
		boardDao.insertInitialBoardType(initialBoard);
	}

	@Override
	public Employee getClientInfoByProjectNo(int projectNo) {
		Project project = projectDao.selectProjectByProjectNo(projectNo);
		Employee client = employeeDao.selectByEmployeeId(project.getEmpId());
		Employee clientInfo = employeeDao.selectInfoByEmployeeId(project.getEmpId());
		client.setEmpEmail(clientInfo.getEmpEmail());
		client.setEmpTel(clientInfo.getEmpTel());
		client.setProjectCompanyName(project.getProjectCompanyName());
		return client;
	}

	@Override
	public void updateEmployeeStatusLogin(int empId) {
		employeeDao.updateEmployeeStatusLogin(empId);
	}

	@Override
	public void updateEmployeeStatusLogout(int empId) {
		employeeDao.updateEmployeeStatusLogout(empId);
		
	}

	@Override
	public List<Employee> findAdmin(){
		return employeeDao.findAdmin();
	}

}
