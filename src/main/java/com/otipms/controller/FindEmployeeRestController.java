package com.otipms.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.otipms.dto.Employee;
import com.otipms.dto.Project;
import com.otipms.dto.Team;
import com.otipms.service.EmployeeService;
import com.otipms.service.ProjectService;
import com.otipms.service.TeamService;

@RestController
@RequestMapping("/api")
public class FindEmployeeRestController {
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private ProjectService projectService;
    @Autowired
    private TeamService teamService;

    @GetMapping("/employeeData")
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
}