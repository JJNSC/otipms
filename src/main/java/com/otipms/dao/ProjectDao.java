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
}
