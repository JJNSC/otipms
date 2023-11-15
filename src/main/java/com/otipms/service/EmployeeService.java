package com.otipms.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.otipms.dto.Employee;
import com.otipms.dto.MediaFile;
import com.otipms.dto.ProjectTeams;

public interface EmployeeService {
	public enum LoginResult{
		SUCCESS,
		FAIL_ID_WRONG,
		FAIL_PASSWORD_WRONG
	}
	public int addEmployee(Employee employee);
	public LoginResult login(Employee employee);
	public Employee getEmployeeInfo(int empId);
	public Employee getEmployeeAllInfo(int empId);
	public int getTeamNo(String projectName, String teamName);
	public int checkEmployeeByTel(String empTel);
	public List<Employee> getAllEmployee();
	//project 등록 시 
	public List<Employee> selectNoTeamEmployeeByRole(String role);
	public List<Employee> selectEmployeeByTeamNo(int teamNo);
	public List<Employee> selectEmployeeByTeamNoAndRole(int teamNo,String role);
	public void addMultiEmployee(Employee employee);
	public List<ProjectTeams> getTeamsPerProjects();
	public void resetEmployeePassword(int empId);
	public void updateEmployeeInfo(Employee employee);
	public void disableEmployee(int empId);
	public List<Employee> getProjectEmployees(String projectName);
	public List<Employee> getProjectTeamEmployees(String projectName,String teamName);
	public Employee selectProfileEmp(int empId);
	public MediaFile getProfileImgByEmpId(int empId);
	public MediaFile getDefaultImg();
	//총 사원수 가져오기
	public int getEmployeeCount();
	//최초 관리자, 기본 프로필 사진 등록
	public void addInitialInfo(Employee employee, MultipartFile defaultProfileImage);
	/**
	 * 비밀번호 수정
	 * @param employee
	 * @author 이은지
	 */
	public void modifyPassword(Employee employee);
	/**
	 * 프로필 사진 수정
	 * @param mediaFile
	 * @author 이은지
	 */
	public void updateProfileImg(MediaFile mediaFile);
	//프로젝트 번호로 고객 정보 가져오기 
	public Employee getClientInfoByProjectNo(int projectNo);
	//
	public void updateEmployeeStatusLogin(int empId);
	public void updateEmployeeStatusLogout(int empId);
	
	
	//관리자만 찾아오기
	public List<Employee> findAdmin();
}
