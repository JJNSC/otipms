package com.otipms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.otipms.dto.Team;
import com.otipms.service.TeamService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class TeamRestController {
	@Autowired
	private TeamService teamService;
	
	@PostMapping("updateTL")
	public void updateTL(@RequestParam String teamNo,
	        		     @RequestParam String empId) {
		log.info("teamNo : "+ teamNo);
		log.info("empId : "+ empId);
		Team team = new Team();
		team.setTeamNo(Integer.parseInt(teamNo));
		team.setEmpId(Integer.parseInt(empId));
		teamService.updateTeamLeader(team);
	}
}
