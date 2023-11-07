package com.otipms.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.otipms.dao.EmployeeDao;
import com.otipms.dao.TaskDao;
import com.otipms.dao.TeamDao;
import com.otipms.dto.Employee;
import com.otipms.dto.Project;
import com.otipms.dto.Task;
import com.otipms.dto.TaskCount;
import com.otipms.dto.TaskEmployee;
import com.otipms.dto.Team;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class TaskServiceImpl implements TaskService {
	@Autowired
	public TaskDao taskDao;
	@Autowired
	public TeamDao teamDao;
	@Autowired
	public EmployeeDao employeeDao;
	
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
	public List<Task> modifyTask(Task task) {
		taskDao.updateTask(task);
		return taskDao.selectTaskList(task.getEmpId());
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

	@Override
	public TaskCount getProjectTaskInfo(int projectNo) {
		//해당 프로젝트 총 업무수,진행전인 업무수, 진행중인 업무수, 완료된 업무수 + %까지
		TaskCount tc = new TaskCount();
		//해당프로젝트에 속한 인원들 다 받아오기
		Map<String, Object> map = new HashMap<>();
		map.put("scope", "project");
		map.put("projectNo", projectNo);
		List<TaskEmployee> taskEmployeeList = taskDao.selectTaskEmployeeList(map);
		//총 업무수
		int totalTaskCount = 0;
		//프로젝트의 완료된 업무 개수
		int doneTaskCount = 0;
		//프로젝트의 진행중인 업무 개수 
		int proceedTaskCount = 0;
		//진행중인 업무 퍼센트 
		double proceedProgressRate = 0;
		//진행완료 업무 퍼센트 
		double doneProgressRate = 0;
		for(TaskEmployee taskEmployee : taskEmployeeList) {
			Map<String, Object> map2 = new HashMap<>();
			map2.put("empId", taskEmployee.getEmpId());
			map2.put("scope", "전체");
			totalTaskCount += taskDao.countTaskList(map2);
			map2.replace("scope", "진행완료");
			doneTaskCount += taskDao.countTaskList(map2);
			map2.replace("scope", "진행중");
			proceedTaskCount +=taskDao.countTaskList(map2);
		}
		tc.setFinishedTaskCnt(doneTaskCount);
		tc.setProceedingTaskCnt(proceedTaskCount);
		tc.setTotalTaskCnt(totalTaskCount);
		tc.setUndoneTaskCnt(totalTaskCount-doneTaskCount-proceedTaskCount);
		
		if(totalTaskCount != 0 && proceedTaskCount != 0) {
			proceedProgressRate = Math.round( ((double) proceedTaskCount / (double) totalTaskCount) * 1000 )/10;
		}
		if(totalTaskCount != 0 && doneTaskCount != 0) {
			doneProgressRate = Math.round( ((double) doneTaskCount / (double) totalTaskCount) * 1000 )/10;
		}
		tc.setFinishedTaskRate(doneProgressRate);
		tc.setProceedingTaskRate(proceedProgressRate);
		tc.setUndoneTaskRate(100-doneProgressRate-proceedProgressRate);
		return tc;
	}

	@Override
	public List<Double> getTeamProgressRateList(int projectNo) {
		List<Team> teamList = teamDao.selectTeamListByProjectNo(projectNo);
		List<Double> progressRateList = new ArrayList<>();
		for(Team team : teamList) {
			int teamTotalTaskCnt =0;
			int teamFinishTaskCnt =0;
			double progressRate = 0;
			List<Employee> employeeList = employeeDao.getEmployeeByTeamNo(team.getTeamNo());
			for(Employee taskEmployee : employeeList) {
				Map<String, Object> map2 = new HashMap<>();
				map2.put("empId", taskEmployee.getEmpId());
				map2.put("scope", "전체");
				teamTotalTaskCnt += taskDao.countTaskList(map2);
				map2.replace("scope", "진행완료");
				teamFinishTaskCnt += taskDao.countTaskList(map2);
			}
			if(teamTotalTaskCnt != 0 && teamFinishTaskCnt != 0) {
				progressRate = Math.round( ((double) teamFinishTaskCnt / (double) teamTotalTaskCnt) * 100 );
			}
			progressRateList.add(progressRate);
		}
		return progressRateList;
	}

}
























