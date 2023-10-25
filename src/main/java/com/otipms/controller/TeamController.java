package com.otipms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.otipms.interceptor.Login;

@Controller
@RequestMapping("/teamManagement")
public class TeamController {
	
	@Login
	@RequestMapping("/teamList")
	public String teamList() {
		return "teamManagement/teamList";
	}
	
	@Login
	@RequestMapping("/addAndModifyTeam")
	public String addAndModifyTeam() {
		return "teamManagement/addAndModifyTeam";
	}
}
