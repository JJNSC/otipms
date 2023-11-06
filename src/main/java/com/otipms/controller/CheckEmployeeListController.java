package com.otipms.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.otipms.dto.Employee;
import com.otipms.dto.ProjectTeams;
import com.otipms.service.EmployeeService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/checkEmployeeList")
public class CheckEmployeeListController {
	
	@Autowired
	private EmployeeService employeeService;
	
	
	@RequestMapping("/employeeList")
	public String employeeList(@RequestParam(name="errMsg",required=false,defaultValue="1") String errMsg,Model model) {
		model.addAttribute("employee", LoginController.loginEmployee);
		model.addAttribute("base64Img", LoginController.profileImg);
		model.addAttribute("mf", LoginController.multipartFile);
		if(errMsg.equals("1")) {
			
		}else {
			model.addAttribute("errMsg", errMsg);
		}
		System.out.println("사원 리스트");
		List<ProjectTeams> projectTeamsList = employeeService.getTeamsPerProjects();
		model.addAttribute("projectTeams", projectTeamsList);
		return "checkEmployeeList/employeeList";
	}
	
	@ResponseBody
	@RequestMapping("/employeeListJson")
	public String employeeListJson(@RequestParam(name="project", required=false,defaultValue="0" ) String projectName,
								   @RequestParam(name="team", required=false, defaultValue="0") String teamName) throws JsonProcessingException {
		
		List<Employee> data = new ArrayList<>();
		if(projectName.equals("0")) {
			data = employeeService.getAllEmployee();
			log.info("그냥 데이터:" + data);
		}else if (!projectName.equals("0") && teamName.equals("0")) {
			data = employeeService.getProjectEmployees(projectName);
		}else if(!projectName.equals("0") && !teamName.equals("0")){
			data = employeeService.getProjectTeamEmployees(projectName,teamName);
		}
		
		//data를 json데이터로 바꾸기
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonData = objectMapper.writeValueAsString(data);
		log.info("json데이터로 바꿔줌 :" + jsonData);
		    
		return jsonData;

	}
	
}
