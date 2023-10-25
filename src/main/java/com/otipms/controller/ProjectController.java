package com.otipms.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.otipms.dto.Employee;
import com.otipms.dto.Project;
import com.otipms.interceptor.Login;
import com.otipms.service.ProjectService;

import lombok.extern.slf4j.Slf4j;

@Slf4j 
@Controller
@RequestMapping("/projectManagement")
public class ProjectController {
	
	@Autowired
	private ProjectService projectService;
	
	@Login
	@RequestMapping("/projectList")
	public String projectList(Model model) {
		//프로젝트 리스트
		List<Project> projectList = projectService.getAllProjects();
		log.info("projectList: "+projectList);
		model.addAttribute("projectList", projectList);
		//해당 프로젝트당 PM
		List<Employee> PMList = new ArrayList<>();
		List<Employee> customerInfoList = new ArrayList<>();
		for(Project project : projectList) {
			Employee employee = new Employee();
			int projectNo = project.getProjectNo();
			employee.setProjectNo(projectNo);
			employee.setRole("ROLE_PM");
			
			//해당 프로젝트당 PM 이름
			Employee PMINfo = projectService.getEmployeeInfoByProjectNoAndRoleNo(employee);
			if(PMINfo==null || PMINfo.equals(null)) {
				Employee noInfo =new Employee();
				noInfo.setEmpName("PM이 없습니다.");
				PMList.add(noInfo);
			}else {
				PMList.add(PMINfo);
			}
			
			
			//해당 프로젝트당 고객 정보(고객명,연락처,이메일)
			employee.setRole("ROLE_CLIENT");
			Employee customerInfo = projectService.getEmployeeInfoByProjectNoAndRoleNo(employee);
			if( customerInfo==null ||customerInfo.equals(null)) {
				Employee noInfo =new Employee();
				noInfo.setEmpName("고객 명이 없습니다.");
				noInfo.setEmpTel("고객 전화번호가 없습니다.");
				noInfo.setEmpEmail("고객 이메일이 없습니다.");
				customerInfoList.add(noInfo);
			}else {
				customerInfoList.add(customerInfo);
			}
			
		}
		log.info("PMNameList: "+PMList);
		//해당 프로젝트당 PM 이름
		model.addAttribute("PMList", PMList);
		
		log.info("customerInfoList: "+customerInfoList);
		//해당 프로젝트당 고객 정보(고객명,연락처,이메일)
		model.addAttribute("customerInfoList", customerInfoList);
		
		
		return "projectManagement/projectList";
	}
	
	@Login
	@RequestMapping("/addAndModifyProject")
	public String addAndModifyProject(@RequestParam(name="projectNo", defaultValue="0") int projectNo,
									  @RequestParam(name="pmId", defaultValue="0") int pmId,
									  @RequestParam(name="customerId", defaultValue="0") int customerId,
									  Model model) {
		if(projectNo==0) {
			
		}else {
			Project project = projectService.selectProjectByProjectNo(projectNo);
			Employee pm = projectService.selectByEmployeeId(pmId);
			Employee customer = projectService.selectByEmployeeId(customerId);
			
			model.addAttribute("projectInfo", project);
			model.addAttribute("pmInfo", pm);
			model.addAttribute("customerInfo", customer);
		}
		
		
		
		
		return "projectManagement/addProject";
	}
	
	@RequestMapping("/addProject")
	public String addProject(@RequestParam("projectName") String projectName,
							 @RequestParam("projectDate") String projectDate,
							 @RequestParam("ProjectManagerId") String PMId,
							 @RequestParam("projectOutLines")String projectContent,
							 @RequestParam("customerCompany") String projectCompanyName,
							 @RequestParam("customerId") String empId) {
		System.out.println("projectName :" + projectName );
		System.out.println("projectDate :" + projectDate );
		System.out.println("PMId :" + PMId );
		System.out.println("projectContent :" + projectContent );
		System.out.println("projectCompanyName :" + projectCompanyName );
		System.out.println("empId :" + empId );
		
		//프로젝트 등록
		Project project = new Project();
		project.setProjectName(projectName);
		// 공백을 기준으로 문자열을 분할
        String[] dateStrings = projectDate.split(" - ");
        // 날짜 형식 지정
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
        try {
            // 첫 번째 날짜를 Date 형식으로 변환
            Date startDate = dateFormat.parse(dateStrings[0]);
            project.setProjectStartDate(startDate);
            
            // 두 번째 날짜를 Date 형식으로 변환
            Date endDate = dateFormat.parse(dateStrings[1]);
            project.setProjectEndDate(endDate);
            
        } catch (ParseException e) {
            e.printStackTrace();
        }
        project.setProjectStatus("작업전");
        project.setProjectCompanyName(projectCompanyName);
        project.setProjectContent(projectContent);
        project.setProjectDeleted(false);
        //임시 empId
        int imsiempId=1020000; //-----------------------------임시! 나중에 삭제 받아올수있을때 삭제!
        project.setEmpId(imsiempId); //고객의 id 
        
		int projectNo = projectService.addProject(project);
		//해당 PM에게 프로젝트 번호 등록!
		System.out.println(" 후보 1번 : "+project.getProjectNo()); //둘다 잘됨 후보 1번 사용하자.
		System.out.println(" 후보 2번 : "+projectNo);
		
		
		
		
		
		return "redirect:/projectManagement/projectList";
	}
	
}
