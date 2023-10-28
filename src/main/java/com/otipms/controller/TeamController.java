package com.otipms.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.otipms.dto.Project;
import com.otipms.dto.Team;
import com.otipms.dto.TeamList;
import com.otipms.interceptor.Login;
import com.otipms.service.ProjectService;
import com.otipms.service.TeamService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/teamManagement")
public class TeamController {
	
	@Autowired
	private ProjectService projectService;
	@Autowired
	private TeamService teamService;
	
	@Login
	@RequestMapping("/teamList")
	public String teamList(Model model) {
		List<Project> projectList = projectService.getAllProjects();
		List<TeamList> allTeam = new ArrayList<>();
		if(projectList.equals(null)||projectList==null) {
			return "teamManagement/teamList";
		}
		for(Project project : projectList) {
			TeamList teamList = teamService.getTeamListByProjectNo(project.getProjectNo());
			allTeam.add(teamList);
		}
		System.out.println("allTeam : "+ allTeam);
		
		model.addAttribute("projectList", projectList);
		model.addAttribute("allTeam", allTeam);
		
		return "teamManagement/teamList";
	}
	
	@PostMapping("/addTeam")
	public String addTeam(@RequestParam("selectedProject") int projectNo, @RequestParam("teamName") String teamName) {
		log.info("projectNo : "+ projectNo);
		log.info("teamName : "+ teamName);
		Team team = new Team();
		team.setProjectNo(projectNo);
		team.setTeamName(teamName);
		teamService.addTeam(team);
		return "redirect:/teamManagement/teamList";
	}
	
	@Login
	@RequestMapping("/addAndModifyTeam")
	public String addAndModifyTeam() {
		return "teamManagement/addAndModifyTeam";
	}
}
