package com.otipms.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.otipms.dto.Project;
import com.otipms.dto.Task;
import com.otipms.dto.TaskEmployee;
import com.otipms.dto.Team;

@Mapper
public interface TaskDao {

	/**
	 * 프로젝트 리스트 조회
	 * @return
	 */
	public List<Project> selectProjectList();

	/**
	 * 팀 리스트 조회
	 * @param projectNo
	 * @return
	 */
	public List<Team> selectTeamList(int projectNo);

	/**
	 * 태스크 사람 조회
	 * @param map
	 * @return
	 */
	public List<TaskEmployee> selectTaskEmployeeList(Map<String, Object> map);

	/**
	 * 새 태스크 삽입
	 * @param task
	 * @return
	 */
	public int insertTask(Task task);

	/**
	 * 태스크 리스트 조회
	 * @param task
	 * @return
	 */
	public List<Task> selectTaskList(int empId);

}
