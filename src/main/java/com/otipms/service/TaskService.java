package com.otipms.service;

import java.util.List;
import java.util.Map;

import com.otipms.dto.Project;
import com.otipms.dto.Task;
import com.otipms.dto.TaskEmployee;
import com.otipms.dto.Team;

/**
 * 
 * @author 이은지
 *
 */
public interface TaskService {

	/**
	 * 프로젝트 리스트 조회
	 * @return
	 */
	public List<Project> getProjectList();
	
	/**
	 * 팀 리스트 조회
	 * @param projectNo
	 * @return
	 */
	public List<Team> getTeamList(String projectNo);

	/**
	 * 태스크 사람 조회
	 * @param map
	 * @return
	 */
	public List<TaskEmployee> getTaskEmployeeList(Map<String, Object> map);

	/**
	 * 태스크 추가
	 * @param task
	 * @return
	 */
	public List<Task> addTask(Task task);

}
