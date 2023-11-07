package com.otipms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.otipms.dto.Employee;
import com.otipms.dto.Project;

@Mapper
public interface ProjectDao {
	public int addProject(Project project);
	public List<Project> selectAllProject();
	public Project selectProjectByProjectNo(int projectNo);
	public void updateProject(Project project);
	public void updateProjectDeletedStatus(Project project);
	public int selectProjectNoByProjectName(String projectName);
	
	/**
	 * 프로젝트 번호로 프로젝트 관련 정보 조회
	 * @param projectNo
	 * @return
	 * @author 이은지
	 */
	public Project selectProjectDetail(int projectNo);
}
