package com.otipms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.otipms.dto.Employee;
import com.otipms.dto.MediaFile;
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
	//기본 프로필 이미지 가져오기(mediaFileNo 를통해)
	public MediaFile getDefaultProfileImg();
	//회원가입 시 기본 프로필 이미지 부여하기 
	public void insertEmployeeDefaultProfileImg(MediaFile mediaFile);
	//사원번호로 프로필 사진 가져오기
	public MediaFile selectProfileImgByEmpId(int empId);
	//총 사원수 가져오기
	public int getEmployeeCount();
	//최초 관리자 등록
	public void insertInitialAdmin(Employee employee);
	public void insertInitialAdminInfo(Employee employee);
	//기본 프로필 사진 등록 
	public void insertDefaultProfileImage(MediaFile mediaFile);
	/**
	 * 프로필 사진 수정
	 * @param mediaFile
	 * @return
	 * @author 이은지
	 */
	public int updateEmployeeProfileImg(MediaFile mediaFile);
}
