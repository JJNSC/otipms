package com.otipms.controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.otipms.aop.time.RuntimeCheck;
import com.otipms.dto.Project;
import com.otipms.dto.Task;
import com.otipms.dto.TaskEmployee;
import com.otipms.dto.Team;
import com.otipms.service.ProjectService;
import com.otipms.service.TaskService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class TaskController {
	@Autowired
	TaskService taskService;
	
	@Autowired
	ProjectService projectService;

	//=============개인 업무 일정 =============
	
	@RuntimeCheck
	@RequestMapping("/myTask")
	public String myTask(Model model) {
		log.info("개인업무일정");
		model.addAttribute("employee", LoginController.loginEmployee);
	    model.addAttribute("base64Img", LoginController.profileImg);
	    model.addAttribute("mf", LoginController.multipartFile);
	    
	    Project project = taskService.getProject(LoginController.loginEmployee.getEmpId());
	    model.addAttribute("project", project);
	    List<Task> taskList = taskService.getTaskList(LoginController.loginEmployee.getEmpId() + "");
	    model.addAttribute("taskList", taskList);
		return "task/myTask";
	}
	
	/**
	 * 업무 달력 표시
	 * @return
	 */
	@RequestMapping("/getTaskListForCalendar")
	@ResponseBody
	public Map<String, Object> getTaskListForCalendar() {
		Map<String, Object> ajaxMap = new HashMap<>();
		List<Task> taskList = taskService.getTaskList(LoginController.loginEmployee.getEmpId() + "");
		ajaxMap.put("taskList", taskList);
		return ajaxMap;
	}
	
	/**
	 * 프로젝트 상세 조회
	 * @param projectNo
	 * @return
	 */
	@RuntimeCheck
	@RequestMapping("/getProjectDetail")
	@ResponseBody
	public Project getProjectDetail(String projectNo) {
		Project project = projectService.getProjectDetail(Integer.parseInt(projectNo));
		return project;
	}

	/**
	 * 태스크 상세 조회
	 * @param taskNo
	 * @return
	 */
	@RuntimeCheck
	@RequestMapping("/getTaskDetail")
	@ResponseBody
	public Task getTaskDetail(String taskNo) {
		Task task = taskService.getTask(taskNo);
		return task;
	}
	
	//태스크 수정 (ajax 버전)
	@RuntimeCheck
	@RequestMapping("/updateTask")
	@ResponseBody
	public Map<String, Object> updateTask(String taskNo
										 , String taskComment
										 , String startDate
										 , String endDate
										 , String status
										 , String taskColor) throws Exception {
		Task task = new Task();
		task.setTaskNo(Integer.parseInt(taskNo));
		task.setTaskComment(taskComment);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(!startDate.equals("")) {
			task.setTaskStartDate(sdf.parse(startDate));
		}
		if(!endDate.equals("")) {
			task.setTaskEndDate(sdf.parse(endDate));
		}
		task.setTaskStatus(status);
		task.setTaskColor(taskColor);
		
		taskService.modifyTask(task);
		
		Map<String, Object> ajaxMap = new HashMap<>();
		Project project = taskService.getProject(LoginController.loginEmployee.getEmpId());
		ajaxMap.put("project", project);
	    List<Task> taskList = taskService.getTaskList(LoginController.loginEmployee.getEmpId() + "");
	    ajaxMap.put("taskList", taskList);
		return ajaxMap;
	}
	
	//=============프로젝트 업무 일정 =============
	
	/**
	 * 프로젝트 업무 일정 페이지 이동
	 * @param model
	 * @return
	 */
	@RuntimeCheck
	@RequestMapping("/projectTask")
	public String projectTask(Model model) {
		log.info("프로젝트업무일정");
		model.addAttribute("employee", LoginController.loginEmployee);
	    model.addAttribute("base64Img", LoginController.profileImg);
	    model.addAttribute("mf", LoginController.multipartFile);
		
		//로그인한 사람의 ROLE이 ROLE_ADMIN일 경우
		if(LoginController.loginEmployee.getRole().equals("ROLE_ADMIN")) {
			List<Project> projectList = taskService.getProjectList();
			model.addAttribute("projectList", projectList);
			
			//속도 문제로 전체가 아닌 프로젝트 선택하여 가져옴
			/*Map<String, Object> map = new HashMap<>();
			map.put("scope", "all");
			List<TaskEmployee> taskEmployeeList = taskService.getTaskEmployeeList(map);
			model.addAttribute("taskEmployeeList", taskEmployeeList);*/
			if(projectList != null) {
				int projectNo = projectList.get(0).getProjectNo();
				
				Map<String, Object> map = new HashMap<>();
				map.put("scope", "project");
				map.put("projectNo", projectNo);
				List<TaskEmployee> taskEmployeeList = taskService.getTaskEmployeeList(map);
				model.addAttribute("taskEmployeeList", taskEmployeeList);
				
				Project project = taskService.getProjectInfo(projectNo + "");
				model.addAttribute("firstProject", project);
				List<Team> teamList = taskService.getTeamList(projectNo + "");
				model.addAttribute("teamList", teamList);
			}
		} else {
			//else if(LoginController.loginEmployee.getRole().equals("ROLE_PM")) {
			//위와 같았으나 사실 ADMIN을 제외하면 모든 사람이 이렇게 나와야 함
			//int projectNo = taskService.getProjectNo(LoginController.loginEmployee.getEmpId());
			Project project = taskService.getProject(LoginController.loginEmployee.getEmpId());
			
			Map<String, Object> map = new HashMap<>();
			map.put("scope", "project");
			map.put("projectNo", project.getProjectNo());
			List<TaskEmployee> taskEmployeeList = taskService.getTaskEmployeeList(map);
			model.addAttribute("taskEmployeeList", taskEmployeeList);
			//model.addAttribute("projectNo", project.getProjectNo());
			model.addAttribute("project", project);
			
			List<Team> teamList = taskService.getTeamList(project.getProjectNo() + "");
			model.addAttribute("teamList", teamList);
		}
		
		return "task/projectTask";
	}
	
	/**
	 * 프로젝트 선택
	 * @param projectNo
	 * @return
	 */
	@RuntimeCheck
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
			
			Project project = taskService.getProjectInfo(projectNo);
			ajaxMap.put("project", project);
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
	@RuntimeCheck
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
	@RuntimeCheck
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
	@RuntimeCheck
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
	@RuntimeCheck
	@RequestMapping("/getTask")
	@ResponseBody
	public Task getTask(String taskNo) {
		log.info("taskNo: " + taskNo);
		return taskService.getTask(taskNo);
	}
	
	/**
	 * 태스크 수정
	 * @param taskNo
	 * @param taskName
	 * @param taskComment
	 * @param empId
	 * @param startDate
	 * @param endDate
	 * @param status
	 * @return
	 * @throws Exception
	 */
	@RuntimeCheck
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
		
		taskService.modifyTask(task);
		List<Task> taskList = taskService.getTaskList(empId);
		
		double progressRate = taskService.calculateProgressRate(Integer.parseInt(empId));
		
		Map<String, Object> map = new HashMap<>();
		map.put("taskList", taskList);
		map.put("progressRate", progressRate);
		
		return map;
	}
	
	/**
	 * 태스크 삭제
	 * @param taskNo
	 * @param empId
	 * @return
	 */
	@RuntimeCheck
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
	
	@RequestMapping("/findEmployee")
	public String findEmployee() {
		return "task/findEmployee";
	}
	
	@RequestMapping("/projectTaskDT")
	public String projectTaskDT(Model model) {
		log.info("프로젝트업무일정");
		model.addAttribute("employee", LoginController.loginEmployee);
		return "task/projectTaskDataTable";
	}
}
