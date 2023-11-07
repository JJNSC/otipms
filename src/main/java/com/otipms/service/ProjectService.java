package com.otipms.service;

import java.util.List;
import java.util.Map;

import com.otipms.dto.Employee;
import com.otipms.dto.Project;

public interface ProjectService {
	public int addProject(Project project, int pmId, int clientId);
	public List<Project> getAllProjects();
	public Employee getEmployeeInfoByProjectNoAndTeamName(Employee employee);
	public Project selectProjectByProjectNo(int projectNo);
	public Employee selectByEmployeeId(int empId);
	public void modifyProject(Project project, int pmId, int clientId, int beforePmId, int beforeClientId);
	public void updateProjectDeletedStatus(Project project);
	public double getProjectProgressRate(Map<String, Object> map);
	
	/**
	 * 프로젝트 번호로 프로젝트 관련 정보 조회
	 * @param projectNo
	 * @return
	 */
	public Project getProjectDetail(int projectNo);
}
