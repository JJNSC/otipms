package com.otipms.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.otipms.dao.TaskDao;
import com.otipms.dto.Project;
import com.otipms.dto.Task;
import com.otipms.dto.TaskEmployee;
import com.otipms.dto.Team;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class TaskServiceImpl implements TaskService {
	@Autowired
	public TaskDao taskDao;
	
	//프로젝트 리스트 조회
	@Override
	public List<Project> getProjectList() {
		return taskDao.selectProjectList();
	}

	//팀 리스트 조회
	@Override
	public List<Team> getTeamList(String projectNo) {
		return taskDao.selectTeamList(Integer.parseInt(projectNo));
	}

	//태스크 사람 조회
	@Override
	public List<TaskEmployee> getTaskEmployeeList(Map<String, Object> map) {
		List<TaskEmployee> taskEmployeeList = taskDao.selectTaskEmployeeList(map);
		for(TaskEmployee taskEmployee : taskEmployeeList) {
			double progressRate = calculateProgressRate(taskEmployee.getEmpId());
			taskEmployee.setProgressRate(progressRate);
		}
		return taskEmployeeList;
	}

	//태스크 추가
	@Override
	public List<Task> addTask(Task task) {
		taskDao.insertTask(task);
		return taskDao.selectTaskList(task.getEmpId());
	}

	//태스크 리스트 조회
	@Override
	public List<Task> getTaskList(String empId) {
		return taskDao.selectTaskList(Integer.parseInt(empId));
	}

	//태스크 조회
	@Override
	public Task getTask(String taskNo) {
		return taskDao.selectTask(Integer.parseInt(taskNo));
	}

	//태스크 수정
	@Override
	public void modifyTask(Task task) {
		taskDao.updateTask(task);
		//return taskDao.selectTaskList(task.getEmpId());
	}

	//태스크 삭제
	@Override
	public List<Task> deleteTask(String taskNo) {
		Task task = new Task();
		task.setTaskNo(Integer.parseInt(taskNo));
		taskDao.updateDeleteTask(task);
		log.info("empId가 잘 왔을까..? ㅎㅎ" + task.getEmpId());
		return taskDao.selectTaskList(task.getEmpId());
	}

	//진척률 계산
	@Override
	public double calculateProgressRate(int empId) {
		double progressRate = 0;
		
		Map<String, Object> map = new HashMap<>();
		map.put("empId", empId);
		map.put("scope", "전체");
		int totalTaskCount = taskDao.countTaskList(map);
		
		map.replace("scope", "진행완료");
		int doneTaskCount = taskDao.countTaskList(map);
		
		if(totalTaskCount != 0 && doneTaskCount != 0) {
			progressRate = Math.round( ((double) doneTaskCount / (double) totalTaskCount) * 100 );
			log.info("done? " + (double) doneTaskCount);
			log.info("total? " + (double) totalTaskCount);
			log.info("계산? " + progressRate);
		}
		
		return progressRate;
	}

	//사용자가 속한 프로젝트 번호 조회
	@Override
	public int getProjectNo(int empId) {
		return taskDao.selectProjectNo(empId);
	}

	//사용자가 속한 프로젝트 조회
	@Override
	public Project getProject(int empId) {
		return taskDao.selectProject(empId);
	}

}
