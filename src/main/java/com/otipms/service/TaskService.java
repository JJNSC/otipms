package com.otipms.service;

import java.util.List;
import java.util.Map;

import com.otipms.dto.Employee;
import com.otipms.dto.Project;
import com.otipms.dto.Task;
import com.otipms.dto.TaskCount;
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

	/**
	 * 태스크 리스트 조회
	 * @param empId
	 * @return
	 */
	public List<Task> getTaskList(String empId);

	/**
	 * 태스크 조회
	 * @param taskNo
	 * @return
	 */
	public Task getTask(String taskNo);

	/**
	 * 태스크 수정
	 * @param task
	 */
	public void modifyTask(Task task);

	/**
	 * 태스크 삭제
	 * @param taskNo
	 * @return
	 */
	public List<Task> deleteTask(String taskNo);
	
	/**
	 * 진척도 계산
	 * @param empId
	 * @return
	 */
	public double calculateProgressRate(int empId);

	/**
	 * 사용자가 속한 프로젝트 번호 조회
	 * @param empId
	 * @return
	 */
	public int getProjectNo(int empId);
	
	//사용자가 속한 프로젝트의 업무 정보 조회
	public TaskCount getProjectTaskInfo(int projectNo);
	//프로젝트에 속한 팀들의 진척도 조회
	public List<Double> getTeamProgressRateList(int projectNo);

	/**
	 * 사용자가 속한 프로젝트 조회
	 * @param empId
	 * @return
	 */
	public Project getProject(int empId);
	//개인의 업무 개수,퍼센트 조회
	public TaskCount getEmployeeTaskCount(int empId);

	/**
	 * 프로젝트 번호로 프로젝트 이름 및 기간 조회
	 * @param projectNo
	 * @return
	 */
	public Project getProjectInfo(String projectNo);

}
