package com.otipms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/employeeManagement")
public class EmployeeController {
	
	@RequestMapping("employeeList")
	public String employeeList() {
		return "employeeManagement/employeeList";
	}
	
	@RequestMapping("addAndModifyEmployee")
	public String addAndModifyEmployee() {
		return "employeeManagement/addAndModifyEmployee";
	}
}
