package com.otipms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/teamManagement")
public class TeamController {
	
	@RequestMapping("teamList")
	public String teamList() {
		return "teamManagement/teamList";
	}
	
	@RequestMapping("addAndModifyTeam")
	public String addAndModifyTeam() {
		return "teamManagement/addAndModifyTeam";
	}
}
