package com.otipms.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.otipms.dto.Project;
import com.otipms.dto.Task;
import com.otipms.dto.TaskEmployee;
import com.otipms.dto.Team;
import com.otipms.service.TaskService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class TaskController {
	@Autowired
	TaskService taskService;
	
	@RequestMapping("/myTask")
	public String myTask(Model model) {
		log.info("개인업무일정");
		model.addAttribute("employee", LoginController.loginEmployee);
		return "task/myTask";
	}
	
	//=============프로젝트 업무 일정 =============
	
	/**
	 * 프로젝트 업무 일정 페이지 이동
	 * @param model
	 * @return
	 */
	@RequestMapping("/projectTask")
	public String projectTask(Model model) {
		log.info("프로젝트업무일정");
		model.addAttribute("employee", LoginController.loginEmployee);
		
		//로그인한 사람의 ROLE이 ROLE_ADMIN일 경우
		if(LoginController.loginEmployee.getRole().equals("ROLE_ADMIN")) {
			List<Project> projectList = taskService.getProjectList();
			model.addAttribute("projectList", projectList);
			
			Map<String, Object> map = new HashMap<>();
			map.put("scope", "all");
			List<TaskEmployee> taskEmployeeList = taskService.getTaskEmployeeList(map);
			model.addAttribute("taskEmployeeList", taskEmployeeList);
		}
		
		return "task/projectTask";
	}
	
	/**
	 * 프로젝트 선택
	 * @param projectNo
	 * @return
	 */
	@RequestMapping("selectProject")
	@ResponseBody
	public Map<String, Object> selectProject(String projectNo) {
		
		Map<String, Object> map = new HashMap<>();
		Map<String, Object> ajaxMap = new HashMap<>();

		if(projectNo.equals("프로젝트 선택")) {
			map.put("scope", "all");
		} else {
			List<Team> teamList = taskService.getTeamList(projectNo);
			ajaxMap.put("teamList", teamList);

			map.put("scope", "project");
			map.put("projectNo", Integer.parseInt(projectNo));
		}
		List<TaskEmployee> taskEmployeeList = taskService.getTaskEmployeeList(map);
		
		ajaxMap.put("taskEmployeeList", taskEmployeeList);
		return ajaxMap;
	}
	
	/**
	 * 팀 선택
	 * @param projectNo
	 * @param teamNo
	 * @return
	 */
	@RequestMapping("selectTeam")
	@ResponseBody
	public Map<String, Object> selectTeam(String projectNo, String teamNo) {
		
		Map<String, Object> map = new HashMap<>();
		if(teamNo.equals("팀 선택")) {
			map.put("scope", "project");
			map.put("projectNo", Integer.parseInt(projectNo));
		} else {
			map.put("scope", "team");
			map.put("projectNo", Integer.parseInt(projectNo));
			map.put("teamNo", Integer.parseInt(teamNo));
		}
		List<TaskEmployee> taskEmployeeList = taskService.getTaskEmployeeList(map);
		
		Map<String, Object> ajaxMap = new HashMap<>();
		ajaxMap.put("taskEmployeeList", taskEmployeeList);
		
		return ajaxMap;
	}
	
	/**
	 * 태스크 추가
	 * @param taskName
	 * @param taskComment
	 * @param empId
	 * @param startDate
	 * @param endDate
	 * @param status
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/registerTask")
	@ResponseBody
	public Map<String, Object> registerTask(String taskName
								  , String taskComment
								  , String empId
								  , String startDate
								  , String endDate
								  , String status) throws Exception {
		Task task = new Task();
		task.setTaskName(taskName);
		task.setTaskComment(taskComment);
		task.setEmpId(Integer.parseInt(empId));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		task.setTaskStartDate(sdf.parse(startDate));
		if(!endDate.equals("")) {
			task.setTaskEndDate(sdf.parse(endDate));
		}
		task.setTaskStatus(status);
		
		List<Task> taskList = taskService.addTask(task);
		
		double progressRate = taskService.calculateProgressRate(Integer.parseInt(empId));
		
		Map<String, Object> map = new HashMap<>();
		map.put("taskList", taskList);
		map.put("progressRate", progressRate);
		
		return map;
	}
	
	/**
	 * 태스크 리스트 조회
	 * @param empId
	 * @return
	 */
	@RequestMapping("/getTaskList")
	@ResponseBody
	public List<Task> getTaskList(String empId) {
		return taskService.getTaskList(empId);
	}
	
	/**
	 * 태스크 조회
	 * @param taskNo
	 * @return
	 */
	@RequestMapping("/getTask")
	@ResponseBody
	public Task getTask(String taskNo) {
		log.info("taskNo: " + taskNo);
		return taskService.getTask(taskNo);
	}
	
	//태스크 수정
	@RequestMapping("/modifyTask")
	@ResponseBody
	public Map<String, Object> modifyTask(String taskNo
			, String taskName
			, String taskComment
			, String empId
			, String startDate
			, String endDate
			, String status) throws Exception {
		Task task = new Task();
		task.setTaskNo(Integer.parseInt(taskNo));
		task.setTaskName(taskName);
		task.setTaskComment(taskComment);
		task.setEmpId(Integer.parseInt(empId));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		task.setTaskStartDate(sdf.parse(startDate));
		if(!endDate.equals("")) {
			task.setTaskEndDate(sdf.parse(endDate));
		}
		task.setTaskStatus(status);
		
		List<Task> taskList = taskService.modifyTask(task);
		
		double progressRate = taskService.calculateProgressRate(Integer.parseInt(empId));
		
		Map<String, Object> map = new HashMap<>();
		map.put("taskList", taskList);
		map.put("progressRate", progressRate);
		
		return map;
	}
	
	/**
	 * 태스크 삭제
	 * @param taskNo
	 * @return
	 */
	/*@RequestMapping("/deleteTask")
	@ResponseBody
	public List<Task> deleteTask(String taskNo) {
		List<Task> taskList = taskService.deleteTask(taskNo);
		
		return taskList;
	}*/
	
	@RequestMapping("/deleteTask")
	@ResponseBody
	public Map<String, Object> deleteTask(String taskNo, String empId) {
		List<Task> taskList = taskService.deleteTask(taskNo);
		
		double progressRate = taskService.calculateProgressRate(Integer.parseInt(empId));
		
		Map<String, Object> map = new HashMap<>();
		map.put("taskList", taskList);
		map.put("progressRate", progressRate);
		
		return map;
	}
	
	@RequestMapping("/projectTaskDT")
	public String projectTaskDT(Model model) {
		log.info("프로젝트업무일정");
		model.addAttribute("employee", LoginController.loginEmployee);
		return "task/projectTaskDataTable";
	}
}
