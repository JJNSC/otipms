package com.otipms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.otipms.dto.Employee;
import com.otipms.service.EmployeeService;
import com.otipms.service.EmployeeService.LoginResult;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ProfileController {
	@Autowired
	public EmployeeService employeeService;
	
	/**
	 * 프로필 수정 페이지로 이동
	 * @param model
	 * @return
	 */
	@RequestMapping("/profile")
	public String profile(Model model) {
		log.info("프로필");
		//model.addAttribute("employee", LoginController.loginEmployee);
		
		Employee employee = employeeService.selectProfileEmp(LoginController.loginEmployee.getEmpId());
		model.addAttribute("employee", employee);
		return "profile/profile";
	}
	
	@RequestMapping("/updatePassword")
	@ResponseBody
	public String updatePassword(String password, String newPassword) {
		Employee employee = new Employee();
		employee.setEmpId(LoginController.loginEmployee.getEmpId());
		employee.setEmpPw(password);
		
		LoginResult loginResult = employeeService.login(employee);
		if(loginResult == LoginResult.SUCCESS) {
			employee.setEmpPw(newPassword);
			employeeService.modifyPassword(employee);
			return "success";
		} else if(loginResult == LoginResult.FAIL_PASSWORD_WRONG) {
			return "fail";
		}
		return null;
	}
	
	@RequestMapping("/indexTest")
	public String indextTest(Model model) {
		log.info("메인 테스트 페이지");
		model.addAttribute("employee", LoginController.loginEmployee);
		return "indexTest";
	}
}
