package com.otipms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.otipms.dto.Project;
import com.otipms.dto.Team;
import com.otipms.service.ProjectService;
import com.otipms.service.TeamService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class TeamRestController {
	@Autowired
	private TeamService teamService;
	
	@Autowired
	private ProjectService projectService;
	
	@PostMapping("updateTL")
	public void updateTL(@RequestParam String teamNo,
	        		     @RequestParam String empId) {
		Team team = new Team();
		team.setTeamNo(Integer.parseInt(teamNo));
		team.setEmpId(Integer.parseInt(empId));
		teamService.updateTeamLeader(team);
	}
	
	@RequestMapping("/getProjectName")
	public Project getProjectName(@RequestParam("projectNo") int projectNo) {
		Project project = projectService.selectProjectByProjectNo(projectNo);
		return project;
	}
}
