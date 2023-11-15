package com.otipms.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.otipms.aop.time.RuntimeCheck;
import com.otipms.dao.EmployeeDao;
import com.otipms.dto.Employee;
import com.otipms.dto.MediaFile;
import com.otipms.dto.Message;
import com.otipms.dto.Messenger;
import com.otipms.dto.Project;
import com.otipms.dto.Team;
import com.otipms.service.EmployeeService;
import com.otipms.service.MessageService;
import com.otipms.service.MessengerService;
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
    @Autowired
    private MessengerService messengerService;
    @Autowired
    private EmployeeDao employeeDao;
    
    @RuntimeCheck
    @PostMapping("/api/createChatRoom")
    public Messenger createChatRoom(@RequestBody List<Employee> selectedEmployees) {
    	Messenger messenger = new Messenger();
    	Employee employee = selectedEmployees.get(0);
    	int mrNo = messengerService.insertChatRoom(employee.getEmpId());
    	Employee empInfo = employeeService.getEmployeeInfo(employee.getEmpId());
    	MediaFile media = employeeService.getProfileImgByEmpId(employee.getEmpId());
    	messenger.setMediaFile(media);
		messenger.setMediaFileData(Base64.getEncoder().encodeToString(media.getMediaFileData()));
		messenger.setEmpStatus(employeeDao.islogined(employee.getEmpId()));
		
    	messenger.setMrNo(mrNo);
    	messenger.setEmpName(empInfo.getEmpName());
    	messenger.setEmpRank(empInfo.getEmpRank());
    	messenger.setMrLastChat("환영합니다.");
    	messenger.setMrDate(new Date());
    	
    	return messenger;
    }

    @RuntimeCheck
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
    
    @RuntimeCheck
    @GetMapping("api/employeeDataRead")
    public ResponseEntity<Map<String, List<Map<String, String>>>> employeeDataRead(@RequestParam("messageNo") int messageNo) {
    	List<Message> messages = messageService.readMail(messageNo);
    	
    	 Map<String, List<Map<String, String>>> jsonData = new HashMap<>();
    	 List<Map<String, String>> messageData = new ArrayList<>();
    	 
    	 for(Message message : messages) {
    		 Map<String, String> messageMap = new HashMap<>();
    		 if(message.getCcType() == 1) {
    			 messageMap.put("ccType", "수신");
    		 } else if(message.getCcType() == 3) {
    			 messageMap.put("ccType", "참조");
    		 } else if(message.getCcType() == 4) {
    			 messageMap.put("ccType", "비밀참조");
    		 }
    		 
    		 messageMap.put("empRank", message.getEmpRank());
    		 messageMap.put("empName", message.getEmpName());
    		 
    		 if(message.getMessageChecked() == 1) {
    			 messageMap.put("messageChecked", "읽지 않음");
    		 } else {
    			 messageMap.put("messageChecked", "읽음");
    		 }
    		 
    		 Date date = new Date();
	         SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	         if (message.getCcCheckedDate() == null) {
	        	    messageMap.put("ccCheckedDate", "읽지 않음");
	        	} else {
	        	    String dateStr = dateFormat.format(message.getCcCheckedDate());
	        	    messageMap.put("ccCheckedDate", dateStr);
	        	}
    		 messageMap.put("empId", String.valueOf(message.getEmpId()));
	         
    		 messageData.add(messageMap);
    	 }
    	 
    	 jsonData.put("messageData", messageData);
    	 return new ResponseEntity<>(jsonData, HttpStatus.OK);
    }
    
    @RuntimeCheck
    @GetMapping("/api/RolePMData")
    public ResponseEntity<Map<String, List<Map<String, String>>>> RolePMData() {
    	
    	List<Employee> employees = employeeService.selectNoTeamEmployeeByRole("ROLE_PM");
    	
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
    
    @RuntimeCheck
    @GetMapping("/api/RoleClientData")
    public ResponseEntity<Map<String, List<Map<String, String>>>> RoleClientData() {
    	List<Employee> employees = employeeService.selectNoTeamEmployeeByRole("ROLE_CLIENT");
    	
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
    
    @RuntimeCheck
    @GetMapping("/api/projectPeData")
    public ResponseEntity<Map<String, List<Map<String, String>>>> projectPeData(
												@RequestParam("teamNo")int teamNo) {
    	
    	List<Employee> employees = employeeService.selectEmployeeByTeamNoAndRole(teamNo,"ROLE_PE");
    	
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
    
    @RuntimeCheck
    @GetMapping("/api/employeeData2")
    public ResponseEntity<Map<String, List<Map<String, String>>>> getEmployeeData2(
    											@RequestParam("projectNo") int projectNo, 
    											@RequestParam("teamNo")int teamNo ) {
        List<Employee> employees = employeeService.selectEmployeeByTeamNo(teamNo);
        Project project = projectService.selectProjectByProjectNo(projectNo);
        Team team = teamService.getTeamByTeamNo(teamNo);
        
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
    
    
    @RequestMapping("/api/projectList")
    public List<Project> projectList() {
    	List<Project> projectList = projectService.getAllProjects();
    	return projectList;
    }
    @RequestMapping("/api/teamList")
    public List<Team> teamList(@RequestParam("projectNo") int projectNo) {
    	List<Team> teamList = teamService.getTeamListByProjectNo(projectNo).getTeamList();
    	return teamList;
    }
    @RequestMapping("/api/employeeList")
    public List<Employee> employeeList(@RequestParam("teamNo") int teamNo) {
    	List<Employee> employeeList = employeeService.selectEmployeeByTeamNo(teamNo);
    	return employeeList;
    }
    @RequestMapping("/api/adminList")
    public List<Employee> adminList(){
    	List<Employee> adminList = employeeService.findAdmin();
    	log.info("관리자 : " + adminList);
    	return adminList;
    }
    
    @RequestMapping("/api/sendList")
    public List<Employee> getSendList(@RequestParam("selectedEmployees[]") List<Integer> selectedEmployees) {
        List<Employee> sendList = new ArrayList<>();
        for(Integer empId : selectedEmployees) {
        	Employee emp = employeeDao.selectByEmployeeId(empId);
        	//Employee emp = employeeService.getEmployeeAllInfo(empId);
        	sendList.add(emp);
        }
        return sendList;
    }
    
    
    
    
    
    
    
}