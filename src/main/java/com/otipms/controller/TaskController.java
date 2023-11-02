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
	
	@RequestMapping("/registerTask")
	@ResponseBody
	public List<Task> registerTask(String taskName
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
		task.setTaskEndDate(sdf.parse(endDate));
		task.setTaskStatus(status);
		
		List<Task> taskList = taskService.addTask(task);
		
		return taskList;
	}
	
	@RequestMapping("/projectTaskDT")
	public String projectTaskDT(Model model) {
		log.info("프로젝트업무일정");
		model.addAttribute("employee", LoginController.loginEmployee);
		return "task/projectTaskDataTable";
	}
}
