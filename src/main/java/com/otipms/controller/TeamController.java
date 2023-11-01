package com.otipms.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.otipms.dao.TeamDao;
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
	public String addTeam(@RequestParam("selectedProject") int projectNo,
			 			  @RequestParam("teamName") String teamName) {
		Team team = new Team();
		team.setProjectNo(projectNo);
		team.setTeamName(teamName);
		teamService.addTeam(team);
		return "redirect:/teamManagement/teamList";
	}
	
	@Login
	@RequestMapping("/modifyTeamForm")
	public String modifyTeamForm(@RequestParam("projectNo") int projectNo,
							     @RequestParam("projectName") String projectName,
							     @RequestParam("teamNo") int teamNo,
					   		     @RequestParam("teamName") String teamName,
							     @RequestParam("TLId") int empId,
							     @RequestParam("TLRank") String empRank,
							     @RequestParam("TLName") String empName,
							     Model model) {
		Team oldTeam = new Team();
		oldTeam.setTeamNo(teamNo);
		oldTeam.setProjectNo(projectNo);
		oldTeam.setTeamName(teamName);
		oldTeam.setProjectName(projectName);
		oldTeam.setEmpId(empId);
		oldTeam.setEmpRank(empRank);
		oldTeam.setEmpName(empName);
		model.addAttribute("oldTeam", oldTeam);
		return "teamManagement/modifyTeam";
	}
	
	@RequestMapping("/findProjectLeader")
	public String findProjectLeader(@RequestParam("projectNo") int projectNo,
									@RequestParam("teamNo") int teamNo,
									Model model) {
		Project project = projectService.selectProjectByProjectNo(projectNo);
		Team team =teamService.getTeamByTeamNo(teamNo);
		model.addAttribute("project", project);
		model.addAttribute("team", team);
		return "teamManagement/findProjectLeader";
	}
	
	@RequestMapping("/findClient")
	public String findClient(Model model) {
		
		return "teamManagement/findClient";
	}
	
	@RequestMapping("/findPL")
	public String findPL(@RequestParam("teamNo") int teamNo,Model model) {
		log.info("팀장 찾기위해서 팀 번호:"+teamNo);
		model.addAttribute("teamNo", teamNo);
		return "teamManagement/findPL";
	}
	
	@RequestMapping("/modifyTeam")
	public String modifyTeam(@RequestParam("teamNo") int teamNo,
				   		     @RequestParam("newTeamName") String teamName,
						     @RequestParam("newTeamEmpId") int empId) {
		Team newTeam = new Team();
		newTeam.setTeamNo(teamNo);
		newTeam.setTeamName(teamName);
		newTeam.setEmpId(empId);
		teamService.updateTeam(newTeam);
		return "redirect:/teamManagement/teamList";
	}
	
	@RequestMapping("/disableTeam")
	public String disableTeam(@RequestParam("disableTeamNo") int teamNo) {
		teamService.removeTeam(teamNo);
		return "redirect:/teamManagement/teamList";
	}
	
}
