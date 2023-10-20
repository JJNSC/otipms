package com.otipms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.otipms.interceptor.Login;

@Controller
@RequestMapping("/projectManagement")
public class ProjectController {
	
	@Login
	@RequestMapping("/projectList")
	public String projectList() {
		
		return "projectManagement/projectList";
	}
	
	@Login
	@RequestMapping("/addAndModifyProject")
	public String addAndModifyProject() {
		return "projectManagement/addAndModifyProject";
	}
}
