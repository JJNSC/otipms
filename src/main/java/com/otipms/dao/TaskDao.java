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
	 * @param empId
	 * @return
	 */
	public List<Task> selectTaskList(int empId);

	/**
	 * 태스크 조회
	 * @param taskNo
	 * @return
	 */
	public Task selectTask(int taskNo);

	/**
	 * 태스크 수정
	 * @param task
	 */
	public void updateTask(Task task);

	/**
	 * 태스크 삭제
	 * @param task
	 * @return
	 */
	public int updateDeleteTask(Task task);
	
	/**
	 * 진척도를 위한 태스크 리스트 개수
	 * @param map
	 * @return
	 */
	public int countTaskList(Map<String, Object> map);

	/**
	 * 사용자 번호로 사용자가 속한 프로젝트 번호 조회
	 * @param empId
	 * @return
	 */
	public int selectProjectNo(int empId);

	/**
	 * 사용자 번호로 사용자가 속한 프로젝트 조회
	 * @param empId
	 * @return
	 */
	public Project selectProject(int empId);
	
}
