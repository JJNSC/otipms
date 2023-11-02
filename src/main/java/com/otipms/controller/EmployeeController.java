package com.otipms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.otipms.dto.Employee;
import com.otipms.dto.ProjectTeams;
import com.otipms.interceptor.Login;
import com.otipms.service.EmployeeService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/employeeManagement")
public class EmployeeController {
	
	@Autowired
	private EmployeeService employeeService;
	
	
	@RequestMapping("/employeeList")
	public String employeeList(@RequestParam(name="errMsg",required=false,defaultValue="1") String errMsg,Model model) {
		if(errMsg.equals("1")) {
			
		}else {
			model.addAttribute("errMsg", errMsg);
		}
		System.out.println("사원 리스트");
		List<ProjectTeams> projectTeamsList = employeeService.getTeamsPerProjects();
		model.addAttribute("projectTeams", projectTeamsList);
		return "employeeManagement/employeeList";
	}
	
	@ResponseBody
	@RequestMapping("/employeeListJson")
	public String employeeListJson() throws JsonProcessingException {
		
		List<Employee> data = employeeService.getAllEmployee();
		log.info("그냥 데이터:" + data);
		  
		//data를 json데이터로 바꾸기
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonData = objectMapper.writeValueAsString(data);
		log.info("json데이터로 바꿔줌 :" + jsonData);
		    
		return jsonData;

	}
	
	@RequestMapping("/employeeListTest")
	public String employeeListTest() {
		System.out.println("사원 리스트 테스트");
		return "employeeManagement/employeeListTest";
	}
	
	@Login
	@RequestMapping("/addAndModifyEmployee")
	public String addAndModifyEmployee() {
		return "employeeManagement/addAndModifyEmployee";
	}
	
	@Transactional
	@PostMapping("/singleResgister")
	public String singleResgister(@RequestParam("registerEmpName") String empName, 
								  @RequestParam("registerPosition") String empRank,
								  @RequestParam("registerPhoneNumber") String empTel,
								  @RequestParam("registerProject") String projectName,
								  @RequestParam("registerTeam") String teamName,
								  @RequestParam("registerAuthority") String authorityName,
								  Model model) {
		log.info("teamName : "+ teamName);
		
		//중복 인력 제외(전화번호로 확인)
		if(employeeService.checkEmployeeByTel(empTel)==1) {
			model.addAttribute("errMsg", "이미 등록 된 인력입니다.");
		}else {
			Employee employee = new Employee();
			employee.setEmpName(empName);
			employee.setEmpRank(empRank);
			employee.setEmpTel(empTel);
			if(teamName.equals("")||teamName.equals(null)) {
				
			}else {
				employee.setTeamNo(employeeService.getTeamNo(projectName,teamName));
			}
			employee.setRole(authorityName);
			employeeService.addEmployee(employee);
		}
		return "redirect:/employeeManagement/employeeList";
	}
	
	@ResponseBody
	@RequestMapping("/employeeInfoJson")
	public Employee employeeInfoJson(@RequestParam("empId") String empId) {
		log.info("empId : " + empId);
		Employee modifyEmpInfo = employeeService.getEmployeeAllInfo(Integer.parseInt(empId));
		log.info("모달 열때 들어있는 사용자 정보들 : "+modifyEmpInfo);
		return modifyEmpInfo;
	}
	
	@ResponseBody
	@RequestMapping("/resetEmpPassword")
	public void resetEmpPassword(@RequestParam("empId") String empId) {
		log.info("비밀번호 초기화할 empId : " + empId);
		employeeService.resetEmployeePassword(Integer.parseInt(empId));
	}
	
	@RequestMapping("/modifySingleEmployeeInfo")
	public String modifySingleEmployeeInfo(@RequestParam("empId") int empId,
										 @RequestParam("nowEmpName") String empName,
										 @RequestParam("nowEmpRank") String empRank,
										 @RequestParam("nowEmpTel") String empTel,
										 @RequestParam("nowEmpEmail") String empEmail,
										 @RequestParam("nowProject") int projectNo,
										 @RequestParam("nowTeam") int teamNo,
										 @RequestParam("nowRole") String role) {
		log.info("사용자 정보 변경 empId : "+ empId);
		log.info("사용자 정보 변경 empName : "+ empName);
		log.info("사용자 정보 변경 empRank : "+ empRank);
		log.info("사용자 정보 변경 empTel : "+ empTel);
		log.info("사용자 정보 변경 projectNo : "+ projectNo);
		log.info("사용자 정보 변경 teamNo : "+ teamNo);
		log.info("사용자 정보 변경 role : "+ role);
		Employee employee = new Employee();
		employee.setEmpId(empId);
		employee.setEmpName(empName);
		employee.setEmpRank(empRank);
		employee.setEmpTel(empTel);
		employee.setEmpEmail(empEmail);
		employee.setTeamNo(teamNo);
		employee.setProjectNo(projectNo);
		employee.setRole(role);
		employeeService.updateEmployeeInfo(employee);
		return "redirect: employeeList";
	}
	@ResponseBody
	@RequestMapping("/disableEmployee")
	public String disableEmployee(@RequestParam("empId") int empId) {
		employeeService.disableEmployee(empId);
		
		return "/otipms/employeeManagement/employeeList";
	}
}
