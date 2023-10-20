package com.otipms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.otipms.interceptor.Login;

@Controller
@RequestMapping("/employeeManagement")
public class EmployeeController {
	
	@Login
	@RequestMapping("/employeeList")
	public String employeeList() {
		return "employeeManagement/employeeList";
	}
	
	@Login
	@RequestMapping("/addAndModifyEmployee")
	public String addAndModifyEmployee() {
		return "employeeManagement/addAndModifyEmployee";
	}
}
