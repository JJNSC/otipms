package com.otipms.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.otipms.dto.CC;
import com.otipms.dto.Employee;
import com.otipms.dto.Message;
import com.otipms.dto.Project;
import com.otipms.dto.Team;
import com.otipms.service.EmployeeService;
import com.otipms.service.MessageService;
import com.otipms.service.ProjectService;
import com.otipms.service.TeamService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class FindEmployeeRestController {
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private ProjectService projectService;
    @Autowired
    private TeamService teamService;
    @Autowired
    private MessageService messageService;

    @GetMapping("/api/employeeData")
    public ResponseEntity<Map<String, List<Map<String, String>>>> getEmployeeData() {
        List<Employee> employees = employeeService.getAllEmployee();
        List<Project> projects = projectService.getAllProjects();
        List<Team> teams = teamService.getAllTeam();

        // JSON 데이터 생성
        Map<String, List<Map<String, String>>> jsonData = new HashMap<>();
        List<Map<String, String>> employeeData = new ArrayList<>();
        List<Map<String, String>> projectData = new ArrayList<>();
        List<Map<String, String>> teamData = new ArrayList<>();

        // Employee 데이터를 JSON 형식으로 변환
        for (Employee employee : employees) {
            Map<String, String> employeeMap = new HashMap<>();
            employeeMap.put("projectName", employee.getProjectName());
            employeeMap.put("teamName", employee.getTeamName());
            employeeMap.put("empRank", employee.getEmpRank());
            employeeMap.put("empName", employee.getEmpName());
            employeeMap.put("empId", String.valueOf(employee.getEmpId()));
            employeeData.add(employeeMap);
        }

        // Project 데이터를 JSON 형식으로 변환
        for (Project project : projects) {
            Map<String, String> projectMap = new HashMap<>();
            projectMap.put("projectNo", String.valueOf(project.getProjectNo()));
            projectMap.put("projectName", project.getProjectName());
            projectData.add(projectMap);
        }

        // Team 데이터를 JSON 형식으로 변환
        for (Team team : teams) {
            Map<String, String> teamMap = new HashMap<>();
            int projectNo = team.getProjectNo();
            String teamName = team.getTeamName();
            teamMap.put("projectNo", String.valueOf(projectNo));
            teamMap.put("teamName", teamName);
            teamData.add(teamMap);
        }

        jsonData.put("employeeData", employeeData);
        jsonData.put("projectData", projectData);
        jsonData.put("teamData", teamData);

        return new ResponseEntity<>(jsonData, HttpStatus.OK);
    }
    
    @GetMapping("/api/RolePMData")
    public ResponseEntity<Map<String, List<Map<String, String>>>> RolePMData() {
    	List<Employee> employees = employeeService.selectEmployeeByRole("ROLE_PM");
    	
    	// JSON 데이터 생성
    	Map<String, List<Map<String, String>>> jsonData = new HashMap<>();
    	List<Map<String, String>> employeeData = new ArrayList<>();
    	
    	// Employee 데이터를 JSON 형식으로 변환
    	for (Employee employee : employees) {
    		Map<String, String> employeeMap = new HashMap<>();
    		employeeMap.put("empRank", employee.getEmpRank());
    		employeeMap.put("empName", employee.getEmpName());
    		employeeMap.put("role", employee.getRole());
    		employeeMap.put("empId", String.valueOf(employee.getEmpId()));
    		employeeData.add(employeeMap);
    	}
    	
    	jsonData.put("employeeData", employeeData);
    	
    	return new ResponseEntity<>(jsonData, HttpStatus.OK);
    }
    
    @GetMapping("/api/RoleClientData")
    public ResponseEntity<Map<String, List<Map<String, String>>>> RoleClientData() {
    	List<Employee> employees = employeeService.selectEmployeeByRole("ROLE_CLIENT");
    	
    	// JSON 데이터 생성
    	Map<String, List<Map<String, String>>> jsonData = new HashMap<>();
    	List<Map<String, String>> employeeData = new ArrayList<>();
    	
    	// Employee 데이터를 JSON 형식으로 변환
    	for (Employee employee : employees) {
    		Map<String, String> employeeMap = new HashMap<>();
    		employeeMap.put("empId", String.valueOf(employee.getEmpId()));
    		employeeMap.put("empName", employee.getEmpName());
    		employeeMap.put("empRank", employee.getEmpRank());
    		employeeMap.put("role", employee.getRole());
    		employeeMap.put("empTel", employee.getEmpTel());
    		employeeMap.put("empEmail", employee.getEmpEmail());
    		employeeData.add(employeeMap);
    		System.out.println("employeeMap : " + employeeMap);
    		System.out.println("employeeData : " + employeeData);
    	}
    	
    	jsonData.put("employeeData", employeeData);
    	
    	return new ResponseEntity<>(jsonData, HttpStatus.OK);
    }
    
    
    @GetMapping("/api/employeeData2")
    public ResponseEntity<Map<String, List<Map<String, String>>>> getEmployeeData2(
    											@RequestParam("projectNo") int projectNo, 
    											@RequestParam("teamNo")int teamNo ) {
    	log.info("projectNo : "+projectNo);
    	log.info("teamNo : "+teamNo);
    	
        List<Employee> employees = employeeService.selectEmployeeByTeamNo(teamNo);
        Project project = projectService.selectProjectByProjectNo(projectNo);
        Team team = teamService.getTeamByTeamNo(teamNo);
        
        log.info("project : "+project);
        log.info("team : "+team);

        // JSON 데이터 생성
        Map<String, List<Map<String, String>>> jsonData = new HashMap<>();
        List<Map<String, String>> employeeData = new ArrayList<>();
        List<Map<String, String>> projectData = new ArrayList<>();
        List<Map<String, String>> teamData = new ArrayList<>();

        // Employee 데이터를 JSON 형식으로 변환
        for (Employee employee : employees) {
            Map<String, String> employeeMap = new HashMap<>();
            employeeMap.put("empId", String.valueOf(employee.getEmpId()));
            System.out.println("String.valueOf(employee.getEmpId()) : " + String.valueOf(employee.getEmpId()));
            employeeMap.put("projectName", employee.getProjectName());
            employeeMap.put("teamName", employee.getTeamName());
            employeeMap.put("empRank", employee.getEmpRank());
            employeeMap.put("empName", employee.getEmpName());
            employeeData.add(employeeMap);
        }

        // Project 데이터를 JSON 형식으로 변환
        Map<String, String> projectMap = new HashMap<>();
        projectMap.put("projectNo", String.valueOf(project.getProjectNo()));
        projectMap.put("projectName", project.getProjectName());
        projectData.add(projectMap);

        // Team 데이터를 JSON 형식으로 변환
        Map<String, String> teamMap = new HashMap<>();
        teamMap.put("projectNo", String.valueOf(projectNo));
        teamMap.put("teamName", team.getTeamName());
        teamData.add(teamMap);

        jsonData.put("employeeData", employeeData);
        jsonData.put("projectData", projectData);
        jsonData.put("teamData", teamData);

        return new ResponseEntity<>(jsonData, HttpStatus.OK);
    }
}