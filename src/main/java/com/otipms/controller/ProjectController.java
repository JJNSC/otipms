package com.otipms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/projectManagement")
public class ProjectController {
	
	@RequestMapping("/projectList")
	public String projectList() {
		
		return "projectManagement/projectList";
	}
	
	@RequestMapping("/addAndModifyProject")
	public String addAndModifyProject() {
		return "projectManagement/addAndModifyProject";
	}
}
