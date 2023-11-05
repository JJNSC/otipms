package com.otipms.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.otipms.dto.Employee;
import com.otipms.dto.Project;
import com.otipms.interceptor.Login;
import com.otipms.service.EmployeeService;
import com.otipms.service.ProjectService;

import lombok.extern.slf4j.Slf4j;

@Slf4j 
@Controller
@RequestMapping("/projectManagement")
public class ProjectController {
	
	@Autowired
	private ProjectService projectService;
	@Autowired
	private EmployeeService employeeService;
	
	@Login
	@RequestMapping("/projectList")
	public String projectList(Model model) {
		//프로젝트 리스트
		List<Project> projectList = projectService.getAllProjects();
		log.info("projectList: "+projectList);
		model.addAttribute("projectList", projectList);
		model.addAttribute("employee", LoginController.loginEmployee);
		model.addAttribute("base64Img", LoginController.profileImg);
		model.addAttribute("mf", LoginController.multipartFile);
		//해당 프로젝트당 PM
		List<Employee> PMList = new ArrayList<>();
		List<Employee> customerInfoList = new ArrayList<>();
		for(Project project : projectList) {
			Employee employee = new Employee();
			int projectNo = project.getProjectNo();
			employee.setProjectNo(projectNo);
			employee.setTeamName("PM");
			
			//해당 프로젝트당 PM 이름
			Employee PMInfo = projectService.getEmployeeInfoByProjectNoAndTeamName(employee);
			if(PMInfo==null || PMInfo.equals(null)) {
				Employee noInfo =new Employee();
				noInfo.setEmpName("PM이 없습니다.");
				PMList.add(noInfo);
			}else {
				PMList.add(PMInfo);
			}
			
			
			//해당 프로젝트당 고객 정보(고객명,연락처,이메일)
			employee.setTeamName("고객");
			System.out.println("project : "+ project);
			System.out.println("project.getEmpId() : "+ project.getEmpId());
			Employee customerInfo = projectService.getEmployeeInfoByProjectNoAndTeamName(employee);
			log.info("고객사 정보 : "+customerInfo);
			if( customerInfo==null ||customerInfo.equals(null)) {
				Employee noInfo =new Employee();
				noInfo.setEmpName("고객 명이 없습니다.");
				noInfo.setEmpTel("고객 전화번호가 없습니다.");
				noInfo.setEmpEmail("고객 이메일이 없습니다.");
				customerInfoList.add(noInfo);
			}else {
				customerInfoList.add(customerInfo);
			}
			
			log.info("DB에 들어가는 정보 : " +customerInfoList);
			
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
	@RequestMapping("/modifyProjectForm")
	public String modifyProjectForm(@RequestParam(name="projectNo", defaultValue="0") int projectNo,
									  @RequestParam(name="pmId", defaultValue="0") int pmId,
									  @RequestParam(name="customerId", defaultValue="0") int customerId,
									  Model model) {
		model.addAttribute("employee", LoginController.loginEmployee);
		model.addAttribute("base64Img", LoginController.profileImg);
		model.addAttribute("mf", LoginController.multipartFile);
		if(projectNo==0) {
			
		}else {
			log.info(" projectNo :"+projectNo);
			log.info(" pmId :"+pmId);
			log.info(" customerId :"+customerId);
			Project project = projectService.selectProjectByProjectNo(projectNo);
			Employee pm = projectService.selectByEmployeeId(pmId);
			Employee customer = employeeService.getEmployeeAllInfo(customerId);
			
			SimpleDateFormat inputFormat = new SimpleDateFormat("E MMM dd HH:mm:ss z yyyy", Locale.US);
			SimpleDateFormat outputFormat = new SimpleDateFormat("MM/dd/yyyy");
			String formattedStartDate;
			String formattedEndDate;
			try {
			    Date startDate = inputFormat.parse(project.getProjectStartDate().toString());
			    Date endDate = inputFormat.parse(project.getProjectEndDate().toString());

			    formattedStartDate = outputFormat.format(startDate);
			    formattedEndDate = outputFormat.format(endDate);

			    model.addAttribute("startDate", formattedStartDate);
			    model.addAttribute("endDate", formattedEndDate);
			} catch (ParseException e) {
			    log.error("날짜 변환 중 에러 발생: " + e.getMessage());
			}
			
			log.info(" project :"+project);
			log.info(" pm :"+pm);
			log.info(" customer :"+customer);
			
			model.addAttribute("projectInfo", project);
			model.addAttribute("pmInfo", pm);
			model.addAttribute("customerInfo", customer);
			
		}
		return "projectManagement/modifyProject";
	}
	
	@RequestMapping("/addProjectForm")
	public String addProjectForm(Model model) {
		model.addAttribute("employee", LoginController.loginEmployee);
		model.addAttribute("base64Img", LoginController.profileImg);
		model.addAttribute("mf", LoginController.multipartFile);
		return "projectManagement/addProject";
	}
	
	@Transactional
	@RequestMapping("/addProject")
	public String addProject(@RequestParam(name="projectName", defaultValue="프로젝트 명") String projectName,
							 @RequestParam("projectDate") String projectDate,
							 @RequestParam("ProjectManagerId") String PMId,
							 @RequestParam(name="projectOutLines", defaultValue="프로젝트 개요")String projectContent,
							 @RequestParam("customerCompany") String projectCompanyName,
							 @RequestParam("customerId") String empId,
							 Model model) {
		model.addAttribute("employee", LoginController.loginEmployee);
		model.addAttribute("base64Img", LoginController.profileImg);
		model.addAttribute("mf", LoginController.multipartFile);
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
        
        int clientId=0;
        if(empId.equals(null) || empId.equals("")) {
        }else {
        	clientId = Integer.parseInt(empId);
        }
        project.setEmpId(clientId); //고객의 id 
        
        int pmId=0;
        if(PMId.equals(null) || PMId.equals("")) {
        }else {
        	pmId = Integer.parseInt(PMId);
        }
        //int clientId = Integer.parseInt(empId);
        
		projectService.addProject(project,pmId,clientId);
		//해당 PM에게 프로젝트 번호 등록!
		System.out.println(" 후보 1번 : "+project.getProjectNo()); //둘다 잘됨 후보 1번 사용하자.
		//System.out.println(" 후보 2번 : "+projectNo);
		
		return "redirect:/projectManagement/projectList";
	}
	
	@Transactional
	@RequestMapping("/modifyProject")
	public String modifyProject(@RequestParam("projectNo") String projectNo,
								@RequestParam("projectName") String projectName,
							 	@RequestParam("projectDate") String projectDate,
							 	@RequestParam(name="ProjectManagerId", required=false, defaultValue="0") String PMId,
							 	@RequestParam(name="beforeProjectManagerId", required=false, defaultValue="0" ) String beforePMId,
							 	@RequestParam("projectOutLines")String projectContent,
							 	@RequestParam("customerCompany") String projectCompanyName,
							 	@RequestParam(name="customerId", required=false, defaultValue="0") String empId,
								@RequestParam(name="beforeCustomerId", required=false, defaultValue="0") String beforeEmpId,
								Model model){
		model.addAttribute("employee", LoginController.loginEmployee);
		model.addAttribute("base64Img", LoginController.profileImg);
		model.addAttribute("mf", LoginController.multipartFile);
		System.out.println("projectNo :" + projectNo );
		System.out.println("projectName :" + projectName );
		System.out.println("projectDate :" + projectDate );
		System.out.println("PMId :" + PMId );
		System.out.println("projectContent :" + projectContent );
		System.out.println("projectCompanyName :" + projectCompanyName );
		System.out.println("empId :" + empId );
		
		//프로젝트 등록
		Project project = new Project();
		project.setProjectNo(Integer.parseInt(projectNo));
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
        project.setEmpId(Integer.parseInt(empId)); //고객의 id 
        
        int pmId =Integer.parseInt(PMId);
        //int clientId = Integer.parseInt(empId);
        
		projectService.modifyProject(project,pmId,Integer.parseInt(empId),Integer.parseInt(beforePMId),Integer.parseInt(beforeEmpId));
		//해당 PM에게 프로젝트 번호 등록!
		System.out.println(" 후보 1번 : "+project.getProjectNo()); //둘다 잘됨 후보 1번 사용하자.
		//System.out.println(" 후보 2번 : "+projectNo);
		
		return "redirect:/projectManagement/projectList";
	}
	
	@Login
	@RequestMapping("/findPM")
	public String findPM(Model model) {
	    
	    return "projectManagement/findPM";
	}
	@Login
	@RequestMapping("/findClient")
	public String findClient(Model model) {
		
		return "projectManagement/findClient";
	}
	
	@RequestMapping("/disableProject")
	public String disableProject(@RequestParam(name="disableProjectNo") String projectNo) {
		System.out.println("disableProject projectNo: "+ projectNo);
		Project project = new Project();
		project.setProjectNo(Integer.parseInt(projectNo));
		project.setProjectDeleted(true);
		projectService.updateProjectDeletedStatus(project);
		return "redirect:/projectManagement/projectList";
	}
	
}
